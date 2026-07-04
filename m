Return-Path: <linux-renesas-soc+bounces-34700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O3KVG9zTSGoouQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:35:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7089707470
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:35:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kysWX2du;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F465300BC6C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7909F3AC0FC;
	Sat,  4 Jul 2026 09:34:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744BD3AA50A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157688; cv=none; b=m1Z8aCkjPSnxFy8XevF1M3sfuIy3AXAEQyqsqIcVU0l9ciQAkXknZQXhejtPxvZRQZNNhu2n8yrk77Rg2478ejrmNK6lKVKEyYrMci8e9m3LqgIj0dK/QmQ4elkF2r8DiVNXMP8XuCdotiWpLwrSGOUlR7m3P/rpcnpbmCMJzWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157688; c=relaxed/simple;
	bh=Loh+6OFz0mK5GAhmzzCuf5Hf8ndCuL4EPmodSWxlT68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cupdZQYloneDtDFC+fMquxzYYcUZTx1tZTuwJKH6BX3ynXt4ZXfdDRBpBS1swpt0ifmia1Vfu+KpCY4WDYAcW6JeKa4KDN/bb1E6WQSe3jABFmTwEuU5pa2+AsB4eKUlwb6uJVRbsg7XYxork5hf8sPKOEz2lgQvj+s3bQAfLMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kysWX2du; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so9321175e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157685; x=1783762485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9IzQPHnBsRY2wO028pzZOPJ0v/NMIURbeDWLuoqX1s=;
        b=kysWX2duwXYR/N9W5A9JzosPYsl7eimyYZXTGTcYXA1KDRfoWNWX6VCy6tU3uhqKuh
         bBQy+21/VXAHz4HiZZ2qEgxDPCkUxbLTicdL1JWHBEyfzYdNWVtcZxI6p5wI7g0/j5Ku
         mNG/Qmwc2tqerWfjbvHDnSOe1JqKzhBoyzIQIBWWQ4ouEB6oVw+++kf3BK6xeRO9pZ/R
         jQQZZL9fTXhYcWHxbS76WxrBpMPH+MJO9fydIOiBtrtEXFFKx8/pDzMLA0iveiswAAt8
         t91YZDGMANbazBOi5v2Om+NtTgv/JgKQqV0fiA0GBKv+R2LZbbj/4JhxUpzEKFO/ixzM
         gjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157685; x=1783762485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9IzQPHnBsRY2wO028pzZOPJ0v/NMIURbeDWLuoqX1s=;
        b=MMDPXpHWl5ZY4Ic5C69Bg7DZF+NEE2gIBwwl0j1JJLjTD9sSSA3Qkl6qWhBmxgghSZ
         KwJS2f7rYYxnh6dnGBM/bY+xJjDaGiDU95eLQxHWCRl+becXqL9MEW/Fel+bHb/qe9Yr
         6nuBKYd9vG+Bx44Eox+8bHnTwCOXc2mGahEKX7WMNggleoUvruDmxJn31EBHyvfjwOCy
         Hh7muMHDBqT4zvxPlAd/+8IvYFFRiEJmh5mX1eiJgMD39A1lwFrd9gLqUhoTgvff0x8j
         fNVfk3b+VXzNi5iTBUOrDj2USTyjtqt50RL/VZAXLn7xIzvY6ttLBOabvSBzMVJ2nACo
         qoJg==
X-Forwarded-Encrypted: i=1; AFNElJ/4KjtBMvEzoTF8acr90yD7rdWHeI9iwKJKH6XlmcOV5qKzJPyZhuR7GsDF59Me+0lg/3vVsxYQ/S//GAEY9milbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuh+qykACCY/at8zSk7hmJpWch5XCEQd5AhW/zYEZLqOuJoBzI
	02qJdTDIIGlQhfz1yfnClX8zwnhnaxCeG0QqS4rqzMyb3pfcUWU9A3Qr
X-Gm-Gg: AfdE7clBN1QkVHvqZY2TqZDxzOnyrTQerGnHWHz1cdJYSieTY4QcfjCpx2F1nohCp6Y
	w+rdxxrUtGFjRVzXeHxn8axB7BqGhiwQECn48xWCq1bnkQBamjKuFVZMRAyibGJ4UsN85+5EJdJ
	MN06TpJmZfSQ2K1T1WOn0gYIPGiICNlshYRkPUlM+NAvnFMZiB1wE2oTLReDYmmMXTwA2jFswzp
	p+2NAqwGds0Qvuf4sRQh7meBabQ8rS56BhnmqYDZvi3xyzGHl4rFPO1/apROr52I11PTIVZMWdw
	fxvIiu4y/vWug8d3/GsLSmvveyiCjt6WZSKOk2dPdIVhCbt9u1wrls2v0nDedXwmO/CJiGy29Cx
	7pZqDcwMuYafHW0Llw1xNt7qIwJM9DDZAurMcxtB+fA4Xn5rRj7mlkB+O3IU1sPhQnGltZy13FL
	1tZ2Hc3JaTYQGSajnOiO38
X-Received: by 2002:a05:600c:628b:b0:492:3237:ddf with SMTP id 5b1f17b1804b1-493d162bb31mr23450765e9.28.1783157684741;
        Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
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
Subject: [PATCH 14/16] arm64: dts: renesas: r9a08g046: Add LVDS node
Date: Sat,  4 Jul 2026 10:34:24 +0100
Message-ID: <20260704093433.273672-15-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34700-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7089707470

From: Biju Das <biju.das.jz@bp.renesas.com>

Add LVDS node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index fe2779d334dc..a8b45443a78c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -795,6 +795,43 @@ port@1 {
 
 				port@2 {
 					reg = <2>;
+					du_out_lvds: endpoint {
+						remote-endpoint = <&lvds_in>;
+					};
+				};
+			};
+		};
+
+		lvds: lvds@108a0000 {
+			compatible = "renesas,r9a08g046-lvds";
+			reg = <0 0x108a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
+				 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
+			clock-names = "pclk", "phyclk", "dotclk";
+			resets = <&cpg R9A08G046_LVDS_RESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
+			reset-names = "lvdrst", "prst", "rst", "arst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds_in: endpoint {
+						remote-endpoint = <&du_out_lvds>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					lvds_out: endpoint {
+					};
 				};
 			};
 		};
-- 
2.43.0


