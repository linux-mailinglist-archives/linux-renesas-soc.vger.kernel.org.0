Return-Path: <linux-renesas-soc+bounces-18836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B7AEB7E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FF4D1C235E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C798F2D3EDE;
	Fri, 27 Jun 2025 12:40:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE8B2676D9;
	Fri, 27 Jun 2025 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028027; cv=none; b=FBwWQxj2hPvEHO7BNASwVf6V3TDoYwNEutUwRFzCi+YHIGb3J4P1zhCjw9NEm/l1X35XKumMeiYhwSC9aWKcerwvduVmx+cinjUoF5G2rpWmaCaVmpu03zgL6szowZLW3MvoMfdsUXbcIFMTGNZO2Qj5Rdkie/y81i57tYVceFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028027; c=relaxed/simple;
	bh=S0wf8fDdone0azafhVX8hiqtbBjG6HF8tCb93k5aMDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvKoqOllCZhal+rAVYedSZcMtLtxtvbgytPkHjIewqUvSMsEzYB65IyGXJRDkV5ktK6wQSrju5/MVvqeIM/w2YDr7MeeO7QdcrY/VSyu7DL5bBs+JRAUHh0Igq1l2rLw7t2/GtQr2q13a14AgdRl0jHUoUCNNjcUVdZjxFChwD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F53C4CEED;
	Fri, 27 Jun 2025 12:40:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.17
Date: Fri, 27 Jun 2025 14:40:17 +0200
Message-ID: <cover.1751026661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751026657.git.geert+renesas@glider.be>
References: <cover.1751026657.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.17-tag1

for you to fetch changes up to 1cf74da68cffc91b00de7a188aca091f1b956a1f:

  soc: renesas: pwc-rzv2m: Use new GPIO line value setter callbacks (2025-06-13 11:21:53 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.17

  - Initial support for the Renesas RZ/T2H (R9A09G077) and RZ/N2H
    (R9A09G087) SoCs,
  - Convert the RZ/V2M External Power Sequence Controller (PWC) driver
    to the new GPIO line value setter callbacks.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      soc: renesas: pwc-rzv2m: Use new GPIO line value setter callbacks

Lad Prabhakar (1):
      soc: renesas: Add RZ/N2H (R9A09G087) config option

Thierry Bultel (1):
      soc: renesas: Add RZ/T2H (R9A09G077) config option

 drivers/soc/renesas/Kconfig     | 12 ++++++++++++
 drivers/soc/renesas/pwc-rzv2m.c |  8 +++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

