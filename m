Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2527C4CEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Oct 2023 10:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjJKIS2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Oct 2023 04:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjJKIS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 04:18:27 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4892E9B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2023 01:18:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,214,1694703600"; 
   d="scan'208";a="182677690"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Oct 2023 17:18:24 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 85B6A400F79B;
        Wed, 11 Oct 2023 17:18:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, kishon@kernel.org
Cc:     linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] phy: renesas: r8a779f0-ether-serdes: Add Re-initialize code
Date:   Wed, 11 Oct 2023 17:18:15 +0900
Message-Id: <20231011081817.257113-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series can re-initialize this PHY after called phy_exit() and
phy_init() again. Such re-initializing the PHY will be needed for system
suspend/resume.

Yoshihiro Shimoda (2):
  phy: renesas: r8a779f0-ether-serdes: Reset in .init()
  phy: renesas: r8a779f0-ether-serdes: Add .exit() ops

 drivers/phy/renesas/r8a779f0-ether-serdes.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.25.1

