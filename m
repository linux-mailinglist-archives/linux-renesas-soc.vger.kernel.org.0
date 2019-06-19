Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DC34B903
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731328AbfFSMql (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:46:41 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:57686 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfFSMql (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:46:41 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id Scme200053XaVaC01cme2S; Wed, 19 Jun 2019 14:46:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZz4-00041r-05; Wed, 19 Jun 2019 14:46:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZz3-0003MO-VI; Wed, 19 Jun 2019 14:46:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: rcar-sysc: Use [] to denote a flexible array member
Date:   Wed, 19 Jun 2019 14:46:37 +0200
Message-Id: <20190619124637.12873-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Flexible array members should be denoted using [] instead of [0], else
gcc will not warn when they are no longer at the end of the structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index b28955e21a9868e0..20fa9f34295c2879 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -182,7 +182,7 @@ struct rcar_sysc_pd {
 	struct generic_pm_domain genpd;
 	struct rcar_sysc_ch ch;
 	unsigned int flags;
-	char name[0];
+	char name[];
 };
 
 static inline struct rcar_sysc_pd *to_rcar_pd(struct generic_pm_domain *d)
-- 
2.17.1

