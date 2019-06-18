Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64DF44A117
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 14:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfFRMrT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 08:47:19 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37178 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRMrT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 08:47:19 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id SCnF2000F3XaVaC06CnF28; Tue, 18 Jun 2019 14:47:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdDW7-0007hs-C4; Tue, 18 Jun 2019 14:47:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdDW7-0003wb-9h; Tue, 18 Jun 2019 14:47:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v5.2-rc1
Date:   Tue, 18 Jun 2019 14:47:14 +0200
Message-Id: <20190618124714.15120-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas ARM boards:
  - Drop CONFIG_GENERIC_PHY=y (selected by PHY_RCAR_GEN3_USB2).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index eb02ba9ec6e625f9..c6c70355141c38fa 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -197,7 +197,6 @@ CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
 CONFIG_RESET_CONTROLLER=y
-CONFIG_GENERIC_PHY=y
 CONFIG_PHY_RCAR_GEN2=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 # CONFIG_DNOTIFY is not set
-- 
2.17.1

