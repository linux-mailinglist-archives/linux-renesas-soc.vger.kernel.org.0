Return-Path: <linux-renesas-soc+bounces-33937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ipv2GqYZLGqdLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:37:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FF767A3F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="i5/0B6vh";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D387B3285151
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C55535B63D;
	Fri, 12 Jun 2026 14:31:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D893E51EC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:31:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274667; cv=none; b=rCs99yp7h/jxOWXuUug/RXRRKiPX/EAvBHOlLz5wPRbFb8c3wQtsHQpk+1ca3dj+7YMamhtdDPsNU77PteRWaZX9nf2x8VAqwrVMQuxgQhhquVjTsYQTlJdVUMspqmjyoWDNlm2YA98CMBkOaRXmkbwYhocOIYPaEvw/71+e0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274667; c=relaxed/simple;
	bh=yi4QZ7onFO7rfmWZfglcXb1b1476GRHsT0qLwRmf1VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acbekFa8KAbkomFUrobbxpXOgBR/J78tn1epthPJPR+kkDB8/hDr8N/jYtu9nT2rH3XeoqW5xEkvkyOVEC1hUDRVgzbNWzDyX/uVzEB8jV8YU+0FDlh1p0mZx8fveQPF4WR8aHHzfC6/WrBZ+zlAiEUhKx5N7arJN2ndCEYTTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5/0B6vh; arc=none smtp.client-ip=209.85.218.53
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-befee9e5ef7so126164466b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274664; x=1781879464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRWVvp9trK+KRbAW+1zCJ07zovSFux9Gr6snmMqyjso=;
        b=i5/0B6vhNb/CXABFTw8V0T/F0ztSTSQhJRX5ODYSnpVjsOWeCsW6N2t1iSDiyWD5yr
         54CpaHVu7krDSINGD+QjhmOvnvEo8f5e7FrXrB5HgP5y7YAIdhTHRwUbkWjwIQ/wl/ww
         z/m93apv0PtG2CeYDLVtfFB+gQI/+YAT/gLFlBI9+03D361p2N4VaeT7lWdLVzTs4yhy
         vVYNPnBekYev7TEMRu/XKQduWghvVyWvYxhtSxhL1HWYnSyypBTYOedER/HAfkgK9kqf
         V/bMvSJBTG3BJUs6zgpCu9keTPN+cNkw4UFk6nuX+TaZEPi73x/noRPLR3UBS8tGoOeq
         wAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274664; x=1781879464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRWVvp9trK+KRbAW+1zCJ07zovSFux9Gr6snmMqyjso=;
        b=ODLqJf5/tIcoMODwoiDBUUHamRDbz+GG3EarxFER8TXeUTRbMB7zwUcvs/2Kh3I09i
         LDS6RyTkPc1ohCmfjVHqWEvcf2JDbpVDAVHwYmmIDn+tokEoFy6k4NM0boIZnWDZubHW
         d36uMAAf7SrWhS1qiYlCvvyFKEErrCi7nDtyIKwNk54N4DKPpGXxiEqIm7Hscgkfl+g+
         yCrLc1UuA24Jlgdv4Vs1w39SJ8K3BbddiCXBK8oJVL8Dv0pgcD2ZZuSFsLsD5e/8AgNq
         ezMiiRuFw+NbPloQw4MCme95SCI9l+j8qNoGH0PY5Pg9tCKKFYaV2T32MDbGOVPTfEJJ
         1mPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bZTSSc58NWLZoLu9Yy8eEr0KsWyynk3H2JsWH51o8FTEbuM3ABrF63UxU0uJYpUgtLdmLTsTq2OFjqoUcXmthow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqZS6VRgbo1Dgo7GbcEv02n7I+BuNZ8zOeHVP5P8WfOqw4tyc
	5E/tfcrxyk3adgy4fqwkgQxpeT9SqR+T3BIrzCrb+ktcg8PzZ4uQI+Xb
X-Gm-Gg: Acq92OEzc+JqAEqkrDGKLv4+B5pHRPBY3SZ0UIPwx3l3op/+ehSTnnr30jZJeOQqJLc
	sPjgMiLf5vgBaPltnV1Z9+OZ3l1L6ebL6lUIMMljZGPwNCCdQA5WAg5kEXp2V6ONp9/0WdQRKhY
	ljBppHyzrLRMjxHHCVCZRM1Z4ObSeA/uIo2xSGp6yWAMJnab2sqp2OxGmxPq3EgPEj4nQeRYoJu
	sJMQIWWIZ1TddVdZzJ+k/0kAO4tX2N4W4FHzfef7ZpNN9YRokwoA5EDruyLhwzOh1lyEJ9t6s4s
	FugoAsIgMkGaubKzxAokzrnUwR9GjpDWulqZmXE4+b0ybi73jNXUJADDDuY0H+Rc98q6hY884Bo
	zvYa4wwRDdWd6p7rZakmVPlet2cw31s9B61AZsEHgGx60fgQaoXn+lbOOxpAzgHfyrfEcC0e0Z4
	z+y73P8cAwQtCCqVeteP//kh4Fw/4jO5CdjyXU/GfmolSx/f68
X-Received: by 2002:a17:907:97c8:b0:be2:cd33:2142 with SMTP id a640c23a62f3a-bfe28600d04mr162616966b.15.1781274661283;
        Fri, 12 Jun 2026 07:31:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:31:01 -0700 (PDT)
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
Subject: [PATCH 11/11] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Fri, 12 Jun 2026 15:30:39 +0100
Message-ID: <20260612143048.317907-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33937-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4FF767A3F4

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 on the RZ/G3L SMARC board (r9a08g046l48-smarc):

- ehci0/ohci0: USB port 0 configured as OTG
- ehci1/ohci1: USB port 1 configured as host only
- phyrst: Enable the USB PHY reset controller
- usb2_phy0: Port 0 PHY with usb0_pins pinmux and usb0_vbus_otg supply
- usb2_phy1: Port 1 PHY with usb1_pins pinmux usb1_vbus_otg supply,
  and renesas,no-otg-pins flag

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


