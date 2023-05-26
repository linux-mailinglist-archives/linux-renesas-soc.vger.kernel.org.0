Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EDC712405
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 11:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjEZJs7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 05:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbjEZJsw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 05:48:52 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5EF1B3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 02:48:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
        by michel.telenet-ops.be with bizsmtp
        id 1Mof2A00A4eYoVn06MofwQ; Fri, 26 May 2023 11:48:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U3X-0038jt-K3;
        Fri, 26 May 2023 11:48:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U3o-00EFZX-4V;
        Fri, 26 May 2023 11:48:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.5
Date:   Fri, 26 May 2023 11:48:30 +0200
Message-Id: <cover.1685094242.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685094238.git.geert+renesas@glider.be>
References: <cover.1685094238.git.geert+renesas@glider.be>
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

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.5-tag1

for you to fetch changes up to cb9a39aacd3d6387b6f1f178a96eadceba90454e:

  soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U (2023-05-15 10:32:12 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.5

  - Enable watchdog reset support on R-Car V3U.

----------------------------------------------------------------
Wolfram Sang (1):
      soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U

 drivers/soc/renesas/rcar-rst.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)
