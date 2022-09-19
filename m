Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 661835BCB64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 14:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbiISMEK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 08:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiISMEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 08:04:09 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AF526AE6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 05:04:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:ed67:3be8:ebe5:696d])
        by andre.telenet-ops.be with bizsmtp
        id Mo432800Z0GZoLL01o43sy; Mon, 19 Sep 2022 14:04:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oaFVL-005cI7-8O; Mon, 19 Sep 2022 14:04:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oaFVK-00GClw-QJ; Mon, 19 Sep 2022 14:04:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas ARM SoC updates for v6.1
Date:   Mon, 19 Sep 2022 14:03:55 +0200
Message-Id: <cover.1663588781.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663588772.git.geert+renesas@glider.be>
References: <cover.1663588772.git.geert+renesas@glider.be>
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

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.1-tag1

for you to fetch changes up to c2ce1e734282662c0b3117e4f26b831d30370bcb:

  ARM: shmobile: Drop selecting SOC_BUS (2022-09-18 14:51:10 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.1

  - Drop superfluous selects of SOC_BUS.

----------------------------------------------------------------
Lad Prabhakar (2):
      arm64: renesas: Drop selecting SOC_BUS
      ARM: shmobile: Drop selecting SOC_BUS

 arch/arm/mach-shmobile/Kconfig | 1 -
 arch/arm64/Kconfig.platforms   | 1 -
 2 files changed, 2 deletions(-)
