Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EFC79C2B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 04:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237509AbjILCZq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 22:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237586AbjILCZg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 22:25:36 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E5BBC64058;
        Mon, 11 Sep 2023 18:49:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,244,1688396400"; 
   d="scan'208";a="179473811"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Sep 2023 10:49:44 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 396BA41065C0;
        Tue, 12 Sep 2023 10:49:44 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net 0/2] net: renesas: rswitch: Fix a lot of redundant irq issue
Date:   Tue, 12 Sep 2023 10:49:34 +0900
Message-Id: <20230912014936.3175430-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After this patch series was applied, a lot of redundant interrupts
no longer occur.

For example: when "iperf3 -c <ipaddr> -R" on R-Car S4-8 Spider
 Before the patches are applied: about 800,000 times happened
 After the patches were applied: about 100,000 times happened

Yoshihiro Shimoda (2):
  net: renesas: rswitch: Fix unmasking irq condition
  net: renesas: rswitch: Add spin lock protection for irq {un}mask

 drivers/net/ethernet/renesas/rswitch.c | 20 ++++++++++++++++----
 drivers/net/ethernet/renesas/rswitch.h |  2 ++
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.25.1

