Return-Path: <linux-renesas-soc+bounces-33460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4r81Jl1BH2rpjAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:47:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FBF631DCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:47:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KxeAtyZS;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 735A03029D27
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 20:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C340F3090C4;
	Tue,  2 Jun 2026 20:47:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06454388873
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 20:47:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433234; cv=none; b=OLsH5q3xlAf4g1NdC+I3nhGymUMeVNHm4sNiX8eUR8TXal3xYBZMcOdXz2NphmhOjykQvcQIawBJYQ+h9N6NtypjEgO6URR5gwFiWxP1zSveewn+QoJvbadwCEQbjhwgDhjVl6dxjuEABNRYzOvqiejNQxMWgd4yIzcqOLoDTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433234; c=relaxed/simple;
	bh=jWgwRdGKyelX5YvNFOo9Gg6B0kYxM+mT9np5o34Zpv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvkREs81MhOy5/x4JZPnZqLbjDkkRC2aMbWictQBljDHcdgsMCON9VLqijMTewPL+yrANjiSRgeWhaKxil87vORee4509erLQz6a6Iq6K0xIJ2+kYjvnxvno51nJlepD9jIMHgt4p6B63AuNRa6kkfpnTFF4JEn04k5rJfaP2K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxeAtyZS; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso3956870f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433230; x=1781038030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/0/5J6oh4mYlfgHIIKIDyXXkIXGEhFBTOovRosPBvE=;
        b=KxeAtyZSpPXNmkTzhYzt+REalWf/vacDjkSsT7tIxPUIxCY3rPvtLZyitgakViQKvB
         3PyS8pwVrd+bIuYDmAEB0tB2H6WloYOoJQenWLJlFpbWqZ5Uyg9jJxZKQtffgSKwDXha
         wpsD7XUgawLSUmdSZYuuIvDThrom/hI/gibVKHZvKHxIdfOpARP0EN1ubAm0L+G6GuJy
         mGJSr5qcqPeiI1wT/dH/Kr5poneecOvxZ+9du8EpLUN8VYAbiqkLPucGlH7VED7aI6Jm
         rd2AyXz67NXbrxir/jSPFFbAigwisw0jQJA+ihmOpvyom8yDPw5esaesRbR1MEO70DKS
         sWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433230; x=1781038030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/0/5J6oh4mYlfgHIIKIDyXXkIXGEhFBTOovRosPBvE=;
        b=TWBxwaXktf29mcbpB3gmbwl6Wq82Lsnr7AtkrfKm1uF54ReGhXT/Fc57FZtnXNbBwV
         NMb5ZAMTQ5s0FxNyrqhUeLX5JfZkIYHyyst3PGHit+rMGuN6KRk6JVdlI4KiKYoAJTiF
         tQqT8Ck0kCsxbgFqzl0CvmGU87pVI+hXnFI/gnl1s4Lz0ucHDuZwsWNGRhDV2TdqbQ6N
         4Sh93dKKbWUcqFaJhls+e/Ci6AeoMUVIT4UENOjRdhitbxlwl05y2QGKAQkD7yWyW9bN
         6YeKqOhgKo/tEZTvA074Nq0zrlLZGq4K6YWiDAdaL8f+4qpPhXXDbmKiNQPGvwW2Rp1T
         0rcA==
X-Forwarded-Encrypted: i=1; AFNElJ9BTduhg8WtLYVTKhSaHci/xTHwVYutvD5OkRPzQrdio16GZZKZkth1/ObpwMqkyYMmaUCnyYNaAEv/dcFazCRrUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25nGee2WedGI2SjRIgOSFcUnkoQGdUk9NGmHmDzUzftGW2/RA
	dXZ7gNQO5LN1laR3bvDkMu4BzcLXkwt/66MFj4ZOa0EEl+vGoRpM84/l
X-Gm-Gg: Acq92OEWgIqIlVk24YKLWiVA0AuoxD9Ld+3yQZI95u9bu/qDBP+MmxFdKKBrbWm4XmW
	Zlkw5z0ggFAZJ946S/loaPRsO5tn5E5nts7JiOu2S1JVD955jMS4bCjuAwYHM3xr1BDLe4j0Jtb
	+NNkGqOZmt99oTV0KujufRaqiSB+BZ3JCQwzW3qAb+4GhN0D7dyl7SsASBcqZZovtMg04QTBCko
	Prk9dRhso8ORc1dCIM/Qb3zV8kZlgrerlYS2mWnwXkBJgZptKb/dLIYqJKiMYRV7RkEnqrYyY8Z
	WzpEcyIc0IPkt2UXMKIX+XGz+OSfFp39BzxKDuDEwYw5jAzlJmwKQ6XQ5TP6qlgx/MnhIa3zdjF
	ADizLcY4wKY7pM+xEPLHveh1Hdf3cUNhsFdHi2e+rG7atSZvoJqUF1a339S0uaAN5QYKftvKzgx
	4QJ5CBI1UM+kFcoXxI15JGCnKFi47tMPUuX/LTz4LsXi3i7yaYj6uaa6Lqqy3dVpIv0RmY7HBY4
	cCzXNfcsbwwr5vqQorOyIYfprZK/YQ7SLkE8gOthqn2WEucpZdwKXh/JvqM+DfSi9M=
X-Received: by 2002:adf:f8ca:0:b0:45e:ea46:ce13 with SMTP id ffacd0b85a97d-460217a5a76mr103460f8f.10.1780433230415;
        Tue, 02 Jun 2026 13:47:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm1957833f8f.26.2026.06.02.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:47:09 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
Date: Tue,  2 Jun 2026 21:47:06 +0100
Message-ID: <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33460-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32FBF631DCC

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 1e94366bb7ee..ca8ecbcbddca 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1025,6 +1025,146 @@ rsci9: serial@12803000 {
 			status = "disabled";
 		};
 
+		pcie0: pcie@13400000 {
+			compatible = "renesas,r9a09g057-pcie";
+			reg = <0 0x13400000 0 0x10000>;
+			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
+				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+					  "serr_fatal", "axi_err", "inta",
+					  "intb", "intc", "intd", "msi",
+					  "link_bandwidth", "pm_pme", "dma",
+					  "pcie_evt", "msg", "all",
+					  "link_equalization_request",
+					  "turn_off_event", "pmu_poweroff",
+					  "d3_event_f0", "d3_event_f1",
+					  "cfg_pmcsr_writeclear_f0",
+					  "cfg_pmcsr_writeclear_f1";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie0 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie0 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie0 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie0 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
+			clock-names = "aclk", "pmu";
+			resets = <&cpg 0xb2>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			num-lanes = <2>;
+			renesas,sysc = <&sys 0>;
+			status = "disabled";
+
+			pcie_port0: pcie@0,0 {
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				ranges;
+				device_type = "pci";
+				vendor-id = <0x1912>;
+				device-id = <0x003b>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+			};
+		};
+
+		pcie1: pcie@13410000 {
+			compatible = "renesas,r9a09g057-pcie";
+			reg = <0 0x13410000 0 0x10000>;
+			ranges = <0x02000000 0 0x38000000 0 0x38000000 0 0x8000000>,
+				 <0x43000000 0xa 0x40000000 0xa 0x40000000 5 0xc0000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 826 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 829 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 815 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 816 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 817 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 818 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 819 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 827 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 828 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 821 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+					  "serr_fatal", "axi_err", "inta",
+					  "intb", "intc", "intd", "msi",
+					  "link_bandwidth", "pm_pme", "dma",
+					  "pcie_evt", "msg", "all",
+					  "link_equalization_request",
+					  "turn_off_event", "pmu_poweroff",
+					  "d3_event_f0", "d3_event_f1",
+					  "cfg_pmcsr_writeclear_f0",
+					  "cfg_pmcsr_writeclear_f1";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie1 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie1 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie1 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie1 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
+			clock-names = "aclk", "pmu";
+			resets = <&cpg 0xb2>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			num-lanes = <2>;
+			renesas,sysc = <&sys 1>;
+			status = "disabled";
+
+			pcie_port1: pcie@0,0 {
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				ranges;
+				device_type = "pci";
+				vendor-id = <0x1912>;
+				device-id = <0x003b>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+			};
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.54.0


