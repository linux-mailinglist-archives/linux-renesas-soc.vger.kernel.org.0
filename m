Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF6E16FCDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 12:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgBZLCc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 06:02:32 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:55448 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgBZLCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 06:02:31 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 7P2V220085USYZQ06P2VLA; Wed, 26 Feb 2020 12:02:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-0002U3-92; Wed, 26 Feb 2020 12:02:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-000526-85; Wed, 26 Feb 2020 12:02:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/5] Renesas ARM64 defconfig updates for v5.7
Date:   Wed, 26 Feb 2020 12:02:19 +0100
Message-Id: <20200226110221.19288-4-geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-defconfig-for-v5.7-tag1

for you to fetch changes up to bf9e333ec0d54f7428d9192ad403c3cb523584c7:

  arm64: defconfig: Enable additional support for Renesas platforms (2020-02-21 14:51:52 +0100)

----------------------------------------------------------------
Renesas ARM64 defconfig updates for v5.7

  - Restore R-Car M3-W support,
  - Enable additional support for Renesas platforms.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: defconfig: Replace ARCH_R8A7796 by ARCH_R8A77960
      arm64: defconfig: Enable additional support for Renesas platforms

 arch/arm64/configs/defconfig | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)
