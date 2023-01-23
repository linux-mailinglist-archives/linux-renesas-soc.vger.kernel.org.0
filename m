Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3BEB677C2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 14:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjAWNNs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 08:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjAWNNr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 08:13:47 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C119C901C;
        Mon, 23 Jan 2023 05:13:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,239,1669042800"; 
   d="scan'208";a="150308963"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2023 22:13:46 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 26096422F21C;
        Mon, 23 Jan 2023 22:13:46 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net v2 0/2] net: ravb: Fix potential issues
Date:   Mon, 23 Jan 2023 22:13:29 +0900
Message-Id: <20230123131331.1425648-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix potentiall issues on the ravb driver.

Changes from v1:
https://lore.kernel.org/all/20230119043920.875280-1-yoshihiro.shimoda.uh@renesas.com/
 - Fix typo in the patch [1/2].
 - Add Reviewed-by in the patch [1/2].
 - Fix "Fixed" tag in the patch [2/2].
 - Fix a comment indentation of the code in the patch [2/2].

Yoshihiro Shimoda (2):
  net: ravb: Fix lack of register setting after system resumed for Gen3
  net: ravb: Fix possible hang if RIS2_QFF1 happen

 drivers/net/ethernet/renesas/ravb_main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.25.1

