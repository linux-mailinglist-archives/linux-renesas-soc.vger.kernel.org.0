Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF8192353
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfHSMV2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:21:28 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:45028 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfHSMV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:21:27 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id r0MQ2000Q05gfCL060MQ7F; Mon, 19 Aug 2019 14:21:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hzgf6-0005rF-Ct; Mon, 19 Aug 2019 14:21:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hzgf6-0005rp-AG; Mon, 19 Aug 2019 14:21:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.3-rc2
Date:   Mon, 19 Aug 2019 14:21:23 +0200
Message-Id: <20190819122123.22512-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas R-Car Gen3 and RZ/G2 boards:
  - Drop CONFIG_COMMON_CLK_XGENE=n (no longer auto-enabled since commit
    ce9a1046434caee1 ("clk: xgene: Don't build COMMON_CLK_XGENE by
    default").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be applied to topic/renesas-defconfig.
Not intended for upstream merge.

 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 264fe03d6b085bae..bf0fd6aad56758e1 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -274,7 +274,6 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_COMMON_CLK_CS2000_CP=y
-# CONFIG_COMMON_CLK_XGENE is not set
 CONFIG_COMMON_CLK_VC5=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_HWSPINLOCK=y
-- 
2.17.1

