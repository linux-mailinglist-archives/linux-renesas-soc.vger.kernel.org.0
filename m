Return-Path: <linux-renesas-soc+bounces-15437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF0A7DB84
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86511790C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 10:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E93223A9A1;
	Mon,  7 Apr 2025 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgpOFPgi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA3238D31;
	Mon,  7 Apr 2025 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023014; cv=none; b=itGiAz3icykfo52uVJBfC/PJmxFcSu+A13izbxXccSAQTSNbx4JjXu3ITbvyUJz/PoXJ/aXsWUAMOSDOixcrDXXgAJpHLuwNlDXTPhIdV16+R5Yuo1Nnu1msIinpAOI58hj0trKhdwLpBF02RZ8fado2mX6+4LqWD0gK38RzFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023014; c=relaxed/simple;
	bh=M1ZKOgW1n57B2nbBeuZf06udUcxV8H5OpaY2xRZXsfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9dszPuggqbBpdeJ6e8JF0M3rTqQEr61jGC/o0/iq5DDu6m7ySFtCZ6CsD1D67lQ0HJkIiCJw6rHw2lV8Q/780+MRTzwCuJDkaf7DTjwpnZ3MNDg30p04uE6WP1hj23jVftRTdCaYl+Ja3Dszed+cyBJIZ3wWKtiN5fcIwyiwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgpOFPgi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so38321025e9.0;
        Mon, 07 Apr 2025 03:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744023011; x=1744627811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5PfyvK0EHksIxahc3vrkGpOF60charYPKbKSdBdtqg=;
        b=DgpOFPgifkzKRSgLlJ+YhQdMcwalA4odQ8tOluEH7gxyaZ8aB4OjLdegQJGrb3zUD8
         AzqmlI0KHB99ei5oEB0Gm1/hZV6vOFo8XB4712E6UGCLQ5GEIbv35DdgkgVrkYEUxNKL
         HY0qKcUJ+Sb1pP7YQZ4kmEDLkyyTEt8F9ngvQhe+KBc6PIH830YJi6GaYiv4phF3j98e
         9G8k5vDHB2J0ol6+BpKkYdZn1QMZTnIHPTWaS3PWUSqcowaAexReRX3mk6rVNjv3qc20
         uABRAOoMr2mPf7aDv+23IY9KsSo07Kx4WDckHNDwSl8tSwLeHBHjfryAC08gXWrxFOK0
         3s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744023011; x=1744627811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5PfyvK0EHksIxahc3vrkGpOF60charYPKbKSdBdtqg=;
        b=B77MCZTCmV/LES78gkkd/I7azMW5Bulr7fnrNQLyPsPXMdt+8wUdVBf63I90GwQolk
         V+ViuBKnGpyOoS6S1TG2ymIsB8/7EDakoCKWedv264vkHNm4LPFUvQOOfb3bfERl0nCF
         I/MIDZo1NE5CTnY1BDxwhpHHLVmLjDgGWRwiT/1ccFNmIFXk2aer1x1L0fOknMimz5ax
         FZ0XfrVM++T0tm3lHZpr9vMlToK1jCnbcQFx5L1E27VMsYLh3DxCJ67FIsuysUCu/OmN
         Rj6b5CbPcObBILGk6KLZ9kJu25qEbd+jA0ig9tUVKV88YGABoxiIzwDt7wiT6LRp5FMX
         iFcg==
X-Forwarded-Encrypted: i=1; AJvYcCWH7/uOowwuykwxdAxqcDpQHz+JHEMNCaLk3/CsYcNtJwxnCspR4LrpQDbsZYhb7oflE2WAGS+jjIqb3IW9aDAOLFc=@vger.kernel.org, AJvYcCXs/lKVM+ViZNkCbFJmLvDV5TxpTdiiQIb2wbQVZ9nLK9Q/ubr872nvM9bPN5BFmQ3NHvc3Ryn19iZSct8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6DwSRouqhOCvX1+HQ42Oot16nP22V0DYweuaPMuzlPNKFdun
	fHtJ767sZjnHJzdoR0FVqgKF18rzolM+yqCXL/citGV005rdg1sj
X-Gm-Gg: ASbGncvJbYsIeYyLRnUvbmc1QjdjphpLvV6kTZB+kYpum1uqrWOxMjba4725cmhPwPB
	xDS73OS2UAWFOczN9D702LJNNs10juYdMeCF3n7YWw0AMVckjYQ5YjsJK/AGDto/NaUKI0mT/ar
	CngTdGB/XNdqfNGyuvO98cWrhQWRjjFpKH5MGsjZLYixoQadGjgx7bAcA7rbrES6NmebW9cmzv9
	y7V8bB8csjMkGi+1SegAhEUOsx4rcN/6b94plUXXxx8+uQCR5yd7tH9JYcDoc8MtvpHD6CdfaZ4
	mDz165B0sxxBLFywkkrIoulMiL15qsIFJpcLTUaHgXGnR3GC1d9952ImhXwot9UZLD3gnQ==
X-Google-Smtp-Source: AGHT+IGnt5id742CxRyj846Uuof7YiHdnbsgHm7Cy93tRKm15j6a6Hy36m/bf40XP4sXhp33LIkiLQ==
X-Received: by 2002:a05:600c:34ca:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43ee0768b1cmr74357675e9.22.1744023010610;
        Mon, 07 Apr 2025 03:50:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm129975765e9.0.2025.04.07.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:50:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and power management in probe
Date: Mon,  7 Apr 2025 11:50:02 +0100
Message-ID: <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 703cf5d0cb41..f52418fe3fd4 100644
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


