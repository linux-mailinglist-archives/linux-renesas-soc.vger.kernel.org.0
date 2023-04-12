Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96ADD6DF8EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Apr 2023 16:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjDLOvD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Apr 2023 10:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbjDLOvC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Apr 2023 10:51:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CF3195FD6;
        Wed, 12 Apr 2023 07:50:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,339,1673881200"; 
   d="scan'208";a="155739568"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Apr 2023 23:50:58 +0900
Received: from localhost.localdomain (unknown [10.226.93.18])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D8602400F959;
        Wed, 12 Apr 2023 23:50:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/5] Add RZ/G2L SCIFA DMAC/ SCI TX support
Date:   Wed, 12 Apr 2023 15:50:48 +0100
Message-Id: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add DMA support for SCIFA/ SCI TX support on
RZ/G2L alike SoCs.

v3->v4:
 * Updated commit description for patch#1,#2,#3 and #5
 * Removed fixes tag from patch#3
v2->v3:
 * Dropped inline function is_rz_scif_port() and instead using
   s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE for finding RZ SCIF port.
 * Dropped SCIx_TEI_IRQ as DMAC activation not possible with TEI interrupt.
 * Updated the code flow similar to SCIFA/SCIFB DMAC tx handling.
 * Replaced is_rz_scif_port to s->cfg->regtype check
 * Updated the code flow similar to SCIFA/SCIFB DMA rx handling.
 * Added remaining patches from Renesas SCI fixes patch series to this series.
 * Updated commit description for patch#3
 * Moved handling of clearing TE bit as separate patch#5.
v1->v2:
 * Added support for DMA tx and rx.

Biju Das (5):
  tty: serial: sh-sci: Add RZ/G2L SCIF DMA tx support
  tty: serial: sh-sci: Add RZ/G2L SCIF DMA rx support
  tty: serial: sh-sci: Fix TE setting on SCI IP
  tty: serial: sh-sci: Add support for tx end interrupt handling
  tty: serial: sh-sci: Fix end of transmission on SCI

 drivers/tty/serial/sh-sci.c | 96 +++++++++++++++++++++++++++++++------
 drivers/tty/serial/sh-sci.h |  3 ++
 2 files changed, 85 insertions(+), 14 deletions(-)

-- 
2.25.1

