Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 522145A689F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 18:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiH3Qpg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 12:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiH3Qpa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 12:45:30 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE53A647CA;
        Tue, 30 Aug 2022 09:45:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,275,1654527600"; 
   d="scan'208";a="131111134"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2022 01:45:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 132D24036C7F;
        Wed, 31 Aug 2022 01:45:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 0/3] Add RZ/N1 CAN support
Date:   Tue, 30 Aug 2022 17:45:15 +0100
Message-Id: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series supports CAN{0,1} populated on RZ/N1D-DB board.

v2->v3:
 * Documented power-domains support.
 * Dropped clock-names property from CAN nodes.
 * Added power-domains property to the CAN nodes.
v1->v2:
 * Added RZ/N1 specific compatible string.
 * Added clock-names property.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20220819084532.ywtziogd7ycuozxx@pengutronix.de/

Biju Das (3):
  dt-bindings: can: nxp,sja1000: Document RZ/N1 power-domains support
  ARM: dts: r9a06g032: Add CAN{0,1} nodes
  ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}

 .../bindings/net/can/nxp,sja1000.yaml         |  5 ++++
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts   | 26 +++++++++++++++++++
 arch/arm/boot/dts/r9a06g032.dtsi              | 20 ++++++++++++++
 3 files changed, 51 insertions(+)

-- 
2.25.1

