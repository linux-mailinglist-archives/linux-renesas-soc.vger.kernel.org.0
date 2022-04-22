Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3BD650BAD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 16:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449035AbiDVO6C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 10:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444129AbiDVO55 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 10:57:57 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154EB38B5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 07:54:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by andre.telenet-ops.be with bizsmtp
        id Mquw2701Y2Ah9RF01quwAr; Fri, 22 Apr 2022 16:54:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugS-001cQ8-9I; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugR-00COlB-Nq; Fri, 22 Apr 2022 16:54:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.19
Date:   Fri, 22 Apr 2022 16:54:50 +0200
Message-Id: <cover.1650638503.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.19-tag1

for you to fetch changes up to dcc1449554ba8e49880507c7b761559022363bdd:

  ARM: shmobile: defconfig: Refresh for v5.18-rc1 (2022-04-19 10:36:23 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.19

  - Enable support for the Renesas RZ/V2L SoC and the Maxim MAX96712
    Quad GMSL2 Deserializer in the arm64 defconfig,
  - Refresh shmobile_defconfig for v5.18-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: defconfig: Enable Maxim MAX96712 Quad GMSL2 Deserializer support
      ARM: shmobile: defconfig: Refresh for v5.18-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable ARCH_R9A07G054

 arch/arm/configs/shmobile_defconfig | 4 ++--
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)
