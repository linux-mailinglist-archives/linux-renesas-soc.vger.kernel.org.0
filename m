Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3E8563361
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 14:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbiGAMSb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 08:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237218AbiGAMSZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 08:18:25 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1C4912D29
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Jul 2022 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ajsQZ
        9OBK9jkwtgRmEH2GiLzDbwezfQlqaiX2vBbTSM=; b=CptgcZ/jctSn/muArlozv
        iqOxBHPyKKZ0l3pVUesTb0rhD2BXex9zzsq48/Gvh0RSWvMezmIGsQji3RErpy5w
        yFKPCuetv+Yq8a2y43+CX+TUidtj4nnB9ltzHrzNOJR402Ld9EWJ9pP0CXvCry4S
        sd8xBhazX4raYE4NnHrRZ4=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp1 (Coremail) with SMTP id C8mowABXNd785b5i0M4bFw--.43113S2;
        Fri, 01 Jul 2022 20:18:05 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com,
        linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] arm: shmobile: Increase refcount for new reference
Date:   Fri,  1 Jul 2022 20:18:04 +0800
Message-Id: <20220701121804.234223-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowABXNd785b5i0M4bFw--.43113S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWkWw4kCw1rCw43Zr4UCFg_yoW8Wr4Dpr
        W5Ca97Cry8Ary8CrW0vw4xurWYqFWkJ3ya9rySkry5WFy5Za40qr15Wry5AF15WrW8u34F
        vw1rtF18X3Wqg3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zixpnJUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2h4xF1uwMUtj-gAAsu
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In rcar_gen2_regulator_quirk(), for_each_matching_node_and_match()
will automatically increase and decrease the refcount. However, we
should call of_node_get() for the new refernece created in 'quirk->np'.
Besides, we also should call of_node_put() before the 'quirk' being
freed.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index abea41f7782e..117e7b07995b 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -125,6 +125,7 @@ static int regulator_quirk_notify(struct notifier_block *nb,
 
 	list_for_each_entry_safe(pos, tmp, &quirk_list, list) {
 		list_del(&pos->list);
+		of_node_put(pos->np);
 		kfree(pos);
 	}
 
@@ -174,11 +175,12 @@ static int __init rcar_gen2_regulator_quirk(void)
 		memcpy(&quirk->i2c_msg, id->data, sizeof(quirk->i2c_msg));
 
 		quirk->id = id;
-		quirk->np = np;
+		quirk->np = of_node_get(np);
 		quirk->i2c_msg.addr = addr;
 
 		ret = of_irq_parse_one(np, 0, argsa);
 		if (ret) {	/* Skip invalid entry and continue */
+			of_node_put(np);
 			kfree(quirk);
 			continue;
 		}
@@ -225,6 +227,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 err_mem:
 	list_for_each_entry_safe(pos, tmp, &quirk_list, list) {
 		list_del(&pos->list);
+		of_node_put(pos->np);
 		kfree(pos);
 	}
 
-- 
2.25.1

