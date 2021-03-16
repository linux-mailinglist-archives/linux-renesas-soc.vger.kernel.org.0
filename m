Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63B433D7FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 16:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhCPPr0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 11:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237408AbhCPPrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:47:09 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42861C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 08:47:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by laurent.telenet-ops.be with bizsmtp
        id h3n72400D0UTkXy013n7n7; Tue, 16 Mar 2021 16:47:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuU-0089uo-Mi; Tue, 16 Mar 2021 16:47:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lMBuU-00AD5G-6M; Tue, 16 Mar 2021 16:47:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hoang Vo <hoang.vo.eb@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: renesas: falcon: Restructuring
Date:   Tue, 16 Mar 2021 16:47:02 +0100
Message-Id: <20210316154705.2433528-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series restructures the devices nodes in the Renesas Falcon
DTS board stack to better match the actual board stack structure.
The DTB generated after this series is the same as before, according to
scripts/dtc/dtx_diff.

I plan to queue this in renesas-devel for v5.13.

Geert Uytterhoeven (3):
  arm64: dts: renesas: falcon: Move console config to CPU board DTS
  arm64: dts: renesas: falcon: Move watchdog config to CPU board DTS
  arm64: dts: renesas: falcon: Move AVB0 to main DTS

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 47 +++++--------------
 .../boot/dts/renesas/r8a779a0-falcon.dts      | 39 ++++++++++++---
 2 files changed, 46 insertions(+), 40 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
