Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0587F477633
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238637AbhLPPoA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238630AbhLPPn7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:43:59 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BFDC06173E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 07:43:59 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by albert.telenet-ops.be with bizsmtp
        id X3jx2600Y250X30063jxjK; Thu, 16 Dec 2021 16:43:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvF-005RBp-AM; Thu, 16 Dec 2021 16:43:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxsvE-00A3Oe-Rk; Thu, 16 Dec 2021 16:43:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/5] arm64: renesas: defconfig: Refresh for v5.16-rc1 and misc updates
Date:   Thu, 16 Dec 2021 16:43:51 +0100
Message-Id: <cover.1639669217.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series contains several updates for the defconfig for Renesas
R-Car Gen3 and RZ/G2 systems.  It is not intended for upstream merge,
but to be applied to the topic/renesas-defconfig branch in my
renesas-devel repository.

Thanks for your comments!

Geert Uytterhoeven (5):
  [LOCAL] arm64: renesas: defconfig: Refresh for v5.16-rc1
  [LOCAL] arm64: renesas: defconfig: Errata update
  [LOCAL] arm64: renesas: defconfig: Enable CONFIG_ARM64_RAS_EXTN
  [LOCAL] arm64: renesas: defconfig: Enable CONFIG_SPI_RSPI
  [LOCAL] arm64: renesas: defconfig: Enable R8A779F0 SoC

 arch/arm64/configs/renesas_defconfig | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
