Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56438901C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 14:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfHPMjY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 08:39:24 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:50282 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbfHPMjY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 08:39:24 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id pofM2000105gfCL06ofMFK; Fri, 16 Aug 2019 14:39:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hybVo-0005GN-Ve; Fri, 16 Aug 2019 14:39:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hybVo-0003wz-Ts; Fri, 16 Aug 2019 14:39:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: rcar-sysc: Eliminate local variable gov
Date:   Fri, 16 Aug 2019 14:39:19 +0200
Message-Id: <20190816123919.15140-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 980532a5dda319ee ("soc: renesas: rcar-sysc: Use
GENPD_FLAG_ALWAYS_ON"), the local variable "gov" is assigned just once,
so it can be eliminated.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.4.

 drivers/soc/renesas/rcar-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 20fa9f34295c2879..40c1ddaa3b4fcae5 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -212,7 +212,6 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 {
 	struct generic_pm_domain *genpd = &pd->genpd;
 	const char *name = pd->genpd.name;
-	struct dev_power_governor *gov = &simple_qos_governor;
 	int error;
 
 	if (pd->flags & PD_CPU) {
@@ -266,7 +265,7 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 	rcar_sysc_power(&pd->ch, true);
 
 finalize:
-	error = pm_genpd_init(genpd, gov, false);
+	error = pm_genpd_init(genpd, &simple_qos_governor, false);
 	if (error)
 		pr_err("Failed to init PM domain %s: %d\n", name, error);
 
-- 
2.17.1

