Return-Path: <linux-renesas-soc+bounces-32875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA7SEQK3DWrC2QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:28:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC72158EC00
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 379853019F22
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DAF3A4F2C;
	Wed, 20 May 2026 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIIR+x13"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7FE39BFE6;
	Wed, 20 May 2026 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283408; cv=none; b=DXTi0Fg/NbN/NjC8uoGW+MJ8nppGXiExzUJqHm1ioRk2yAp/ITbmQdeMgdSpX9X1WciIcJVPiikc7PSoM0jaQr9arc5P2s/XEhPwKpHhRxp996AoaF0mRj1T48oRI5wPkK9SSYnh2K8AqiUlfUhFZc2Owo3YPeW8Dr7uAnDh7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283408; c=relaxed/simple;
	bh=4jyAm0L6jfWqpCz7l3Hn/JKGYF3y1sTm3UUERea3Nyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pSL4aLPG82lhj2fAIBWmgJkYox3flX7rVkiMNxVZBH33ietGB7+pEkDYsvCH5lP4FnhHJDOQHqECgyEH2bzbM5jycFYKF/OK2hDf2uczyMGjztXji+JCSo7HGnyc1gqB7EBr086ecAC3pN7wGivcEQuTsDNTOBF/7VaQMp++Ipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIIR+x13; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8061F00893;
	Wed, 20 May 2026 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779283407;
	bh=MFVvU5dxzzHstTYZwSPqXl9AvGR0IWtqy7Qj702a30Y=;
	h=From:To:Cc:Subject:Date;
	b=RIIR+x13VXpTanB0+QKZxMp1nbXbEKMmW5JxYTiv2g40mdCfVntJiGsKvIoHOSrU3
	 2EXIvxiAP3gi/d6D7yD5H3rTCCPzV27V2gxddhUXCTtnz2yT78ZZeSm00wd3FtM1Tj
	 4FQs0f8UF8ryjqUUwzNKuOmHIqad7AUx7pktsarfyFt4wys/w4k3KAxaV1NS7QTUmO
	 uucBrP/WXl+6y+xFGtie11K1Ib5SqJY6YbIvrR8fuyB+3MCqDIliHvWF/5SiQJtsZX
	 4ni2TRqDBSA7LmFFqu24Ddw0Ylxim9+Ift9ctBNWGqg0rycXzPLuymPs0kLw4wpS/c
	 6r1uqtnAvRvyA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: claudiu.beznea@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a07g044: Add DMA properties for serial nodes
Date: Wed, 20 May 2026 16:23:15 +0300
Message-ID: <20260520132315.944117-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32875-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,1004c000:email,1004bc00:email]
X-Rspamd-Queue-Id: BC72158EC00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add DMA properties for the serial nodes on RZ/G2L SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index cb0c9550aa03..b0eed9251ff1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -505,6 +505,8 @@ scif0: serial@1004b800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G044_SCIF0_CLK_PCK>;
 			clock-names = "fck";
+			dmas = <&dmac 0x4e79>, <&dmac 0x4e7a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_SCIF0_RST_SYSTEM_N>;
 			status = "disabled";
@@ -523,6 +525,8 @@ scif1: serial@1004bc00 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G044_SCIF1_CLK_PCK>;
 			clock-names = "fck";
+			dmas = <&dmac 0x4e7d>, <&dmac 0x4e7e>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_SCIF1_RST_SYSTEM_N>;
 			status = "disabled";
@@ -541,6 +545,8 @@ scif2: serial@1004c000 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G044_SCIF2_CLK_PCK>;
 			clock-names = "fck";
+			dmas = <&dmac 0x4e81>, <&dmac 0x4e82>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_SCIF2_RST_SYSTEM_N>;
 			status = "disabled";
@@ -559,6 +565,8 @@ scif3: serial@1004c400 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G044_SCIF3_CLK_PCK>;
 			clock-names = "fck";
+			dmas = <&dmac 0x4e85>, <&dmac 0x4e86>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_SCIF3_RST_SYSTEM_N>;
 			status = "disabled";
@@ -577,6 +585,8 @@ scif4: serial@1004c800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G044_SCIF4_CLK_PCK>;
 			clock-names = "fck";
+			dmas = <&dmac 0x4e89>, <&dmac 0x4e8a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_SCIF4_RST_SYSTEM_N>;
 			status = "disabled";
-- 
2.43.0


