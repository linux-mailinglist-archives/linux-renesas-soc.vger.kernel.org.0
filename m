Return-Path: <linux-renesas-soc+bounces-14918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE87A73207
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 13:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143A616696D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 12:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B194D214A9D;
	Thu, 27 Mar 2025 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZTia0Ra"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935E21422A;
	Thu, 27 Mar 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077278; cv=none; b=lN7oFjPyG+v+Lc77Kj4ST4rsbLuHkCJ4QVaTMdUspBdIYLIwApvVJac1WfU95ndQZumQO36uOgdAqVJHodtRPgxlWLCA90+P1uuBq+BZq38urC9G8MwTl5DudPG4+TB6QY1igINy7m9Imd1X8P2iTWdi2in8a90BjDmNTyXJT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077278; c=relaxed/simple;
	bh=+VZg1rry8Mu/Xu+XCFb1efCa02/67xbeLIf108f6o+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exd6X/Waj86Vck+uCcAFIwGgn87iXFdCgcVgVyptxhmk7Nbaoz3cMaWM2PNR7X6DNlppYe3PYer9A49w3EZOeRxdBrTIvlNRt36QaigjXszCelHoe8OOGMmtxLSzz0UfGPdbbCngd4OAg6ZgI9ll6UYMsdSD5mLxcO0KZ7Wu+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZTia0Ra; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so9924585e9.3;
        Thu, 27 Mar 2025 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743077275; x=1743682075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgqWqvTey2/gQ4s56C3BtNu3p+nUIOiECXSnp663yXU=;
        b=kZTia0Ray/e4//YZ+lBADh/SB/WSxlhG4S5koodW7FNZRQOgDJ5rXMLFWVb5hrMhG6
         M6/Y5OwGNI53KU3ikfQlM4ivg4Inhm38MZxmD9QICgDC8VeZNf1fv5dX/dz618cZvI9X
         OghhmlNAMrhasUlZ57/Nllfccx2/rNusB/nckE7coFSKUbJQEtDa7STXGTE9tB9RoG4+
         T3yblk1WJGgW4FWeSv1FDsUGIVJumhTC0i42XJFwhBg6HZwCsElXz91NPoNLyo7hDJo6
         XS/oxQul+qTaPaTrmQm0unas0j4ykilNchR5qJ/g0aKFeeXvKhMcZaOQbBpZcCHkS7ss
         DjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077275; x=1743682075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgqWqvTey2/gQ4s56C3BtNu3p+nUIOiECXSnp663yXU=;
        b=k9HI5bTyA7QOXBDlH22PJzzcHGiE8/NpPWDASRyyb+8k82Az/4hJBwCBjx2g15YgIK
         r0RsBRYX7OX9mPTRABaPkZSeTMxfp+PW7CT6Mvc5pixURqrtAmcBdHd/oxuxaUcWDaFa
         OdRfb0Y2IlM8xvK6xGdHE846L0EXxipDuF9Jz+Gz+LGgGWkFEQsU31v4dxEtjR0R1WAK
         YMwKB06iUsr8nYtCRybStGDRQfvIlD+YEwLZT2hjrP5i3tsxBHkl3gonhl7vv1GT7e53
         D0Dfm76iKJ64xop4Cnqz4iNFXX3szhvdbki4kXL+w+k7yqZAWQGsWq+zOVbLiRbp5mde
         f8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUxAvwqrbWdlE/jTOSPfTi5AzamaH5VRNtdAdhtW9efNfD0vkDaeHzrRwaX/XHCSHYAeD+UJP6YCTfqG5E=@vger.kernel.org, AJvYcCXPmpAzrPU6SmQ94j1hkm3dMF7UPijQtpWnCNle72gS6xKyd0fEwxrDmwMR0jpHnFIZE+9otLd1tWs0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CnLKzVZY83Pbn/G9XemrnG0lZKfaGKAj7kR6sRCsIrj1nq9D
	ZN8oKx/+rdd6SMR7wH/5LFhVqM4UtyZSkENXhvxx+XYqtOhtLTM/
X-Gm-Gg: ASbGnctwn537UfwCglmV/pQtSKQfujWpeDBz8BmwV629GDDrg6tUjtGRsOTEXiH5Vpo
	tjxv/LYCERtglNrjq+LQapmAHB7v8QxkciKr+DsBg1Lbhtt3cEi5dcjv0+V5ER5Qk7Nn5J5VRU/
	n9CsXaY3o60zjeYJspFHywx8E+eUbI1gsYhu5KnHMuoQ+cRxTXPh8fh1mo8ad7OSrCKSX7EvZjs
	ZVZ2OexEIRwvudLsYPMC52eLHlQajy0elyprPAoum0uTvco0H8oMDJCQRHr+GiKGFyTNt678guf
	IaC/K6onKTgqjT2O++wqD+8V4mNjX3/Se8P9bXmg484sCoi0sw+xhvfH++8nsefO/Rbf1Gjc7Ee
	z2n63
X-Google-Smtp-Source: AGHT+IFC5xncfA2w+JPganQAY8oGyfGCYcURUerOaQ6toZd577lmSDGWj881GfZ2ttKq3gA3MGa/6Q==
X-Received: by 2002:a05:600c:c15:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43d85065ab9mr32900365e9.20.1743077274716;
        Thu, 27 Mar 2025 05:07:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ac9bsm35109955e9.12.2025.03.27.05.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:07:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-usb@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] usb: renesas_usbhs: Reorder clock handling and power management in probe
Date: Thu, 27 Mar 2025 12:07:37 +0000
Message-ID: <20250327120737.230041-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the initialization sequence in `usbhs_probe()` to enable runtime
PM before accessing registers, preventing potential crashes due to
uninitialized clocks.

Currently, in the probe path, registers are accessed before enabling the
clocks, leading to a synchronous external abort on the RZ/V2H SoC.
The problematic call flow is as follows:

    usbhs_probe()
        usbhs_sys_clock_ctrl()
            usbhs_bset()
                usbhs_write()
                    iowrite16()  <-- Register access before enabling clocks

Since `iowrite16()` is performed without ensuring the required clocks are
enabled, this can lead to access errors. To fix this, enable PM runtime
early in the probe function and ensure clocks are acquired before register
access, preventing crashes like the following on RZ/V2H:

[13.272640] Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
[13.280814] Modules linked in: cec renesas_usbhs(+) drm_kms_helper fuse drm backlight ipv6
[13.289088] CPU: 1 UID: 0 PID: 195 Comm: (udev-worker) Not tainted 6.14.0-rc7+ #98
[13.296640] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44 (DT)
[13.303834] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[13.310770] pc : usbhs_bset+0x14/0x4c [renesas_usbhs]
[13.315831] lr : usbhs_probe+0x2e4/0x5ac [renesas_usbhs]
[13.321138] sp : ffff8000827e3850
[13.324438] x29: ffff8000827e3860 x28: 0000000000000000 x27: ffff8000827e3ca0
[13.331554] x26: ffff8000827e3ba0 x25: ffff800081729668 x24: 0000000000000025
[13.338670] x23: ffff0000c0f08000 x22: 0000000000000000 x21: ffff0000c0f08010
[13.345783] x20: 0000000000000000 x19: ffff0000c3b52080 x18: 00000000ffffffff
[13.352895] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000827e36ce
[13.360009] x14: 00000000000003d7 x13: 00000000000003d7 x12: 0000000000000000
[13.367122] x11: 0000000000000000 x10: 0000000000000aa0 x9 : ffff8000827e3750
[13.374235] x8 : ffff0000c1850b00 x7 : 0000000003826060 x6 : 000000000000001c
[13.381347] x5 : 000000030d5fcc00 x4 : ffff8000825c0000 x3 : 0000000000000000
[13.388459] x2 : 0000000000000400 x1 : 0000000000000000 x0 : ffff0000c3b52080
[13.395574] Call trace:
[13.398013]  usbhs_bset+0x14/0x4c [renesas_usbhs] (P)
[13.403076]  platform_probe+0x68/0xdc
[13.406738]  really_probe+0xbc/0x2c0
[13.410306]  __driver_probe_device+0x78/0x120
[13.414653]  driver_probe_device+0x3c/0x154
[13.418825]  __driver_attach+0x90/0x1a0
[13.422647]  bus_for_each_dev+0x7c/0xe0
[13.426470]  driver_attach+0x24/0x30
[13.430032]  bus_add_driver+0xe4/0x208
[13.433766]  driver_register+0x68/0x130
[13.437587]  __platform_driver_register+0x24/0x30
[13.442273]  renesas_usbhs_driver_init+0x20/0x1000 [renesas_usbhs]
[13.448450]  do_one_initcall+0x60/0x1d4
[13.452276]  do_init_module+0x54/0x1f8
[13.456014]  load_module+0x1754/0x1c98
[13.459750]  init_module_from_file+0x88/0xcc
[13.464004]  __arm64_sys_finit_module+0x1c4/0x328
[13.468689]  invoke_syscall+0x48/0x104
[13.472426]  el0_svc_common.constprop.0+0xc0/0xe0
[13.477113]  do_el0_svc+0x1c/0x28
[13.480415]  el0_svc+0x30/0xcc
[13.483460]  el0t_64_sync_handler+0x10c/0x138
[13.487800]  el0t_64_sync+0x198/0x19c
[13.491453] Code: 2a0103e1 12003c42 12003c63 8b010084 (79400084)
[13.497522] ---[ end trace 0000000000000000 ]---

Fixes: f1407d5c66240 ("usb: renesas_usbhs: Add Renesas USBHS common code")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 50 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 0678830dc7ce..c504726ccec8 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -685,10 +685,29 @@ static int usbhs_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&priv->notify_hotplug_work, usbhsc_notify_hotplug);
 	spin_lock_init(usbhs_priv_to_lock(priv));
 
+	/*
+	 * Acquire clocks and enable power management (PM) early in the
+	 * probe process, as the driver accesses registers during
+	 * initialization. Ensure the device is active before proceeding.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = usbhsc_clk_get(dev, priv);
+	if (ret)
+		goto probe_pm_disable;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto probe_clk_put;
+
+	ret = usbhsc_clk_prepare_enable(priv);
+	if (ret)
+		goto probe_pm_put;
+
 	/* call pipe and module init */
 	ret = usbhs_pipe_probe(priv);
 	if (ret < 0)
-		return ret;
+		goto probe_clk_dis_unprepare;
 
 	ret = usbhs_fifo_probe(priv);
 	if (ret < 0)
@@ -705,10 +724,6 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (ret)
 		goto probe_fail_rst;
 
-	ret = usbhsc_clk_get(dev, priv);
-	if (ret)
-		goto probe_fail_clks;
-
 	/*
 	 * device reset here because
 	 * USB device might be used in boot loader.
@@ -721,7 +736,7 @@ static int usbhs_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_warn(dev, "USB function not selected (GPIO)\n");
 			ret = -ENOTSUPP;
-			goto probe_end_mod_exit;
+			goto probe_assert_rest;
 		}
 	}
 
@@ -735,14 +750,19 @@ static int usbhs_probe(struct platform_device *pdev)
 	ret = usbhs_platform_call(priv, hardware_init, pdev);
 	if (ret < 0) {
 		dev_err(dev, "platform init failed.\n");
-		goto probe_end_mod_exit;
+		goto probe_assert_rest;
 	}
 
 	/* reset phy for connection */
 	usbhs_platform_call(priv, phy_reset, pdev);
 
-	/* power control */
-	pm_runtime_enable(dev);
+	/*
+	 * Disable the clocks that were enabled earlier in the probe path,
+	 * and let the driver handle the clocks beyond this point.
+	 */
+	usbhsc_clk_disable_unprepare(priv);
+	pm_runtime_put(dev);
+
 	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
 		usbhsc_power_ctrl(priv, 1);
 		usbhs_mod_autonomy_mode(priv);
@@ -759,9 +779,7 @@ static int usbhs_probe(struct platform_device *pdev)
 
 	return ret;
 
-probe_end_mod_exit:
-	usbhsc_clk_put(priv);
-probe_fail_clks:
+probe_assert_rest:
 	reset_control_assert(priv->rsts);
 probe_fail_rst:
 	usbhs_mod_remove(priv);
@@ -769,6 +787,14 @@ static int usbhs_probe(struct platform_device *pdev)
 	usbhs_fifo_remove(priv);
 probe_end_pipe_exit:
 	usbhs_pipe_remove(priv);
+probe_clk_dis_unprepare:
+	usbhsc_clk_disable_unprepare(priv);
+probe_pm_put:
+	pm_runtime_put(dev);
+probe_clk_put:
+	usbhsc_clk_put(priv);
+probe_pm_disable:
+	pm_runtime_disable(dev);
 
 	dev_info(dev, "probe failed (%d)\n", ret);
 
-- 
2.49.0


