Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D609C66AB84
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 14:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjANNXS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 08:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjANNXQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 08:23:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A51F59FD
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 05:23:13 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 8dP92900U4C55Sk01dP9eh; Sat, 14 Jan 2023 14:23:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgUz-003z7D-W5;
        Sat, 14 Jan 2023 14:23:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pGgV3-006HuK-N6;
        Sat, 14 Jan 2023 14:23:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.3
Date:   Sat, 14 Jan 2023 14:22:57 +0100
Message-Id: <cover.1673702289.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
References: <cover.1673702287.git.geert+renesas@glider.be>
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

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.3-tag1

for you to fetch changes up to 3ad69c496d488cd1b6c3a20b2f7945b45a0f7f18:

  arm64: defconfig: Enable RZ/G2L MIPI CSI-2 and CRU support (2023-01-10 09:39:55 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.3

  - Enable support for the Renesas RZ/G2L MIPI DSI, CSI-2, and Camera
    Receiving Unit drivers in the arm64 defconfig,
  - Refresh shmobile_defconfig for v6.1-rc5.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable Renesas RZ/G2L MIPI DSI driver

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v6.1-rc5
      arm64: defconfig: Enable RZ/G2L MIPI CSI-2 and CRU support

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 3 +++
 2 files changed, 4 insertions(+)
