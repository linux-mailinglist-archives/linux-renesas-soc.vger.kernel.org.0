Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F8B59A681
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Aug 2022 21:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350366AbiHSTkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Aug 2022 15:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349506AbiHSTj7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2022 15:39:59 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2445A21E04;
        Fri, 19 Aug 2022 12:39:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,248,1654527600"; 
   d="scan'208";a="129965168"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Aug 2022 04:39:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8136D400D4C0;
        Sat, 20 Aug 2022 04:39:55 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 0/3] Add i2c to Renesas RZ/V2M SoC and board
Date:   Fri, 19 Aug 2022 20:39:41 +0100
Message-Id: <20220819193944.337599-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support fpr the i2c clocks and resets, add the i2c nodes to the 
RZ/V2M SoC and enable them for the EVK board.

Phil Edworthy (3):
  clk: renesas: r9a09g011: Add IIC clock and reset entries
  arm64: dts: renesas: r9a09g011: Add i2c nodes
  arm64: dts: renesas: rzv2m evk: Enable i2c

 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    | 27 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi    | 28 +++++++++++++++++++
 drivers/clk/renesas/r9a09g011-cpg.c           |  4 +++
 3 files changed, 59 insertions(+)

-- 
2.34.1

