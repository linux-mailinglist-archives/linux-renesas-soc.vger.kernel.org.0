Return-Path: <linux-renesas-soc+bounces-32078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DtVOJ7l+Wn2EwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:42:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDE4CDC07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1EE030A36C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EBE44B68E;
	Tue,  5 May 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQZky9j4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3303843C06A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984637; cv=none; b=VQHe/XX+V8eyrgXdMQ8BAHZMuDXbJJ/CB+8F72kBfKi5g3KV4ILqor1Tt/GF/Gi5ZynFzNRM7DLigGM6gYZg/xVvtUK0r3RwNuThWi7zsGMMAbWHen5ivL6AdOxBS+1/O8R/OB95BJyXqMEjSRAHLcpTZG/V0ChxXeae/lDbJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984637; c=relaxed/simple;
	bh=8tDAAWCyX8g8rEM+l88sXOrzNZ2pgZADOHDwS7WFU2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRZCmyCjCKvTPPaLIdNKclWiN3loSptLweS0q9KWfbuq7TxN0A8PYzC8PymPb7W/aXsNVgtsYTIhVLaODZoRIPdz7FjNJJmjuAF/hxrX8S1ptvzJXI5hL3gMZWYvQIbexznpnbBDhfSDv2KncQXiJyxwR5w+YvytQyfMMRQPLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQZky9j4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-444826c16ffso5017651f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984633; x=1778589433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe5hiZ22zYH3VWvOeb03VwN3MDfhsjlKDVnCObh3ENE=;
        b=KQZky9j48DZXgDheu7PplYA13usOo9RtfLY+nJfTaEOGhyA6UymmRphurmDo1HqRSo
         hPKY5bOkjQcqHCMlEWwKbahF64Sh4SzAwQzJlMLv/EReXfwjs8lwLjvFDPl+4wujqDgQ
         sJX4R8keDBZ7373/gg0SdDCYCale+jG/fSlkXN3mETln5H9X0pflfCWmhQdS0pxaXxH6
         SyEdMz25gIKlNQcyplIOl0jlXnSQ9p72FtI2z9Rr/U1kg09CVBhAe+fW4CAZAvgWic7V
         bnzzZ2TtrSxgBWbLGBGHj0zJXBMOya1EkriGNQmF2MxDCbk5LOFlyLuLTCKTDEiU7mFC
         T+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984634; x=1778589434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oe5hiZ22zYH3VWvOeb03VwN3MDfhsjlKDVnCObh3ENE=;
        b=NzrS/hRog7aMc8JXcTmB92KC4hzh/FUy3j18E3Uw2+W/2rtbPYpOUeg3wEcrvDb0vW
         Tx4suYtDwO+HtbSbFnhwNA9A0Nd4guEb3L7DlQLxZ8fbZMNpIYHggI/+yxwwXJQO0XFa
         MvIECQW28ZlElT7nsrqYHzZGVwZy4AW/IXs9R2BiHLEJSVlXNdNsmhjeqa9QL6tUkREE
         OeSnTj2ah3lhoVlsfqlAOTkyKVm1ZJHK8xkdIx702Jz/LA35Q9hpuCRzli/m+r9eOF2m
         AxLxzY2fi2UVDoU5cCIgRgOs0gz1b2U2v7Jei+CjoyETUmA1VVajL8Fp8TPg6RPhZWp/
         00mg==
X-Forwarded-Encrypted: i=1; AFNElJ/FnU3JQim5b4hcVdSqV0PSSkTz0+uEiHkmByJ6qZ/ZPBpLTQeHXMzKNud9TpobATdSihFz3uinIBkoK76L+QagRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjCAenBuPFLS0+DId3jGwmK3PE1dk+usH7CKcwirkOPzac9e3
	VHpTSo4s+Ma5e98Wv/f2NVYnuozhWboGehe6WqdvsnEqCWiXq3Xv1/fo
X-Gm-Gg: AeBDieusNuI/4KL+BjmjSvYHFGYO9v1Svgd2VANulCd7Dyz4tRSFVH7PQj/8d0Hy0BA
	sD/oIq8bdTBXNl+DjQNsCiUWR5rTy2HcNOOkvhc2x4rbx84OSbEuHJvcS3LS9LdCLkgXCujB3RZ
	uZo9XPH66IAdVqtNMHMIE0WXYMOFrvlf56m1zbRAZAB2A81oFkMa/BUAU11lH3FK5l/6gCIR36Q
	+EUaQmu8EMmuYB7wiAdXMOR/QJe4p7+YM0qbBNYHRfjUijS+VAydaZOoJTVJWq4U0f6JgiZH+9O
	RoVNDQifAoB1+2msx+okmIbTnTA7N2IZUJVXpgmmRU1b3AUCCkGvhBasccSsbRJklEi0/NX/UIx
	I28DGWO2qQRA8L76AnFF6iaCZZTf3ZdT1uacoFZRGrkbcJjZFza4cdrfqTZsXTDlkpgvSCrkFXx
	Gwg2i3S+zonvq/oTBK13tmNK3PWj6EwlGa2jbrId3VxoOjQr4VlVfhqG/uDU0=
X-Received: by 2002:a05:6000:240c:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-4500670b33cmr5481315f8f.43.1777984633403;
        Tue, 05 May 2026 05:37:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:13 -0700 (PDT)
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
Subject: [PATCH 2/5] arm64: dts: renesas: r9a08g046: Add SSI support
Date: Tue,  5 May 2026 13:37:00 +0100
Message-ID: <20260505123708.134069-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 86DDE4CDC07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32078-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.167.255.208:email,100e4400:email,100e4c00:email,bp.renesas.com:mid,100e4000:email,renesas.com:email,100e4800:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SSI{0,1,2,3} nodes to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index fa15e2ebc87c..03c0ac707d3a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -349,6 +349,82 @@ canfd: can@100c0000 {
 			/* placeholder */
 		};
 
+		ssi0: ssi@100e4000 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4000 0 0x400>;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 307 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI0_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI0_RST_M2_REG>;
+			dmas = <&dmac 0x2665>, <&dmac 0x2666>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi1: ssi@100e4400 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4400 0 0x400>;
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI1_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI1_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI1_RST_M2_REG>;
+			dmas = <&dmac 0x2669>, <&dmac 0x266a>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi2: ssi@100e4800 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4800 0 0x400>;
+			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 313 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI2_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI2_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI2_RST_M2_REG>;
+			dmas = <&dmac 0x266d>, <&dmac 0x266e>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi3: ssi@100e4c00 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4c00 0 0x400>;
+			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 316 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI3_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI3_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI3_RST_M2_REG>;
+			dmas = <&dmac 0x2671>, <&dmac 0x2672>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g046-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.43.0


