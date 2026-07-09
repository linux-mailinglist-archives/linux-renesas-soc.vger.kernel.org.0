Return-Path: <linux-renesas-soc+bounces-34933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7yOVC6ZcT2rVfAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:32:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A572E529
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:32:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GLZ4dWYo;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5F3B3051452
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56903F8243;
	Thu,  9 Jul 2026 08:31:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD83F44CF
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585880; cv=none; b=gmNrYm46zwmTi0i3UeYF2k7BvjeJY1tVjiBilcYX5OzprObiwWBW7+DgFq4JYIt/5W8uXWFvOo+9vVPiZKjV08xlUSVCteDPfzMmX+LGQeCDiE3L1PJrqoYhOmmgwquACgYtC3SCgv8ahN0CkfuXS396x4sXzg1WUpOVbkGpEyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585880; c=relaxed/simple;
	bh=21Rj3FeOvdSNjA1SYvp0nD5emvcqesX4OzhB5eUP+dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MS914U6xMsr6Bsl19TMjdUVBAxoHRDo0S3rxLSX0Qkl9w3gQTCAzKhfa79P+Jw57xAJgXAJTDknlwfbKeLVCKxqc8ebRU/RNeAOuQRNwx6LJr8A72gz7+NqeWFlaZOdP97GeJHO6Kth1zzSMOXrbAqRl7RhHcosBffShSanyvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLZ4dWYo; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c19bad03so14698915e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585877; x=1784190677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7dHFdWjQS6co2u1ICLYU9FzZX279DRcjq7ALWW6jQA=;
        b=GLZ4dWYoPfLekQnwWLEeEbZDLUnpAFnMqi4t6dmv0F9RLNbwKKfmjuBBPDUAvvbCFs
         28aOCY2SUc4wSGrQLRcYbgkeY95dveeCpS7j0/6BYA1UHBUC6rC38b3Jvuz0SJXb13GB
         +5DUruAUdJFxLFmsmTxpXosNVCEFZEUpNE1z7aW4G1Hrb9jsOIPw5iPN+saOJZdobisL
         OMmHGHk4SS/FYkxWxN5wtPzES/TExCM5DZQfC2rxjaYhG0V5G7dobBJXARZPr48Ig1mE
         kB3GHDFr4wQ9+L2QZxtkMr7bGnpEWwNXoxO5C5H4yiruDUwyUgMirYStk3JpfvMyRoMM
         Q0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585877; x=1784190677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7dHFdWjQS6co2u1ICLYU9FzZX279DRcjq7ALWW6jQA=;
        b=ZP5aC9CHONaSeVEIEHQ3n6IUGTFkbNBBLNXH3V1JVZBAg+4O3sf9v+Vu5Wzkcbiz+N
         dECMnBGeKE1nemwv5tq0UZaf35KdYo+5kwkMTT0F/DgSFKfxiRepqAJNslYTs4Y7gKFm
         YzniQW+e0HkLWgVbv5vHEunwsasGV+r4Q02PbSeJdcqfPBQz/G7bXXfN3/ZjU0pj66TW
         ZlW9GedfJ3DYWESAmU5FCaxunu6LLZPAI1jxn0TX1zcKsUx3pcfTzYoLIaA3zSd43Auk
         wW9I6Ektjju3L9h9bKFCmCmJ5j4gS7CaYASOSJ2mQ42A8T6/pLHM9Y3gzJqk+bYOfj1Z
         ptcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNLkyJkyn1TPbxfituE5nXP5gTQlvuDed8WAS5G08KYT5wHaENdBVQelA4HgzHieEgrNz2jU6u++NjUaq7bB0iPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGVgsWWo9r+UL8FshKnqLBJ2hDhXsN5Edbx7RQ+R8zncB55eU
	l1P5CYyxXOiYGgQNLMETdD+zMB+UNR/A2UkXEsGO75abvniU/gsGt5LQ
X-Gm-Gg: AfdE7cmxZ7zvnnV/m3hyZMWE9KOMxlMfhAYoKHTYN5TD167FGQXdAFhYmSweUe37WtJ
	JETaVvhqYmWMOmA7Mq622SYzISGKhvxO1Ku8tfPSCUJTcS2M7YTw8XYxE3G25iNX1WM6lZRNREZ
	mG732/3eZrQo5k7DEosRwQY69g85G4YBy5D0VJWXJXe1huk+sOTIZdCJeHf24KhovF75MsNnRq8
	B6OKQ+anCgGLWoWB6sowDSn0HVBB5O0qQP3kIlvTBTtaX0VhP+k7mUigxSLFfK10sSnXo0nmPyA
	VumcmOGMXYZ905IRq+31q+XuFHA8SstO74jXziSIa7LQ1OA3URJRV7zDR6CoHREcc16Alwv78kd
	d9MM+/wR0vm/LhxoU0kumiHPj7Xqx7hbChs1ie4U/fXNoAimCwkIYTbY6l7MK9xncEKJKVLnN7b
	cAc8/zCC4OM4z7IIVYYQ/x
X-Received: by 2002:a05:600c:5299:b0:493:eccb:8cb2 with SMTP id 5b1f17b1804b1-493eccb8e6cmr15069775e9.30.1783585876605;
        Thu, 09 Jul 2026 01:31:16 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:16 -0700 (PDT)
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
Subject: [PATCH v4 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Thu,  9 Jul 2026 09:31:02 +0100
Message-ID: <20260709083108.108370-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34933-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B97A572E529

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 on the RZ/G3L SMARC board (r9a08g046l48-smarc).

Port 0 (ehci0, ohci0, usb2_phy0) is configured as OTG with
usb0_pins pinmux (USB20_OVRCUR, USB20_VBUSEN) and usb0_vbus_otg
as the VBUS supply. Port 1 (ehci1, ohci1, usb2_phy1) is configured
as host-only with usb1_pins pinmux (USB21_OVRCUR, USB21_VBUSEN),
usb1_vbus_otg as the VBUS supply, and renesas,no-otg-pins set to
indicate no OTG pin routing. The phyrst USB PHY reset controller is
also enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 96cc7ee46a6a..b189ae8e808d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -87,6 +87,16 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -138,6 +148,20 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
@@ -259,6 +283,16 @@ ssi0_pins: ssi0 {
 			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
 			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 4, 12)>, /* USB21_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 5, 12)>; /* USB21_VBUSEN */
+	};
 };
 
 #if SW_SER0_PMOD
@@ -330,3 +364,18 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb1_vbus_otg>;
+	renesas,no-otg-pins;
+	status = "okay";
+};
-- 
2.43.0


