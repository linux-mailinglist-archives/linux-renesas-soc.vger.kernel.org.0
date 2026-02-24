Return-Path: <linux-renesas-soc+bounces-28420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO55ITJXnWk2OgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 08:45:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85818333C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 08:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94C233016883
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 07:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BAB1EFF8D;
	Tue, 24 Feb 2026 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czKLtXKl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B632D6E6F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919152; cv=none; b=swFj1Ab/xDqRveoqiAhq6TFP7tk5FXch8fERKoaaRsNYZADU3LrrD7BN0HtKPs4YEvKW694817q9JWCIVGW8/+cr14MsP8+ZJ4nswp1ahiwmgDooHQyah3GE8PPPYlAsqbpEt55AA3hZH4ycZzXomh6GiXcCVHq3UzuGEJiMIfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919152; c=relaxed/simple;
	bh=EgvBwVW3fzHxVZwxqweEzA2aY5ov4rT0plwRdInAfTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8PSwbieBSWnzD/BESM/rtpBrnDJWH7xuxLDhe/XkyvYbitdD4m+O2z9t8wEsdQivkq434ybXZ/VYOWCCPH6x00mjsllirNI+1whIxFp98D4Mr0x7P5IbuOGtumanrMDjmkB/qhtfzEzHW+3EQsJ3FQULtmT/X2vdpa6x07wMsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czKLtXKl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ab077e3f32so20928375ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 23:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771919151; x=1772523951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik0I2eRajzcaY/myt6ewZrh7yPRrQbzFl835dyaF2rk=;
        b=czKLtXKlFDMh6UUATKMfdR/SO0yS39hkFPtRCQ0g1znfcjQVNSEujq8Qm5uCObIDRb
         t421XvWa88Mi5Ih1TWKUcIlYBcEQ77cnlTaB0bil0OiHViHkWyrA9M60mVMrwCw6Fjdb
         LGF0zu9tLr9sjLmaQcsf0DvM7pU/UgT0HQuWFd5Z96/A3ep0QSvr5UjhHNh5UcgvuYML
         r0CyfSsZrfqxdHhGiO+jDAVOI1YMVCwIShCstCrjlMD30rULNuS6kVwayvZUmVbBG9iN
         sugAf30e9HKPjepSCzr1g38EltlD3iOIOCKCrDi4Wa3NoRFZw1UPALRb7yJBNVcMvHV7
         ffQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919151; x=1772523951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ik0I2eRajzcaY/myt6ewZrh7yPRrQbzFl835dyaF2rk=;
        b=SEoXOJLnoK4oJRC1guSJAV9nwqMP4gVo+8AJ6JUMksO4oTlHBEcOg7+XDJAjk0wy+2
         MkM4VsklO1lP03SDJKFvLtGAn3PSkIO9ONdUCrsQvXUJqJSv6X+sUNqqUvzVintjHHVY
         Iru9ZEjsA5C4SjwhWmKThNNv2r+e//ifhllSjDqmuFtWHvdPNm4mJtGZzwMHTifT4Fm0
         1FiHZt7+dbQ8Qo9SLVfliNJlENmhRjycYxc3KeD9JnjiprW0ex9eq3mGkoXBhgRv+RCb
         bGDkxKiD20iryyDcWgO2VMYiPVLFdrG1SjKtoSBlYaCZW4bG+8q2Sy/o6MQjwqKdBLHY
         jCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhhQtyMs/laCTNdVWhMA5isSx11nXUtxMUS2t7X1GGPRtfJxaaoqYHFxKc2dSyxrvp775u5qWSRBRiPZw1103+GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvniPQ6OSq40WzvIEAd1sCwzJiYeKLCG92wIEXQUaThnDdG7D
	wwSScYBbKUizS4du9UgqVnMes1UwORE52e3m8W5/q/vyoak6HdbjUl4M
X-Gm-Gg: ATEYQzx6z2eK9qAeL/ryVNpAIiCGpbRZSTHlPW65I8SYNvhBOlW2nEAawrIyT5q0jTI
	e9VEJfmREDddNH4hAhYX7q3+qHPfIouSFSea+M81i6cyBXdojq96PjHROkJtxUc1zG3srqgwTok
	XTPfmIfzPYLsg8FQGLyvh+3wEm9geQpoxbLEcHhN+anJoAIbQEqVzb9zCKD7b3qRZ+LvI2vmqCB
	XTvsXjqg0cdzaujORuOM274gs8S9BcR4ihSIAZNBySXnbIDvsW/eAc/wSleU5a1IQPM3IVSswMd
	BV32uAXiImFS5PZX6sWTBGHU18/WxgcV2fVr+AkGJu5o9/D4r6B3+J6/2/D03GikxYa64cSa6oh
	RxxGiUPdrl93F+8Aszh1GMXGyYlF39YkROSYozwJRnuf1l0u1DJBtfKkQ4inCe29vui/AFisLgl
	O9Kw43rXkFXfA1tn4PAqsf8sdONQ==
X-Received: by 2002:a17:902:c949:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-2ad744553e2mr103623015ad.6.1771919150755;
        Mon, 23 Feb 2026 23:45:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d8e3e73sm12537377a91.15.2026.02.23.23.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:45:50 -0800 (PST)
From: phucduc.bui@gmail.com
To: phucduc.bui@gmail.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2] arm: dts: renesas: r8a7740-armadillo800eva: Enable SDHI1
Date: Tue, 24 Feb 2026 14:45:32 +0700
Message-ID: <20260224074532.60046-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212073819.41304-1-phucduc.bui@gmail.com>
References: <20260212073819.41304-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28420-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,glider.be];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C85818333C
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

The Armadillo-800EVA board provides an SD card slot and an AWL13 SDIO
interface connected to the SDHI1 controller. Routing between these two
interfaces is controlled by a mechanical DIP switch and a set of
multiplexers.

This patch adds:

  - A fixed 3.3V regulator for SDHI1 power, controlled by PORT16 (G2).
  - SDHI1 pinmux groups for data, control, and card detection.
  - A gpio-hog for PORT6 (J5) to control the SDHI1/AWLAN multiplexer.

PORT176 (N21) is already configured as output-high in this DTS (via
lcd0-mux-hog), routing the SDSLOT2_ENABLE signal to PORT6. Since the
hardware includes an external 10k pull-up resistor (R94) on this line,
PORT6 is configured as an input to allow the physical DIP switch to
determine the routing without SoC interference.

Both configurations have been verified:

  - SD card (CON8): detected as mmcblk1, high-speed SDHC.
  - SDIO (CON14): detected as mmc1, high-speed SDIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
  - Added PORT6 (J5) as a gpio-hog in input mode to preserve physical switch
    functionality, influenced by the R94 10k pull-up resistor.
  - Included hardware verification results for both SD card and SDIO modes.
  - Improved commit description with detailed hardware routing logic.

Note: While a specific driver for the AWL13 SDIO module may not be
present in the current mainline kernel, the SDHI1 host successfully
detects it as a high-speed SDIO device, confirming the hardware
description is correct.

 .../dts/renesas/r8a7740-armadillo800eva.dts   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 04d24b6d8056..e7aae1e32b2e 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -65,6 +65,17 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
 		enable-active-high;
 	};
 
+	vcc_sdhi1: regulator-vcc-sdhi1 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI1 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pfc 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_5p0v: regulator-5p0v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-5.0V";
@@ -285,6 +296,11 @@ sdhi0_pins: sd0 {
 		function = "sdhi0";
 	};
 
+	sdhi1_pins: sd1 {
+		groups = "sdhi1_data4", "sdhi1_ctrl", "sdhi1_cd", "sdhi1_wp";
+		function = "sdhi1";
+	};
+
 	fsia_pins: sounda {
 		groups = "fsia_sclk_in", "fsia_mclk_out",
 			 "fsia_data_in_1", "fsia_data_out_0";
@@ -302,6 +318,12 @@ lcd0-mux-hog {
 		gpios = <176 0>;
 		output-high;
 	};
+
+	sdhi1-select-hog {
+		gpio-hog;
+		gpios = <6 0>;
+		input;
+	};
 };
 
 &tpu {
@@ -336,6 +358,15 @@ &sdhi0 {
 	status = "okay";
 };
 
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi1>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &sh_fsi2 {
 	pinctrl-0 = <&fsia_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


