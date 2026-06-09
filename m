Return-Path: <linux-renesas-soc+bounces-33763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g/lpJrYNKGpn9AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 14:57:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C8660495
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 14:57:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="HDfl/XTe";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED09303454B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 12:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350123A9616;
	Tue,  9 Jun 2026 12:54:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96719CC0C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 12:54:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009688; cv=none; b=Af8WsKdYj86O+pPnSCiw7+ac6URRn9bcL7/t8aUFhh/BRjiYphS5ixVKhDJLeSZxuWcQY4pkkug34wD4cIqY0yb8p8Mw4g7cjgtiSzjwgdxPcI0Wba48+Bsa7CSH051ynaq3YSe5iHImy/Rm15eqe3Ex/6JINV4ruWtO2FgQcss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009688; c=relaxed/simple;
	bh=jpAzcsar83RT/yJsgZz3cbdGzD5XuyeMnf3Y+zyOldU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGpDFJdAORzUrRNKo8HQzQIRY6blHmGotmA8rSxVef0yDhFZXfeLcxDackmxy42uTJqozXWWCRuP+FzftSwwt2fulVavx5+o0Qf9k/v9IjFwMeJTKN8c2YOV5yZ8FpyM0OlOGtyw20s0Jc61uAymC++r2nPzlEYnzGgToKKXAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDfl/XTe; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b12270b3so33061935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009684; x=1781614484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZbdhxNRHx0Zryd46XkBMjMtJwqMLavPuhsEZIYoVkU=;
        b=HDfl/XTeZUCD217RLs54Z2TKrKBvaxJreTkz8oicVKPk1NTpon9CGJsmjb2yzoqwJY
         ozoojxieVtq5KZgXDzqOJXERCu2H5EatEowNsGAQ+8a55cBvvgJB24z0Oc+5w6Z6ydsz
         EJUUKjdtxdy+f96ubUCm6InEJkNbLon0lm2y1tbf/KAcnO+PhoiHSyZJ0jAgInQEIsxP
         2+4rds7G2jIfncw4J8yMgmJn4IUamSi7QBJMPL++xqYaGhJbz8cWwAA9fGYXBl1W0LQK
         Et1ThKe/m3U4NojyJz4q+7eYuA/YCe+cJKWdLxq8Ds4Y74mBdZsMyemU8m5OObE0gxqB
         LuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009684; x=1781614484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZbdhxNRHx0Zryd46XkBMjMtJwqMLavPuhsEZIYoVkU=;
        b=QutdFtsErdqvc0HuPZyoHSkXsKilvNSN0To1CCIYggCDPUtXvkUpyhB93sYehJAtic
         2Y1WvKa6+kGKsfpG93aCvLS3R2+gtT8solCZ4+H1AvMbPv0q7PiQzSdUMtH8jRYbqgBl
         zMWNrEDw6TiCQe7yoAObp77Apyn44+AAMw1K5QQCMPtTEkn9U9zScVXGH4Px6n5zK6KP
         GxefKrDrhgFYrmObTdAQx8wy9efEkYfjSqzEfU2d4OK8PQf0oS1ylFRrByuV03E3fiAF
         24A9rLXpeaf49ghLCXNTaFOkAAetyVqC5QkuUF4x7VaeT73tyX//E62ZsoqOjeBBAA2c
         16Uw==
X-Gm-Message-State: AOJu0Yy8GjXKB/Ymppwiyq/a3uHatQaSlyWPGf8qW0Li05g1EUZzFwI+
	3dhjF0iyKW8AfV3kp7JX34dcB4MNaKYM9P6yZY4h0QiR9kIM/WjN7vw4
X-Gm-Gg: Acq92OFcUdFFj9obUvRdaPDmiBctsfRBBIJ/Vxw0UNvkgK1U8ocj39XjfhM/KzK0rwC
	/lbiucubrfFG8uvAbWqv5FbmHSKQ49ZYBhQCaU3sqVbDoOVjJYJNhD9LH502f4Oc5wGZCFxKFEf
	sMUa00yrYY944E69r+DWzLQJA+CuFJHiJvXZhbuxbjXHqjJuEFeOFK9WaXuhMG/Zk4orVfuBqMo
	hEQGdBWXNxTgrVJnz24yxU8/ZA5kRhaIw2onffqlRdx5bapQJNfsiDMdmlGZd3MAGM12G5IBsQ4
	X0BB+W7vYCTcWJmfdj8pjnb9ac5NS3NCXYPjDF+PWb9yv9mA1v4ZpMURdyYBb00mNHAgSp/G29I
	6WKBxOwQ6wqpIBylZWPIpAmx4yFGAhqQMDKAeR7iLwqXaKf5Drhu27BeqbeLr7sfVtDt3ihf/rG
	4B3JeeFvyvcRvzjTmdHauylwFljMbYnPpECga9x/jTDkWKDP02k4DF3FsQcsTJNa5nn2stH06Lb
	6d1mpw+2/NDJzCMp1eK55JXj5AiPO5gmUEOR3AWoGv7RSQUqMn8jLZ5FWD1V0RLT4fL
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr321650975e9.2.1781009683630;
        Tue, 09 Jun 2026 05:54:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
Date: Tue,  9 Jun 2026 13:53:49 +0100
Message-ID: <20260609125353.401124-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33763-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 315C8660495

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..dda7008acdd9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1376,6 +1376,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g077-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g077-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0


