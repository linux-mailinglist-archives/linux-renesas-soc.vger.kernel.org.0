Return-Path: <linux-renesas-soc+bounces-33248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHvHA5HzF2q5WAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:49:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FBE5EDF1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E03930EF670
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 07:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C528351C22;
	Thu, 28 May 2026 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSXLIO/a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC571A683F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954382; cv=none; b=ueVPiQ8CmDJZxK3NVbPwqkg0zoHIm2NIjSHKkCZiJS/k+QvIyEGvVIPqV4OUE9E3NUD5U+gKCbTSSfJGb9tv2or1z+Cy/Vc0YzvV/ybAZWiaNMOZgc11/oSbPU0SEGrTNvrIjBqAjeB+GCFMczXl17W69eDXEZTuhiiS4rqrNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954382; c=relaxed/simple;
	bh=Kboas5xNLKk0qBHKN+fxDMxfgo86/AwSgt9iVJrmwBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWxw0Pe8G1sgGrsbxql1u/JBGCggrKqVT8z+WXFFJ/ol9fa5YHnBK4JzwL1iwTFWoyC3mmjdj0bfQ7NE273SbNu76YIqh8fcYfH0BtzwVC5GlP3mL2sYuQSQ1vqx2n0E3EFUtA8PWxcOcddg5EiqHsE7eGDzjSttNeOKVhFTML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSXLIO/a; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49039a8851fso68971905e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954379; x=1780559179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IK8cXubIek9iNkpA8iJuTiBed2eiFBkLb37ZvD2iJM=;
        b=GSXLIO/aUQhcz5F+aI+AO8ad/PsVHaqsnBFygE9zGedAJD7iaILnLGQjHXBSmvqNaD
         Ld77ZQ0Zp/oaLj65OCkyClnEOSQdFT93ZaQf7NQ9xZkWtivrx+M9lv8luDr2vtlTz+Hq
         bDCWKpsoZf9bhJnIDEIUbYHCatjAYQY85T+nn7WupZsi+UUjnFjjs2eueErq8xDjgJ4h
         7UIcomQADMQydmYyCzp3zZ4K6WvEGL1N/nyhMP84meWgDjNMgH8gJvYpQf0K1uc4UgLU
         5KXYdLtGVctOmFpCFWfb4oa7lh2qIZbsfDD0rhYgHXjsO8wbtCgeAr9SUI2k/XwSpsb7
         UH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954379; x=1780559179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9IK8cXubIek9iNkpA8iJuTiBed2eiFBkLb37ZvD2iJM=;
        b=CpmekyK7XS84nqTOaanmcfPeNxvA0oF3u6MJpIi/6DAI7H+undT6HuZnz73zMqyas6
         j/2mB6aP0vmANpgJi47aA/NeY9NmiImci9rVBy0iiCaLjq2w1ncsrv9Ozb5Y6Jh9UX2s
         fMrBIMU4Uukc1CcGCiqVdQJuJkuQ+aA2NgCBHHm/nuoMMW2t5+AAr28TCAJC06bLQl7j
         MDPVHKInJr5ZWf43gDUtHqxgy/H93CveWeatcJ8R3vcWqn+ikImMJEtuvZdOR/hTlYuI
         ATo8oUIk8zGveZ0Hi6in8o26b1dUDTSpnFXk1UvTA/WAklF97U9aUH+1/mOF4LKL1gD3
         NEtA==
X-Forwarded-Encrypted: i=1; AFNElJ/jog+fSUSaCcDvm/DMCtCWr5fio2sbbChSPnA1sblUsLr4uATaheo8+tzHDTbwMZvG9hsvt0CDqHMY2gx0vpVKJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2nfNrfqepS1IvBKaT2KexL58kTw3NBZ6dDig+ppsgTcPTNyX
	PhkNiDOgBcCuq+qML/DuIq8/c6oHWzQKxNxkBjVD3hJneOfdK7ZCSZYQ
X-Gm-Gg: Acq92OGD+2PeFH22BozUkj4mEgHvAbiAGqkSdUjIh5IkfgQCZUajFb8gz6b8MmZdMia
	2gxzhHYsD8uxsVAwRzFIjexwisubmK/Gr+HnlUCqx4MjDH4GQilUG8mYK5rxko/X8Tsy1gZzf75
	8mX4OQcY5bG3rdOJ+Tiy8eVIiBo73UUUKcRjB/ZsdgSmUFGN7AInJxfOhMZ5FclNbDMTMqDjxa6
	jjnbEVdxWK1FCwC2/9ELGevxBOdtbsH7/cnYEUI9fNx3P5rOpvUX1jUJ5gTcGrITbvnUgQcSoVK
	Xs7f+lNMWWPNPbKrpQj6BMg4kEKh26Q6f0uOFp5dZHHVgQhw+vXB8YSe2ZI3ZK8FwZAuA7OiiIU
	iYtYj72npZ4Mp4sA27skZ9eRCM0LlTBVHbqXC2cFNocAr2VVw+a69G0abXAIIiLwQvbdGc9J6Is
	zdyBT98paiRtBsXMnHOZt/40IW7/NCZm9QSdMoi3WLKWaCCTo6c7JZXOB12N8=
X-Received: by 2002:a05:600c:3b02:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-490425aa70fmr438828655e9.8.1779954379113;
        Thu, 28 May 2026 00:46:19 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f0a3c2dsm10865885e9.31.2026.05.28.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:46:18 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
Date: Thu, 28 May 2026 08:45:44 +0100
Message-ID: <20260528074615.91110-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
References: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33248-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,2.220.108.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,0.0.0.68:email]
X-Rspamd-Queue-Id: 77FBE5EDF1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SMARC SoM has versa 5P35023B clock generator to generate the
below clocks:
  ref: Not connected
  se1: AUDIO_MCK (11.2896 or 12.2880 MHz)
  se2: RZ_AUDIO_CLK_B (11.2896 MHz)
  se3: RZ_AUDIO_CLK_C (12.2880 MHz)
  diff{1,1B}: ET{0,1}_PHY_CLK (25 MHz)
  diff2{2,2B}: Not connected

Enable versa 5P35023B clock generator on the RZ/G3L SoM DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description with clocks arranged in clock output index
   order.
 * Dropped assigning clock rates of the unused outputs (ref and diff2).
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 17bf44778398..5e58e08e7fad 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -40,6 +40,12 @@ memory@48000000 {
 		/* First 128MiB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
+
+	x2_clk: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &eth0 {
@@ -75,6 +81,18 @@ &extal_clk {
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x2_clk>;
+
+		assigned-clocks = <&versa3 1>, <&versa3 2>,
+				  <&versa3 3>, <&versa3 4>;
+		assigned-clock-rates = <12288000>, <11289600>,
+				       <12288000>, <25000000>;
+	};
 };
 
 &mdio0 {
-- 
2.43.0


