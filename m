Return-Path: <linux-renesas-soc+bounces-33491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5PJcIh/VH2qbqgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:17:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217D6351B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:17:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bC72aH1G;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A48EB313E6C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976984028E6;
	Wed,  3 Jun 2026 06:57:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E17400DE7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469877; cv=none; b=V6MpGyGmw05IP+PdxUPx07XVOcJxEV5WOWb1G9JLi3WD38h0t1NDvE36zlozs9+aONZAxo1PdqWZBmSUEXWe8kzBHmNtCWA35HhpfPkJ6zZYFVDZHXN8KFvvAfsYBdq5hDtzl/fvbv1wD/cqG/g+6YemJZlq5EpGXDbOiR+AKFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469877; c=relaxed/simple;
	bh=UQm6NkHuYIyeWv6CvUZG9GzuWmprq0FqpGDq3GMWI4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvG3YjODHs42c8HhqFMqe+sYVHZW3iSxKzNGSWRhdjDxzsKAsQ057d2Ut7ZpD1Klm1zBZDUM7tABr/lNr/PTRAIy7B0PCkHQafA7ghi8O/MFtmk7xPPwiBcuWrKs53uxO/b4HvNbi3vBvvuXfaPygLusLaetRg8mZP4nVIMvv2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC72aH1G; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so7486725e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469873; x=1781074673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKD/jOSADZ7rMDpz/kzySiiUCx3Fo+KM1sW62qF4fO4=;
        b=bC72aH1GZyVGiRrtGtxYWUhbvOVTO2wdBvEgWzCJitAgNX2KL2qWRYf/nvgyif9VFb
         A9TWvgSuK/9uLAkoOZFsC0tb3GXKyO9AvRVA2/dU+ISF8EnH2dFveMNprSW25mA6x6ps
         tqjVqr3SEjuuDUbv2imeY3GFnDyd2ZQkokSu7qESsn75PYX7gOpG7hxexE3T6M1vxsZM
         Gkn3sQ4TZA36gYey6cOF/hW/pK/p71FhNXZOR9b81CW6pZ0bRoEFGPTkkyC+NnWe+FxP
         DGNSR5B7WdHNS2LyBzCd9ZDyM2YNjDBKGxwFoVrhhEYDatq0kSMvb3gM9J+NgJDaRQMK
         LODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469873; x=1781074673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKD/jOSADZ7rMDpz/kzySiiUCx3Fo+KM1sW62qF4fO4=;
        b=Xp+xRNW+eaZ2vPdi8yxbKcvY2hbxhY5WtqDCh8CEqBpK8CmaTwDRi7crOxZgGhiXj4
         gQNZ0v9RlFJmmloAMUcHIFqcHY6SgVnVM7DEGw+fCGTvcLszDkzDkTp2uEXuMUOASulp
         36b9IWP+auHm8gZH3buDLp6l248wqwwWFeX1oZ59J/hX9qhGZ+TKzIm0HhobR9L8f9nM
         Hla+X86yW2OSE2InNYpWQIQaOXxNoQD6L2AeN8u3B3xa+jmNmDf9/SGP4LCUnR1qlojb
         BmArntIz/yZgJV2KYLzeND03Z86WeCgh2IiTgVp/ra1UQTu/QFDE+c/tz+X35GAgbmhb
         VQeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uvdrxhQS7lvgNfbAkdjeWtwIO8MNGGN38uZdLfEmDyb91RUmzK/4JHwDSVmePuiL84U38bDpooe60jHgj5Uw38g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBL5CWwk+C3IprwGtR+EKFt6o2Dn0ttR7iSUtnMzI5dXU9hVL7
	Q+EK+OyFUbvwItdjSJ4O2Un9bRD3T2IMPatvNejOgKv8S1aQw7a3Vn5r
X-Gm-Gg: Acq92OHpP8jDSeI0w8mmmT39XQZOeY4RITvtMoOUFAC/5xHsYkoQaTIg+Wxu1LG85pm
	CEEefeA/3pc2VoU1xMRuGyl4aSnrPOeUW0afvhDNoS7R7jx0tLPczwauUujhK5iJvxe7RyBgJgg
	bnBWFIfOYkQAJmMUKaggToguXKGUsveweDzh9sy1ibVZwKPV2U84Slb4vih7R9FdLcDr/WGhBxM
	YUkr/DvX1xkxC8vOYGDU9LrR6mkNTYm6Rd2EiM4he6s0ZAYykgyLzBiAbj8VB/6pQG7Ql72r2fP
	rSO0bQBVjmN3yLSdqBxxtR46nAblnLpB+bTou9kKVihtKBdgyoZE7HGwtOFA1YZy1m850gXrv0U
	EdL7iSSP8ricmsh6sTPKG/UlzJlpD5Y5y2iqGb30xWBfxxzqCBmvcI4lNxn+zHQ0dVk+RUbBprZ
	6/J1K6m1Q3eWSXftPX+F3vKSCeL0uxAtR6qixe7DJekbk/xDjyA9QbsNuz/2U=
X-Received: by 2002:a05:600c:4e52:b0:490:ae52:499c with SMTP id 5b1f17b1804b1-490b5ed4620mr33043315e9.21.1780469872601;
        Tue, 02 Jun 2026 23:57:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:52 -0700 (PDT)
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
Subject: [PATCH v17 17/17] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Date: Wed,  3 Jun 2026 07:57:17 +0100
Message-ID: <20260603065731.93243-18-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33491-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2217D6351B4

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
voltage regulator for voltage switching. SDHI2 signals are muxed
with I2S0; the selection is controlled by the SW_SD2_EN macro in
the board DTS, which must match the position of switch SYS.4 on
the SoM. By default, I2S0 is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 446c7780cb30..3d5e6b8489a9 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -42,6 +42,7 @@ aliases {
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
 		mmc0 = &sdhi0;
+		mmc2 = &sdhi2;
 	};
 
 	memory@48000000 {
@@ -296,6 +297,74 @@ sd0-data {
 			power-source = <1800>;
 		};
 	};
+
+	sdhi2_pins: sd2 {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <3300>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
+
+	sdhi2_pins_uhs: sd2-uhs {
+		sd2-cd {
+			pinmux = <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_CD */
+		};
+
+		sd2-clk {
+			pinmux = <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_CLK */
+			power-source = <1800>;
+		};
+
+		sd2-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-data {
+			pinmux = <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_DAT0 */
+				 <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT1 */
+				 <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT2 */
+				 <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd2-iovs {
+			pinmux = <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_IOVS */
+		};
+
+		sd2-pwen {
+			pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
+		};
+	};
 };
 
 #if (SW_SD0_DEV_SEL)
@@ -329,6 +398,25 @@ &sdhi0 {
 };
 #endif
 
+#if SW_SD2_EN
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&sdhi2_vqmmc>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdhi2_vqmmc {
+	status = "okay";
+};
+#endif
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.43.0


