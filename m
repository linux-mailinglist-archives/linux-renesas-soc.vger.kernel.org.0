Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33F81583EB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jul 2022 14:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237079AbiG1MXZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jul 2022 08:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236295AbiG1MXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 08:23:24 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 12A6B6BD50;
        Thu, 28 Jul 2022 05:23:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,198,1654527600"; 
   d="scan'208";a="129460820"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2022 21:23:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.50])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1ACB64011408;
        Thu, 28 Jul 2022 21:23:14 +0900 (JST)
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
Subject: [PATCH 0/3] Add RSPI DMA support to RZ/G2{L, LC, UL} and RZ/V2L
Date:   Thu, 28 Jul 2022 13:23:09 +0100
Message-Id: <20220728122312.189766-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add dmac phandles to RSPI nodes on SoC dtsi to
support DMA operation on RZ/G2{L, LC, UL} and RZ/V2L SoC's

This patch series depend upon [1] and [2]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220728&id=b620aa3a7be346f04ae7789b165937615c6ee8d3
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220728&id=7d3a3aaaa9cc8ec53e9ef4f3e1711827107f76c5

Biju Das (3):
  arm64: dts: renesas: r9a07g043: Add DMA support to RSPI
  arm64: dts: renesas: r9a07g044: Add DMA support to RSPI
  arm64: dts: renesas: r9a07g054: Add DMA support to RSPI

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 6 ++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 6 ++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 6 ++++++
 3 files changed, 18 insertions(+)

-- 
2.25.1

