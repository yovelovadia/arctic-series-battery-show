function iconText {
    [DateTime]::Now.Second.ToString()
    # ((Get-Counter '\\mypc\network interface(Intel[R] 82579V Gigabit Network Connection)\bytes total/sec').countersamples).cookedvalue*8/102400000*100
}
Add-Type -ReferencedAssemblies @("System.Windows.Forms"; "System.Drawing") -TypeDefinition @"
    using System;
    using System.Drawing;
    using System.Windows.Forms;
    public static class TextNotifyIcon
    {
        // it's difficult to call DestroyIcon() with powershell only...
        [System.Runtime.InteropServices.DllImport("user32")]
        private static extern bool DestroyIcon(IntPtr hIcon);

        public static NotifyIcon CreateTrayIcon()
        {
            var notifyIcon = new NotifyIcon();
            notifyIcon.Visible = true;

            return notifyIcon;
        }

        public static void UpdateIcon(NotifyIcon notifyIcon, string text)
        {
            using (var b = new Bitmap(16, 16))
            using (var g = Graphics.FromImage(b))
            using (var font = new Font(FontFamily.GenericMonospace, 9))
            {
                int number = Int32.Parse(text);
                var color = Brushes.Green;
                if (number < 75){
                    color = Brushes.Yellow;
                }
                if (number < 50){
                    color = Brushes.Orange;
                }
                if (number < 25){
                    color = Brushes.Red;
                }

                g.DrawString(text, font, color, 0, 0);

                var icon = b.GetHicon();
                try
                {
                    notifyIcon.Icon = Icon.FromHandle(icon);
                } finally
                {
                    DestroyIcon(icon);
                }
            }
        }
    }
"@

