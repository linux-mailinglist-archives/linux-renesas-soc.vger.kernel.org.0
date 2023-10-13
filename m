Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117B67C8583
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjJMMTp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjJMMTo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:19:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7FDE3A9;
        Fri, 13 Oct 2023 05:19:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,222,1694703600"; 
   d="scan'208";a="182975500"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Oct 2023 21:19:41 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B792C400264B;
        Fri, 13 Oct 2023 21:19:41 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v2 0/2] rswitch: Add PM ops
Date:   Fri, 13 Oct 2023 21:19:34 +0900
Message-Id: <20231013121936.364678-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch is based on the latest net-next.git / next branch.
After applied this patch with the following patches, the system can
enter/exit Suspend to Idle without any error:
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=next&id=aa4c0bbf820ddb9dd8105a403aa12df57b9e5129
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=next&id=1a5361189b7acac15b9b086b2300a11b7aa84c06

Changes from v1:
https://lore.kernel.org/all/20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on the latest net-next.git / main branch. So, the following patches
   are already merged.
   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=510b18cf23b9bd8a982ef7f1fb19f3968a2bf787
   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=053f13f67be6d02781730c9ac71abde6e9140610
 - Add a new patch to use unsigned int for array index in the patch 1/2.
 - Use unsigned int for array index in the patch 2/2.
 - Use DEFINE_SIMPLE_DEV_PM_OPS() and drop __maybe_unused tags in the patch 2/2.
 - Use pm_sleep_ptr() in the patch 2/2.

Yoshihiro Shimoda (2):
  rswitch: Use unsigned int for array index
  rswitch: Add PM ops

 drivers/net/ethernet/renesas/rswitch.c | 51 ++++++++++++++++++++++++--
 drivers/net/ethernet/renesas/rswitch.h |  2 +-
 2 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.25.1

