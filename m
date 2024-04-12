Return-Path: <linux-renesas-soc+bounces-4551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E91168A2CD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 12:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A33A2285A2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 10:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7821352F68;
	Fri, 12 Apr 2024 10:49:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A151C28
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918949; cv=none; b=Xj3QtEUfYC5s35J8s1B95hmTmv9PUa+EfgthbnzWLqcf6HWwukJ+Z7ld1sd0hFtuvHZNW13cB7oyYmisvAF0+h6WaysEth4WSF6NhtRAQJiiuNdwTytTGA1vf57vWEntxwoXQKx6BY+qyDu0nLJMydmruPkMcwXQb+2VmJAy754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918949; c=relaxed/simple;
	bh=MBJMUHR/WWesk0tPvFRs6MDcluDTcC9MWtCZucJOEes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AkaGC/URrNunF+mCX8thvu5pm7LUUfLQVXVhMPkf34gpI20eYxEpZmmqk4JCaRCs3jYcz40mYHYgdVHlsa0As0IVZYbsXToz22o9zghBYhTI6My6AUHcuHcmx9laclZX296AHmBvBpzUPuKHBwZOqCfmx6FxNd/7TuGTVTRZrbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id AAox2C00M0SSLxL06Aox06; Fri, 12 Apr 2024 12:48:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESG-00GpC8-47;
	Fri, 12 Apr 2024 12:48:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQK-RZ;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.10
Date: Fri, 12 Apr 2024 12:01:38 +0200
Message-Id: <cover.1712915532.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
References: <cover.1712915528.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.10-tag1

for you to fetch changes up to 3d2db954d2d922a8193654f2aa09c1bdee47818a:

  soc: renesas: Enable TMU support on R-Car Gen2 (2024-03-26 09:25:06 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.10

  - Identify the new RZ/V2H (R9A09G057) SoC,
  - Enable support for the TMU (Timer Unit) on R-Car Gen2 SoCs.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Enable TMU support on R-Car Gen2

Lad Prabhakar (1):
      soc: renesas: Add identification support for RZ/V2H SoC

 drivers/soc/renesas/Kconfig       |  6 ++++++
 drivers/soc/renesas/renesas-soc.c | 20 +++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

