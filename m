Return-Path: <linux-renesas-soc+bounces-129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF817F4C0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 17:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B4D281338
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 16:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A0C4EB26;
	Wed, 22 Nov 2023 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190FCBD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Nov 2023 08:12:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d60:3031:68fb:d1ad])
	by andre.telenet-ops.be with bizsmtp
	id DUCm2B00G3EmSSH01UCm0e; Wed, 22 Nov 2023 17:12:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pq4-009ylB-95;
	Wed, 22 Nov 2023 17:12:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pqI-00GzNM-6U;
	Wed, 22 Nov 2023 17:12:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/3] ARM: dts: renesas: r8a7740/armadillo800eva: Add LCD support
Date: Wed, 22 Nov 2023 17:12:40 +0100
Message-Id: <cover.1700669207.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds support for the two LCD Controllers (LCDC) on the
R-Mobile A1 SoC, and for the 5" WVGA TFT LCD panel on the
Armadillo-800-EVA development board, using the shmobile-drm driver,
which gained support for DT recently.

Changes compared to v1:
  - New patch "ARM: shmobile: defconfig: Switch to DRM_SHMOBILE",
  - Add Reviewed-by.

To be queued in renesas-devel for v6.8.

Thanks for your comment!

Geert Uytterhoeven (3):
  ARM: shmobile: defconfig: Switch to DRM_SHMOBILE
  ARM: dts: renesas: r8a7740: Add LCDC nodes
  ARM: dts: renesas: armadillo800eva: Add LCD panel

 .../dts/renesas/r8a7740-armadillo800eva.dts   | 28 +++++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 65 +++++++++++++++++++
 arch/arm/configs/shmobile_defconfig           |  5 +-
 3 files changed, 94 insertions(+), 4 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

