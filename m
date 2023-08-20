Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB24781F51
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 20:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbjHTSre (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbjHTSrd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 14:47:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 59EEC35A9;
        Sun, 20 Aug 2023 11:44:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,188,1684767600"; 
   d="scan'208";a="173403352"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Aug 2023 03:44:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D412406BE25;
        Mon, 21 Aug 2023 03:44:08 +0900 (JST)
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
Subject: [PATCH 1/4] usb: typec: tcpci_rt1711h: Make similar OF and ID table
Date:   Sun, 20 Aug 2023 19:43:59 +0100
Message-Id: <20230820184402.102486-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make similar OF and ID table to extend support for ID match
using i2c_match_data()/device_get_match_data() later. Currently
it works only for OF match tables as the driver_data is wrong for
ID match.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 17ebc5fb684f..1e13ce3c4b35 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -392,8 +392,8 @@ static void rt1711h_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rt1711h_id[] = {
-	{ "rt1711h", 0 },
-	{ "rt1715", 0 },
+	{ "rt1711h", RT1711H_DID },
+	{ "rt1715", RT1715_DID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
-- 
2.25.1

