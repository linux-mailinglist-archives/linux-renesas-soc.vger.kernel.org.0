Return-Path: <linux-renesas-soc+bounces-6565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC2910A26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36F801F229EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5841B1408;
	Thu, 20 Jun 2024 15:40:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02041B0139
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898000; cv=none; b=OXU0azd72gbbnhpQW2RyddXoWRcuRrAF/EaZm8jk7WuHWLlnnrH5hN7Q6/UCdoYENmHvDG62fXUvISiLAJ1ShRvzO9N7NrO5rflmtHOjXnwEoV0nxqsNww8jUQMZa/DdybfbHDiGa7OPlkvGco6uaGMZve+3rDer68iD2QQuC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898000; c=relaxed/simple;
	bh=EGan0DPRyj1iH/qlzBQ+qSQPs0ak1SMhLvLNyPKTR4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s7GCLCOj6kdips8b5Do5XD6T0mcXItTEDU/JFwtJnR2VGO5Yg8tdY30fnXWa1Wmx0u5/VtDbFyDZfqOdP9exom7Fe4HDTfwMDHoXuWdDJD12wG1M/hFN7EyxyVCrY44D5pfbJi5AdZI9m88E1GcWE89wR7aOUXJPZMIiMOLpUJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:260f:cd5c:91b1:523c])
	by laurent.telenet-ops.be with bizsmtp
	id drfo2C00R0Y0hZi01rfocP; Thu, 20 Jun 2024 17:39:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKJt6-0005LW-Oa;
	Thu, 20 Jun 2024 17:39:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKJt6-000LnR-Le;
	Thu, 20 Jun 2024 17:39:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] mmc: tmio: Remove obsolete callbacks
Date: Thu, 20 Jun 2024 17:39:44 +0200
Message-Id: <cover.1718897545.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series removes two unused callbacks from the tmio_mmc_data
structure, and related infrastructure code.
  - The first patch touches only the MFD subsystem.
  - The second patch touches both the MMC and MFD subsystems, and has a
    contextual dependency on the first patch.  If really needed, it can
    be split in an MMC and MFD part, but the MFD part depends on the MMC
    part anyway.

Thanks for your comments!

Geert Uytterhoeven (2):
  mfd: tmio: Remove obsolete .set_clk_div() callback
  mmc: tmio: Remove obsolete .set_pwr() callback()

 drivers/mmc/host/tmio_mmc.h      | 3 ---
 drivers/mmc/host/tmio_mmc_core.c | 8 --------
 include/linux/mfd/tmio.h         | 2 --
 3 files changed, 13 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

