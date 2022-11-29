Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E8263C616
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Nov 2022 18:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbiK2RFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Nov 2022 12:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbiK2RFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2022 12:05:04 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30CF6D4AB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2022 09:03:10 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id qH372800A4C55Sk01H37mw; Tue, 29 Nov 2022 18:03:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p040g-0023VE-Mm; Tue, 29 Nov 2022 18:03:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p040g-003MOm-4Q; Tue, 29 Nov 2022 18:03:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Tam Nguyen <tam.nguyen.xa@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain
Date:   Tue, 29 Nov 2022 18:03:04 +0100
Message-Id: <14bd8a8de16ced703ff824f6a241e89d1ead6b07.1669740926.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669740926.git.geert+renesas@glider.be>
References: <cover.1669740926.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tam Nguyen <tam.nguyen.xa@renesas.com>

Add the power domain structure for the A3DUL domain (PAP-Subsystem), as
described in the R-Car V4H Series Hardware User's Manual Rev. 0.51 and
later.

Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
[geert: Manual reference]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a779g0-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/r8a779g0-sysc.c b/drivers/soc/renesas/r8a779g0-sysc.c
index a452709f066d9993..b932eba1b8042d8f 100644
--- a/drivers/soc/renesas/r8a779g0-sysc.c
+++ b/drivers/soc/renesas/r8a779g0-sysc.c
@@ -37,6 +37,7 @@ static struct rcar_gen4_sysc_area r8a779g0_areas[] __initdata = {
 	{ "a3vip0",	R8A779G0_PD_A3VIP0, R8A779G0_PD_ALWAYS_ON },
 	{ "a3vip1",	R8A779G0_PD_A3VIP1, R8A779G0_PD_ALWAYS_ON },
 	{ "a3vip2",	R8A779G0_PD_A3VIP2, R8A779G0_PD_ALWAYS_ON },
+	{ "a3dul",	R8A779G0_PD_A3DUL, R8A779G0_PD_ALWAYS_ON },
 	{ "a3isp0",	R8A779G0_PD_A3ISP0, R8A779G0_PD_ALWAYS_ON },
 	{ "a3isp1",	R8A779G0_PD_A3ISP1, R8A779G0_PD_ALWAYS_ON },
 	{ "a3ir",	R8A779G0_PD_A3IR, R8A779G0_PD_ALWAYS_ON },
-- 
2.25.1

