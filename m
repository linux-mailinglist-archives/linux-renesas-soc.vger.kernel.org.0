Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798C931B7D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 12:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhBOLRN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 06:17:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhBOLRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 06:17:11 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E38C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 03:16:25 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed60:c5d6:9422:c618:ee58])
        by xavier.telenet-ops.be with bizsmtp
        id VPGN2400E2PLE0701PGNlr; Mon, 15 Feb 2021 12:16:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lBbrZ-00755Z-RM; Mon, 15 Feb 2021 12:16:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lBbrZ-00A0Sz-8i; Mon, 15 Feb 2021 12:16:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] driver core: Fix double failed probing with fw_devlink=on
Date:   Mon, 15 Feb 2021 12:16:19 +0100
Message-Id: <20210215111619.2385030-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With fw_devlink=permissive, devices are added to the deferred probe
pending list if their driver's .probe() method returns -EPROBE_DEFER.

With fw_devlink=on, devices are added to the deferred probe pending list
if they are determined to be a consumer, which happens before their
driver's .probe() method is called.  If the actual probe fails later
(real failure, not -EPROBE_DEFER), the device will still be on the
deferred probe pending list, and it will be probed again when deferred
probing kicks in, which is futile.

Fix this by explicitly removing the device from the deferred probe
pending list in case of probe failures.

Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen on various Renesas R-Car platforms, cfr.
https://lore.kernel.org/linux-acpi/CAMuHMdVL-1RKJ5u-HDVA4F4w_+8yGvQQuJQBcZMsdV4yXzzfcw@mail.gmail.com
---
 drivers/base/dd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9179825ff646f4e3..91c4181093c43709 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -639,11 +639,13 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 	case -ENXIO:
 		pr_debug("%s: probe of %s rejects match %d\n",
 			 drv->name, dev_name(dev), ret);
+		driver_deferred_probe_del(dev);
 		break;
 	default:
 		/* driver matched but the probe failed */
 		pr_warn("%s: probe of %s failed with error %d\n",
 			drv->name, dev_name(dev), ret);
+		driver_deferred_probe_del(dev);
 	}
 	/*
 	 * Ignore errors returned by ->probe so that the next driver can try
-- 
2.25.1

