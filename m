Return-Path: <linux-renesas-soc+bounces-16300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B54A9A575
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 10:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C45741889744
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 08:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D711E9B00;
	Thu, 24 Apr 2025 08:14:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDD58BE8;
	Thu, 24 Apr 2025 08:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482450; cv=none; b=IX8HOcNmat+5h9pi4/TvaovxIx79+jpvb3eIn1VWCuCZRDlHs/z23NSW8zuyCDs+zkNImEDoFsqz/lph3Th70S3lQup1PJj3j/6yB7mPaMNjJDfkAjt884HiHpKFjcCsUt22884RfmtK1jNoqH7LgVTHKTibbXl7baKfkBuHOH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482450; c=relaxed/simple;
	bh=nIHxy6cCI+02ocj9vn9rQPJ47jhPgoePTIzzxXqYwGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ktOHO3T92Gp48eGFjcowIQhisY+g/jLZL5iMUkL4DFI11/RnTLdhREu/MM94c6b5wxEgzADs2k6wnc0sWeGh0j/uGjZCwmHO5dUj3JfbgKZGd+8xm4tCPONdMoopbY5sJhk/4+q36XBgkWtLu6G86SV/bPOpOIIPMWBuSg5LsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: VLtS5dltQje9bzAm/az+Lg==
X-CSE-MsgGUID: NGDXuZkTRMi5QhlFxjCIgg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2025 17:14:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 45D0841BEF9D;
	Thu, 24 Apr 2025 17:14:02 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Add RZ/G3E XSPI clocks
Date: Thu, 24 Apr 2025 09:13:53 +0100
Message-ID: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G3E XSPI has 4 clocks{ahb, axi, spi, spix2). spi and spix2 clks
share the same CPG_ON bit, but they have different monitor bit.
Modelled clk_spi as a fixed divider clock with parent clk_spix2 and
factor two.

v2->v3:
 * Added definitions for XSPI core clock and Gigabit Ethernet PTP
   reference core clocks in the R9A09G047 CPG DT bindings header file.
 * Updated LAST_DT_CORE_CLK entry.
 * Moved "spi_clk_spi" definitions from patch#2 to #3.
v1->v2:
 * Modelled clk_spi as a fixed divider clock with parent clk_spix2 and
   factor two and dropped coupled clk.
 * Updated commit description for the cover letter
 * Dropped static divider patch as it is updated as [1]
 * Updated LAST_DT_CORE_CLK macro
 * Replaced DEF_SDIV->DEF_CSDIV macro
 * Added spi_clk_spi as core clk
 * Updated CSDIV0_DIVCTL3 macro.
 * spi_clk_spix2 is handled as module clock with RPM.
 * Dropped CDDIV0_DIVCTL1 as it is already merged in clk tree.

Biju Das (3):
  dt-bindings: clock: renesas,r9a09g047-cpg: Add XSPI and GBETH PTP core
    clocks
  clk: renesas: r9a09g047: Add support for xspi mux and divider
  clk: renesas: r9a09g047: Add XSPI clock/reset

 drivers/clk/renesas/r9a09g047-cpg.c           | 39 ++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  7 ++++
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h |  3 ++
 3 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.43.0


