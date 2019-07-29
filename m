Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8FF8792B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 19:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbfG2R5I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 13:57:08 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:50840 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728560AbfG2R5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 13:57:07 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id ihx02000S05gfCL01hx0yn; Mon, 29 Jul 2019 19:57:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hs9tM-00023k-R0; Mon, 29 Jul 2019 19:57:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hs9tM-0003ZM-Os; Mon, 29 Jul 2019 19:57:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add Geert as Renesas SoC Co-Maintainer
Date:   Mon, 29 Jul 2019 19:56:58 +0200
Message-Id: <20190729175658.13672-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

At the end of the v5.3 upstream kernel development cycle, Simon will be
stepping down from his role as Renesas SoC maintainer.  Starting with
the v5.4 development cycle, Geert is taking over this role.

Add Geert as a co-maintainer, and add his git repository and branch.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Stephen: Can you please add my branch to linux-next, after Simon's
	 branch, which may still receive fixes for v5.3?

	 Thanks!
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6426db5198f05377..6de667021591fb52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2155,10 +2155,12 @@ F:	Documentation/devicetree/bindings/arm/realtek.txt
 
 ARM/RENESAS ARM64 ARCHITECTURE
 M:	Simon Horman <horms@verge.net.au>
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
 M:	Magnus Damm <magnus.damm@gmail.com>
 L:	linux-renesas-soc@vger.kernel.org
 Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
 S:	Supported
 F:	arch/arm64/boot/dts/renesas/
 F:	Documentation/devicetree/bindings/arm/renesas.yaml
@@ -2269,10 +2271,12 @@ F:	drivers/media/platform/s5p-mfc/
 
 ARM/SHMOBILE ARM ARCHITECTURE
 M:	Simon Horman <horms@verge.net.au>
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
 M:	Magnus Damm <magnus.damm@gmail.com>
 L:	linux-renesas-soc@vger.kernel.org
 Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
 S:	Supported
 F:	arch/arm/boot/dts/emev2*
 F:	arch/arm/boot/dts/gr-peach*
-- 
2.17.1

