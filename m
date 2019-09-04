Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDAFA81CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 14:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfIDMBT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 08:01:19 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:34976 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbfIDMBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:01:19 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id xQ1F2000X05gfCL01Q1FJD; Wed, 04 Sep 2019 14:01:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5TyN-0001Yp-Jc; Wed, 04 Sep 2019 14:01:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5TyN-0000VK-HP; Wed, 04 Sep 2019 14:01:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: renesas: Replace spaces by TABs
Date:   Wed,  4 Sep 2019 14:01:12 +0200
Message-Id: <20190904120114.1894-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Two simple patches to replace spaces by TABs, to increase consistency
between similar DTS files, and make it easier to compare them.

To be queued in renesas-devel for v5.5.

Geert Uytterhoeven (2):
  ARM: dts: gose: Replace spaces by TABs
  ARM: dts: lager: Replace spaces by TABs

 arch/arm/boot/dts/r8a7790-lager.dts |   8 +-
 arch/arm/boot/dts/r8a7793-gose.dts  | 110 ++++++++++++++--------------
 2 files changed, 59 insertions(+), 59 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
