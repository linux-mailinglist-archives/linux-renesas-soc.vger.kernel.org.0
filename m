Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174A877F8B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 16:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351819AbjHQOWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 10:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351836AbjHQOWV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 10:22:21 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A2C902D76;
        Thu, 17 Aug 2023 07:22:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,180,1684767600"; 
   d="scan'208";a="173192468"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Aug 2023 23:22:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4F52D4270482;
        Thu, 17 Aug 2023 23:22:15 +0900 (JST)
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
Subject: [PATCH v3 0/4] Fix Versa3 clock mapping
Date:   Thu, 17 Aug 2023 15:22:07 +0100
Message-Id: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
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

Also added a fix for 64 by 64 division.

v2->v3:
 * Dropped dts patch and added fix for 64 byte division to this patch
   series.
 * Added Rb tag from Geert for patch#3
 * Added a patch to make vc3_clk_mux enum values depend on vc3_clk enum
   values.
v1->v2:
 * Updated binding commit description to make it clear it fixes
   "assigned-clock-rates" in the example based on 5P35023 datasheet.

Biju Das (4):
  dt-bindings: clock: versaclock3: Document clock-output-names
  clk: vc3: Fix 64 by 64 division
  clk: vc3: Fix output clock mapping
  clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values

 .../bindings/clock/renesas,5p35023.yaml       | 14 +++-
 drivers/clk/clk-versaclock3.c                 | 79 +++++++++----------
 2 files changed, 49 insertions(+), 44 deletions(-)

-- 
2.25.1

