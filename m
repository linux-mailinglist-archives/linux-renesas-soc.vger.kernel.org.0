Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3776E1D1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Apr 2023 09:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjDNH10 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Apr 2023 03:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNH1Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Apr 2023 03:27:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ABCE03591
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Apr 2023 00:27:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,195,1677510000"; 
   d="scan'208";a="155967154"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Apr 2023 16:27:23 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A9A3541AF0CF;
        Fri, 14 Apr 2023 16:27:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779f0: Add PCIe support
Date:   Fri, 14 Apr 2023 16:27:15 +0900
Message-Id: <20230414072717.2931212-1-yoshihiro.shimoda.uh@renesas.com>
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

Add PCIe support for R-Car S4-8 (r8a779f0). The dt-bindings doc
patches are under review now:
https://patchwork.kernel.org/project/linux-pci/list/?series=739719

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  19 ++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 104 ++++++++++++++++++
 2 files changed, 123 insertions(+)

-- 
2.25.1

