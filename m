Return-Path: <linux-renesas-soc+bounces-29905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJh6KDX6u2mzqwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:29:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 099632CBFC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95A7B308D3D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333F537E2E6;
	Thu, 19 Mar 2026 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiDU1B+a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B573D34B7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926958; cv=none; b=p9cWvpATRXudaEAf+H3uFULViYXyAH2lSruwQ45rM9MVrzXw69h3S4ZXjsLgzuauQo1v8W5JP83b9zpCH589yRQB0grAvzsCNfNBwilHDCMHCAGebnF7tEJdfyJdBCp+32S2Uv7CswgFX73z5W/ODdQX2ZTDkk67woRGdxoBQE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926958; c=relaxed/simple;
	bh=VRgAkdyRMfnSvzgx2lhwuJvHQrdfzpIbhlWZuwEHB94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7c4mOMzM3Gs9MPzZEeep3xQ99SUAZEHs+X3X79vC5rz7aXoSxOH7+iao0H6yquesw0MTH7szav7QFKwZCffSR2Otnh8IN+dKRmH9iA7rj8I1KY8fL6PxEesdcssqgvA+CIDDsKTKDICeE4lkvtT6tnviPBnvC6zJslBPgU21Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiDU1B+a; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-509064418a8so10390771cf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773926953; x=1774531753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYhP02QkOfJ2jdHzFLfwbhYh2I9Jpna8dg7+RGyb+Jk=;
        b=NiDU1B+aNPod04wdSwL2vGB+Jd3sdUmfUO/qhSwqgMXz+MlYwCc4WuMiH4o8YrrtEd
         uKcRNSgf+JX4TgIlA9DlJLXA/BnPhZFSUKyVm9QZCrEZAAts85G+8niaIMYywV71CsSY
         ZOTizG7TsvTFoglSv9wzdVz8pz4FpzgmjwPbMAhESxnagutww94a7jNxgxEm52EvBQvs
         NCWBpEvFfgL91DJaii/WQ0+Zx1hUtMxHK8ozOhs8os4SH9K7Jw+LliDeHxVvubSPDLrl
         id/39NCFDth6LQogH7S5cCChG7HWraOOxzMlL55Mwr8jjYCFYuQrIwWEvZth2rpREK6d
         NB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773926953; x=1774531753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYhP02QkOfJ2jdHzFLfwbhYh2I9Jpna8dg7+RGyb+Jk=;
        b=du0j7KGSpzKc2wl2JagnW821+6NgebJaeABlhAnV2zP32ovlHbIKNSXcyzW4mGfXt1
         AjN5UfJQ1yMTJsbuUr4AUx55y6tV8lYfiaAJV4HdeGTNgxfdNrYRgHcYvlXIl3oGR+4O
         QCaY9WUVNq7uchpUVObujkRvbP2oE5au2VjkWT3f/xmb8J6T0DBrO4EoUH0Ef6PWs0Hm
         3ugANdslrJGTDdxdtnkteO769ySLAYK8orFMlyTb5mtdoPbiWHidoGZG7Fm3CqvEnnB/
         /CTLL3SVODHCy9gv3c9auJCACe9zrYckQwC9tbE7g3kW/4yp31fZD9CTa9EdmyZwEtJN
         Kqyw==
X-Gm-Message-State: AOJu0YwPAbKELjRuMFznXKJNpMK0gYtHoJ/r0ZkwZ4q0voQuJynLTKDF
	AOXY9vYH/+1jhRz75s+gE7AuyjsMxlmmcbiCZKWCGhszJAzYbW8JswWGhfQ5Bw==
X-Gm-Gg: ATEYQzygpVbQbdfep5+aKvlthMeNrJKWb7KhT0wx0rmZNN0Wg7SrmvPZG2Au0KvRRdT
	8sShnSZl3CrFM8PZQUbF0oASHRG2+aZiIr0NMI6lyEq5SZ0ttT3er0Eu6PXuUusIYk3rqiaf+3r
	3aMMcKqzkDVcr+kAocHer2r1VJNN49vKuncLsf9l8f832pjhA7B9mSUUxcdKfxmnyzDJLlr0btE
	twKLa9PEzqyXwrzoSPm1w/YC3fGNJkParTDNbCLeHEBrJiIzsiI4ex24gxqbyi6ws5lSU26sPUV
	JPQMLF25O3WB5DZn4KmM3XTR2LFUwdXv4FQN7hyNSFQUvIITY20Jjvkj88uZz+p92CtIyKgJna+
	2PTZmZJFpZcnlAn54UlaYugkI/dNsf5MoiE9/njEtcWGilyJ9mmcjh/TG2IDNw8DAGqrGWaGKyi
	G5kceL6OVVYr67m3NGSp18xXbJbHoloawisQImUjb25o/WQBBQ63uW3P01IPwjbIs0slgkobKsZ
	A==
X-Received: by 2002:a05:622a:20d:b0:509:39b1:d4b8 with SMTP id d75a77b69052e-50b14863b72mr100330671cf.45.1773926953275;
        Thu, 19 Mar 2026 06:29:13 -0700 (PDT)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b913e46sm45492176d6.21.2026.03.19.06.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 06:29:12 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
Date: Thu, 19 Mar 2026 08:29:07 -0500
Message-ID: <20260319132907.2350458-1-aford173@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29905-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[mailbox.org,gmail.com,glider.be,kernel.org,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aford173@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.946];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[60hz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.70:email]
X-Rspamd-Queue-Id: 099632CBFC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LVDS Panel was never shipped from Beacon, and there are device
tree errors, so rather than trying to fix them, remove it instead.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index d55f2d7066ad..dcc98e8424f7 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -101,38 +101,6 @@ led3 {
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
@@ -480,18 +448,6 @@ gpio_exp1: gpio@70 {
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
-- 
2.51.0


