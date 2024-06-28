Return-Path: <linux-renesas-soc+bounces-6893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB791BF5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73600284CF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED613154434;
	Fri, 28 Jun 2024 13:16:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65697B653
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580561; cv=none; b=QITF/EsjR/A2yq4jjR3AfRoUArn/zOa1r35AKE40Si8J88ga66ejp/o0OWwXtuMzWRobzQa4XQ1Z2jW1ucMDvgPjsQDsgl5pus3TJ6RvFfHGXzhRpmshTQFiF5zdvHBzhZCzxB2EIXnrpr/EItCsKAL8taayiO2WpmRDAwer540=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580561; c=relaxed/simple;
	bh=aDXn25cszTTvVxDAKBYSoiyStm9e1anymcITTr7pWJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NkAOlNUcpO0OCtl6Zgvl/pilxJ0Bl9jBXvag9tHT2C0vGESu00fU6EInDhduSVfIws5FA0H8i7s1IhZzNrqCJXZFwxtsLRKZdX8J4R6UdrOD1n6QHymdG/2PejE67URreRPV15jah9eLkun2M3cAKnN6lDPXDf1hN40EA3bAynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by albert.telenet-ops.be with bizsmtp
	id h1Fs2C0085ECAAU061Fsiq; Fri, 28 Jun 2024 15:15:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBS6-000VGQ-7X;
	Fri, 28 Jun 2024 15:15:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSC-00BlRF-2Z;
	Fri, 28 Jun 2024 15:15:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.11 (take two)
Date: Fri, 28 Jun 2024 15:15:46 +0200
Message-Id: <cover.1719578273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.11.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.11

    - Add R-Car fuse driver.

  [GIT PULL 2/3] Renesas DT binding updates for v6.11

    - Document support for R-Car E-FUSE controllers.

  [GIT PULL 3/3] Renesas DTS updates for v6.11 (take two)

    - Add E-FUSE support for the R-Car V3U, S4-8, V4H, and V4M SoCs,
    - Add sound support for the R-Car V4M SoC,
    - Miscellaneous fixes and improvements.

Note that the new R-Car Fuse DT bindings, and/or driver and platform
data are shared by multiple driver and DT source files, and thus
included in multiple pull requests:
  - "[GIT PULL 1/3] Renesas driver updates for v6.11",
  - "[GIT PULL 2/3] Renesas DT binding updates for v6.11",
  - "[GIT PULL 3/3] Renesas DTS updates for v6.11 (take two)",
  - "[GIT PULL] pinctrl: renesas: Updates for v6.11 (take two)" (for
    pinctrl).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

