Return-Path: <linux-renesas-soc+bounces-25283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC5BC8F154
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF9EB3BE280
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4B83346B6;
	Thu, 27 Nov 2025 14:58:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854B7334690;
	Thu, 27 Nov 2025 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764255503; cv=none; b=iHpAyF9C8qoenHtY7TxIO53XMqPIOYVRUxzPDPOu3jjIp2T8ohh3vrSl7u3fDr+VqUpfY097Q5SCpi+ugfTD6flO1heMFHqgTt/LoU7coCEtkIDrQbZqQr2P+9+YLSnkNuBI0etAaxz4ks+RbNazrpB9QWAYAdH7Zx2LG+Hue2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764255503; c=relaxed/simple;
	bh=iQieFxAgnGsc4V0aD4Lx1+Rndngs3yHuIpAiPJ3Vv+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKiTLcQdBt1brRUA7mMeFmmsdyj42HVfSEz09+kiX7CPSLQP+qaLWUtm6xDmce9c/tbQPMyAxeXuFBG0QVJATCncRdBDsp6EACw6TJoL2UXQ6jCLaFNcGPp4NO2JKDvvObbG8BOakeom+Lupo5rIkDBVSbvr0jdzgg3Jv2ghQY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: CFkev+JORg6lovlfgigKHA==
X-CSE-MsgGUID: 2W5vJW58RbaSZAMKM7lY5Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Nov 2025 23:58:15 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.189])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DE88D40108F6;
	Thu, 27 Nov 2025 23:58:11 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 2/2] clk: renesas: cpg-mssr: handle RZ/T2H register layout in PM callbacks
Date: Thu, 27 Nov 2025 16:56:54 +0200
Message-ID: <20251127145654.3253992-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register layout for RZ/T2H is not handled inside
cpg_mssr_suspend_noirq() and cpg_mssr_resume_noirq(), causing a memory
abort because the wrong code path is taken, as shown below.

Explicitly handle the RZ/T2H register layout in cpg_mssr_suspend_noirq()
and cpg_mssr_resume_noirq(), similar to how it is done inside
cpg_mstp_clock_is_enabled() and cpg_mstp_clock_endisable().

[   90.052296] Mem abort info:
[   90.055420]   ESR = 0x0000000096000007
[   90.059553]   EC = 0x25: DABT (current EL), IL = 32 bits
[   90.065697]   SET = 0, FnV = 0
[   90.069211]   EA = 0, S1PTW = 0
[   90.072834]   FSC = 0x07: level 3 translation fault
[   90.078109] Data abort info:
[   90.081405]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
[   90.087427]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   90.093169]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   90.099008] swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000c60b4000
[   90.106756] [ffff800082816318] pgd=0000000000000000, p4d=10000000c69ef003, pud=10000000c69f0003, pmd=100000024002b403, pte=0000000000000000
[   90.120727] Internal error: Oops: 0000000096000007 [#1]  SMP
[   90.127058] Modules linked in: sha256 cfg80211 spi_nor at24 renesas_usbhs bluetooth ecdh_generic ecc rfkill rzt2h_adc spi_rzv2h_rspi industrialio_adc gpio_keys fuse drm backlight ipv6
[   90.145201] CPU: 0 UID: 0 PID: 307 Comm: sh Not tainted 6.18.0-rc1-next-20251016+ #47 PREEMPT
[   90.155006] Hardware name: Renesas RZ/T2H EVK Board based on r9a09g077m44 (DT)
[   90.163041] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   90.170777] pc : cpg_mssr_suspend_noirq+0x4c/0xc0
[   90.175983] lr : device_suspend_noirq+0x6c/0x22c
[   90.181309] sp : ffff8000838d3af0
[   90.185026] x29: ffff8000838d3af0 x28: ffff8000825c016f x27: ffff8000825c01a0
[   90.192973] x26: ffff8000809feeec x25: ffff8000827bebb8 x24: 0000000000000002
[   90.200815] x23: ffff8000825c0190 x22: 0000000000000002 x21: 0000000000000000
[   90.209058] x20: ffff8000827bebb8 x19: ffff000180128010 x18: ffff00033ef92a80
[   90.217100] x17: ffff000180051700 x16: 0000000000000001 x15: ffff000187afc310
[   90.224847] x14: 0000000000000254 x13: 0000000000000001 x12: 0000000000000001
[   90.232793] x11: 00000000000000c0 x10: 0000000000000ab0 x9 : ffff8000838d38b0
[   90.240540] x8 : ffff000186387410 x7 : 0000000000000001 x6 : 0000000000000000
[   90.248600] x5 : ffff0001803240d4 x4 : 0000000000000003 x3 : ffff0001803240d0
[   90.256460] x2 : ffff800082816318 x1 : 000000000000000c x0 : ffff000180324000
[   90.264208] Call trace:
[   90.267019]  cpg_mssr_suspend_noirq+0x4c/0xc0 (P)
[   90.272450]  device_suspend_noirq+0x6c/0x22c
[   90.277375]  dpm_noirq_suspend_devices+0x1a8/0x2a0
[   90.282902]  dpm_suspend_noirq+0x24/0xa0
[   90.287428]  suspend_devices_and_enter+0x310/0x590
[   90.292790]  pm_suspend+0x1b4/0x200
[   90.296811]  state_store+0x80/0xf4
[   90.300676]  kobj_attr_store+0x18/0x34
[   90.305002]  sysfs_kf_write+0x7c/0x94
[   90.309232]  kernfs_fop_write_iter+0x12c/0x200
[   90.314115]  vfs_write+0x240/0x380
[   90.318041]  ksys_write+0x64/0x100
[   90.321862]  __arm64_sys_write+0x18/0x24
[   90.326013]  invoke_syscall.constprop.0+0x40/0xf0
[   90.331445]  el0_svc_common.constprop.0+0xb8/0xd8
[   90.336554]  do_el0_svc+0x1c/0x28
[   90.340375]  el0_svc+0x34/0xe8
[   90.343900]  el0t_64_sync_handler+0xa0/0xe4
[   90.348426]  el0t_64_sync+0x198/0x19c
[   90.352609] Code: 8b040042 b9409004 7100049f 54000240 (b9400042)
[   90.359639] ---[ end trace 0000000000000000 ]---

Fixes: 065fe720eec6 ("clk: renesas: Add support for R9A09G077 SoC")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 031e4b125f2d..976c157829f1 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1077,11 +1077,19 @@ static int cpg_mssr_suspend_noirq(struct device *dev)
 
 	/* Save module registers with bits under our control */
 	for (reg = 0; reg < ARRAY_SIZE(priv->smstpcr_saved); reg++) {
-		if (priv->smstpcr_saved[reg].mask)
-			priv->smstpcr_saved[reg].val =
-				priv->reg_layout == CLK_REG_LAYOUT_RZ_A ?
-				readb(priv->pub.base0 + priv->control_regs[reg]) :
-				readl(priv->pub.base0 + priv->control_regs[reg]);
+		u32 val;
+
+		if (!priv->smstpcr_saved[reg].mask)
+			continue;
+
+		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
+			val = readb(priv->pub.base0 + priv->control_regs[reg]);
+		else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+			val = cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
+		else
+			val = readl(priv->pub.base0 + priv->control_regs[reg]);
+
+		priv->smstpcr_saved[reg].val = val;
 	}
 
 	/* Save core clocks */
@@ -1112,6 +1120,8 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 
 		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 			oldval = readb(priv->pub.base0 + priv->control_regs[reg]);
+		else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+			oldval = cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
 		else
 			oldval = readl(priv->pub.base0 + priv->control_regs[reg]);
 		newval = oldval & ~mask;
@@ -1125,6 +1135,12 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			readb(priv->pub.base0 + priv->control_regs[reg]);
 			barrier_data(priv->pub.base0 + priv->control_regs[reg]);
 			continue;
+		} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+			cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
+			/* See cpg_mstp_clock_endisable() on why this is necessary. */
+			cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
+			udelay(10);
+			continue;
 		} else
 			writel(newval, priv->pub.base0 + priv->control_regs[reg]);
 
-- 
2.52.0

