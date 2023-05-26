Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727C2712407
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 11:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243236AbjEZJs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 05:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243189AbjEZJsu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 05:48:50 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BE0E49
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 02:48:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
        by albert.telenet-ops.be with bizsmtp
        id 1Moc2A0064eYoVn06Moc3v; Fri, 26 May 2023 11:48:36 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U3X-0038jq-Jx;
        Fri, 26 May 2023 11:48:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U3o-00EFZU-3q;
        Fri, 26 May 2023 11:48:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.5
Date:   Fri, 26 May 2023 11:48:29 +0200
Message-Id: <cover.1685094240.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.5-tag1

for you to fetch changes up to 3f1e1ad9230f8b1c415b432841db2b2850450fd4:

  ARM: shmobile: defconfig: Refresh for v6.4-rc1 (2023-05-15 10:31:22 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.5

  - Refresh shmobile_defconfig for v6.4-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.4-rc1

 arch/arm/configs/shmobile_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
