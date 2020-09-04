Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17EC25D7C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 13:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgIDLsl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 07:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgIDLsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 07:48:32 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B93EC061246
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2020 04:48:31 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id PnoM2300D4C55Sk06noMQx; Fri, 04 Sep 2020 13:48:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0004eL-71; Fri, 04 Sep 2020 13:48:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0007sm-5t; Fri, 04 Sep 2020 13:48:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:17 +0200
Message-Id: <20200904114819.30254-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904114819.30254-1-geert+renesas@glider.be>
References: <20200904114819.30254-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.10-tag1

for you to fetch changes up to 5a87251dac0db8704d4d18b6dc7c23e30804585b:

  ARM: shmobile: defconfig: Enable CONFIG_PCIE_RCAR_HOST (2020-09-01 13:54:41 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.10

  - Enable touchscreen support on the iWave RZ/G1E platform,
  - Update for PCIE_RCAR => CONFIG_PCIE_RCAR_{HOST,EP} split, including
    enabling the latter,
  - Enable FLASH support on various R-Car Gen3 boards,
  - Refresh shmobile_defconfig for v5.9-rc1.

----------------------------------------------------------------
Biju Das (1):
      ARM: shmobile: defconfig: Enable TOUCHSCREEN_STMPE

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v5.9-rc1
      arm64: defconfig: Enable RPC-IF support

Lad Prabhakar (3):
      arm64: defconfig: Enable R-Car PCIe endpoint driver
      ARM: multi_v7_defconfig: Enable CONFIG_PCIE_RCAR_HOST
      ARM: shmobile: defconfig: Enable CONFIG_PCIE_RCAR_HOST

 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/shmobile_defconfig | 5 +++--
 arch/arm64/configs/defconfig        | 7 +++++++
 3 files changed, 11 insertions(+), 3 deletions(-)
