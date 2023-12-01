Return-Path: <linux-renesas-soc+bounces-504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF8800ADF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0DA7B210D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 12:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A736C250E1;
	Fri,  1 Dec 2023 12:28:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158861B4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 04:28:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7f2e:4977:a943:cc87])
	by albert.telenet-ops.be with bizsmtp
	id H0UU2B00F0rKVV8060UUP0; Fri, 01 Dec 2023 13:28:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92cr-00ARcA-SN;
	Fri, 01 Dec 2023 13:28:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92dA-00CVCy-HG;
	Fri, 01 Dec 2023 13:28:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.8
Date: Fri,  1 Dec 2023 13:28:15 +0100
Message-Id: <cover.1701433485.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.8.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v6.8

    - Enable support for the Renesas VersaClock 3 clock generator in the
      arm64 defconfig,
    - Enable support for the Renesas EtherAVB module in the arm multi_v7
      defconfig,
    - Refresh shmobile_defconfig for v6.7-rc1.

  [GIT PULL 2/2] Renesas DTS updates for v6.8

    - Add FLASH support for the Renesas Marzen and Blanche development
      boards,
    - Add 4-bit TX support for the QSPI FLASHes on the RZ/G2L, RZ/G2LC,
      and RZ/V2L SMARC SoMs,
    - Add SDHI support for the RZ/G3S SMARC development kit,
    - Add LCD support for the Atmark Techno Armadillo-800-EVA development
      board, which requires switching from the legacy frame buffer device
      driver to the DRM driver,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

