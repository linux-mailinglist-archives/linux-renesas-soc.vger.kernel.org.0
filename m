Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2A23CC83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 15:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388606AbfFKNHD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 09:07:03 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:41807 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387657AbfFKNHD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 09:07:03 -0400
X-IronPort-AV: E=Sophos;i="5.60,579,1549897200"; 
   d="scan'208";a="18387396"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2019 22:07:01 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AC62640031EC;
        Tue, 11 Jun 2019 22:06:57 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-kernel@vger.kernel.org, xu_shunji@hoperun.com
Subject: [PATCH 0/6] Add USB2.0/CMT/TMU support to HiHope RZ/G2M
Date:   Tue, 11 Jun 2019 14:06:35 +0100
Message-Id: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds USB2.0/CMT/TMU support to the HiHope RZ/G2M.

Thanks,
Fab

Fabrizio Castro (6):
  arm64: dts: renesas: r8a774a1: Fix USB 2.0 clocks
  arm64: dts: renesas: hihope-common: Add USB 2.0 support
  arm64: dts: renesas: r8a774a1: Add CMT device nodes
  clk: renesas: r8a774a1: Add TMU clock
  dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
  arm64: dts: renesas: r8a774a1: Add TMU device nodes

 .../devicetree/bindings/timer/renesas,tmu.txt      |   1 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |  76 +++++++++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 151 +++++++++++++++++++--
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            |   5 +
 4 files changed, 225 insertions(+), 8 deletions(-)

-- 
2.7.4

