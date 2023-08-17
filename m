Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32E377F2C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 11:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349298AbjHQJIk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 05:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349303AbjHQJIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 05:08:19 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61DF91AE;
        Thu, 17 Aug 2023 02:08:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,179,1684767600"; 
   d="scan'208";a="173175563"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Aug 2023 18:08:16 +0900
Received: from localhost.localdomain (unknown [10.226.93.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E675D41B65BA;
        Thu, 17 Aug 2023 18:08:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] Fix Versa3 clock mapping
Date:   Thu, 17 Aug 2023 10:08:07 +0100
Message-Id: <20230817090810.203900-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Table 3. ("Output Source") in the 5P35023 datasheet,
the output clock mapping should be 0=REF, 1=SE1, 2=SE2, 3=SE3,
4=DIFF1, 5=DIFF2. But the code uses inverse.

This patch series aims to document clock-output-names in bindings and
fix the mapping in driver.

v1->v2:
 * Updated binding commit description to make it clear it fixes
   "assigned-clock-rates" in the example based on 5P35023 datasheet.

Biju Das (3):
  dt-bindings: clock: versaclock3: Document clock-output-names
  clk: vc3: Fix output clock mapping
  arm64: dts: renesas: rz-smarc-common: Use versa3 clk for audio mclk

 .../bindings/clock/renesas,5p35023.yaml       | 14 ++--
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 14 ++--
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 23 +++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 23 +++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 27 ++++++++
 drivers/clk/clk-versaclock3.c                 | 68 +++++++++----------
 6 files changed, 124 insertions(+), 45 deletions(-)

-- 
2.25.1

