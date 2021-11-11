Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1D944D659
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 13:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhKKMOl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 07:14:41 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:60055 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230358AbhKKMOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 07:14:41 -0500
X-IronPort-AV: E=Sophos;i="5.87,226,1631545200"; 
   d="scan'208";a="99922503"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 21:11:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 739BE400F783;
        Thu, 11 Nov 2021 21:11:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add OPP table for RZ/G2L SoC
Date:   Thu, 11 Nov 2021 12:11:40 +0000
Message-Id: <20211111121144.11131-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add OPP table for RZ/G2L SoC.
Supported frequencies are 1.2GHz, 600MHz, 300MHz and 150MHz.

Biju Das (4):
  clk: renesas: rzg2l: Add CPG_PL1_DDIV macro
  clk: renesas: r9a07g044: Change core clock "I" from DEF_FIXED->DEF_DIV
  arm64: dts: renesas: r9a07g044: Sort psci node
  arm64: dts: renesas: r9a07g044: Add OPP table

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 36 ++++++++++++++++++++--
 drivers/clk/renesas/r9a07g044-cpg.c        | 11 ++++++-
 drivers/clk/renesas/rzg2l-cpg.h            |  2 ++
 3 files changed, 45 insertions(+), 4 deletions(-)

-- 
2.17.1

