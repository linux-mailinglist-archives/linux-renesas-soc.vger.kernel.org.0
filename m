Return-Path: <linux-renesas-soc+bounces-34820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wPA5HAgTTWqUugEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:54:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09971CDF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:53:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lvOT5KbJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3603F30ABA1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BDD432BC4;
	Tue,  7 Jul 2026 14:37:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A4430CEB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435020; cv=none; b=XedLdG4OfwdaeiBSZ1D/VH8Rv9ARTk7CY3KlQnL0B/WVKIn7Abn3egP5QudGSjiLIsOi8xcmXB4FMMUEFYdE7qkiSlHQGGPCB0smqCstcMfVNjGpWpYwkE0RwmOEDWnUK8EHpdUsDFqq/P9Fw2baHhnehoPnduJh4BXGOIDjJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435020; c=relaxed/simple;
	bh=aAmzUSZzbLyujEstXd+uWTm8MXYug0fqFUoYKr94RoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUY9eEQ5Pw8g6HVlch2bFY4/MIB0O1LnDbNI+JmhUU16qE+onrI8V5mBbghrqCrT6RzL3c2tCHq0dbcPC3E29DU7EPTDASDgFqoQDQ7j6Ud50UbOnW2POOVUGPRSzy6Lobd77UpBwP0Us2e/msUKpn6Ok5rYVkP3P+qxlqboam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvOT5KbJ; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2231385f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435017; x=1784039817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAAqUYadKZN3JqyuHZZxZJVuJ9WtVF8Xn0YwNTIAf9E=;
        b=lvOT5KbJDtPls4+xMEL5DNeI3eAdRNqP/5WDKzg5pNehy4AmSUneWGwWRY9iDuUgF1
         2huzkdD4MDddwasRjhvAxwQYVwLqjaLVaSYXHtv/l/SBgHK89eiXYYpaFnCi8WIn/33y
         zbnnB5hG4/vtO44HTqZWF33jW6ndeft+8QQip2DK+WDnVP1NUdXf3mXkR9oRl9Q9fgEd
         JytK/zrXw4ofEDD9lScdczN5j43Hus9+kwtNBpeVsg+6E4UJWKAiuaEW7MBXz721EKpR
         errzxOdakzJp3GH6aAOnmV3FtcT5Eyzuv2Ez6y2a64hogfHXeNdXn75vQbCrEJlFC3aX
         bpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435017; x=1784039817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAAqUYadKZN3JqyuHZZxZJVuJ9WtVF8Xn0YwNTIAf9E=;
        b=R+vRO0+gcKOZXphD6KKVfe0UzeXupBxQ936e52Uwl0t6uV+5k/+Cc1RoB2XQppRfMi
         ZfVe21bD4FDOR0SJJP9ecw+88TQ31K5wB+9R0yddK6ylHAVyAD+h059Cu1IJmADzR+1s
         5Tlg6e0RQgFxYWvunpOmbwmoDszml0e0Q3pvm8E7pNKWKQXUjhhNZtGDC/SincWbTM4b
         ED0srs/39/TIq32nu3PB538v+GO55Urua0sVM8VVMg720mPPeHZETSL8H8jjf2JtfnsI
         Tsdv7vHHEGOU10miqIXgdrsImAUzWY16VjUGAjGsU3NpouP9XLNSgQMGjVtkADxcR8rc
         tUQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv4w+DZNZTE3AbdCTpcXuCzKAferHXfu/3o9eMR4Ys6ARmyJ7iTQ1XU5HRjCt6lio58HHQ7J0RR1Q6xDkt1XD1IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqlPdxdfSgCPUkqaDkO6lIpX2eLxWIFJT/MWY2i+I/A8xOhtbt
	AMWSzfTLPm4+I6r9XcjWQONaYVoVi2F3sIo2JVkfdsl3V8DEXLa3amxY
X-Gm-Gg: AfdE7cnw4BmQMoDx1HuEda32CW7wlwNNqz3aDaIQfJgFZWKiwBE08nmfbKCZKsyIDSd
	DoSJycNIm2El6zQJzwfnhGCydBYWRdWQksEP3SHiXm+7w1nvULovxAkg7ykJ2H84orWPrGJI/O4
	27+oniaPR5RHIOLgU8EFxooedJvWqxPuuqa16J6IOeelfZZWeph1bov2TDeu4Q+pQgdZ/c5m6Zt
	nsByocGlH8dLFeBHUlUvmDCtwOGoRUlaAw9vztNhSHy4hD86PtI52H566Um4vlgdyIYq18JKeEM
	UzgajTgBTF1cdzQcpurma3SoKZF243oBaSz4h3lJqKVZbFeXIoJF7NWKeDlR9GxleCypaJj5Fi5
	at3lMlteEfLw15m3RfeLHVAqPNirmqC5ON/h3lodGqyfhMa2Ucuq+4yEQDE041zGyodSwPkouxg
	Df91MhWhSAVhNwb3KydqybM5w1vPTjDIw4QfaSEQ==
X-Received: by 2002:adf:ed0f:0:b0:475:f100:35f9 with SMTP id ffacd0b85a97d-47de66ed48emr4547252f8f.54.1783435016590;
        Tue, 07 Jul 2026 07:36:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:56 -0700 (PDT)
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
Subject: [PATCH v3 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Tue,  7 Jul 2026 15:36:41 +0100
Message-ID: <20260707143646.245177-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34820-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE09971CDF5

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


