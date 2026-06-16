Return-Path: <linux-renesas-soc+bounces-34071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jA72MAwqMWoGdAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:48:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588868E758
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:48:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Grgn7EaE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59DC0319C041
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C2343C04D;
	Tue, 16 Jun 2026 10:45:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89E43C07E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606719; cv=none; b=KulznWEnlmYDvyUvRwzH7WVel7s7GWZgB47zAcwzG+/EEH/8yRow6kO3TYQ6unamctUmAUF+AON67sWVJ4ykPWEfwN9qCj3LGet8PAX9Dp5OiGhdi8GG4cP/xsicX1QMlgEsQYMy8Ij15rti4jm0T/R/VviVvN2tFN3TT2e2h2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606719; c=relaxed/simple;
	bh=/+QxgrEtVCoAJlH780G3C4bNU8LpijH2gKwosk8/UB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m55U29AmWbAHYQ60ABP/pPtVE+XlcStC/tdwDkmYsDbx7Rkh4wZE2v/HN9Yq7oeIGy/KbfWjqYOxpEh8+RNK14QWID54S8baGVg3WFjzhY7+C2JQxxkgrbs+9iiRYWh1dbJZw2cHS/eOcNdv4MJ6c4V1yANKwUxygXhIG0HJBRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grgn7EaE; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso38910575e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606712; x=1782211512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghDcckMrsxIgI0PwQD8NgJiWjxevvvKKfOn6FTfcfKY=;
        b=Grgn7EaE+yxMAQH0aOry+yPAb94dpWVHMdYLo3d9FEjDv7f5JBu1HiIWUNTEA3BQfQ
         jiPhn2c72O2PrCCLZbr8cnRiZFN2tlyRoKsWo/Kw0Bm+Kq8DjJOFddyB2VJ1wy8/WrWV
         gJyR5gJSq/m5t93GfED68wASsbV/zV748VmfzxYDhPoHRL5xskuBFpXJCeZXEMGlUVhS
         sLAckfWXG/b8L7cgICmeZ1ejG3+QAFfyC35FmmeChkcx3tDSzi3Od/Vm5Po7ESXHrizl
         y1pG+gVcJ5qiF/Z3d1xY1020dtsPFhgbRTaqBewtlovApMgVj/dmaHzxaVwIWBdJqvdX
         js4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606712; x=1782211512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ghDcckMrsxIgI0PwQD8NgJiWjxevvvKKfOn6FTfcfKY=;
        b=PzvzT+Uxz8v9O3g8zAEJei3Xrpfzvony6B+nAucA/CNBkPhrrjalY2wzrNm7P0ISsd
         RNKKKLfK0qwnne/SBQpdvgjylJaRKiI63+oQqukafBVGBT5bUwOnDvVpE56x/JHzvROA
         EHY0bXINiGvufL0NlBheTRtdbgf2Cd2wvfUU45RkbMa4T0chJ/68PjJbnNYTytypNJw9
         6Q2S7tLm1pjOjf/NZ1E2g6u3sE6FqoMvLlS7AATD+vwbmrHs1aIPunxH/1ZNG0gay0m1
         UhdZT7Mamh55seAan9MJnXkT7RUvG3emAbxd91Y6aFouwXFUcbZIf4HWYlM7PQpIsy+z
         2Feg==
X-Forwarded-Encrypted: i=1; AFNElJ9eXLujDnwlhgXziMrgHRaBxnMVWuH9hM3dr8xpommk9M82CSfNR6dbo2L1wAUzDOK3L8cU7+wTQrfosd+KEagpmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjfWwRTjSBDqsPw2VxRrSvPdptC1EUjgu6F3t1uz0sfh5KqtxZ
	XNA7h9Wfiheo9y13+Y0qsO21XNilnoYJVvPZWUPHjbDi9oZQ7O8QLTIE
X-Gm-Gg: Acq92OHwOBwEeGC90hcQLO6ie6aArEPOQIY7StxrhwwpL1s75XwrM3csRFCFaBAzw/8
	Ocqhhp8vt9ROghfiBuuurucZgG8GyT5mY3wxzXunYanIqofWFdoxGITEQiuM1Z8dTH8gL72QLiJ
	Gk5ojiXjCkK4kpge62VmTQi1At7LruKebRXCUoLhJWFxW4jKuN7ZnQy+lra9CmQNc5xjgzAp0Nx
	3Ke6dmcxHUDGNAsGO1S/wEF5VIGb51l9uNWVNcsLilQCHqKdiwBZmYQCwT6w+0RmXs/0DbTuKto
	8TC/baGem9gcmuygSlFL+uT/TjoukOakR4cr8c3YRSocL9554xGHNcoKXWEMeNnxbmLc0MjXXA/
	6zd4aFeDHd8qMKkxIFXJu5PO/MMI5THVfKZPpet+PY73AMp4FTLbLc18bkofJFe0Ocw6yAYXkmv
	AeGmex/1A3wHgSIyQ8HWFIRO1AnSvgCr0naDpOURVm7DLEA+iz
X-Received: by 2002:a05:600c:154c:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-492200c01dbmr209666135e9.18.1781606711871;
        Tue, 16 Jun 2026 03:45:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:11 -0700 (PDT)
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
Subject: [PATCH v2 10/10] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Tue, 16 Jun 2026 11:44:52 +0100
Message-ID: <20260616104459.410743-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34071-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2588868E758

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


