Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F82787987
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 22:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238213AbjHXUpJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 16:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243579AbjHXUpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 16:45:06 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4E8DC1707;
        Thu, 24 Aug 2023 13:45:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,195,1688396400"; 
   d="scan'208";a="173867889"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2023 05:45:02 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A2A414005B25;
        Fri, 25 Aug 2023 05:44:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Enhancements for tmp51x driver
Date:   Thu, 24 Aug 2023 21:44:53 +0100
Message-Id: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add enhancements for tmp51x driver.
 * patch#1 fixes channel number in tmp51x_is_visible().
 * patch#2 simplifies probe()
 * Patch#3 avoids using enum chip id for HW differences and improves
   the code by avoiding checks.

This patch series is only compile tested.

v1->v2:
 * Created 2 new patches. Patch#1 for fixing channel number in
   tmp51x_is_visible() and patch#3 avoids using enum chip id for HW
   differences and improves the code by avoiding checks.

Biju Das (3):
  hwmon: tmp513: Fix the channel number in tmp51x_is_visible()
  hwmon: tmp513: Simplify probe()
  hwmon: tmp513: Replace tmp51x_ids->max_channels in struct tmp51x_data

 drivers/hwmon/tmp513.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

-- 
2.25.1

