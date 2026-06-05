Return-Path: <linux-renesas-soc+bounces-33612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gD9EIl7BImrzdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:30:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36164826C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:30:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nvaUTNug;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E6B8300C0EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FC33D7D9E;
	Fri,  5 Jun 2026 12:20:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302F73126DA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662026; cv=none; b=Kaa3c/wx8FtvSXiFNTmPoL2GscPW6dr4J006qZzGzEhyL5HZ64wIeV6w4qVm52z1gWt29QFG8DVqfYxZRxnN0GvbuKkIWk9yISFx97QUjOORahhTIgPeMLq6fFxnKbvzmuAMRmGxiPvXyVq63moiXuF2qcLMrhipCsF2dicN8Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662026; c=relaxed/simple;
	bh=fTbdpRCyfFLaOtbYVQuXBTeh5e2Blvm9k0H83//ETNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poiOixC2rKKVFES/MF/8xdcXfIKt1oaV+lcaZ//Dd8qHWhmoRIZdVLmp41DgL8p0QoEVr3dZd3VU8gm6mu4tudZh7Lk7EKSOesWtcImN5XsEMafnykEllHBaAfdLi47lTkTxPeCum9+tSHN/Q+ufIWnEW9Lq3rbDko0DVlVzOG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvaUTNug; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84234c83142so758985b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662024; x=1781266824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=nvaUTNug3ZU0SWxUO3S3khfKFoXf/Dg19CWpHNsfV7eh2walln0B0rIVbXcF9irpPk
         3OkmwsOrQO1SMSi6AQk3mpk3tddDED7nxQqpdE90VvkklCyFQtbYnnZ6GbTnIEKJfeFj
         lkrI64/NCFM76th/SxL0aNtpcHUtOYulxfyj0ZP+knvKgq2rXAX2zuXq/gC0YJCrhLMn
         xmpKEiF9iyEjOxDya8xj5c4JUXXQCpDpaIEVuZ+CcaCyRLTFC5iTtgRuy5QK4V3ZREZH
         TCFivrKluxZHcVZXPpOUZ6QjzqulCS7paNSYQfruvHSHY7Tpq9NJcxLctxsp/oKoXDTY
         50GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662024; x=1781266824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=hFGB1IJVhMI4HJCoORb1A4eScHpNZCEXaJl8MaLtt9smg/kCXf60EumswW7+BuuOzk
         3+U5hS6248D8LhiUEuhBmyvs0J3sjsUScSpm9INZ9L6wF0AzPVknsgQuioqR8I70d0ix
         GV5qPRv2ZAqF4rAnQYJmhXbtcRvJRphpf64P7iW3t7A+1LA8R5emN4IlvzDFQLoUXcdb
         jyca3fn/eaI4+IcfYOD1pnLYq0sRKlU6fUGF5XBR8Er5geHf3SMmKG6lF6hNzSfWRy02
         D/V975LwFzpCuK0u+jgTfqZyqAvPPr/K2c91wHXRzZp9ZsYM9blYeiKut9foKFxMyIJ1
         Pvxw==
X-Forwarded-Encrypted: i=1; AFNElJ8131r8IAYO+KSZTe2gD5oRh8dqHC++r8MWIjRXYWDEHLKO9syHXbpkb9O7I99ma+2OqRX32JXbcauPZHpEjwkIGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFX6M/tes+9ZkZSV0EjzP0hacl0F1LRzWs7q2uW8xvWufkLal
	hbaBdtrz7HbwbUvjs7fiFsi19MSBYzZ0zmareMckH1u5yzfWdHctjg9Z
X-Gm-Gg: Acq92OE2SpQQtlDhRNf6waHhcVWiILfYUwzofFYoJRqBEvZDqQnHEeDwMAAcXY8/mTc
	erdlxuAHr2t6wEMVjTrphkDyQEJMN4VsbbT/6uHpwojAiWkpk44aXTGpLZLFWVsMgApy0tHcMoB
	yjLRP4owOrle+yE9xLP4V/MyTqFo0EuAH6ar04/SmELBbeg0KaV/N2CeSg+6BIkJMv05lybAklU
	CUW6xOnjVYfRNJ39V0pbMPFOc99CYivK1VXOii8I9IrkNh6+SAmeIEkXzahIyVF24H8BGsid86t
	uEa1kqJZTRnux1QSWZU7GHtG7PLF+MlZNlo7pLEBJxAKSsIiThmS05mHHkDaPFE3cj/rOXlt7Sw
	FAwKDxQ4+I2LmgAn7DPIfSek8LycJ17rUNSk6lGfGmA0YGEBPZKcuBJwhLw+rTefMtLgxTM+knw
	e1QSH6VHy3ICdZEpobx7MTwroHjAZZVKQ1zcl/e2rhI3co9vbhfl/yP13SehekKSlETH5x
X-Received: by 2002:a05:6a00:4390:b0:842:6a3b:60ea with SMTP id d2e1a72fcca58-842b0fbbb03mr3362512b3a.40.1780662024485;
        Fri, 05 Jun 2026 05:20:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 02/10] ARM: dts: renesas: r8a7740: Add clocks for FSI
Date: Fri,  5 Jun 2026 19:19:46 +0700
Message-ID: <20260605121955.105661-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33612-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F36164826C

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU bus clock, icka/b functional clocks, and xcka/b external
clock inputs to the FSI device node.
This prepares for subsequent driver changes that explicitly manage the
SPU clock required for FSI register access on the r8a7740.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..6f9d9bbfd159 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "fck", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0


