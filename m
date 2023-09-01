Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8272E78FE45
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Sep 2023 15:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbjIAN1i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Sep 2023 09:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349738AbjIAN1i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Sep 2023 09:27:38 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F058CC5
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Sep 2023 06:27:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,219,1688396400"; 
   d="scan'208";a="178442523"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2023 22:27:33 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 94B0540121DF;
        Fri,  1 Sep 2023 22:27:33 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] arm64: dts: renesas: r8a779f0: Add PCIe support
Date:   Fri,  1 Sep 2023 22:27:28 +0900
Message-Id: <20230901132730.2861451-1-yoshihiro.shimoda.uh@renesas.com>
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

Add PCIe support for R-Car S4-8 (r8a779f0).
This patch series is based on the following pci.git repo:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/rcar
and the following revised patches about the dt-bindings docs:
https://lore.kernel.org/linux-pci/20230901131711.2861283-1-yoshihiro.shimoda.uh@renesas.com/

Changes from v2:
https://lore.kernel.org/all/20230828041434.2747699-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on the revised dt-bindings doc.
 - Fix node names.
 - Fix reg property.
 - Fix some properties position to match dt-bindings doc, and host and endpoint.
 - Fix a node position to preserve alphabetical sor order.

Changes from v1:
https://lore.kernel.org/all/20230414072717.2931212-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on the latest renesas-devel tag (renesas-devel-2023-08-21-v6.5-rc7).
 - Fix the nodes for the latest dt-bindings docs.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  24 ++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 132 ++++++++++++++++++
 2 files changed, 156 insertions(+)

-- 
2.25.1

