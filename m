Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE072743F1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jun 2023 17:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbjF3Por (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jun 2023 11:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjF3Poq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2023 11:44:46 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CAD1BEC;
        Fri, 30 Jun 2023 08:44:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,171,1684767600"; 
   d="scan'208";a="169865389"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Jul 2023 00:44:44 +0900
Received: from localhost.localdomain (unknown [10.226.93.15])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 98768400AFB5;
        Sat,  1 Jul 2023 00:44:41 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hien Huynh <hien.huynh.px@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH RESEND 0/2] RZ/G2L DMA fix/improvements
Date:   Fri, 30 Jun 2023 16:44:36 +0100
Message-Id: <20230630154438.584066-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to fix/improve RZ/DMAC driver.

The improvement patch is related to fix cleanup order in probe/remove().
and fixes patch is related to wrong SDS/DDS settings, when we change/update
the DMA bus width several times.

Biju Das (1):
  dmaengine: sh: rz-dmac: Improve cleanup oerder in probe()/remove()

Hien Huynh (1):
  dma: rz-dmac: Fix Destination and Source Data Size setting

 drivers/dma/sh/rz-dmac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.25.1

