Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5A85637C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 18:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbiGAQXb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 12:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiGAQXa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 12:23:30 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F57312ABC;
        Fri,  1 Jul 2022 09:23:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,237,1650898800"; 
   d="scan'208";a="124796060"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2022 01:23:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.73])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0592E409F593;
        Sat,  2 Jul 2022 01:23:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/2] Add CAN support
Date:   Fri,  1 Jul 2022 17:23:18 +0100
Message-Id: <20220701162320.102165-1-biju.das.jz@bp.renesas.com>
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

Biju Das (2):
  ARM: dts: r9a06g032: Add CAN nodes
  ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}

 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts | 26 +++++++++++++++++++++
 arch/arm/boot/dts/r9a06g032.dtsi            | 18 ++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.25.1

