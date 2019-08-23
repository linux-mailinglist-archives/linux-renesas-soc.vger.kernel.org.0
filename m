Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D9C9AFA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 14:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732076AbfHWMgz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 08:36:55 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:57768 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391797AbfHWMgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 08:36:55 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id sccr2000U05gfCL06ccrx4; Fri, 23 Aug 2019 14:36:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0006YU-GJ; Fri, 23 Aug 2019 14:36:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0004uR-E9; Fri, 23 Aug 2019 14:36:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 4/5] Renesas driver updates for v5.4 (take two)
Date:   Fri, 23 Aug 2019 14:36:42 +0200
Message-Id: <20190823123643.18799-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823123643.18799-1-geert+renesas@glider.be>
References: <20190823123643.18799-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 0ed0eb0171d7c19310d9f7b06a6dee82a4fb8ab6:

  soc: renesas: rcar-sysc: Use [] to denote a flexible array member (2019-07-29 15:36:56 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.4-tag2

for you to fetch changes up to 2eced4607a1e6f51f928ae3e521fe02be5cb7d23:

  soc: renesas: Enable ARM_ERRATA_754322 for affected Cortex-A9 (2019-08-23 10:33:31 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.4 (take two)

  - Improve "always-on" PM Domain handling on SH/R-Mobile SoCs,
  - Automatic errata selection for Cortex-A7/A9,
  - Small fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (4):
      soc: renesas: rcar-sysc: Eliminate local variable gov
      soc: renesas: rmobile-sysc: Set GENPD_FLAG_ALWAYS_ON for always-on domain
      soc: renesas: Enable ARM_ERRATA_814220 for affected Cortex-A7
      soc: renesas: Enable ARM_ERRATA_754322 for affected Cortex-A9

Nishka Dasgupta (1):
      soc: renesas: rcar-sysc: Add goto to of_node_put() before return

 drivers/soc/renesas/Kconfig        | 11 +++++++++++
 drivers/soc/renesas/rcar-sysc.c    |  5 ++---
 drivers/soc/renesas/rmobile-sysc.c | 31 ++++++++++++++++---------------
 3 files changed, 29 insertions(+), 18 deletions(-)
