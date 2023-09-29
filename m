Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A847B310B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 13:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbjI2LK3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 07:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjI2LK2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 07:10:28 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC74DE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 04:10:25 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
        by baptiste.telenet-ops.be with bizsmtp
        id rnAN2A0061EgHdD01nANmJ; Fri, 29 Sep 2023 13:10:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBNd-004qNa-45;
        Fri, 29 Sep 2023 13:10:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBO2-001fr0-26;
        Fri, 29 Sep 2023 13:10:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v6.7
Date:   Fri, 29 Sep 2023 13:10:10 +0200
Message-Id: <cover.1695985418.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.7.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v6.7

    - Refresh shmobile_defconfig for v6.6-rc3.

  [GIT PULL 2/5] Renesas ARM SoC updates for v6.7

    - Reserve boot area when SMP is enabled to prevent conflicts with
      FLASH,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/5] Renesas driver updates for v6.7

    - Identify the new RZ/G3S SoC,
    - Miscellaneous fixes and improvements.

  [GIT PULL 4/5] Renesas DT binding updates for v6.7

    - Document support for the new RZ/G3S (R9A08G045) SoC variants.

  [GIT PULL 5/5] Renesas DTS updates for v6.7

    - Add PCIe Host and Endpoint support for the R-Car S4-8 SoC and the
      Renesas Spider development board,
    - Add FLASH support for the Renesas Genmai and RSK+RZA1 development
      boards,
    - Add multi Component sound support for Renesas ULCB development
      boards equipped with the Shimafuji Kingfisher extension,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
