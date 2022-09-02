Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53DEC5AAB89
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 11:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiIBJhS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 05:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235448AbiIBJhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 05:37:10 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30FE3C8E2
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 02:37:07 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id Exd32800r4C55Sk06xd3Wn; Fri, 02 Sep 2022 11:37:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU36l-003hap-Br; Fri, 02 Sep 2022 11:37:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU36k-007eRQ-Pk; Fri, 02 Sep 2022 11:37:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v6.1
Date:   Fri,  2 Sep 2022 11:36:52 +0200
Message-Id: <cover.1662111137.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111124.git.geert+renesas@glider.be>
References: <cover.1662111124.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.1-tag1

for you to fetch changes up to fddccbcb4de7ae734977da1a4c6d4c04a36a8f62:

  dt-bindings: arm: renesas: Document Renesas R-Car V3H2 SoC and board (2022-08-30 09:52:32 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.1

  - Document support for the R-Car H3Ne-1.7G SoC on the Salvator-XS and
    ULCB development boards,
  - Document system controller support for the RZ/Five SoC,
  - Document support for the R-Car V3H2 SoC and the Condor-I development
    board.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: arm: renesas: Document R-Car H3Ne-1.7G SoC and boards

Kuninori Morimoto (1):
      dt-bindings: arm: renesas: Document Renesas R-Car V3H2 SoC and board

Lad Prabhakar (1):
      dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/Five SoC

 Documentation/devicetree/bindings/arm/renesas.yaml       | 16 ++++++++++++++++
 .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml         |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)
