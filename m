Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B58075BF30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jul 2023 09:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjGUHA1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jul 2023 03:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjGUHA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jul 2023 03:00:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7DE8270E;
        Fri, 21 Jul 2023 00:00:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,220,1684767600"; 
   d="scan'208";a="170340902"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jul 2023 16:00:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.55])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A93D44005656;
        Fri, 21 Jul 2023 16:00:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] Use i2c_get_match_data() for versa{5,7} drivers
Date:   Fri, 21 Jul 2023 08:00:17 +0100
Message-Id: <20230721070019.96627-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use i2c_get_match_data() to get match data for I2C, ACPI and
DT-based matching instead of device_get_match_data() the one for
ACPI/DT-based matching.

This patch series is only compile tested.

v1->v2:
 * Added Rb tags from Geert and Marek.
 * Removed error check as all tables have data pointers.

Biju Das (2):
  clk: vc5: Use i2c_get_match_data() instead of device_get_match_data()
  clk: vc7: Use i2c_get_match_data() instead of device_get_match_data()

 drivers/clk/clk-versaclock5.c | 2 +-
 drivers/clk/clk-versaclock7.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

