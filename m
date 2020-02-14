Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2380015DA06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2020 15:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgBNO7D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Feb 2020 09:59:03 -0500
Received: from sauhun.de ([88.99.104.3]:59630 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729241AbgBNO7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Feb 2020 09:59:03 -0500
Received: from localhost (p5486CB48.dip0.t-ipconnect.de [84.134.203.72])
        by pokefinder.org (Postfix) with ESMTPSA id 89E792C08AB;
        Fri, 14 Feb 2020 15:59:00 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i3c@lists.infradead.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i3c: master: no need to iterate master device twice
Date:   Fri, 14 Feb 2020 15:58:53 +0100
Message-Id: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We already have the master device in a variable, reuse it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found while refactoring of_i2c_get_board_info() and checking its users.

 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f8f896fa0c3..b56207bbed2b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1953,7 +1953,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	 * DEFSLVS command.
 	 */
 	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
-		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
+		dev_err(dev, "I2C device with 10 bit address not supported.");
 		return -ENOTSUPP;
 	}
 
-- 
2.20.1

