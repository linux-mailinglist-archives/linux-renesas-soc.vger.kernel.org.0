Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D3816FCD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 12:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgBZLCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 06:02:31 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:60898 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbgBZLCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 06:02:31 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 7P2V2200S5USYZQ06P2V8u; Wed, 26 Feb 2020 12:02:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-0002U7-Ah; Wed, 26 Feb 2020 12:02:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-00052C-9a; Wed, 26 Feb 2020 12:02:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas driver updates for v5.7
Date:   Wed, 26 Feb 2020 12:02:21 +0100
Message-Id: <20200226110221.19288-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226110221.19288-1-geert+renesas@glider.be>
References: <20200226110221.19288-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.7-tag1

for you to fetch changes up to 4ff27112282e5482d618ea93837fe416af671bc2:

  soc: renesas: Remove ARCH_R8A7795 (2020-02-21 14:39:58 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.7

  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Remove ARCH_R8A7795

Nishad Kamdar (1):
      soc: renesas: rcar-sysc: Use the correct style for SPDX License Identifier

 drivers/soc/renesas/Kconfig       | 16 ++++++++--------
 drivers/soc/renesas/rcar-sysc.h   |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)
