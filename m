Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1CC2139C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2020 14:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgGCMG6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 08:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgGCMG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA53C08C5DD
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2020 05:06:57 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e8cd:dde5:943b:dfd3])
        by laurent.telenet-ops.be with bizsmtp
        id yc6t2200m1UkkT801c6uGA; Fri, 03 Jul 2020 14:06:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKSz-0004Tt-RS; Fri, 03 Jul 2020 14:06:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKSz-0001Ln-Pk; Fri, 03 Jul 2020 14:06:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v5.9
Date:   Fri,  3 Jul 2020 14:06:41 +0200
Message-Id: <20200703120642.5128-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703120642.5128-1-geert+renesas@glider.be>
References: <20200703120642.5128-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.9-tag1

for you to fetch changes up to 1d21a0a32f93e24711b13af493ac5fe728a7be1f:

  arm64: defconfig: Enable additional support for Renesas platforms (2020-07-03 12:02:05 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.9

  - Refresh shmobile_defconfig for v5.8-rc1
  - Enable additional support for Renesas platforms to
    shmobile_defconfig, multi_v7_defconfig, and the arm64 defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (9):
      ARM: shmobile: defconfig: Refresh for v5.8-rc1
      ARM: shmobile: defconfig: Enable DA9063 ONKEY support
      ARM: shmobile: defconfig: Enable CAT9554 support
      ARM: shmobile: defconfig: Enable RZ/A watchdog support
      ARM: shmobile: defconfig: Enable RZ/A1 CEU support
      ARM: shmobile: defconfig: Enable ADV7612 CEC support
      ARM: shmobile: defconfig: Enable RZ/A1H RTC support
      ARM: multi_v7_defconfig: Enable additional support for Renesas platforms
      arm64: defconfig: Enable additional support for Renesas platforms

 arch/arm/configs/multi_v7_defconfig |  6 ++++++
 arch/arm/configs/shmobile_defconfig | 13 ++++++++-----
 arch/arm64/configs/defconfig        |  4 ++++
 3 files changed, 18 insertions(+), 5 deletions(-)
