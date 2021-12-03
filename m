Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D1C467661
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244102AbhLCLfI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:35:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243778AbhLCLe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:34:56 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D75C061759
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Dec 2021 03:31:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
        by xavier.telenet-ops.be with bizsmtp
        id RnXV2600K3eLghq01nXVDH; Fri, 03 Dec 2021 12:31:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6mn-002IYi-0F; Fri, 03 Dec 2021 12:31:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6mm-000hRL-9g; Fri, 03 Dec 2021 12:31:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.17
Date:   Fri,  3 Dec 2021 12:31:20 +0100
Message-Id: <cover.1638530612.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638530605.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.17-tag1

for you to fetch changes up to 05b22caa7490e4f4c94bbde33c61cf72d187b8f7:

  soc: renesas: Consolidate product register handling (2021-11-30 09:42:00 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.17

  - Add a remoteproc API for controlling the Cortex-R7 boot address on
    R-Car Gen3 SoCs,
  - Consolidate product register handling.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Consolidate product register handling

Julien Massot (1):
      soc: renesas: rcar-rst: Add support to set rproc boot address

 drivers/soc/renesas/rcar-rst.c       |  43 ++++++++++++-
 drivers/soc/renesas/renesas-soc.c    | 115 +++++++++++++++++------------------
 include/linux/soc/renesas/rcar-rst.h |   2 +
 3 files changed, 98 insertions(+), 62 deletions(-)
