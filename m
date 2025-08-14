Return-Path: <linux-renesas-soc+bounces-20544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B8B26F24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 20:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6700B7BD090
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 18:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DDF29D284;
	Thu, 14 Aug 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcfSgPMa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C123D286;
	Thu, 14 Aug 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196885; cv=none; b=dD6taMAUTqnBgt98zluNFVc+FsT7JPUdC4+0l5ZLyGxKDwR2o3u4+A/Z1BybEMizXoFbhN/2gvrtF3pZeqvz5S5xCL7drATqtFUh2lYoKpvDK+yHi8qUG8JcGZZx2S1Q1a72qVCuWwi+vVMYJGIYJ0yJiqOc2CIRSuD0/k+9rGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196885; c=relaxed/simple;
	bh=PBvKzxHYUZyjBdDdRiFl/Ta3qJCEjZG1+6KKdRsoJK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkfYiYIz/zNgIDZ4SYYRE17gVV+xRmHws2e/pT5FBnrr8mNdvMA7BhcmI6VbhEDCC7l+/71mfUcgYA+Uf7eF41tVNe2JTKlf543mP/EHKdqggOvDff2ATR+ka0U1ogHPzTyl7T3BRyiP74daAGy5lFuQbVa8va/zFdN+ydRaBY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcfSgPMa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so8418725e9.1;
        Thu, 14 Aug 2025 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755196882; x=1755801682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NDZp57POD5hF/gYZ8czWKATBHo9znF4ipgYzEVstQ4=;
        b=VcfSgPMaqoL2Tv01Zm7R8LnKsxeL47ERPnyeHr3lQipm4Je+zjpul7xDop8TxRNPeD
         B4UNQInxwuA3TISl16UvnDP/DTYYcKoHh7StqDZmE7AME63uls0g8x3DKbQUyVufgm4Q
         xOUJ7uxI0n88/ocMfD6CYzQxBFwCI1winHrbgl6+/cevZiNh/6uvLGHPPeFeq0Op24Dm
         pTGfBnBJQnBNMSestPR8zEUeGWAFXmxGFR/dSDsuDTEJe8npu+iAUYBVSvPoeSBAtxLj
         rmy55j9gbxr+lmxJKOjgsquSMoD7ApWe0Kq9X/2Kc1qH2B8Od2pkOiopTTpqIAzv2t7X
         FMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755196882; x=1755801682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NDZp57POD5hF/gYZ8czWKATBHo9znF4ipgYzEVstQ4=;
        b=TaBGoSR5Ui4Xg7ELyHN6+sbKwwsfVzTiZi3vMkPnSq8Ba0pzfrA4BrLMrpwQgiyqz2
         pelEisRUGijcfjpIJ0rjhELLzEsJUlsmMcKU6sedZigOihQdgl0PGSOhEoxbvjTTqnQW
         OKjX0np3E2Vg6GH8uq/P9C7yq1bYqUk3YGBUp3/Xgf3Krg0i2nEQt0X63r8kDIYr2uha
         gbc3uBBUp5mJPcDLj5sn5bIpoc8WIu1gAk/9b90D9b2pVMNb5g28PKOIqxod1i1CSbtA
         VjpBjOhN671Cv2Hn6Ipr8Ywp3YJXloog8a1iqazs9a2lqisBipts3er/OMlmWG2sd2PJ
         95yA==
X-Forwarded-Encrypted: i=1; AJvYcCUJBPP1JrILdK7/th+6bJddboMGz3T1+jM/d53ZXl8ID1f1C/sU9je/aoR4ZCfbLIdYeqSyHH5sYabxETKQHIgIqIs=@vger.kernel.org, AJvYcCWKI+QfZbyJxPpLigo6MZ5UjJms+pZ+TDjv8Naq33L0cne3e0Wmj9m1HMFzTZI3cjswvvY4ylpi4KTj@vger.kernel.org, AJvYcCXYW1wNGDTHfc5VHwZ/xwwaxhmRmLNu47PyNmg9lMCjTkgwvxv3Wu79/i718P4mjCSwuw+1eMSQ2KtnucNG@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMYE02XjwsZ/uECSK1Sn+jcwth0N9g/FejBhvvkes21byMC7f
	+yuec4l4Fu8RGN88542Ue7iiXvrED0WmCzHNoAIMy6J5llEIJuwFgsbL
X-Gm-Gg: ASbGnctT39II6nXwJnd4GaemKO/w1kp1UFk6YoXW1Ejl5UBB3hffV3G+9SUxwYPodVH
	UWz3PZJ/sc67B9DHW9/RZqdayz8je+2Us5h15+ZzzYehPLtVx9V2oLKEjL2I0UEuuG3gSKDOSA4
	c1nk/D3PTihiCiYXBXAwiSMhKF8hesVPE5FGUMWHVt2ZjGdTVDAze+i5Pri3wr83BJkxtyeLBr5
	Qx6NEeGKggUnk6IuqNAZInWoqtUKA2H+ZT6NEt4oOOcm/oQ3B98eRxos9NMUakAIa64Fe3poLZa
	Nwdig4eIN23RRv93tgQ8Dh1CtZTkfkisPbAi76zQWkv6UdkzeSDzQjv2TOcSon7bQnLt8HH9X8q
	ZJnLqcalCSgYqWaUGZ0puxwH0RoXKovNM0uVrG5cMTjtQJlIQ/yWlGCWkalDMmHFjZ9ZIQtDTXQ
	==
X-Google-Smtp-Source: AGHT+IEWEcPw3RO11WRFgKG0+rh3Yd/w/ToMDK59h6Y+l9ww5vSXXE0OkmF7Pxi1Q+eLhZwsCoxRCQ==
X-Received: by 2002:a05:6000:400b:b0:3b7:9aff:db60 with SMTP id ffacd0b85a97d-3b9edfcc5f6mr3695502f8f.10.1755196881904;
        Thu, 14 Aug 2025 11:41:21 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453aeasm53744383f8f.40.2025.08.14.11.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:41:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable GPT on carrier board
Date: Thu, 14 Aug 2025 19:41:11 +0100
Message-ID: <20250814184115.192930-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814184115.192930-1-biju.das.jz@bp.renesas.com>
References: <20250814184115.192930-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The GTIOC4{A,B} IOs are available on the carrier board's PMOD1_6A
connector. Enable the GPT on the carrier board by adding the GPT pinmux
and node on the carrier board dtsi file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 1e67f0a2a945..093c0202b4f9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -84,6 +84,14 @@ &can_transceiver1 {
 };
 #endif
 
+#if (!SW_LCD_EN) && (!SW_GPIO8_CAN0_STB)
+&gpt0 {
+	pinctrl-0 = <&gpt0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+#endif
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -125,6 +133,11 @@ can4_pins: can4 {
 		};
 	};
 
+	gpt0_pins: gpt0 {
+		pinmux = <RZG3E_PORT_PINMUX(5, 4, 10)>, /* GTIOC4A */
+			 <RZG3E_PORT_PINMUX(5, 5, 10)>; /* GTIOC4B */
+	};
+
 	i2c0_pins: i2c0 {
 		pinmux = <RZG3E_PORT_PINMUX(D, 4, 4)>, /* SCL0 */
 			 <RZG3E_PORT_PINMUX(D, 5, 4)>; /* SDA0 */
-- 
2.43.0


