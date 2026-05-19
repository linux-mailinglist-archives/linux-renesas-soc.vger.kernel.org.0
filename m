Return-Path: <linux-renesas-soc+bounces-32793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A4eOHY1DGoKaAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:03:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BEF57BD2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74440308DC76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B301477E34;
	Tue, 19 May 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQwggyMK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9747B40D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184832; cv=none; b=NJaoPmj0gUO4VMYvOCuHoUUj7ZVa33L03epsU2VnZxBeL2Qpqhsif5HpPadgUKd3xaLrq87UFDxXm32aX7vTDc4jyur4UPev0918ACpbIGTnTHNFh8UeMwuTBMWjY6CjVqDGf8CKsARLk/XxtHe1vzD0MzL0ib4pmSo5gPsebrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184832; c=relaxed/simple;
	bh=ZHWHc+VtthD6hvYeK7oMeY1NPDjDF8a5lqw7D41CD5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpWJoBI7XZUS/kQxZrJ1rgjD6O+9saKfV4GybMsxE2BOmCCx+ViSKDnKRMc/2LWVTgP0DNtd1QPmWilI+YOMTWeRCwBenUsh9+Z+KtcElAFwLdk0M7aNlBVOhoIJgXEDB0+HRLQ3gMnVJx5qSC7VunjLPVkqQwHqIO+8SBi5WtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQwggyMK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ad135063so25864125e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184828; x=1779789628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq2NvGmvJa4BQjcZHZ81YHd3i89ilFfO+t5Hs3o6u68=;
        b=UQwggyMKWdY0ux2jGcoTU4nKjMVNRNvIR+7aWbnwZsBrA6GIumVbaFw9re0lPwMjJv
         T0+uBohAKvQqBxb91r6eILG6jbEvEBpBRpAUGphK/BX8gYCAiRZsdqh5b1MTbIVS8zJc
         Vy1fcYwFXCfl2rFVAVsh/mY7dfV8QErPJyxWZ1Y+iX8vgBoS0NSH2uujwih8wTe8BCaQ
         IeYBexEwRwTr3LWyB9zU5PG6Zkr13BivEcVdEi8kqJ183xm7LaWu6CzZigPzB/yelegA
         vFjj4xNRE75U0IzFeOsZYMIm38D1vyynZ/p6Yg2EfQk7Dl4n+v1Ivps2iebxCNYxcO7o
         po6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184828; x=1779789628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fq2NvGmvJa4BQjcZHZ81YHd3i89ilFfO+t5Hs3o6u68=;
        b=CTVGxfeHM6vxXX4k4cMWx3G7hf5UITiNUoB8DxjFDnicNmmqI5wyDrBhqJkU/ivxj3
         7+FDSWE8EYu9xZf6scZlXt94r/IkbdhOJs0ceE4g3be+TrfiM1pD/6gvcsC8Pm3PNWEB
         5AW677jEns700huHEftxuadWJN1GvV5LZn7OQ94GGfNkeAje7OgRglCdV84VUFV4tf+N
         Pjfyq04MRWx222tD79mcnzFzVDxQvFM0MmN0rl/nI87sQ/S56sWdujuXwANYERvfmZk5
         taPrpn4aHU5xrDv8ZNzlhquWgnOigOZDjdeM/keoRqVUwyDMYvKp2oVVWQlP9IAgQ4CF
         1gnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NiYg8qJvKLYZmpgIRhHe+VafKNsldlgJe0KYa0yzWVe0UyWFCb/qMSCLubMo4D4Q2T1PBXFe11ZiWtD2wG2adSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvXAJGWL4XGjKFEH68f9EmrhJ+GknruZzsqphdX4GPI/SW+Mw4
	pl1B9gCoudKrhMWAiRPpr9LdpwHMvRdXkfC8Dwlqynn0LDaKKXdl8qk9
X-Gm-Gg: Acq92OEvvOVus5iLCqfVCoJHnaAVJBFdSqbjiXpJzugH7flppcLwuuM4yFIQu9HaiNH
	FaYEl8MRKRZZP2/5fvEEX6HrUOlLGl/i577NOPh+uy3tx2Z8DlUu2zezQHs9KzrwpY+sz7L1TKT
	GEwu9OkcPTlIBoBRFBcgzFID2HpurF34BkmCbyTu0mxwqDGAw1+Sf0Z/KLv/EBl10NWd7wrAOSP
	LGn121lj+z2t7q2mUegLhfwwbs5ITdtBeyOgQZ4vZM6S5Ax/KR1vtoWpEIZQwzApvRNJbJ1JOCv
	234HAPLnrXkbZhjhTCHRjtutlAPui/mcB8XpYR+xT4HM4TMkh9rqRjAgA/6QHh5UfP1ujus6Yb8
	YCxb0YiZOhufkFRNnQGI4n7+L3TO0pKfYqgS3jfuEOtsFNX9h4I0Ao5915iXU+yz/q/ozlQ09Au
	GqzTk1YO55O9boiPdIq3y7nas1NimGG2JFhGGGvu6f6OchHG3v+K+ENw75C3Q=
X-Received: by 2002:a05:600c:4455:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fe60ea92dmr267488935e9.8.1779184827051;
        Tue, 19 May 2026 03:00:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febc56f89sm131791455e9.3.2026.05.19.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:26 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
Date: Tue, 19 May 2026 11:00:17 +0100
Message-ID: <20260519100022.116318-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32793-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,100f2000:email,100c0000:email,100f3000:email]
X-Rspamd-Queue-Id: 47BEF57BD2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add rsci{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 930873ae7786..a53d579eaad2 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -358,6 +358,90 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		rsci0: serial@100b8000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100b8000 0 0x1000>;
+			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI0_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI0_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI0_PRESETN>,
+				 <&cpg R9A08G046_RSCI0_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci1: serial@100f1000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100f1000 0 0x1000>;
+			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 424 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI1_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI1_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI1_PRESETN>,
+				 <&cpg R9A08G046_RSCI1_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci2: serial@100f2000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100f2000 0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 430 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI2_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI2_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI2_PRESETN>,
+				 <&cpg R9A08G046_RSCI2_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
+		rsci3: serial@100f3000 {
+			compatible = "renesas,r9a08g046-rsci";
+			reg = <0 0x100f3000 0 0x1000>;
+			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei",
+					  "aed", "bfd";
+			clocks = <&cpg CPG_MOD R9A08G046_RSCI3_TCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSCI3_PCLK>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_RSCI3_PRESETN>,
+				 <&cpg R9A08G046_RSCI3_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			status = "disabled";
+		};
+
 		canfd: can@100c0000 {
 			reg = <0 0x100c0000 0 0x20000>;
 			/* placeholder */
-- 
2.43.0


