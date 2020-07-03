Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403D02139C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2020 14:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgGCMG5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 08:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCMG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:57 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B75C08C5DD
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2020 05:06:56 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e8cd:dde5:943b:dfd3])
        by michel.telenet-ops.be with bizsmtp
        id yc6t2200s1UkkT806c6uMw; Fri, 03 Jul 2020 14:06:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKSz-0004Ts-R1; Fri, 03 Jul 2020 14:06:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKSz-0001Ll-OB; Fri, 03 Jul 2020 14:06:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.9
Date:   Fri,  3 Jul 2020 14:06:40 +0200
Message-Id: <20200703120642.5128-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.9.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v5.9

    - Refresh shmobile_defconfig for v5.8-rc1
    - Enable additional support for Renesas platforms to
      shmobile_defconfig, multi_v7_defconfig, and the arm64 defconfig.

  [GIT PULL 2/2] Renesas ARM DT updates for v5.9

    - Increase support for the Renesas RZ/G1H SoC on the iWave RainboW
      Qseven board (G21D), and its camera expansion board,
    - IPMMU support for R-Car M3-W+,
    - Support for Rev.3.0/4.0 of the HopeRun HiHope RZ/G2M and RZ/G2N
      boards,
    - Minor fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
