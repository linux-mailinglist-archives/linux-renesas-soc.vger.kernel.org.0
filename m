Return-Path: <linux-renesas-soc+bounces-30263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePb2HF4OxGk+vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:33:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 74723329141
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B09703009F0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 16:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C063A453C;
	Wed, 25 Mar 2026 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNr+JrzQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A5024E4A8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456065; cv=none; b=d+OZ9JhCXk9YVnAbKEHr0JUR7npxVQpGXdJTnXPdbmXARzJ5AthySvaltY7WakNJCLd7eoXP/Gum16dXfZ32KNwdGF9V5T1ViK2WC/2WRPFOj0PiOVjbfazOUXohpHcs4hGVeGV4yEYTjs3FT08UD/uxCWLaZqt4qEGb8yMmeno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456065; c=relaxed/simple;
	bh=mPX6NAeZDkROhXMP56+7tMeFl2KtVn3Z1ugGBvlUIgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRnyLn8UVBUd73bxtsCOpt031ztNmrS/fgslGGsB3JuCFkzQcgffXsVEZCpW9A8Zkr3v5N6AffPEhvJLNcw908MPuul6wNvb1DG6v9a3tHgW0v7iHZrVDatvvgAZpwaXRZSxM0Lb+Pjj6ZSGO8PZEodSQpu9xWY5+mtXAamYmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNr+JrzQ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899ee491af3so26301536d6.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774456061; x=1775060861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2g8topQOvfOO8rlahI8ziLuuIYQbiMR2HTZw8FnPzWs=;
        b=dNr+JrzQiEjNtXNBio2QY8lVT2p7s9GrH6Sa8T6qcrkyU6swPUNXx3dkCRCL+leA8y
         qnBkU/Z5gMz6rPjYILRaJKedyhiyHu9zZXi0+i0EFlx/24l/GnJhE+6Ol5lgUDVOky6D
         P3WHXKFcaN+UmfBhTFgEPesMsAKQ0hgcWmmFK4KHzvHW3Ggy9XJNDKtzW/mHqyMhTT4m
         gJAgMNWFwCqyJaIE8MRnNy+7ASkYIwtxBZyIhBnkw++4cB2MjNO5Wee5VwIN9MzLSCE6
         0lkv8+g6Rv+fT4Ov6WypwtVyU5fta0O8S3psx3iT8vj1jGm0HbdWcaEgZNcF/JikSkhO
         vv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456061; x=1775060861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g8topQOvfOO8rlahI8ziLuuIYQbiMR2HTZw8FnPzWs=;
        b=TLV8uONmRC+pP/U/WQY4ijWe8tKPsfe0rFcvtXzJmx72t6bXce3iCLFTtTS7yNHLJA
         8s5kfMU4SpFBZKvnbUrLwkt45kaUE58BE6t3Vn6TftE9EnYn3Fk12AkgALo4KS6VNN+t
         tZyUJUo9B3d+eLYxZbtx9pGkMaX9eEu+H5eI7zKY43oKd1dCTZlrMFMx6SCi6/FsL3Sz
         LfBkLoJ0BHlr5Fhf9pINQwytX6NLIY0Qb/dHlm30Q+NXmRPW3Y0VsfypX8dyqeIcXKQd
         x/slXEHsf1Wf8onxpqSoFG8VfAy8TeuLXsQYirDe4jHNFhc2OUJL1DRh5KI7l9jF4zfN
         63aw==
X-Gm-Message-State: AOJu0YzvcB1J58S4Plo+0vSO4k3XCDw/8UWXFuzlDZHS8RblUaFBaNx9
	sGEOFBC42g/o/bGIxOgfnXPIuo/npsx9OIV64GJEpw2SoFhAfP7lxGPJsoVSrg==
X-Gm-Gg: ATEYQzzli2I8TgYwEDyymtjGCxq50fiE6Z6B8hriFFoRQRcWI+DOEHa3SvyLBcvgp5i
	GYRaM8Ryn5rpxcdp+2BHnteYd9BU5DQPOxGphGPMZvh+RYd1ZvbFJHFdTWnG8bwqYCsnumlCy5R
	yc+tRqCIRmXdAi9flZW8T6pxhMyyT5NhET60Syt+XlxcDlax6he/CpZXmXHBfTxAhSiJ555VKry
	Lq4a9MRkyeMMg01jlAla/yx8o1XZpfjcdHCzuS2dh4lzxgSdrq3WSVlPCshStcW6JmC7x1lL5wI
	i3Vmoms7vUkbFAvQ3P7waZBSz6yBXiJfzc7v+/FXMfNxgSXwTc428vQ1thdksJX+nhpT5hmOFgb
	6j9DCgT47YG34z0yDC9AyTWfRN+UkzZdHozWZJJqH9FMb531tLzKla12eBjOa7OPR2tZ9iuxbfo
	3jgIRWV7yJUp6Gn6EwBdydaSnJ5t9u6FoKS3npDxidRyxvNMcovRrtMvFWVSJ16OBKagYdth2dg
	A==
X-Received: by 2002:ad4:5ec9:0:b0:89a:14c5:f74 with SMTP id 6a1803df08f44-89cc55000fbmr61189566d6.54.1774456060874;
        Wed, 25 Mar 2026 09:27:40 -0700 (PDT)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5a197aesm1167936d6.26.2026.03.25.09.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:27:40 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: marek.vasut@mailbox.org,
	Adam Ford <aford173@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
Date: Wed, 25 Mar 2026 11:27:35 -0500
Message-ID: <20260325162735.24467-1-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,gmail.com,glider.be,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30263-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aford173@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.70:email]
X-Rspamd-Queue-Id: 74723329141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LVDS Panel was never shipped from Beacon, and there are device
tree errors, so rather than trying to fix them, remove it instead.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Add LVDS backlight, some power, pwm and pwm pins all associated with
the LVDS panel.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index d55f2d7066ad..62ab0a3776e7 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -8,15 +8,6 @@
 #include <dt-bindings/clock/versaclock.h>
 
 / {
-	backlight_lvds: backlight-lvds {
-		compatible = "pwm-backlight";
-		power-supply = <&reg_lcd>;
-		enable-gpios = <&gpio_exp1 3 GPIO_ACTIVE_HIGH>;
-		pwms = <&pwm2 0 25000>;
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-	};
-
 	backlight_dpi: backlight-dpi {
 		compatible = "pwm-backlight";
 		power-supply = <&reg_lcd>;
@@ -101,38 +92,6 @@ led3 {
 		};
 	};
 
-	lvds {
-		compatible = "panel-lvds";
-		power-supply = <&reg_lcd_reset>;
-		width-mm = <223>;
-		height-mm = <125>;
-		backlight = <&backlight_lvds>;
-		data-mapping = "vesa-24";
-
-		panel-timing {
-			/* 800x480@60Hz */
-			clock-frequency = <30000000>;
-			hactive = <800>;
-			vactive = <480>;
-			hsync-len = <48>;
-			hfront-porch = <40>;
-			hback-porch = <40>;
-			vfront-porch = <13>;
-			vback-porch = <29>;
-			vsync-len = <1>;
-			hsync-active = <1>;
-			vsync-active = <3>;
-			de-active = <1>;
-			pixelclk-active = <0>;
-		};
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	rgb {
 		/* Different LCD with compatible timings */
 		compatible = "rocktech,rk070er9427";
@@ -164,16 +123,6 @@ reg_lcd: regulator-lcd {
 		enable-active-high;
 	};
 
-	reg_lcd_reset: regulator-lcd-reset {
-		compatible = "regulator-fixed";
-		regulator-name = "nLCD_RESET";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&reg_lcd>;
-	};
-
 	reg_cam0: regulator-cam0 {
 		compatible = "regulator-fixed";
 		regulator-name = "reg_cam0";
@@ -480,18 +429,6 @@ gpio_exp1: gpio@70 {
 	};
 };
 
-&lvds0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			lvds0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-};
-
 &msiof1 {
 	pinctrl-0 = <&msiof1_pins>;
 	pinctrl-names = "default";
@@ -562,11 +499,6 @@ pwm0_pins: pwm0 {
 		function = "pwm0";
 	};
 
-	pwm2_pins: pwm2 {
-		groups = "pwm2_a";
-		function = "pwm2";
-	};
-
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -617,12 +549,6 @@ &pwm0 {
 	status = "okay";
 };
 
-&pwm2 {
-	pinctrl-0 = <&pwm2_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
 &rcar_sound {
 	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
-- 
2.51.0


