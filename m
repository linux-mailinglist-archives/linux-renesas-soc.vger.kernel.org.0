Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF31979CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 14:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfHUMqH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 08:46:07 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:40718 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfHUMqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 08:46:07 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id rom32000M05gfCL06om3Do; Wed, 21 Aug 2019 14:46:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i0Q03-0003dy-LB; Wed, 21 Aug 2019 14:46:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i0Q03-0007dd-JR; Wed, 21 Aug 2019 14:46:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] soc: renesas: ARM errata updates
Date:   Wed, 21 Aug 2019 14:45:59 +0200
Message-Id: <20190821124602.29317-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series updates the handling of ARM errata for affected
Renesas SoCs.

The first patch enables the new ARM_ERRATA_814220 for Cortex-A7, using
Kconfig logic.
The second patch moves enablement of ARM_ERRATA_754322 for Cortex-A9
from shmobile_defconfig to Kconfig logic, to make sure it's always
enabled when needed.
The third patch disables PL310_ERRATA_588369, as it doesn't affect any
Renesas SoCs.

The last patch is marked RFC, as I don't know the revision of PL310 on
EMMA Mobile EV2, and cannot test it on EMEV2.

Thanks for your comments!

Geert Uytterhoeven (3):
  soc: renesas: Enable ARM_ERRATA_814220 for affected Cortex-A7
  soc: renesas: Enable ARM_ERRATA_754322 for affected Cortex-A9
  [RFC] ARM: shmobile: defconfig: Disable PL310_ERRATA_588369

 arch/arm/configs/shmobile_defconfig |  2 --
 drivers/soc/renesas/Kconfig         | 11 +++++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
