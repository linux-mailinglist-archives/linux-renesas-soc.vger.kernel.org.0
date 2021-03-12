Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B7F338E2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 14:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhCLNDG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 08:03:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhCLNCw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 08:02:52 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C8DC061762
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Mar 2021 05:02:51 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f9e2:c536:b8cc:fbbc])
        by baptiste.telenet-ops.be with bizsmtp
        id fR2o240061ACAb301R2ot2; Fri, 12 Mar 2021 14:02:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lKhRH-0077p7-QO; Fri, 12 Mar 2021 14:02:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lKhRH-00EDv3-7S; Fri, 12 Mar 2021 14:02:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] regulator: bd9571mwv: Convert device attribute to sysfs_emit()
Date:   Fri, 12 Mar 2021 14:02:42 +0100
Message-Id: <20210312130242.3390038-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312130242.3390038-1-geert+renesas@glider.be>
References: <20210312130242.3390038-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the "backup_mode" device attribute from sprintf() to
sysfs_emit(), as the latter is aware of the PAGE_SIZE buffer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/regulator/bd9571mwv-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index a4d406022587d59d..ba020a45f238e764 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -174,7 +174,7 @@ static ssize_t backup_mode_show(struct device *dev,
 {
 	struct bd9571mwv_reg *bdreg = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", bdreg->bkup_mode_enabled ? "on" : "off");
+	return sysfs_emit(buf, "%s\n", bdreg->bkup_mode_enabled ? "on" : "off");
 }
 
 static ssize_t backup_mode_store(struct device *dev,
-- 
2.25.1

