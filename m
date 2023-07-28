Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946847667C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 10:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbjG1Ix1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235181AbjG1Iwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:52:37 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF465269
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:50:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by michel.telenet-ops.be with bizsmtp
        id SYqi2A00H0d1nm806YqiDK; Fri, 28 Jul 2023 10:50:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJB7-002lRz-CF;
        Fri, 28 Jul 2023 10:50:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJBK-00AjsW-Eu;
        Fri, 28 Jul 2023 10:50:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/13] of: overlay/unittest: Miscellaneous fixes and improvements
Date:   Fri, 28 Jul 2023 10:50:26 +0200
Message-Id: <cover.1690533838.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series contains miscellaneous fixes and improvements for
dynamic DT overlays and the related unit tests.

The first two patches are fixes for a lock-up and a crash.
The remaining patches are smaller fixes, enhancements and cleanups for
the overlay tests, including one new test.

I ran into the crash when accidentally loading the wrong overlay (using
the out-of-tree DT overlay configfs[1]), and removing it afterwards.
As this case was not yet covered by the unittests, I added a test.
I enhanced the tests to clean up partial state after a failed
overlay apply attempt, which triggered the lock-up.

Changes compared to v1[2]:
  - Correct fixes tag and update description.
  - Merge differently, as requested by Rob.

Thanks for your comments!

[1] https://elinux.org/R-Car/DT-Overlays
[2] https://lore.kernel.org/r/cover.1689776064.git.geert+renesas@glider.be

Geert Uytterhoeven (13):
  of: dynamic: Do not use "%pOF" while holding devtree_lock
  of: overlay: Call of_changeset_init() early
  of: unittest: Fix overlay type in apply/revert check
  of: unittest: Restore indentation in overlay_bad_add_dup_prop test
  of: unittest: Improve messages and comments in apply/revert checks
  of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
  of: unittest: Cleanup partially-applied overlays
  of: unittest: Add separators to of_unittest_overlay_high_level()
  of: overlay: unittest: Add test for unresolved symbol
  of: unittest-data: Convert remaining overlay DTS files to sugar syntax
  of: unittest-data: Fix whitespace - blank lines
  of: unittest-data: Fix whitespace - indentation
  of: unittest-data: Fix whitespace - angular brackets

 drivers/of/dynamic.c                          |  12 +-
 drivers/of/overlay.c                          |   3 +-
 drivers/of/unittest-data/Makefile             |   3 +-
 drivers/of/unittest-data/overlay.dtso         |  32 ++-
 drivers/of/unittest-data/overlay_0.dtso       |  11 +-
 drivers/of/unittest-data/overlay_1.dtso       |  11 +-
 drivers/of/unittest-data/overlay_11.dtso      |   1 -
 drivers/of/unittest-data/overlay_12.dtso      |  11 +-
 drivers/of/unittest-data/overlay_13.dtso      |  11 +-
 drivers/of/unittest-data/overlay_15.dtso      |   1 +
 drivers/of/unittest-data/overlay_4.dtso       |   1 -
 .../overlay_bad_add_dup_node.dtso             |   9 +-
 .../overlay_bad_add_dup_prop.dtso             |   9 +-
 .../of/unittest-data/overlay_bad_phandle.dtso |   5 +-
 .../of/unittest-data/overlay_bad_symbol.dtso  |   5 +-
 .../unittest-data/overlay_bad_unresolved.dtso |   7 +
 drivers/of/unittest-data/overlay_common.dtsi  |  36 ++-
 drivers/of/unittest-data/overlay_gpio_01.dtso |   1 +
 .../of/unittest-data/overlay_gpio_02a.dtso    |   1 +
 .../of/unittest-data/overlay_gpio_02b.dtso    |   1 +
 drivers/of/unittest-data/overlay_gpio_03.dtso |   1 +
 .../of/unittest-data/overlay_gpio_04a.dtso    |   1 +
 .../of/unittest-data/overlay_gpio_04b.dtso    |   1 +
 .../of/unittest-data/testcases_common.dtsi    |   1 +
 .../of/unittest-data/tests-interrupts.dtsi    |   1 +
 drivers/of/unittest-data/tests-overlay.dtsi   |   1 -
 drivers/of/unittest-data/tests-phandle.dtsi   |   2 +
 drivers/of/unittest.c                         | 218 +++++++++++-------
 28 files changed, 224 insertions(+), 173 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_bad_unresolved.dtso

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
