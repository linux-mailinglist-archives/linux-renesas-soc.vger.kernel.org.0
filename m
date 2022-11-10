Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A2462430A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 14:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiKJNQl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 08:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiKJNQk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 08:16:40 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B545331DCC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 05:16:37 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,153,1665414000"; 
   d="scan'208";a="142179803"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Nov 2022 22:16:36 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E08554310C0A;
        Thu, 10 Nov 2022 22:16:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 0/3] arm64: dts: renesas: r8a779f0: Add/Enable Ethernet Switch and SERDES nodes
Date:   Thu, 10 Nov 2022 22:16:27 +0900
Message-Id: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add/enable Ethernet Switch and SERDES for R-Car S4-8 (r8a779f0).

Notes that we need to modify Marvell 10G PHY driver for Spider board. I have
local patches to use the Marvell 10G driver on the Spider board. But, it needs
to update for upstraming.

JFYI, if we don't modify the Marvell 10G PHY driver, the ethernet device cannot
work correctly with the following error messages:

[    2.137800] phy phy-e6444000.phy.0: phy init failed --> -110
[    2.148809] renesas_eth_sw: probe of e6880000.ethernet failed with error -110

Changes from v4:
https://lore.kernel.org/all/20221019083538.933127-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on renesas-devel-2022-11-08-v6.1-rc4.
 - Fix node name of eth_serdes.
 - Modify defconfig for using NFS root on the Spider board.

Changes from v3:
 https://lore.kernel.org/all/20220922051706.3442382-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on next-20221017.
 - Update some propeties which are related to the latest dt-bindings doc.

Yoshihiro Shimoda (3):
  arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
  arm64: dts: renesas: r8a779f0: spider: Enable Ethernet Switch and
    SERDES
  arm64: configs: Enable Renesas R-Car S4-8 Spider Ethernet devices

 .../dts/renesas/r8a779f0-spider-ethernet.dtsi |  77 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 109 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   4 +-
 3 files changed, 189 insertions(+), 1 deletion(-)

-- 
2.25.1

