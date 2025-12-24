Return-Path: <linux-renesas-soc+bounces-26115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B5CDCFBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A655307CE7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1B334D4FB;
	Wed, 24 Dec 2025 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1S7OQev"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF2343D67
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598749; cv=none; b=W1+CfGsRPd9HxXZMoabnZli/Xve2+mDEV1HbKb7/J/D6srls2yV92KSKhRTLk4EC3M+cR6a7yX8Rj/9jNuAhyjfXLKFzlFW/6eM9ATdqbn2lD6tezs+1YvFZ8WUqbWFkwuOcgsyzPfXt1RGdT2hnCN9P6m0wDlFtUbuqsRTVWJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598749; c=relaxed/simple;
	bh=8eOJE2ne7sXkYazkk+85d0qkTSighdHtQJpIvLFCbDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rpqa97DFrYl6TV4LdGIz0lx4GYefh63GhVNYjF8uTumAgDbQJ1J5UJ2dRF7E04q3BwgKPBHKoN1u6K6TgeMjAK3yQJYcfjoT+FYalFPyYdH4+w1zBpjdaH29H0v4TZoChuhyMgUboCvb07kW2lbHwqyOFwYfEra0vZW/DBzz0lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1S7OQev; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477632b0621so38693975e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766598744; x=1767203544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AHMi1hMmRbz3t4zZpvMga2BQTEmP90JEbRCMvlnY7Y=;
        b=P1S7OQeviIY+0pQZEse9GCVU9OeHHLQHD7J3+hYTx0n34peT9SUk+tFSO3XRlkdc08
         4kaIDGoX8Q1c3L+xeCXlphNDGaN/0WDimRx0McXXs2H4ZZnBiHUTZdUEbcOQZEwBPcRs
         mFBCD7PLO+2uWpHdBHRcOWra94NbKwPDdzJ9iMtaV12/uL4pp5swrdIxbF8o2lsjpqC3
         xUwv3tSOd24TRhhvrSTz4iu+p1uCgeqbCIg5wPXJkRk2XVquXtCNyAKSC2WZhHY5gmXh
         0Ms8UKb55s556CHFhG4Sa5MShxB9YgO1YhgooazVmEsF6Hyq6Vlr6X36LNdbgtJqr6E7
         fr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766598744; x=1767203544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8AHMi1hMmRbz3t4zZpvMga2BQTEmP90JEbRCMvlnY7Y=;
        b=BHee6+uPVIonvVYpGs+a4NpexTx9HcJralhd97AOrWj9aRoPNcyJk3cD+gKeQSy3fM
         lqBYSx3VmXj8vkuVz3szExWZ55AcoyS/MWQO5lXI8Rj67f+ncm9WzTUeXd8zNqAqkdYS
         gTSJowzJ8lmAEwvh6PYOEYKetho+IrXtUx5y/nNJ+86YODnf5TWMb8LGR8JIsc7mL/t4
         xh5gAXmjRHyoOx6HGptMmDJi8erttIlCLUVW54RyDwShQJOGHbMSOtC2pyzaUO3zTZlQ
         n0AOrGSX7b+hnkj9XSsj6ql4UpMFKN+me7P+4SCIid6qM1xm3XQ7X338oRCjh6Wuz80u
         1JpA==
X-Forwarded-Encrypted: i=1; AJvYcCWqS+H+aIARRIzEn7CgUlr6s70QnEyyS9OezbTlf14mJTubWdMvYPpS1PtcL7DAt+BscY4xw0UFms6IvpAnAWLQNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAiUibasck219kohIGsfImk58qSV+325PjaM0iD5yrqi1b7Xg
	HnuoYJgyhI6R1U27Sc+2Fc4rFDLxSMxH8yikq5+iagH3XhlsmooT0LlH
X-Gm-Gg: AY/fxX4G4HE4CB54pxcVsRxGz4XhUF9kYcoXmF5NSZ6aDefnEZmnaazcdGFQmi8qGGZ
	fnujSTJhE3uulyJmk8J8txWeMEEHezGjT18Ej0nn6RKSLkFdyFC1MTzzqeTp1tvV9igVW0PhHND
	ezDztlnvV3aI1SpDhV5zTQJqaLlDg3mGHzpD43L6zgz4Z3L2TOrEqB7iiW06aXmlU331AK5GdLa
	SyqYFlR2CsjDoU3Ptp8yWMyh1ODPjiFuO68L/bl6k5qXIU0FUPbyUbkfsNQ/IhPbwzgs5Z/URPC
	UtquhRP2GWdJ6SMrNIzpN9+ys22ypbO7CJCcR0CEZvhzACBfT45kLqODgITycKwI8P2ZqyXKs/6
	KWzlHUylATggzWmVDBsjDQs7eHKPBeqzMyHEnb1bwYnEwJ5aEkkBHR9+sZsOIYxiEjcZ+SjdR0m
	24CTsDfc7vl1CAT+MVPCBpN5hdWaUkZ6Zpeg5WZdJQ/SAdflIhI+/21L95yPnhhyuYDoDto/Gr5
	U9K+RLqzklJ1rmrlYW+Of3X8H87aHiAtC0=
X-Google-Smtp-Source: AGHT+IESR9ylzGQ2JpCjradBd4DCO0VlDoQTe2tTv3rNuVCtATe1eQHerQ36NQ5foDU5YJrHIWWldg==
X-Received: by 2002:a05:600c:1c1a:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d195780eemr204175925e9.11.1766598744481;
        Wed, 24 Dec 2025 09:52:24 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a4651bsm140167935e9.7.2025.12.24.09.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:52:23 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g057: Add CANFD node
Date: Wed, 24 Dec 2025 17:52:04 +0000
Message-ID: <20251224175204.3400062-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add CANFD node to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index cb0308b84002..0db05e24b789 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -690,6 +690,66 @@ i3c: i3c@12400000 {
 			status = "disabled";
 		};
 
+		canfd: can@12440000 {
+			compatible = "renesas,r9a09g057-canfd", "renesas,r9a09g047-canfd";
+			reg = <0 0x12440000 0 0x40000>;
+			interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 698 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 704 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 714 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 701 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx",
+					  "ch2_err", "ch2_rec", "ch2_trx",
+					  "ch3_err", "ch3_rec", "ch3_trx",
+					  "ch4_err", "ch4_rec", "ch4_trx",
+					  "ch5_err", "ch5_rec", "ch5_trx";
+			clocks = <&cpg CPG_MOD 0x9c>, <&cpg CPG_MOD 0x9d>,
+				 <&cpg CPG_MOD 0x9e>;
+			clock-names = "fck", "ram_clk", "can_clk";
+			assigned-clocks = <&cpg CPG_MOD 0x9e>;
+			assigned-clock-rates = <80000000>;
+			resets = <&cpg 0xa1>, <&cpg 0xa2>;
+			reset-names = "rstp_n", "rstc_n";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
+			channel2 {
+				status = "disabled";
+			};
+			channel3 {
+				status = "disabled";
+			};
+			channel4 {
+				status = "disabled";
+			};
+			channel5 {
+				status = "disabled";
+			};
+		};
+
 		rspi0: spi@12800000 {
 			compatible = "renesas,r9a09g057-rspi";
 			reg = <0x0 0x12800000 0x0 0x400>;
-- 
2.52.0


