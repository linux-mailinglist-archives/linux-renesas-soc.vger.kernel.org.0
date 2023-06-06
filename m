Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5C0723C4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 10:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237382AbjFFI4Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 04:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237358AbjFFI4J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 04:56:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE2EF18E;
        Tue,  6 Jun 2023 01:56:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,219,1681138800"; 
   d="scan'208";a="162391984"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Jun 2023 17:56:04 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 00CB441A061A;
        Tue,  6 Jun 2023 17:56:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v2 0/2] net: renesas: rswitch: Improve perfromance of TX/RX
Date:   Tue,  6 Jun 2023 17:55:56 +0900
Message-Id: <20230606085558.1708766-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on net-next.git / main branch [1]. This patch
series can improve perfromance of TX in a specific condition. The previous code
used "global rate limiter" feature so that this is possible to cause
performance down if we use multiple ports at the same time. To resolve this
issue, use "hardware pause" features of GWCA and COMA. Note that this is not
related to the ethernet PAUSE frames.

< UDP TX by iperf3 >
 before: about 450Mbps on both tsn0 and tsn1
 after:  about 950Mbps on both tsn0 and tsn1

Also, this patch series can improve performance of RX by using
napi_gro_receive().

< TCP RX by iperf >
 before: about 670Mbps on tsn0
 after:  about 840Mbps on tsn0

[1]
The commit ddb8701dcb67 ("Merge branch 'splice-net-handle-msg_splice_pages-in-af_kcm'")

Changes from v1:
https://lore.kernel.org/all/20230529080840.1156458-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on the latest net-next.git / main branch.
 - Use "hardware pause" feature instead of "per-queue limiter" feature.
 - Drop refactaring for "per-queue limiter".
 - Drop dt-bindings update because "hardware pause" doesn't need additional
   clock information.
 - Use napi_gro_receive() to improve RX performance.

Yoshihiro Shimoda (2):
  net: renesas: rswitch: Use napi_gro_receive() in RX
  net: renesas: rswitch: Use hardware pause features

 drivers/net/ethernet/renesas/rswitch.c | 38 ++++++++++----------------
 drivers/net/ethernet/renesas/rswitch.h |  6 ++++
 2 files changed, 21 insertions(+), 23 deletions(-)

-- 
2.25.1

