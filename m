Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264AF7C85ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjJMMj2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbjJMMj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:39:27 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E893C0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2023 05:39:25 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
        by andre.telenet-ops.be with bizsmtp
        id xQfM2A00Q56FAx301QfMUN; Fri, 13 Oct 2023 14:39:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRl-006Gga-TO;
        Fri, 13 Oct 2023 14:39:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRp-002Jnz-An;
        Fri, 13 Oct 2023 14:39:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.7 (take two)
Date:   Fri, 13 Oct 2023 14:39:13 +0200
Message-Id: <cover.1697200119.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697200117.git.geert+renesas@glider.be>
References: <cover.1697200117.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit d2efde5cc970cd21de0f94cf03e059adc1e1311b:

  ARM: shmobile: defconfig: Refresh for v6.6-rc3 (2023-09-28 11:41:02 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.7-tag2

for you to fetch changes up to 09cfdb5a97b53d117682211a4d32a39af2e819e4:

  arm64: defconfig: Enable RZ/G3S (R9A08G045) SoC (2023-10-05 14:31:10 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.7 (take two)

  - Enable support for the Renesas RZ/G3S (R9A08G045) SoC in the arm64
    defconfig.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: defconfig: Enable RZ/G3S (R9A08G045) SoC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
