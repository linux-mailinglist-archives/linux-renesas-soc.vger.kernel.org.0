Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B071A781F54
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 20:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjHTSre (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbjHTSre (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 14:47:34 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B3673A9C;
        Sun, 20 Aug 2023 11:44:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,188,1684767600"; 
   d="scan'208";a="173403357"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Aug 2023 03:44:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.18])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 702B8406BE25;
        Mon, 21 Aug 2023 03:44:19 +0900 (JST)
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
Subject: [PATCH 4/4] usb: typec: tcpci_rt1711h: Add enable_pd30_extended_message feature bit to struct rt1711h_chip_info
Date:   Sun, 20 Aug 2023 19:44:02 +0100
Message-Id: <20230820184402.102486-5-biju.das.jz@bp.renesas.com>
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

The RT1715 has PD30 extended message compared to RT1711H. Add a feature bit
enable_pd30_extended_message to struct rt1711h_chip_info to enable this
feature only for RT1715.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 1b1753895ca5..e79cbb344c14 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -54,6 +54,7 @@
 struct rt1711h_chip_info {
 	u16 did;
 	u32 rxdz_sel;
+	unsigned enable_pd30_extended_message:1;
 };
 
 struct rt1711h_chip {
@@ -110,7 +111,7 @@ static int rt1711h_init(struct tcpci *tcpci, struct tcpci_data *tdata)
 		return ret;
 
 	/* Enable PD30 extended message for RT1715 */
-	if (chip->info->did == RT1715_DID) {
+	if (chip->info->enable_pd30_extended_message) {
 		ret = regmap_update_bits(regmap, RT1711H_RTCTRL8,
 					 RT1711H_ENEXTMSG, RT1711H_ENEXTMSG);
 		if (ret < 0)
@@ -401,6 +402,7 @@ static const struct rt1711h_chip_info rt1711h = {
 static const struct rt1711h_chip_info rt1715 = {
 	.did = RT1715_DID,
 	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
+	.enable_pd30_extended_message = 1,
 };
 
 static const struct i2c_device_id rt1711h_id[] = {
-- 
2.25.1

