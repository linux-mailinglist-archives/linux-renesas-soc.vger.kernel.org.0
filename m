Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D947667D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 10:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbjG1Ixa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235149AbjG1Iwd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:52:33 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2F25270
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:50:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by andre.telenet-ops.be with bizsmtp
        id SYqi2A00T0d1nm801Yqiia; Fri, 28 Jul 2023 10:50:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJB7-002lS0-CH;
        Fri, 28 Jul 2023 10:50:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJBK-00Ajsa-G0;
        Fri, 28 Jul 2023 10:50:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 01/13] of: dynamic: Do not use "%pOF" while holding devtree_lock
Date:   Fri, 28 Jul 2023 10:50:27 +0200
Message-Id: <c593d8389352c574b5be69d4ca4810da13326a50.1690533838.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690533838.git.geert+renesas@glider.be>
References: <cover.1690533838.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While originally it was fine to format strings using "%pOF" while
holding devtree_lock, this now causes a deadlock.  Lockdep reports:

    of_get_parent from of_fwnode_get_parent+0x18/0x24
    ^^^^^^^^^^^^^
    of_fwnode_get_parent from fwnode_count_parents+0xc/0x28
    fwnode_count_parents from fwnode_full_name_string+0x18/0xac
    fwnode_full_name_string from device_node_string+0x1a0/0x404
    device_node_string from pointer+0x3c0/0x534
    pointer from vsnprintf+0x248/0x36c
    vsnprintf from vprintk_store+0x130/0x3b4

Fix this by making the locking cover only the parts that really need it.

Fixes: a92eb7621b9fb2c2 ("lib/vsprintf: Make use of fwnode API to obtain node names and separators")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Correct fixes tag and update description.
---
 drivers/of/dynamic.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index e311d406b1705306..eae45a1c673ee05f 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -601,13 +601,16 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 
 	__of_changeset_entry_dump(ce);
 
-	raw_spin_lock_irqsave(&devtree_lock, flags);
 	switch (ce->action) {
 	case OF_RECONFIG_ATTACH_NODE:
+		raw_spin_lock_irqsave(&devtree_lock, flags);
 		__of_attach_node(ce->np);
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
 		break;
 	case OF_RECONFIG_DETACH_NODE:
+		raw_spin_lock_irqsave(&devtree_lock, flags);
 		__of_detach_node(ce->np);
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
 		break;
 	case OF_RECONFIG_ADD_PROPERTY:
 		/* If the property is in deadprops then it must be removed */
@@ -619,7 +622,9 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 			}
 		}
 
+		raw_spin_lock_irqsave(&devtree_lock, flags);
 		ret = __of_add_property(ce->np, ce->prop);
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
 		if (ret) {
 			pr_err("changeset: add_property failed @%pOF/%s\n",
 				ce->np,
@@ -628,7 +633,9 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 		}
 		break;
 	case OF_RECONFIG_REMOVE_PROPERTY:
+		raw_spin_lock_irqsave(&devtree_lock, flags);
 		ret = __of_remove_property(ce->np, ce->prop);
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
 		if (ret) {
 			pr_err("changeset: remove_property failed @%pOF/%s\n",
 				ce->np,
@@ -647,7 +654,9 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 			}
 		}
 
+		raw_spin_lock_irqsave(&devtree_lock, flags);
 		ret = __of_update_property(ce->np, ce->prop, &old_prop);
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
 		if (ret) {
 			pr_err("changeset: update_property failed @%pOF/%s\n",
 				ce->np,
@@ -658,7 +667,6 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 	default:
 		ret = -EINVAL;
 	}
-	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	if (ret)
 		return ret;
-- 
2.34.1

