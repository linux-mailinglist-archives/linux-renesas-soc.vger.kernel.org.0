Return-Path: <linux-renesas-soc+bounces-12253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF36A169D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 10:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB72D3A27A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 09:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF97C1AF0B0;
	Mon, 20 Jan 2025 09:47:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA81419AD8D;
	Mon, 20 Jan 2025 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366460; cv=none; b=atVhd2UvRdBFgSOhbQz83xYW64octgDfnAv4edpmzFmgCi4t7S2onHZ66jykRT6T5MediZexBjXSJSIMjZGWuRnGzDIZlkImsQs3ru+c9w/eWjkAj0YVZck5b13ZkQHROIFe/pIIoqcdOzfENZ3jNZXzW+JhAk+Nsiw4EeT4yIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366460; c=relaxed/simple;
	bh=IV5ICDGKkAoYaD7v5+kW3KGWbT2/6Cdc5FqBMtO2CVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TaEkecJPbyxzUUf/WSBAJp6kZlHIlP+c6ADhCfTFlhxvud3lIIcNwMXc54k6UQwNOeBLHLTQH31KaGje5pLDZuYwtoonhHWUKNNFyJPgm124eTN4rAcDUEKz3msQGzzdmmhRIMJeR0uE/Gfy5vq8whYuDGX02iKn+LHYpCAs7ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZvwP2pJ9Seal7hP1PK1mwg==
X-CSE-MsgGUID: yeMZNJSgQHClPYB4JkeGgw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jan 2025 18:47:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D54B14016D71;
	Mon, 20 Jan 2025 18:47:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/11] Add Support for RZ/G3E ICU
Date: Mon, 20 Jan 2025 09:46:56 +0000
Message-ID: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ICU block on the RZ/G3E SoC is almost identical to the one found on
the RZ/V2H SoC, with the following differences:
 - The TINT register offset is 0x830 compared to ox30 on RZ/V2H.
 - The number of supported GPIO interrupts for TINT selection is 141
   instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 15 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Add support for the RZ/G3E ICU driver.

Biju Das (11):
  dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/G3E
    SoC
  clk: renesas: r9a09g047: Add ICU clock/reset
  irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
  irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
  irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
  irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add tssr_k variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add tssel_mask and tssel_shift variables to
    struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add tien variable to struct rzv2h_hw_info
  irqchip/renesas-rzv2h: Add RZ/G3E support
  arm64: dts: renesas: r9a09g047: Add icu node

 .../renesas,rzv2h-icu.yaml                    |   6 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 108 ++++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |   3 +
 drivers/irqchip/irq-renesas-rzv2h.c           | 159 +++++++++++++-----
 4 files changed, 229 insertions(+), 47 deletions(-)

-- 
2.43.0


