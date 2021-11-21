Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4C74585BF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Nov 2021 19:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238307AbhKUSFJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Nov 2021 13:05:09 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:27463 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230454AbhKUSFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 13:05:09 -0500
X-IronPort-AV: E=Sophos;i="5.87,252,1631545200"; 
   d="scan'208";a="100965886"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2021 03:02:02 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3DFC54006DE3;
        Mon, 22 Nov 2021 03:02:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] memory: renesas-rpc-if: Silence clang warning
Date:   Sun, 21 Nov 2021 18:01:55 +0000
Message-Id: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch silences the following clang warning:

| drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
| type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
|                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: b04cc0d912eb8 ("memory: renesas-rpc-if: Add support for RZ/G2L")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 8c51145c0f5c..0202c1dbc5c4 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -250,7 +250,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 		return PTR_ERR(rpc->dirmap);
 	rpc->size = resource_size(res);
 
-	rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
+	rpc->type = (enum rpcif_type)(uintptr_t)of_device_get_match_data(dev);
 	rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 
 	return PTR_ERR_OR_ZERO(rpc->rstc);
-- 
2.17.1

