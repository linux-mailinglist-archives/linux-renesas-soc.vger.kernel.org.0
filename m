Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4374141F24F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 18:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhJAQo5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 12:44:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34837 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232094AbhJAQo4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 12:44:56 -0400
X-IronPort-AV: E=Sophos;i="5.85,339,1624287600"; 
   d="scan'208";a="95676880"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Oct 2021 01:43:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.36])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CA1A54001DD6;
        Sat,  2 Oct 2021 01:43:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Adam Ford <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/8] Fillup stubs for Gigabit Ethernet driver support
Date:   Fri,  1 Oct 2021 17:42:57 +0100
Message-Id: <20211001164305.8999-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DMAC and EMAC blocks of Gigabit Ethernet IP found on RZ/G2L SoC are
similar to the R-Car Ethernet AVB IP.

The Gigabit Ethernet IP consists of Ethernet controller (E-MAC), Internal
TCP/IP Offload Engine (TOE)  and Dedicated Direct memory access controller
(DMAC).

With a few changes in the driver we can support both IPs.

This patch series is for adding Gigabit ethernet driver support to RZ/G2L SoC.

The number of patches after incorporatng RFC review comments is 18.
So split the patches into 2 patchsets (10 + 8).

This series is the second patchset, aims to fillup all the stubs for the
Gigabit Ethernet driver.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20211001150636.7500-1-biju.das.jz@bp.renesas.com/T/#t

RFC->V1:
 * used rx_max_buf_size instead of rx_2k_buffers feature bit.
 * renamed "rgeth" to "gbeth".
 * renamed ravb_rx_ring_free to ravb_rx_ring_free_rcar
 * renamed ravb_rx_ring_format to ravb_rx_ring_format_rcar
 * renamed ravb_alloc_rx_desc to ravb_alloc_rx_desc_rcar
 * renamed ravb_rcar_rx to ravb_rx_rcar
 * Added Sergey's Rb tag for patch #6.
 * Moved CSR0 initialization to patch #8.

Biju Das (8):
  ravb: Add rx_max_buf_size to struct ravb_hw_info
  ravb: Fillup ravb_rx_ring_free_gbeth() stub
  ravb: Fillup ravb_rx_ring_format_gbeth() stub
  ravb: Fillup ravb_alloc_rx_desc_gbeth() stub
  ravb: Fillup ravb_rx_gbeth() stub
  ravb: Add carrier_counters to struct ravb_hw_info
  ravb: Add support to retrieve stats for GbEthernet
  ravb: Fillup ravb_set_features_gbeth() stub

 drivers/net/ethernet/renesas/ravb.h      |  47 ++++
 drivers/net/ethernet/renesas/ravb_main.c | 327 +++++++++++++++++++++--
 2 files changed, 352 insertions(+), 22 deletions(-)

-- 
2.17.1

