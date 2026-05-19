Return-Path: <linux-renesas-soc+bounces-32803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD8ZBs9NDGpIeQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:47:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418757DF52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28D313174412
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 11:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3344A4963A0;
	Tue, 19 May 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7l5b4Y1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43253C4B81
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189606; cv=none; b=dkY+zcdnFeGXndJWB1GzmD27JebPAxjkiuE0+25lLGdqsFPPb94gJy5osZVsuDEGHypeVwYwvUx5KWOt80CmvDcxGhdT6VaYzwzGhZS+6YiATaUxbV51Yg3pTGOBL5RR2RW1udtyiN6V8dkJQPtIywiwBpI4P6lbgm0es/VsdFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189606; c=relaxed/simple;
	bh=dLXaYe5diorc9wO0xXPb0VONUhmQ+UNGEUQkpF0d8m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Au3+XIRHyq+rtO5XcWMWyPYCtHd53xKMEfVPYLGD7Islk0Xkwl4iT5Rj4EOfd+wlTm5R97+A3wM4LFQPexqH5oUM4n8dM6TsbZ/prQP2tltrKgSXADzfb1EvDFl0kkV7Pw7lFw7z2HgVsdqYfq3yuZc0r1p0qPW8QqACZ8qpOWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7l5b4Y1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-453903ee4adso735517f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189602; x=1779794402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nffFNJyJYbclz+zU24Jr2YC2Tb19NL3Gy5lFOXSCZXc=;
        b=U7l5b4Y1yHvvGE3ShWW8bXhetw4Tg9r2VqKDMHZPb0IV5QDr7aKVaMp+p/jAzFMsS/
         9jzJ1JfDDpZcidcAC6mV2Kotaq4U9yb4Vhf9TmyIK8K3sGOum6YJC/qG/BjHaefD8GNw
         UauH+CXnCQQRpfONfj61pFBMwH5uutFnyN7PlZammCicpg0eT5DXCj2NmhHBwaJzX6BJ
         CHnyByQzxFW2dgphtYSmb7ZYesjMTel+cBgTkpojuOJc/fg4Vj/BkZ+foA0cSQLyMdet
         PSVhu7ptReCDH3bFoC+ec2oInNi+0FWxqe0b3vCRV1QfAFEZ1ZsXSFb46CjcuI3woCGi
         YJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189602; x=1779794402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nffFNJyJYbclz+zU24Jr2YC2Tb19NL3Gy5lFOXSCZXc=;
        b=WmWTGFl8/9xiNL0znSrbikalvUMOfyEldIZWS/qRNKHHTPwwFC//gKXEh5ABGwwSl2
         VIau/Hdnq0c6linoSpzPtxoW6I4kTi6vPPnJHwT6NL8bpM5F+HVK1KS66BTm6O5c3EYx
         FvmIrFwvByga28UVv5oj14VsFa3aRWylUwrHOQvm4GQ7/41OIwlDDjTqxZ5KcYPh9xku
         W40vi7lomDq46WXhsHZaUdDap/3myz79oXR71hIa2Oq4jRKCxQRgRd4Joxv/j7GTx7ec
         //r6NTb8esPVyGCDB9yJrth0DQj756LWxEX0MyQzOvw2wuy9F3QNrf0bawKM+PlN976+
         oueg==
X-Forwarded-Encrypted: i=1; AFNElJ9K/6EKDUWHgE90UxknT1j/Qg7etN/a55Ov2OPLcDkjYi2ERiARHbe5NIMlIAAtGqeHrtWXBMGQ0sYOGf/IBcTKhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUoNsePFPm4au6ZiFywg62mBqErzCAtEpxRiqNVBW1zvD2pfa3
	EH68hJ7pZz9CF8eJo0PObao9cphgiNLn9ZGtYjqmpIUVicmG63MjjhA7
X-Gm-Gg: Acq92OHsesjWgUAj3KJjSqwpXRnZEvP8oNqjApGQcSt3ghlkXhNjq2tV4wWX6UIksHc
	vQSdhYoHQPUdtBP/zGudb5Huep6RJZpRx8CpqGVbYGF7oMsr1ZlblkmmJlr0w1GtPFe9MtH01SA
	RIlbbAxjJxFLTHSftgTnpkmREV5K42TdjNsl0f8X9t9/70cRycpfTF92+PNuLNuWN7d7glLKiKv
	mF5gnHrEwTZlUEZdsH3mM2Das6kLbs5BZ+pSTireR4E8mZinTzXA4GoIIEnxzQiMWd0AbwIcyne
	ow86N/pbh8F8fehTqpyAp1ylT4vOyEdspYZUUQtmCVS59JFoaXX/S0B3FLq/jfTTY7zo/JPd3ji
	54moRbT7sUHT15ioHleLPNZMyUnIPyBay2iQrxFbIow8pfqZFBial/sz7MCEZc7g2BtM/cB4VV6
	H9JwwXFarUcg2dSha7ASnbfJgnLrdGN9N/wPLyEd6yTB42C9FZsN78Y6I075c=
X-Received: by 2002:a05:6000:2f83:b0:43b:5097:6f62 with SMTP id ffacd0b85a97d-45e5c5952d5mr29923699f8f.36.1779189602037;
        Tue, 19 May 2026 04:20:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm46066323f8f.34.2026.05.19.04.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:20:01 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Date: Tue, 19 May 2026 12:19:53 +0100
Message-ID: <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32803-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,100c0000:email,renesas.com:email,100ea000:email,100b0000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,100f3000:email]
X-Rspamd-Queue-Id: 8418757DF52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three RSPI channels on the RZ/G3L
(R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index a53d579eaad2..1fc409ebdd44 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -442,6 +442,78 @@ rsci3: serial@100f3000 {
 			status = "disabled";
 		};
 
+		rspi0: spi@100b0000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100b0000 0 0x400>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI0_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI0_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI0_PRESETN>,
+				 <&cpg R9A08G046_RSPI0_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f2>, <&dmac 0x26f1>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi1: spi@100e9000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100e9000 0 0x400>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI1_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI1_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI1_PRESETN>,
+				 <&cpg R9A08G046_RSPI1_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f6>, <&dmac 0x26f5>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi2: spi@100ea000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100ea000 0 0x400>;
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 453 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 454 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI2_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI2_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI2_PRESETN>,
+				 <&cpg R9A08G046_RSPI2_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26fa>, <&dmac 0x26f9>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		canfd: can@100c0000 {
 			reg = <0 0x100c0000 0 0x20000>;
 			/* placeholder */
-- 
2.43.0


