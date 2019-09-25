Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9778EBE6D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2019 23:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393524AbfIYVEX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Sep 2019 17:04:23 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33307 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393194AbfIYVEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Sep 2019 17:04:04 -0400
Received: by mail-io1-f67.google.com with SMTP id z19so714875ior.0;
        Wed, 25 Sep 2019 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GskCKR0jyoPsR1qZhphzrVQ/g2FzbQKpnf7tZfcT51I=;
        b=uG5RAiSuJrTiTvehczL9JXUYpZbYKGY3Uf1ThnU/ETAxdyc/N+GPVGpLuiucQoNVHL
         EUKbdWcFyk6dnfSzr0NCBz8LRkRadra1Ly1tx05rfBj46vXybCwKU/nOSomTX0wsDZOH
         Q6RZnJVvCTFGhCYN63QM7tzSUKFrqne+HbkazfJal7TbHK1CVmGNNGCdB1h4Bin/xC4c
         JvEt5Q488Qz6YesqY+L4F5NqAd/bRR6pjM4tFaZWQj2dFR/KYkZHNuK4q5/+8mFy2xtT
         Y7HbE1NEze6ehJmX3H0gBoGn8n8st9Sc6+nizr2usgPJMijn+4k2uR0KrZ+kHBvJBYSE
         ySEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GskCKR0jyoPsR1qZhphzrVQ/g2FzbQKpnf7tZfcT51I=;
        b=HQYvuRcZbyz3W8LcNi8W4f3xml69Jg76i10fTpxq2hYoKA5LbYoU/fHaT8QlTLlhxD
         zOCHtPL4+mGkfni3H10GarDE2Z4qXX8TP6ydXhurLSmCXjF2lc7aYSPFrqST4WGFruvG
         KeKGUkxH5imTRyenhe5mwH0HplN4hy2uVik3oEBsn2VdHDCCerZPISnzjUw36o7laDUj
         Ud1T4dAZqmlyO3RJAy4zYwHLy8DRwZMJRFKIKY2JuIvCaGZ1wYpFaUgAsdmiGooCCrOk
         Q8OEKrV8e4IjKdlT7JB61mme1AUSmma5ZwgRxL/56mQkTK5A7Wiv0EJtA0JSgXRfRcYu
         zOow==
X-Gm-Message-State: APjAAAV9nW0naN5clq1LJ9nyfK6mg/ZJ7qZw4WOpr0GCtam+QM4Bqw8o
        Wj1EmBtxLaAoO8KA0x4uRns=
X-Google-Smtp-Source: APXvYqy3vUuSJpelIpaF6LgUfckTdS4d1hpomZh/Hs6MA0cJ1+CC6fLhpsvgMrjv96PcZRthAHKpUg==
X-Received: by 2002:a02:cc6e:: with SMTP id j14mr280431jaq.130.1569445443802;
        Wed, 25 Sep 2019 14:04:03 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id a14sm531516ioo.85.2019.09.25.14.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 14:04:02 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: renesas: rcar-sysc: fix memory leak in rcar_sysc_pd_init
Date:   Wed, 25 Sep 2019 16:03:53 -0500
Message-Id: <20190925210354.8845-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In rcar_sysc_pd_init when looping over info->areas errors may happen but
the error handling path does not clean up the intermediate allocated
memories.

This patch changes the error handling path in major and a little the loop
 itself. Inside the loop if an error happens the current pd will be
released and then it goes to error handling path where it releases any
 previously allocated domains.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/soc/renesas/rcar-sysc.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 59b5e6b10272..f9613c1ee0a0 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -330,10 +330,10 @@ static int __init rcar_sysc_pd_init(void)
 {
 	const struct rcar_sysc_info *info;
 	const struct of_device_id *match;
-	struct rcar_pm_domains *domains;
+	struct rcar_pm_domains *domains = NULL;
 	struct device_node *np;
 	void __iomem *base;
-	unsigned int i;
+	unsigned int i, num_areas = 0;
 	int error;
 
 	np = of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
@@ -382,6 +382,7 @@ static int __init rcar_sysc_pd_init(void)
 		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
 		if (!pd) {
 			error = -ENOMEM;
+			num_areas = i;
 			goto out_put;
 		}
 
@@ -393,8 +394,11 @@ static int __init rcar_sysc_pd_init(void)
 		pd->flags = area->flags;
 
 		error = rcar_sysc_pd_setup(pd);
-		if (error)
+		if (error) {
+			kfree(pd);
+			num_areas = i;
 			goto out_put;
+		}
 
 		domains->domains[area->isr_bit] = &pd->genpd;
 
@@ -406,13 +410,30 @@ static int __init rcar_sysc_pd_init(void)
 		if (error) {
 			pr_warn("Failed to add PM subdomain %s to parent %u\n",
 				area->name, area->parent);
+			kfree(pd);
+			num_areas = i;
 			goto out_put;
 		}
 	}
 
 	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
+	of_node_put(np);
+
+	return error;
 
 out_put:
+	if (domains) {
+		for (i = 0; i < num_areas; i++) {
+			const struct rcar_sysc_area *area = &info->areas[i];
+
+			if (!area->name) {
+				/* Skip NULLified area */
+				continue;
+			}
+			kfree(domains->domains[area->isr_bit]);
+		}
+		kfree(domains);
+	}
 	of_node_put(np);
 	return error;
 }
-- 
2.17.1

