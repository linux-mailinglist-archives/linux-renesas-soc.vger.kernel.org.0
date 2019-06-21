Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA314E2EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfFUJOW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:22 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFUJOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 97DF625BE7B;
        Fri, 21 Jun 2019 19:14:05 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9E543940954; Fri, 21 Jun 2019 11:14:03 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
Date:   Fri, 21 Jun 2019 11:14:03 +0200
Message-Id: <b995421faef5b24ee8ec60d66b356b57ca0c8b77.1561101309.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561101309.git.horms+renesas@verge.net.au>
References: <cover.1561101309.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Remove the GENERIC_PHY config option from shmobile_defconfig, as it is
selected by PHY_RCAR_GEN3_USB2.

PHY_RCAR_GEN3_USB2 is enabled by the commit 0cd4f4f10245d1d9616e00245
("ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig").

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index eb02ba9ec6e6..c6c70355141c 100644
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
2.11.0

