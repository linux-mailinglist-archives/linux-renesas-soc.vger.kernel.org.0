Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035D57925D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Sep 2023 18:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbjIEQEW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Sep 2023 12:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244627AbjIEBYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Sep 2023 21:24:15 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DF3AECC5
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Sep 2023 18:24:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,227,1688396400"; 
   d="scan'208";a="175006397"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2023 10:24:09 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6724D400BBEE;
        Tue,  5 Sep 2023 10:24:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 0/2] arm64: dts: renesas: r8a779f0: Add PCIe support
Date:   Tue,  5 Sep 2023 10:24:02 +0900
Message-Id: <20230905012404.2915246-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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

Changes from v3:
https://lore.kernel.org/all/20230901132730.2861451-1-yoshihiro.shimoda.uh@renesas.com/
 - Fix reg and ranges properties of pcie host nodes in the patch 1/2.
 - Add Reviewed-by in the patch 2/2.

Changes from v2:
https://lore.kernel.org/all/20230828041434.2747699-1-yoshihiro.shimoda.uh@renesas.com/
 - Rebased on the revised dt-bindings doc.
 - Fix node names.
 - Fix reg property.
 - Fix some properties position to match dt-bindings doc, and host and endpoint.
 - Fix a node position to preserve alphabetical sor order.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  24 ++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 134 ++++++++++++++++++
 2 files changed, 158 insertions(+)

-- 
2.25.1

