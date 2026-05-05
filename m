Return-Path: <linux-renesas-soc+bounces-32011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHDpFO2Y+Wm2+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:14:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF64C7B24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B82D302A1AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754CF3CF699;
	Tue,  5 May 2026 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arIQrvNe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F31421A0C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964538; cv=none; b=ZfWFEi73PW6Z8hM8MRVJArWaUqoNpKiN/cnC2BKIY6+ZAqyTh25Tz9SjBZLx83BziU1tNaZgj1fpp2wBQtBTCG/ZxraW9VeSR4Z9HOGP20qtTldRCTWJ/YIojohCSLiVA6w+yITh3CvhJEN7fwCrCsLWA7xvGcZ26WYfYOJdMXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964538; c=relaxed/simple;
	bh=jVz8PvnNum1fjLPKM+tCYU+oCnJh/gnm040lq69wdV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AAI3C4nD86hPoY/qeqgukCHUQb/lriKCmTnB2vul/N6D++rSYLaf6bkKvo9LhytvOyQFQtoMi3JaiWJiYIKZQQYaqBqRwIjAAEpOR3KYxH/tlZ8xMnJM8UzLiXejxPmDgAvuSKIW0rtnjtxxiQv1dafPciorh6FUNYX4Rz/+XyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arIQrvNe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so54856515e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964535; x=1778569335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VLOa+aovvb/fUff3rMrQZnsi91wgejZkNFCjTClpec=;
        b=arIQrvNel1KZiD6QKjysY4Zg8ZU4BIUlSPGG9CZp0Vb6bndIqHlsnlO769G9vEJMen
         3PGSjUBJBs/M2JhGJoM+TNfpZ+MIG6LzGhZSOQ6kODG/bxwe/OdQ/cTGzGH5Q+9M6EVU
         k+/LhpKrvl5kEBMAQeOF1TMlSU7jwfP+Jdl17ngcBFMTcWxvGygbr8DOkz9d4LxeNhB6
         6t8ZPAt6n7YvV9tqFEBHpFI3XgYxLvYsgDBfXqKdm+fayvKHTYYTs3meKc9I/lW+FL1E
         mJ3ff5GNxdfvFfiWml/ZuAiZ7QcV+xZfwOGw/p+pyMswpdvGahmfXCwZSSHU7BiHtRBc
         vfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964535; x=1778569335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VLOa+aovvb/fUff3rMrQZnsi91wgejZkNFCjTClpec=;
        b=HUowjMiXwVlnEfmMTxnYb17JoBwykyJh/evlgoceIUw2va1mbnWGWbv/y44x+3F3ao
         IBXgYer2BpFPITwp/4guY64YN3xHzm2kNFLQh7iELGOccpPe5TnAKzVCFZeNRd8T4kfB
         4JljdtPIFGW++iTPpTFSL14XrQP98Z3hFVhrYYfOHqTfyD+4bgYSlBC6g0keieq5NDrB
         TfClZ56ADTa2y+Iq3duPHyasuluam6GxqdtfDQgueSzOoJ9LcAVmyf5k9LVJdJm7/dWF
         jGUST4XXgDNNWZ9VcuL9dF/a0+Ax/5po1/86zFI6iyaZLFLOzUU6vfl4oW0cT0zbEy07
         BI1A==
X-Forwarded-Encrypted: i=1; AFNElJ9TlDHhxwGhKeyDRbVbIYFVZtTkXebh2VhLQ3rYO9RxmlXw39anJ4svezQmSlA8ZmK3rIm32V8tNkp32kEIeNjx3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwJgXwk8ipecb9rDCr4SmAUcfbENxnTaOlfiO0vlM6VqJPTi7
	h+a12K4Ac77plOXkgum9KIdAWtZMIpoS5WLIqYgHYSFaBPwZhMCeH0xPIKc8bA==
X-Gm-Gg: AeBDietk+do0jjDxH/KoUllkRX02SMy0pYbQEy3Bh6VIZ7rkL+a9N653uUzZE5PyDrf
	tSmnm+LDTukReLhF4wN4LfUIMMweV2APWxfqs9zme+/jKgCmnEvnAJnmmTuoKGOFkHtWTZZExpo
	k6mCO9a72b7Jyi7NPB8dJenCMDM5tTSlkgvMNRtVQ960KBvkDr15iTe7m+inkKm72u7DEsTLjF5
	Ru4jwgcVuNqeOiN9/IUrnvuBW9+APQ8i8XWKc+7Hyo/JEoUSJVZFk7744v3ciL2Ek6+HDOnOF6Z
	rtAYdOJbf0LT+tUXi2ID6WB9vembf6SBR+LFi1y2YVW53hjt3wGFRnSZM8onwZfEh20ZOaDgaQK
	Jfe4Qh+CYC9SKxAN+Oy6n7K7qeUGzUs8U38UVJF8fXOf/+SjWLRyMCwsiOUkGA094oELZ+EILYA
	v22koUwxa2K7j4YJmuM50VUsCLOzQ0SsnHFY+5Nnb2ep5QVM9XdG7LfytQOxI=
X-Received: by 2002:a05:600c:1e8b:b0:48a:6315:da26 with SMTP id 5b1f17b1804b1-48a98676d48mr206683845e9.26.1777964534592;
        Tue, 05 May 2026 00:02:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:13 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices
Date: Tue,  5 May 2026 08:01:57 +0100
Message-ID: <20260505070206.7932-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E2DF64C7B24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32011-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable I2C{2,3} on RZ/G3L SMARC EVK board. The I2C3 is enabled by
setting SW SYS.2 to OFF position.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 29 +++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  4 +++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 8384cec7f056..9752d9d6a59c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -11,6 +11,7 @@
 #define RZ_BOOT_MODE3		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		0
+#define SW_I3C_EN		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -33,10 +34,28 @@ / {
 		     "renesas,r9a08g046l48", "renesas,r9a08g046";
 
 	aliases {
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 		serial3 = &scif0;
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+#if !SW_I3C_EN
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
 &keys {
 #if RZ_BOOT_MODE3 || SW_GPIO4 || PMOD_GPIO4
 	/delete-node/ key-1;
@@ -52,6 +71,16 @@ &keys {
 };
 
 &pinctrl {
+	i2c2_pins: i2c2 {
+		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
+			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */
+	};
+
+	i2c3_pins: i2c3 {
+		pinmux = <RZG3L_PORT_PINMUX(2, 0, 4)>, /* RIIC3_SCL */
+			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index bc1178c7484a..fb868ea99b7f 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.2, Macro SW_I3C_EN:
+ *      0 - SMARC_I2C_GP is enabled
+ *      1 - I3C is enabled
+ *
  * Switch position SYS.5, Macro SW_DPI_EN:
  *      0 - Select multiple SMARC signals active
  *      1 - Select LCD
-- 
2.43.0


