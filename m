Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B439471460E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 10:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjE2IIx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 04:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjE2IIv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 04:08:51 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 17AF9AD;
        Mon, 29 May 2023 01:08:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,200,1681138800"; 
   d="scan'208";a="164772888"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 May 2023 17:08:49 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6771D400C743;
        Mon, 29 May 2023 17:08:49 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next 0/5] net: renesas: rswitch: Improve performance of TX
Date:   Mon, 29 May 2023 17:08:35 +0900
Message-Id: <20230529080840.1156458-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on next-20230525. This patch series can improve
performance of TX in a specific condition. The previous code used
"global rate limiter" feature so that this is possible to cause performance
down if we use multiple ports at the same time. To resolve this issue,
use "per-queue rate limiter" feature instead. To use the feature, we need
to refactor the rswitch driver, especially got the internal bus clock
rate and calculate the value for the feature.

Yoshihiro Shimoda (5):
  dt-bindings: net: r8a779f0-ether-switch: Add ACLK
  net: renesas: rswitch: Rename GWCA related definitions
  net: renesas: rswitch: Alloc all 128 queues
  net: renesas: rswitch: Use AXI_TLIM_N queues if a TX queue
  net: renesas: rswitch: Use per-queue rate limiter

 .../net/renesas,r8a779f0-ether-switch.yaml    | 10 ++-
 drivers/net/ethernet/renesas/rswitch.c        | 86 ++++++++++++-------
 drivers/net/ethernet/renesas/rswitch.h        | 30 +++++--
 3 files changed, 82 insertions(+), 44 deletions(-)

-- 
2.25.1

