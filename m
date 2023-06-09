Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4198272969B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 12:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240040AbjFIKPw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 06:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241515AbjFIKOz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 06:14:55 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC25449D6
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 03:06:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
        by andre.telenet-ops.be with bizsmtp
        id 6y6i2A00B12zQ4r01y6ilE; Fri, 09 Jun 2023 12:06:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z0d-008L2M-1u;
        Fri, 09 Jun 2023 12:06:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z10-00G42t-35;
        Fri, 09 Jun 2023 12:06:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.5 (take two)
Date:   Fri,  9 Jun 2023 12:06:37 +0200
Message-Id: <cover.1686304612.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686304609.git.geert+renesas@glider.be>
References: <cover.1686304609.git.geert+renesas@glider.be>
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

The following changes since commit cb9a39aacd3d6387b6f1f178a96eadceba90454e:

  soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U (2023-05-15 10:32:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.5-tag2

for you to fetch changes up to a00d47f7645d6e840a38a62fd961c8aa2c8fed6c:

  soc: renesas: rmobile-sysc: Convert to readl_poll_timeout_atomic() (2023-06-05 15:43:27 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.5 (take two)

  - Convert the R-Mobile SYSC driver to readl_poll_timeout_atomic().

----------------------------------------------------------------
Geert Uytterhoeven (4):
      iopoll: Call cpu_relax() in busy loops
      iopoll: Do not use timekeeping in read_poll_timeout_atomic()
      Merge tag 'iopoll-busy-loop-timeout-tag' into renesas-drivers-for-v6.5
      soc: renesas: rmobile-sysc: Convert to readl_poll_timeout_atomic()

 drivers/soc/renesas/rmobile-sysc.c | 29 +++++++++--------------------
 include/linux/iopoll.h             | 24 +++++++++++++++++++-----
 2 files changed, 28 insertions(+), 25 deletions(-)
