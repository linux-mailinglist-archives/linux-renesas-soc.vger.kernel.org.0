Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CCD50BAD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 16:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449014AbiDVO6B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 10:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448575AbiDVO55 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 10:57:57 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C7F5FFE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 07:54:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by baptiste.telenet-ops.be with bizsmtp
        id Mquw2700f2Ah9RF01quxTE; Fri, 22 Apr 2022 16:54:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugS-001cQB-HJ; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugR-00COlW-Qu; Fri, 22 Apr 2022 16:54:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.19
Date:   Fri, 22 Apr 2022 16:54:53 +0200
Message-Id: <cover.1650638516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650638502.git.geert+renesas@glider.be>
References: <cover.1650638502.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.19-tag1

for you to fetch changes up to 05d39fc06cee5b11b195d0d5fec55d01da2781cb:

  dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK (2022-04-13 12:19:31 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.19

  - Document support for the new RZ/G2UL SoC and the RZ/G2UL SMARC EVK
    development board.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: power: renesas,rzg2l-sysc: Document RZ/G2UL SoC
      dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK

 Documentation/devicetree/bindings/arm/renesas.yaml              | 2 ++
 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
