Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC912EF0A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 11:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbhAHK3j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 05:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbhAHK3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 05:29:39 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B726C0612F4
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jan 2021 02:28:58 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id EAUx240054C55Sk01AUxpP; Fri, 08 Jan 2021 11:28:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxp0q-001zhq-MH; Fri, 08 Jan 2021 11:28:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxp0q-008UsI-6H; Fri, 08 Jan 2021 11:28:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a779a0: Add GPIO support
Date:   Fri,  8 Jan 2021 11:28:52 +0100
Message-Id: <20210108102854.2025261-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series enables GPIO in the R-Car V3U DTS file.
It includes an RFC patch to add a Pin Controller device node, as the
PFC node is a dependency for proper GPIO support.  It would be good to
resolve the PFC issue soon, as PFC and GPIO are dependencies for most
hardware support on the Falcon board.

Changes compared to v1:
  - Include RFC patch to add PFC node,
  - Add Tested-by,
  - Fix "V3u" typo in patch description,
  - Uncomment "gpio-ranges" properties,
  - Verified resets values.

Thanks!

Geert Uytterhoeven (2):
  [RFC] arm64: dts: renesas: r8a779a0: Add PFC node
  arm64: dts: renesas: r8a779a0: Add GPIO nodes

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 149 ++++++++++++++++++++++
 1 file changed, 149 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
