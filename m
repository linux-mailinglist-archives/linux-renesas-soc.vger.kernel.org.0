Return-Path: <linux-renesas-soc+bounces-34699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8HZ9K+7USGpsuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:39:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619D7074DC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ROJvloTJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6DC53059A41
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCE83AC0C8;
	Sat,  4 Jul 2026 09:34:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38473AA1A8
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157687; cv=none; b=t2uF/0LO/zsLYJTZjo2zq+Ep+cox3VqUjMD0DUSeh82FOpbt74qq3vo0+RE+gD2376aok1THm+Q7BPdQl9CsKCyEgAhKy8pqwoewlgFNDYMvywhnL0/x1opt0o0bvSc3mSX7EF1SCVAAwai2JpGjzex0fhMeBMcF6HFhL/h8K0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157687; c=relaxed/simple;
	bh=xyY/NwQFLlwmOl0zw32PWNdaCjRi8wPb+S0091dDWPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBU5snEJW59GxGZWppJqHXmqaJRbM28QtVRJ/FUlhyAb2uKWtiCeFlXUZOzx4+LYRnTz9SVq2AENTV/1jmNabZzZLTAleu22bf3hUBSetwr/uegkvoH3cP6KdR16HAGulrHdjea6U6SUnMjRKayNAHVTWAR+sK9aOgdVD5782oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROJvloTJ; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so7632775e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157684; x=1783762484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x30oVeDqcdQBi3QKBhaaJjFdjMCx1Drh6i0vSGeNwB0=;
        b=ROJvloTJslP4zOxEhRZkVDAdW0vZtLg67ke7sZdW04w1qgnMX1YG8RRPQHIqFeMb+A
         QwTo9gm9KfnxKa1znoNnVvZdpYv84Ey+A1FkiZuM5ITXQXi05iGxPo7UDvesVs1tv2pd
         ONJDl7plp8SmmZgwmAvMTiSrJO43GO8vNlSc6kJAFZP1jkt1ysKMYzceYJ8JQQRS0hQH
         oLvOEwwbUdeOvbz+EdOAHYvBGb+8ud9vi5amT3LnfIMApnTE65cOofpIDmXvQilBJYb4
         TZXIRF9l9CRKzibYRVmVFuVqlCB7H+nTwN50sAlBsT+RQmC6Ev46ujpdqVkYPiGxmluK
         HYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157684; x=1783762484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x30oVeDqcdQBi3QKBhaaJjFdjMCx1Drh6i0vSGeNwB0=;
        b=Dq9c0ATzLi0khsj1/Fzf1tfy/yoDGI1HRwkQQyUwbQuG10D7taHGa8JtI0KIr9au4d
         3UJS+A4e2JlAmsmJdMSWsqW/wAtMsR0RIyL3l6gPoUVRTS5NtslpCltcIzB6fW+cRBoc
         4EnPTLGWCcB+oPP/HrUpEZMhXP6xrTiqUwtZ44FTOnmtE17sJc1ClQaB6X0XZFksI9PH
         fbjat6jkGna2x4ivkB0YYR8ihE+htbVgT3UJKtFS6BXBstH+bl7XR9L1UUjARIJ+ehPJ
         te3RiKglhy77doAPQhTSZzrKyevt1qAW5O0cxZV9N+MJKEaT542Sub2rFnCBlf3Sk4yG
         llZg==
X-Forwarded-Encrypted: i=1; AFNElJ+pQErpZMi5F0Dh1O24f/SgSha4SoU/k8yrOqOSLr3JEPj7pxe4WO1nlJ8EAyjglKtf9DVq2qissMpTS9sWWzVyPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+b1b2iF7Pz6dLfPbAWEBYMwudLgN8aE7LcPts8z126CSIcaq
	eHpw8d1f9y7K5UgHbjHlXcicV1lUBnwU3ATPInU0lz60EvKxEBidPK4H
X-Gm-Gg: AfdE7clid2d2I5RkAoNwhl1y3NodsUAlnsSzPdD5sNaFG3WciP7cyKEutWOAGwtlafh
	xPbPPK0tBa3bRBoQPV8dknVsteZ1N/iOoI9ZNw0aKozFriM1aok6vVP0agwS4nLBlm97tB0DGwk
	nr9io14bSyFFStO4oxcaGXJmU0Mwip0YtduN+ddHD2KIxe3PdwSNohme8TgJrP9Pgi2HwONNZPq
	Lt+wEux7syXXzpNbhaOC9/v2R8r+jZkvEculTzlq186GBXq43sTJ/0+t+Ha44vEPNSNsPrInkta
	cHnQfSJAOAQcq3BpMHGG8ZP2LfGDRNNij0lofGWPuHan/Stq9vQYUDyQACffb+9Ohw8qxpbzLFo
	Tyti4wKwpJkw0sRwHLm4+QVUu4YjX1KdGws28JLz1HXqwKfCw8BLx77d/qbKI0O/dLzOWsxXTWq
	uYrE/N62RQSjoY/ZaGEnNc
X-Received: by 2002:a05:600c:1d0d:b0:490:5000:917 with SMTP id 5b1f17b1804b1-493d127f020mr22753485e9.1.1783157684145;
        Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:43 -0700 (PDT)
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
Subject: [PATCH 13/16] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
Date: Sat,  4 Jul 2026 10:34:23 +0100
Message-ID: <20260704093433.273672-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-34699-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0619D7074DC

From: Biju Das <biju.das.jz@bp.renesas.com>

Add DU and DSI nodes to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 0d8507e0666d..fe2779d334dc 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,50 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		dsi: dsi@10850000 {
+			compatible = "renesas,r9a08g046-mipi-dsi";
+			reg = <0 0x10850000 0 0x20000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_CORE R9A08G046_MIPI_DSI_PLLCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_SYSCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_ACLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_VCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_LPCLK>;
+			clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+			resets = <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>;
+			reset-names = "rst", "arst", "prst";
+			power-domains = <&cpg>;
+			renesas,sysc-pwrrdy = <&sysc 0xd70 0x2>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&du_out_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		vspd: vsp@10870000 {
 			compatible = "renesas,r9a08g046-vsp2",
 				     "renesas,r9a07g044-vsp2";
@@ -721,6 +765,40 @@ fcpvd: fcp@10880000 {
 			power-domains = <&cpg>;
 		};
 
+		du: display@10890000 {
+			compatible = "renesas,r9a08g046-du";
+			reg = <0 0x10890000 0 0x10000>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0


