Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D2D4EFF94
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 10:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242461AbiDBIPg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 04:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243942AbiDBIPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 04:15:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E5CB50073;
        Sat,  2 Apr 2022 01:13:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="116499421"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2022 17:13:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ECD3241F41F7;
        Sat,  2 Apr 2022 17:13:30 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/7] Enable Ethernet and SDHI on RZ/G2UL SMARC EVK
Date:   Sat,  2 Apr 2022 09:13:21 +0100
Message-Id: <20220402081328.26292-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to enable Ethernet and SDHI on RZ/G2UL
SMARC EVK. This patches also adds pinctrl support to SoC
dtsi and enables scif0 and audio clk pins.

This patch series depend upon [1], [2], [3]  and [4]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628396
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220401180230.19950-1-biju.das.jz@bp.renesas.com/
[3] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628401
[4] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220401175427.19078-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Added Rb tag from Geert
 * Updated gpios property for vccq_sdhi1 regulator and removed
   sdhi1 node as it is enabled in common.

Biju Das (7):
  arm64: dts: renesas: r9a07g043: Fillup the pinctrl stub node
  arm64: dts: renesas: rzg2ul-smarc: Add scif0 and audio clk pins
  arm64: dts: renesas: r9a07g043: Add SDHI nodes
  arm64: dts: renesas: r9a07g043: Add GbEthernet nodes
  arm64: dts: renesas: rzg2ul-smarc: Enable microSD on SMARC platform
  arm64: dts: renesas: rzg2ul-smarc-som: Enable eMMC on SMARC platform
  arm64: dts: renesas: rzg2ul-smarc-som: Enable Ethernet on SMARC
    platform

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |  74 +++++-
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |  16 +-
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  63 ++++++
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 210 +++++++++++++++++-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |  24 ++
 5 files changed, 368 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi

-- 
2.17.1

