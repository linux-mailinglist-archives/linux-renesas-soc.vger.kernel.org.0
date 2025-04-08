Return-Path: <linux-renesas-soc+bounces-15552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4CAA80235
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 13:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79B23B42CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 11:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91897263C8A;
	Tue,  8 Apr 2025 11:39:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A74E35973;
	Tue,  8 Apr 2025 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112345; cv=none; b=XXhyf82LMpvh3KNNndrzydBlIdaOm049oMQz57zLJcU4F+YTz1EFuUk0xnEnZIwnB4QjS9LsiDGuxm84rbZBvJv7jib9b342rF7b2hlxdUVuGtvE82z37pc/HkGYRyNLt6nnmy8ThMVsaLhYUb7ibuYS8SiVoRiB2wgalrH8mV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112345; c=relaxed/simple;
	bh=Jj18nPD7BFLtoruPAhXOy95hhbmGp7eznJSnrQ11SrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YhE5TTywU02JkzJJFsuJ/VY9fOndxAXq44IJ+jPOCflRM7hMS5G1e7rttVp2Q7RJ5GPyR7//LQOFQNjWE/CH3dZ/IQqf+vD5jioeehBhN8/7QckZcbpAMidMoV4KbHzr3PQC4MgT9FLH7Vv2evw6Y7fZYS6eUKJ0bOuylrB+390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: VbtH/XNEQtuQKun5qYpnMA==
X-CSE-MsgGUID: YvM1ZaulStWlb2UVExQtyg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Apr 2025 20:38:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD03140138ED;
	Tue,  8 Apr 2025 20:38:52 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: biju.das.au@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 0/2] Add RZ/G3E XSPI clocks
Date: Tue,  8 Apr 2025 12:38:43 +0100
Message-ID: <20250408113845.130950-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E XSPI has 4 clocks{ahb, axi, spi, spix2). spi and xpix share the
same CPG_ON bit, but they have different monitor bit. Modelled clk_spi
as a fixed divider clock with parent clk_spix2 and factor two.

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
 
Note:
 This patch series depend upon 
[1] https://lore.kernel.org/all/20250407165202.197570-4-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20250401143537.224047-2-biju.das.jz@bp.renesas.com/

Biju Das (2):
  clk: renesas: r9a09g047: Add support for xspi mux and divider
  clk: renesas: r9a09g047: Add XSPI clock/reset

 drivers/clk/renesas/r9a09g047-cpg.c | 39 ++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  3 +++
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.43.0


