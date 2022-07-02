Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375795640A5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Jul 2022 16:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiGBOKe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Jul 2022 10:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiGBOKd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jul 2022 10:10:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0D8F810542;
        Sat,  2 Jul 2022 07:10:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,240,1650898800"; 
   d="scan'208";a="124846823"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2022 23:10:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B945A4005E36;
        Sat,  2 Jul 2022 23:10:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V2 0/2] Add RZ/N1 CAN support
Date:   Sat,  2 Jul 2022 15:10:24 +0100
Message-Id: <20220702141026.219450-1-biju.das.jz@bp.renesas.com>
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

v1->v2:
 * Added RZ/N1 specific compatible string.
 * Added clock-names property.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20220702140130.218409-1-biju.das.jz@bp.renesas.com/T/#t

Biju Das (2):
  ARM: dts: r9a06g032: Add CAN nodes
  ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}

 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts | 26 +++++++++++++++++++++
 arch/arm/boot/dts/r9a06g032.dtsi            | 20 ++++++++++++++++
 2 files changed, 46 insertions(+)

-- 
2.25.1

