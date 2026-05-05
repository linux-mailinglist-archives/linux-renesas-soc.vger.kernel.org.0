Return-Path: <linux-renesas-soc+bounces-32008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA/7NSOY+WmB+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:11:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43D4C795E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 934C8307954D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C203DEFFF;
	Tue,  5 May 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyAaSel7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09603CFF56
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964534; cv=none; b=BV6pqYAmC0lDTGGq5CVRS/ogZWccZRoQOmbP0HX73Dv+o9mRvKQtTsxzwspLY974+QWfilUbYR3CkwAIB8gtemNjr7YtO6YYG7sDRejaeQPuIQ+exq7WWq8J/qMMBFR4FPqd48Bn6a4NuPFSomK93NIWCN7+4iB9zyAFTX9UgDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964534; c=relaxed/simple;
	bh=yiZOkNnsfOxULr80dVoBjXh2GPcUsaBp57/+YELSAzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rs5rHPt2OJ6ogbZsccneCV67nVqwc71cgpzTWvsGUIEcm7BggiGA4QyUXFG5VMtRSobL5NSNW13PsT1L3IENRSUrPr8xo7MaLPerkWpk45DnBg1ka0HvkRU9NbIZf4ipQUHfSly5R/zAmVC1EwOKjW+TZr6D2d6fjvVvdEKKlwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyAaSel7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so46034695e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964531; x=1778569331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCW3P85cvh30kejpe8kPs02BqysaCcYo27CePRnAR2w=;
        b=lyAaSel7LY2svHCnH/P1e+K+wKlCvnxOHtLZoS8YZaEnZV4Ltu1A2ns0YWlBqY0fO5
         DDfh2Kl1SZ3K91YAUy4bGkvWdhx1V/Ia/693zdj0vp4jxxxSdd3/cT00IkXfPUzdeGm2
         Ik/uqWMHofpznxYJuZ29XgbwK2Je79DjxQNCYIQhpY2BWqiUCc8ZtUR0XV3h8lPCy8bq
         RPxsqwfrUEiVrzuCGh/c40eCvKoyOpwQr6qXr2spOUw80YE92DMM+GVzgd6zRcb5TjJm
         J75UZS7VE+6dMdPKCKzTvbQ0nDjYMjeFJjyoj3uEfz3VDZwbWiS3RQOtylZWnj0T1ewI
         oKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964531; x=1778569331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCW3P85cvh30kejpe8kPs02BqysaCcYo27CePRnAR2w=;
        b=SBvQA1kG5cLrfISbWjoCt0V0ohdXSnDYpDk91toJn1o+M4EqIyztEWyXIpoOugBl+Q
         G5ErmSVBa8WWNjOarsxr+YH0V09Qty6TSkc3RLV6GMS6BZLllxxUpFMnl+VeQNNc3sw7
         k4j4ENhEQ0UYf3I3uUoRWhW3jIhVLBRB4PcatrkL/q2jWxDY1MFYm4lVQclLpN1BHNSs
         6uS46hUTS+PxfhIbQXDcuAbcN4mTcDY3e6TnQs1zkQranMXxwVIXReeRnQ+5ySxxGphb
         eiNk7yQQXaE3AsPdv3skwHdqqLmyBBmSGQ2wVN0eFW+/H5hl6LTNoEAS0yAc+EVpOvLJ
         qrsA==
X-Forwarded-Encrypted: i=1; AFNElJ9O/YGBSPxdH3ZLSOArf8A4TXp7Q7hxSzsf/WOfXGWUhnhOuyEGo2UMNNA5gHC/B/8nBlv+WgZFJyanVi5krBRocA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUtX+nhEQeIRUbnype4iHNFv6DP8CndKvjybpyZIQjLvsr8az
	mzgGqXgZu5X/Y8uvvQYmDX5KP2YnWzjFVOHVx4kZo95U+OxXieii9ZrD
X-Gm-Gg: AeBDievLIF9IN8oPj2u4hcPFYSA1x3ohVzdZRbYw8O8rUKPv311EVZg2FLPYMtlt1XQ
	V3VTerKx7u9qyKDKg7T+y4ergsbeGBm2s70JVjxlA60kY+rY0KaNVbPowqt0icTLkOS/Qr4v75+
	40etwaOy1Z0wdHpAhBEPOP0k5Wp8dtDAYZtTpH3tIU2DkqZjd9NYItwc+gi51V1nJBow3suLJmp
	0hLuweRKsN+WGNYzyZ5VqU+pNRdPH+PgvSSSi12/GwwNP4g39siwBqL2HXgEgmi9LE971G3qfm0
	8IjyhDrH90Ct0eTg/dBReJwJzj9w61OdZdaX8f7Hm9TVupYC/8TPvWf+Cl4G9eI++vxASaJeHYi
	sU1gGsAtBDWPqRPiX4C8AYh1UPwe5bCA7wlmkmCGrSrMYPoAHCSWij0UxuRDDeZ+kAle/9Q+upB
	h3FXjQ43zr6KXYA61scK6MIGWaLO0BprqD7uxD4XcY3oGvlcH8uw+pTKjDKwE=
X-Received: by 2002:a05:600c:a46:b0:48d:112c:f582 with SMTP id 5b1f17b1804b1-48d112cf94emr88852435e9.11.1777964531080;
        Tue, 05 May 2026 00:02:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:10 -0700 (PDT)
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
Subject: [PATCH 1/4] arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
Date: Tue,  5 May 2026 08:01:54 +0100
Message-ID: <20260505070206.7932-2-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: 4A43D4C795E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32008-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add scif{1..5} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 0cedf5a38291..f0dbd700b538 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -166,6 +166,96 @@ scif0: serial@100ac000 {
 			status = "disabled";
 		};
 
+		scif1: serial@100ac400 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x100ac400 0 0x400>;
+			interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF1_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF1_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif2: serial@1004c000 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c000 0 0x400>;
+			interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF2_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF2_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif3: serial@1004c400 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c400 0 0x400>;
+			interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF3_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF3_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif4: serial@1004c800 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c800 0 0x400>;
+			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF4_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF4_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif5: serial@1004e000 {
+			compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";
+			reg = <0 0x1004e000 0 0x400>;
+			interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF5_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF5_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@100ae000 {
 			reg = <0 0x100ae000 0 0x400>;
 			#address-cells = <1>;
-- 
2.43.0


