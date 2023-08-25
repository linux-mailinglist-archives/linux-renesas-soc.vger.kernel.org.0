Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEDB788FFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 22:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjHYUyH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 16:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjHYUxy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 16:53:54 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05EE01FF0;
        Fri, 25 Aug 2023 13:53:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,201,1688396400"; 
   d="scan'208";a="177704967"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2023 05:53:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 386534001976;
        Sat, 26 Aug 2023 05:53:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] Enhancements for tmp51x driver
Date:   Fri, 25 Aug 2023 21:53:42 +0100
Message-Id: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
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
 * patch#1 Adds max_channels variable to struct tmp51x_data for HW
           differences and fixes the invalid channel number in
           tmp51x_is_visible().
 * patch#2 Drops enum tmp51x_ids and variable id from struct tmp51x_data
	   as all HW differences can be handled by
 * Patch#3 Simplify tmp51x_read_properties()

This patch series is only compile tested.

v2->v3:
 * Dropped patch#1 and patch#2 as it is accepted
 * Split patch#3 into 3.
 * Avoided Yoda style logic in tmp51x_is_visible().
 * Replaced OF/ID data from tmp51x_ids->max_channels
 * Updated the macro TMP51X_TEMP_CONFIG_DEFAULT by adding bit definitions
   for Configuration register 2.
 * Dropped unused macros TMP51{2,3}_TEMP_CONFIG_DEFAULT.

v1->v2:
 * Created 2 new patches. Patch#1 for fixing channel number in
   tmp51x_is_visible() and patch#3 avoids using enum chip id for HW
   differences and improves the code by avoiding checks.

Biju Das (3):
  hwmon: tmp513: Add max_channels variable to struct tmp51x_data
  hwmon: tmp513: Drop enum tmp51x_ids and variable id from struct
    tmp51x_data
  hwmon: tmp513: Simplify tmp51x_read_properties()

 drivers/hwmon/tmp513.c | 59 ++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

-- 
2.25.1

