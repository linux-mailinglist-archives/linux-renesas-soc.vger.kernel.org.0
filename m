Return-Path: <linux-renesas-soc+bounces-33600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vC2zMM2ZIWq+JgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 17:29:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F936416DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 17:29:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iFcG6c2R;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 052C530463AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 15:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD54342C88;
	Thu,  4 Jun 2026 15:19:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F75533F597
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 15:19:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586344; cv=none; b=KJeQ+U5IZWz07YF2LxqgitXGj8eCp2Mxfjern6Llqd9D1SqMFAPBdIu+e0/KGTm7p/z18jpEtsVqH6gdKRv9i8RKsGzeEa4PhXH/C9RunW80mjaiY80i1/fg9ALjuLJ0qXkoz1n/Akv0Zhv9/ck/TBTEUe9DPL4AvZQr8LX21RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586344; c=relaxed/simple;
	bh=CRpSLWc+6zDoJo5DNd7dh84E5+rddROJ9ABvBxZmhN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llfVWuZQtKm8MH7PY0dWqHnHWzed9c5jYxuhSsSWX9b3XhCs4MEjvDX5ZLiiT7M6pQVjoLtZtvW0ByrdXCJuV8pTWej07rbyBzhIZo5pCTKD7/mgFnMZ0C8DE+l6XRxPVOZs7UzagaSsx6t/Hqmd16X7FUGr+Qy8X3wC71yoA14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFcG6c2R; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so506682f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586341; x=1781191141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/LibZY7W+c/BPC7aBAGNpRUQAiRLmLNuIcbki5KxVc=;
        b=iFcG6c2RhliYcUmpFoVEkXBokbIxDorzW1n18WxHW+w0h+YyGbc5jcRn+OvDEAjdt2
         0Dm/yqNEaEh0gads/x5OpbeI2sqZfCqPhNbtGzocPWqvMo0vzO5eRLvNs83eW031OpTM
         ZTdXb8NhgS63rlKOVBZzuLRT7ikzoThWXfmBRzdwHlcP6alegCJo5GqSNvnhX1fYvu2l
         SkqO4f9oOSck8KjLDmdCjiKtsvezKngG0/xNaWBQMdXABgoHi3zxYiOO4VjiCEwdqRe5
         fdEMpCVI5EXJVNv1EA6BISw1nooHrANdjgXxsSOeZIjGkGMJhRqm3u67ZFpJ0QKjP5Cb
         c4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586341; x=1781191141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/LibZY7W+c/BPC7aBAGNpRUQAiRLmLNuIcbki5KxVc=;
        b=NSLjbH9sWpL0R2lzNzDhImEth1ww7CwBQC0gZD5Q4dnj28i3byIyUQ2XkMphdEAEjb
         IWzhHxULevz6i8BJVsnzZm7iaGUwmad8LqV1+oM4jtTHQt+qk2YWiya1nZThO3pAyt+Z
         x0VGC/oGBhaLFUL5Q3GHw61eTqmZl4vXN6g250CmEfBzlxHc5CwJXsXUkSmextleCWzX
         Oo6PlRCup0XI87i/duQV2vhv1rUs5Mz/AyP7JNKrCOmZXYDjWX7goXE22Sm4mRThUL8A
         qtuX+msBM+cn4m/PnvbhWoeu4g6glkfwymPyoePIe7MrjHLUHrJtKQ2jn2DmQCe7rt2d
         iEGA==
X-Forwarded-Encrypted: i=1; AFNElJ/PUYwZH3A0nKn1vaPKUthxrI6QSsQIl0gHwBCjRmVEq334cYAOkPmsXa6n9VpJJ3ztRW2l9KMSJcmqtcYM8wSHzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoH+jQ4ZxbrOvhh9/4BXhCeWg/EaSGDczitgZ/eayh2WxmmECP
	4CttApXITKOOOwIQH9qKDW7PvQ0UdyXl5VDm76JryPEycY/aOuGntErK
X-Gm-Gg: Acq92OFphxPHjefupnaUMm+DyjGHLO46LKbEbs6E46GiyIGoJrFd4LOBQZjTLN6pJEC
	DIwOMMWmIa8ACAPx3JrdzikUGCj0bISMPy1a2wpim9vBQogEde+TDia0Y8KNe1bVlw362gl5Yat
	bvlecaZUDAoRu9vWOCURlU/VPeC1ntfgdhTbpZSpK24m6pgD4PW6HiaBFA+fObxM3xb8mllqE9X
	473wuTCm37mWD1IQjEHoBE4ol2naYlCS12TuvCStbEZnFPgeDOxBQtjIgWiCHBp34mjHDSWRJfY
	kpdsTyur2S43IX8nUiKvbPT0f2PKDznAwuFIVz+rTgCCjfoXoYYcIpMXdEH2Ks8IqxIeHq97Y5D
	EH+HzqEOqF2oLQ2+Dg5t2y/ULPNRG3gz584tl0+GfCv2l9+yPSxUwptlgKkDwesIpEFbP4u4y0E
	Z9XjZ5ziTQGWH0Dcfd51IP6b7qLJrvuJ0c59uOucu0hyBfrKeT02GBUVmhZvU=
X-Received: by 2002:a05:600c:a09:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-490b5fe66ebmr139763285e9.22.1780586340547;
        Thu, 04 Jun 2026 08:19:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm82776805e9.1.2026.06.04.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:19:00 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
Date: Thu,  4 Jun 2026 16:18:50 +0100
Message-ID: <20260604151855.307772-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33600-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71F936416DD

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the Mali-G31 GPU node to the SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/all/20260603065731.93243-16-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index ce42c945fdf4..0c1cb22aada0 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -64,6 +64,110 @@ opp-1200000000 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-533330000 {
+			opp-hz = /bits/ 64 <533330000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-266667000 {
+			opp-hz = /bits/ 64 <266667000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-133333000 {
+			opp-hz = /bits/ 64 <133333000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-125000000 {
+			opp-hz = /bits/ 64 <125000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-66667000 {
+			opp-hz = /bits/ 64 <66667000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-62500000 {
+			opp-hz = /bits/ 64 <62500000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-18750000 {
+			opp-hz = /bits/ 64 <18750000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-16667000 {
+			opp-hz = /bits/ 64 <16667000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-15625000 {
+			opp-hz = /bits/ 64 <15625000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-12500000 {
+			opp-hz = /bits/ 64 <12500000>;
+			opp-microvolt = <1000000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -592,6 +696,28 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		gpu: gpu@108b0000 {
+			compatible = "renesas,r9a08g046-mali",
+				     "arm,mali-bifrost";
+			reg = <0x0 0x108b0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			clocks = <&cpg CPG_MOD R9A08G046_GE3D_CLK>,
+				 <&cpg CPG_MOD R9A08G046_GE3D_AXI_CLK>,
+				 <&cpg CPG_MOD R9A08G046_GE3D_ACE_CLK>;
+			clock-names = "gpu", "bus", "bus_ace";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_GE3D_RESETN>,
+				 <&cpg R9A08G046_GE3D_AXI_RESETN>,
+				 <&cpg R9A08G046_GE3D_ACE_RESETN>;
+			reset-names = "rst", "axi_rst", "ace_rst";
+			operating-points-v2 = <&gpu_opp_table>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g046-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.43.0


