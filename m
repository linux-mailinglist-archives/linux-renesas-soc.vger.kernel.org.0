Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57CCE1310C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2020 11:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgAFKtK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jan 2020 05:49:10 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:57890 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgAFKtK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 05:49:10 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id myp52100U5USYZQ06yp5RT; Mon, 06 Jan 2020 11:49:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0001yo-Mq; Mon, 06 Jan 2020 11:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0002C0-Lr; Mon, 06 Jan 2020 11:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas driver updates for v5.6
Date:   Mon,  6 Jan 2020 11:48:56 +0100
Message-Id: <20200106104857.8361-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106104857.8361-1-geert+renesas@glider.be>
References: <20200106104857.8361-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.6-tag1

for you to fetch changes up to b925adfceb529389124193b57be5b7014e481834:

  soc: renesas: Add ARCH_R8A7795[01] for existing R-Car H3 (2020-01-06 11:08:43 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.6

  - Remove now unused ARCH_R8A7796 config symbol,
  - Fix a sparse warning,
  - Add split R-Car H3 ES1.x and ES2.0+ config symbols.

----------------------------------------------------------------
Ben Dooks (Codethink) (1):
      soc: renesas: rcar-rst: Fix __iomem on configure call

Geert Uytterhoeven (2):
      soc: renesas: Remove ARCH_R8A7796
      soc: renesas: Add ARCH_R8A7795[01] for existing R-Car H3

 drivers/soc/renesas/Kconfig    | 14 +++++++++-----
 drivers/soc/renesas/rcar-rst.c |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)
