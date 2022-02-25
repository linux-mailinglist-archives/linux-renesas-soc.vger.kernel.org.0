Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76564C4231
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 11:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238547AbiBYKZO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 05:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238176AbiBYKZN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 05:25:13 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B791DDFEE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 02:24:40 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7d31:13ed:51c6:c7cc])
        by albert.telenet-ops.be with bizsmtp
        id zNQf260070mlTBr06NQfil; Fri, 25 Feb 2022 11:24:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNXmB-0020l8-3F; Fri, 25 Feb 2022 11:24:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nNXmA-00DHXv-5a; Fri, 25 Feb 2022 11:24:38 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas driver updates for v5.18 (take two)
Date:   Fri, 25 Feb 2022 11:24:34 +0100
Message-Id: <cover.1645784470.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645784465.git.geert+renesas@glider.be>
References: <cover.1645784465.git.geert+renesas@glider.be>
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

The following changes since commit cb5508e47e60b85ac033edd8c52245ad51360eb4:

  soc: renesas: Add support for reading product revision for RZ/G2L family (2022-02-08 09:43:06 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.18-tag2

for you to fetch changes up to 088659ad2a830124407edc38da278010c95bcc96:

  soc: renesas: Kconfig: Introduce ARCH_RZG2L config option (2022-02-24 13:53:25 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.18 (take two)

  - RZ/G2L and RZ/V2L need PM and PM_GENERIC_DOMAINS,
  - Introduce ARCH_RZG2L family for RZ/G2L, RZ/G2LC, RZ/G2UL and RZ/V2L
    SoCs.

----------------------------------------------------------------
Lad Prabhakar (2):
      soc: renesas: Kconfig: Explicitly select PM and PM_GENERIC_DOMAINS configs
      soc: renesas: Kconfig: Introduce ARCH_RZG2L config option

 drivers/soc/renesas/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)
