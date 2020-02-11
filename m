Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A208159857
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgBKSVT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:21:19 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:44996 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730206AbgBKSTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 1WKV2200K5USYZQ01WKV3C; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002nb-Ar; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003y7-9j; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 01/34] debugfs: regset32: Add Runtime PM support
Date:   Tue, 11 Feb 2020 19:18:55 +0100
Message-Id: <20200211181928.15178-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hardware registers of devices under control of power management cannot
be accessed at all times.  If such a device is suspended, register
accesses may lead to undefined behavior, like reading bogus values, or
causing exceptions or system lock-ups.

Extend struct debugfs_regset32 with an optional field to let device
drivers specify the device the registers in the set belong to.  This
allows debugfs_show_regset32() to make sure the device is resumed while
its registers are being read.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
Affected drivers:
  - drivers/crypto/ccree (fixed)
  - drivers/gpu/drm/msm/disp/dpu1
  - drivers/usb/dwc3
  - drivers/usb/host/ehci-omap.c
  - drivers/usb/host/ehci-tegra.c
  - drivers/usb/host/ohci-platform.c
  - drivers/usb/host/xhci-dbgcap.c
  - drivers/usb/host/xhci-histb.c
  - drivers/usb/host/xhci-hub.c
  - drivers/usb/host/xhci-mtk.c
  - drivers/usb/host/xhci-pci.c
  - drivers/usb/host/xhci-tegra.c
  - drivers/usb/host/xhci.c
  - drivers/usb/mtu3
  - drivers/usb/musb
    drivers/usb/host/xhci-plat.c

Some drivers call pm_runtime_forbid(), but given the comment "users
should enable runtime pm using power/control in sysfs", this can be
overridden from userspace?

v2:
  - Add Reviewed-by, Acked-by,
  - s/locks/lock-ups/.
---
 fs/debugfs/file.c       | 8 ++++++++
 include/linux/debugfs.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 634b09d18b77f46f..204734f8d1c6d648 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
+#include <linux/pm_runtime.h>
 #include <linux/poll.h>
 #include <linux/security.h>
 
@@ -1060,7 +1061,14 @@ static int debugfs_show_regset32(struct seq_file *s, void *data)
 {
 	struct debugfs_regset32 *regset = s->private;
 
+	if (regset->dev)
+		pm_runtime_get_sync(regset->dev);
+
 	debugfs_print_regs32(s, regset->regs, regset->nregs, regset->base, "");
+
+	if (regset->dev)
+		pm_runtime_put(regset->dev);
+
 	return 0;
 }
 
diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index 3d013de64f70ec42..ad416853e722fca7 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -35,6 +35,7 @@ struct debugfs_regset32 {
 	const struct debugfs_reg32 *regs;
 	int nregs;
 	void __iomem *base;
+	struct device *dev;	/* Optional device for Runtime PM */
 };
 
 extern struct dentry *arch_debugfs_dir;
-- 
2.17.1

