Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C289D6D1F22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Mar 2023 13:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjCaLe0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Mar 2023 07:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbjCaLeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2023 07:34:22 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7ACE71D905;
        Fri, 31 Mar 2023 04:33:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,307,1673881200"; 
   d="scan'208";a="157862781"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2023 20:33:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.148])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 02DEB436D614;
        Fri, 31 Mar 2023 20:33:48 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/5] Add RZ/G2L SCIFA DMAC/ SCI TX support
Date:   Fri, 31 Mar 2023 12:33:41 +0100
Message-Id: <20230331113346.170602-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.5 required=5.0 tests=AC_FROM_MANY_DOTS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add DMA support for SCIFA/ SCI TX support on
RZ/G2L alike SoCs.

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

