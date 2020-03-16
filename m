Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF971868E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 11:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730527AbgCPKZs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 06:25:48 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:57370 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730571AbgCPKZs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 06:25:48 -0400
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id EyRk2200P5USYZQ06yRkK4; Mon, 16 Mar 2020 11:25:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jDmwK-00069k-85; Mon, 16 Mar 2020 11:25:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jDmwK-0007Wg-5V; Mon, 16 Mar 2020 11:25:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r8a7791: Enable PWM support
Date:   Mon, 16 Mar 2020 11:25:38 +0100
Message-Id: <20200316102540.28887-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series enables PWM support on R-Car M2-W, using both the
single Timer Pulse Unit (4 channels), and the 7 channels of dedicated
PWM Timers.

Channels 1-3 for both types have been tested on Koelsch using DT
overlays from my topic/renesas-overlays branch[*].
I intend to queue this in renesas-devel for v5.8.

Thanks for your comments!

[*] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Geert Uytterhoeven (2):
  ARM: dts: r8a7791: Add TPU device node
  ARM: dts: r8a7791: Add PWM device nodes

 arch/arm/boot/dts/r8a7791.dtsi | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
