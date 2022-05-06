Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F19851D4B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 11:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390619AbiEFJhL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 05:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390729AbiEFJg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 05:36:57 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0EE69CDD
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 02:32:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
        by michel.telenet-ops.be with bizsmtp
        id TMYM270031UVucw06MYMkL; Fri, 06 May 2022 11:32:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJw-0038XE-Is; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJv-00AekT-Ss; Fri, 06 May 2022 11:32:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas driver updates for v5.19 (take two)
Date:   Fri,  6 May 2022 11:32:15 +0200
Message-Id: <cover.1651828613.git.geert+renesas@glider.be>
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

The following changes since commit 2f89bef90de4740be33b2cb4ba95e0107df0d25e:

  soc: renesas: Identify RZ/G2UL SoC (2022-04-04 11:01:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.19-tag2

for you to fetch changes up to 27e7657a7cdc4b4a73bd5e4448e9ed733bae05c0:

  soc: renesas: R-Car V3U is R-Car Gen4 (2022-05-05 12:31:22 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.19 (take two)

  - Initial support for the R-Car V4H and RZ/V2M SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      Merge tag 'renesas-r8a779g0-dt-binding-defs-tag' into renesas-drivers-for-v5.19
      soc: renesas: R-Car V3U is R-Car Gen4

Herve Codina (1):
      soc: renesas: rzn1: Select PM and PM_GENERIC_DOMAINS configs

Phil Edworthy (1):
      soc: renesas: Add RZ/V2M (R9A09G011) config option

Yoshihiro Shimoda (5):
      dt-bindings: power: Add r8a779g0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
      soc: renesas: r8a779g0-sysc: Add r8a779g0 support
      soc: renesas: Identify R-Car V4H
      soc: renesas: rcar-rst: Add support for R-Car V4H

 drivers/soc/renesas/Kconfig                   | 20 ++++++
 drivers/soc/renesas/Makefile                  |  1 +
 drivers/soc/renesas/r8a779g0-sysc.c           | 62 ++++++++++++++++++
 drivers/soc/renesas/rcar-gen4-sysc.c          |  3 +
 drivers/soc/renesas/rcar-gen4-sysc.h          |  1 +
 drivers/soc/renesas/rcar-rst.c                |  1 +
 drivers/soc/renesas/renesas-soc.c             | 10 ++-
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h | 90 +++++++++++++++++++++++++++
 include/dt-bindings/power/r8a779g0-sysc.h     | 45 ++++++++++++++
 9 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/renesas/r8a779g0-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h
