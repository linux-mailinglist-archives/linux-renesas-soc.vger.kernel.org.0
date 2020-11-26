Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0662C5C79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 20:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405177AbgKZTLz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 14:11:55 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:38352 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405176AbgKZTLz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 14:11:55 -0500
X-IronPort-AV: E=Sophos;i="5.78,372,1599490800"; 
   d="scan'208";a="63792991"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Nov 2020 04:11:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E90B140F8AE0;
        Fri, 27 Nov 2020 04:11:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
Date:   Thu, 26 Nov 2020 19:11:41 +0000
Message-Id: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series fixes trivial issues in RPC-IF driver.

Changes for v2:
* Balanced PM in rpcif_disable_rpm
* Fixed typo in patch 4/5
* Dropped C++ style fixes patch
* Included RB tags from Sergei

Cheers,
Prabhakar

Lad Prabhakar (5):
  memory: renesas-rpc-if: Return correct value to the caller of
    rpcif_manual_xfer()
  memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in
    rpcif_{enable,disable}_rpm
  memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
  memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
    inline
  memory: renesas-rpc-if: Export symbols as GPL

 drivers/memory/renesas-rpc-if.c | 28 +++++++++-------------------
 include/memory/renesas-rpc-if.h | 13 +++++++++++--
 2 files changed, 20 insertions(+), 21 deletions(-)

-- 
2.25.1

