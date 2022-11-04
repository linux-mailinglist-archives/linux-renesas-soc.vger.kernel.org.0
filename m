Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF30E6194C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 11:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbiKDKuL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 06:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKDKuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 06:50:07 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3786D2B277
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 03:50:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
        by michel.telenet-ops.be with bizsmtp
        id gAq32800U2kjr6L06Aq3Nz; Fri, 04 Nov 2022 11:50:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGx-002mVK-8Y; Fri, 04 Nov 2022 11:50:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGw-00HWEu-O7; Fri, 04 Nov 2022 11:50:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM SoC updates for v6.2
Date:   Fri,  4 Nov 2022 11:49:55 +0100
Message-Id: <cover.1667558746.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667558738.git.geert+renesas@glider.be>
References: <cover.1667558738.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.2-tag1

for you to fetch changes up to d84ea59e20158ca7a1b6c1dfc3c0e2e652eb4b00:

  arm64: renesas: Drop selecting GPIOLIB and PINCTRL (2022-10-28 14:31:24 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.2

  - Drop selecting GPIOLIB and PINCTRL, which are already automatically
    selected as part of the SOC_RENESAS config option in
    drivers/soc/renesas/Kconfig.

----------------------------------------------------------------
Lad Prabhakar (3):
      soc: renesas: Kconfig: Explicitly select GPIOLIB and PINCTRL config under SOC_RENESAS
      ARM: shmobile: Drop selecting GPIOLIB and PINCTRL
      arm64: renesas: Drop selecting GPIOLIB and PINCTRL

 arch/arm/mach-shmobile/Kconfig | 2 --
 arch/arm64/Kconfig.platforms   | 2 --
 drivers/soc/renesas/Kconfig    | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)
