Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A701D4A6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 12:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbgEOKGC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 06:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgEOKGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 06:06:02 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AEFC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 03:06:01 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad37:48f9:900a:523e])
        by andre.telenet-ops.be with bizsmtp
        id ey5w2200E1TfvYq01y5w1b; Fri, 15 May 2020 12:05:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0008Qj-D5; Fri, 15 May 2020 12:05:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0003pa-Bn; Fri, 15 May 2020 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM defconfig updates for v5.8 (take two)
Date:   Fri, 15 May 2020 12:05:43 +0200
Message-Id: <20200515100547.14671-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515100547.14671-1-geert+renesas@glider.be>
References: <20200515100547.14671-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 4c427ab28fd1cd988fce9517527476cfebd27485:

  ARM: shmobile: defconfig: Refresh for v5.7-rc1 (2020-04-20 10:02:46 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.8-tag2

for you to fetch changes up to 44b6141ebe936808fc59b386e3e259bef6c9bba6:

  ARM: multi_v7_defconfig: Enable r8a7742 SoC (2020-05-04 14:29:56 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.8 (take two)

  - Enable support for the new RZ/G1H SoC in the shmobile and multi_v7
    defconfigs.

----------------------------------------------------------------
Lad Prabhakar (2):
      ARM: shmobile: defconfig: Enable r8a7742 SoC
      ARM: multi_v7_defconfig: Enable r8a7742 SoC

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/shmobile_defconfig | 1 +
 2 files changed, 2 insertions(+)
