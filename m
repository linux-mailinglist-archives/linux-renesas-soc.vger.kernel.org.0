Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE1E51D4B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 11:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390777AbiEFJhJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 05:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390731AbiEFJg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 05:36:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7836A011
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 02:32:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
        by laurent.telenet-ops.be with bizsmtp
        id TMYM270061UVucw01MYMdR; Fri, 06 May 2022 11:32:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJw-0038XF-JW; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJv-00Aeka-Te; Fri, 06 May 2022 11:32:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas DT binding updates for v5.19 (take two)
Date:   Fri,  6 May 2022 11:32:16 +0200
Message-Id: <cover.1651828616.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651828600.git.geert+renesas@glider.be>
References: <cover.1651828600.git.geert+renesas@glider.be>
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

The following changes since commit 05d39fc06cee5b11b195d0d5fec55d01da2781cb:

  dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK (2022-04-13 12:19:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.19-tag2

for you to fetch changes up to 033a26dcbe10476c5203f590dce0537fac802d03:

  dt-bindings: soc: renesas: Move renesas,rzg2l-sysc from arm to soc (2022-05-05 11:59:47 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.19 (take two)

  - Document support for the R-Car V4H SoC and the White Hawk
    development board stack,
  - Document support for the RZ/V2M SoC and the RZ/V2M Evaluation Kit
    Board,
  - Document SPI Multi I/O Bus Controller (RPC-IF) support for RZ/G2UL,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC

Geert Uytterhoeven (1):
      dt-bindings: soc: renesas: Move renesas,rzg2l-sysc from arm to soc

Phil Edworthy (1):
      dt-bindings: arm: renesas: Document Renesas RZ/V2M SoC and EVK board

Yoshihiro Shimoda (3):
      dt-bindings: arm: renesas: Document R-Car V4H White Hawk DT bindings
      dt-bindings: reset: renesas,rst: Document r8a779g0 reset module
      dt-bindings: power: renesas,rcar-sysc: Document r8a779g0 SYSC bindings

 Documentation/devicetree/bindings/arm/renesas.yaml     | 18 ++++++++++++++++++
 .../bindings/memory-controllers/renesas,rpc-if.yaml    |  1 +
 .../devicetree/bindings/power/renesas,rcar-sysc.yaml   |  1 +
 .../devicetree/bindings/reset/renesas,rst.yaml         |  1 +
 .../{power => soc/renesas}/renesas,rzg2l-sysc.yaml     |  2 +-
 5 files changed, 22 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{power => soc/renesas}/renesas,rzg2l-sysc.yaml (96%)
