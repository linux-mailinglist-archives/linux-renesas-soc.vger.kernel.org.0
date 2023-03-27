Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D27F6C9EBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 10:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbjC0I7m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 04:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbjC0I7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 04:59:13 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44815526F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 01:57:10 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id dLx82900H1C8whw06Lx8FR; Mon, 27 Mar 2023 10:57:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgieO-00ExYz-SK;
        Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgif6-002atk-DO;
        Mon, 27 Mar 2023 10:57:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.4
Date:   Mon, 27 Mar 2023 10:57:02 +0200
Message-Id: <cover.1679907059.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
References: <cover.1679907055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.4-tag1

for you to fetch changes up to 2653d5bf1c9d123c0d8b8c1634cf54dacfcfdb52:

  soc: renesas: Use "#ifdef" for single-symbol definition checks (2023-03-16 16:58:42 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.4

  - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: rmobile-sysc: Use of_fwnode_handle() helper
      soc: renesas: Use "#ifdef" for single-symbol definition checks

Krzysztof Kozlowski (2):
      soc: renesas: mark OF related data as maybe unused
      soc: renesas: pwc-rzv2m: drop of_match_ptr for ID table

Wolfram Sang (2):
      soc: renesas: rcar-sysc: Remove R-Car H3 ES1.* handling
      soc: renesas: Remove r8a77950 arch

 drivers/soc/renesas/Kconfig              |  7 -------
 drivers/soc/renesas/pwc-rzv2m.c          |  2 +-
 drivers/soc/renesas/r8a7795-sysc.c       | 10 ----------
 drivers/soc/renesas/renesas-soc.c        | 14 ++++++--------
 drivers/soc/renesas/rmobile-sysc.c       |  2 +-
 include/dt-bindings/power/r8a7795-sysc.h |  1 -
 6 files changed, 8 insertions(+), 28 deletions(-)
