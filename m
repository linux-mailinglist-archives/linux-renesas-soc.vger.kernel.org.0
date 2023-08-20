Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56B19781F4F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 20:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbjHTSrd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 14:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjHTSrc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 14:47:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DAC24359D;
        Sun, 20 Aug 2023 11:44:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,188,1684767600"; 
   d="scan'208";a="177101046"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Aug 2023 03:44:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E6B00406BF96;
        Mon, 21 Aug 2023 03:44:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] onvert enum->pointer for data in the rt1711h match tables
Date:   Sun, 20 Aug 2023 19:43:58 +0100
Message-Id: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
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

Convert enum->pointer for data in the match tables, so that
device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
bus type match support added to it. see [1]

This patch series extend support for retrieving match data for ID lookup.
The first patch fixes the driver_data for ID table and second patch
convert enum->pointer to avoid non zero values as the proposed
solution returns NULL for non-match. The third and fourth patches
replaces comparison of did against hardware differences with data
and feature bit.

This patch series is only compile tested.

[1] https://lore.kernel.org/all/20230804161728.394920-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  usb: typec: tcpci_rt1711h: Make similar OF and ID table
  usb: typec: tcpci_rt1711h: Convert enum->pointer for data in the match
    tables
  usb: typec: tcpci_rt1711h: Add rxdz_sel variable to struct
    rt1711h_chip_info
  usb: typec: tcpci_rt1711h: Add enable_pd30_extended_message feature
    bit to struct rt1711h_chip_info

 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 38 ++++++++++++++++++--------
 1 file changed, 26 insertions(+), 12 deletions(-)

-- 
2.25.1

