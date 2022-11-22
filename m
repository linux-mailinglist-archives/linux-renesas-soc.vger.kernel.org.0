Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C5363495F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 22:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbiKVVfi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 16:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235075AbiKVVfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 16:35:36 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 636A7C497F;
        Tue, 22 Nov 2022 13:35:35 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,185,1665414000"; 
   d="scan'208";a="140910985"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Nov 2022 06:35:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.123])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 511C540D24DA;
        Wed, 23 Nov 2022 06:35:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/7] Enable DSI and ADV7535 on RZ/G2{L, LC} and RZ/V2L platforms.
Date:   Tue, 22 Nov 2022 21:35:22 +0000
Message-Id: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to Enable DSI and ADV7535 on SMARC EVK based on
RZ/G2{L, LC} and RZ/V2L platforms.

This patches tested with [1] and [2] with some rebase related trivial changes.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=673696
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=663483

Biju Das (7):
  arm64: dts: renesas: r9a07g044: Add fcpvd node
  arm64: dts: renesas: r9a07g044: Add vspd node
  arm64: dts: renesas: r9a07g044: Add DSI node
  arm64: dts: renesas: r9a07g054: Add DSI node
  arm64: dts: renesas: r9a07g054: Add fcpvd node
  arm64: dts: renesas: r9a07g054: Add vspd node
  arm64: dts: renesas: rzg2l-smarc: Enable DSI and link with ADV7535

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 53 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi   | 54 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 30 +++++++++++
 3 files changed, 137 insertions(+)

-- 
2.25.1

