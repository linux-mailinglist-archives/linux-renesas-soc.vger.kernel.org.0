Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465DC4D9F78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 16:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349893AbiCOQAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 12:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245084AbiCOQAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 12:00:37 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EF674B43D;
        Tue, 15 Mar 2022 08:59:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,184,1643641200"; 
   d="scan'208";a="113587932"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2022 00:59:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 876DA4017C38;
        Wed, 16 Mar 2022 00:59:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/7] Enable Ethernet and SDHI on RZ/G2UL SMARC EVK
Date:   Tue, 15 Mar 2022 15:59:12 +0000
Message-Id: <20220315155919.23451-1-biju.das.jz@bp.renesas.com>
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

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20220315142644.17660-1-biju.das.jz@bp.renesas.com/T/#t

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
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |  37 +++
 5 files changed, 381 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi

-- 
2.17.1

