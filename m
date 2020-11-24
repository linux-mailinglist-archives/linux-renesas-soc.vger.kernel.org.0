Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7132C240F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 12:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732077AbgKXL0H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 06:26:07 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:29824 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728346AbgKXL0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 06:26:07 -0500
X-IronPort-AV: E=Sophos;i="5.78,366,1599490800"; 
   d="scan'208";a="63502443"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2020 20:26:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07C814362273;
        Tue, 24 Nov 2020 20:26:03 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] memory: renesas-rpc-if: Trivial fixes
Date:   Tue, 24 Nov 2020 11:25:47 +0000
Message-Id: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series fixes trivial issues in RPC-IF driver.

Cheers,
Prabhakar

Lad Prabhakar (5):
  memory: renesas-rpc-if: Return correct value to the caller of
    rpcif_manual_xfer()
  memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
    inline
  memory: renesas-rpc-if: Export symbols as GPL
  memory: renesas-rpc-if: Avoid use of C++ style comments
  memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()

 drivers/memory/renesas-rpc-if.c | 28 +++++++++-------------------
 include/memory/renesas-rpc-if.h | 19 ++++++++++++++-----
 2 files changed, 23 insertions(+), 24 deletions(-)

-- 
2.17.1

