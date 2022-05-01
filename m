Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF34516420
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 13:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346206AbiEALdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 07:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346284AbiEALc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 07:32:58 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D57026D393;
        Sun,  1 May 2022 04:29:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,189,1647270000"; 
   d="scan'208";a="119719480"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 May 2022 20:29:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 12DCC422925E;
        Sun,  1 May 2022 20:29:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] Add OPP, TSU, RSPI and SPI Multi I/O Bus controller node
Date:   Sun,  1 May 2022 12:29:20 +0100
Message-Id: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add support for OPP, TSU, RSPI and 
SPI Multi I/O Bus controller on RZ/G2UL SoC.

This patch series depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637371

Biju Das (6):
  arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus controller node
  arm64: dts: renesas: r9a07g043: Add RSPI{0,1,2} nodes
  arm64: dts: renesas: r9a07g043: Add OPP table
  arm64: dts: renesas: r9a07g043: Add TSU node
  arm64: dts: renesas: r9a07g043: Create thermal zone to support IPA
  arm64: dts: renesas: r9a07g043: Add ADC node

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 144 ++++++++++++++++++++-
 1 file changed, 141 insertions(+), 3 deletions(-)

-- 
2.25.1

