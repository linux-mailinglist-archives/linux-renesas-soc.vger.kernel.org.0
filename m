Return-Path: <linux-renesas-soc+bounces-23956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 244CAC2495B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 11:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 239E64042CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 10:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA4F33890A;
	Fri, 31 Oct 2025 10:43:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE301F2C34;
	Fri, 31 Oct 2025 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907423; cv=none; b=QQJHLg/5ZQ5jT6mIhIKlmfQm1XIBbyzrQYyv/+yTzVl7/lSJbAe/o+4hyDY8S1D4EeDm9ZSjaiXaeENNvSC5ZTvfp02T+usCfNpEI2XNzweH2SEaG0N5xVvH3SsvHzYFsbJxHsasQjw88QywIVATqJC2aKa8qMcganiKD9QQ/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907423; c=relaxed/simple;
	bh=mxj36eAkfJcx0Yc9EMpQ65RODXP52rKBO42PgL4/OAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLf+EJhYZYyV2rrPyNzfkSA2uLq7h0qNj/XDrptRKkHl4CC5/oH8l+/6NTcOyaCke3kvAeEmhrcQ/MzeeFc7wcm1fKBmcFviOPCpEc4FleA7v7ugFUMRpAF655g2u2qqfbfaQ09UI6nvFX9bsmWXN75ukdc1p65tYSEAiY1+97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9863FC116B1;
	Fri, 31 Oct 2025 10:43:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.19
Date: Fri, 31 Oct 2025 11:43:31 +0100
Message-ID: <cover.1761905414.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761905410.git.geert+renesas@glider.be>
References: <cover.1761905410.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.19-tag1

for you to fetch changes up to 4765d59fcf8679372286bc899628c3721dafe456:

  soc: renesas: rcar-rst: Keep RESBAR2S in default state (2025-10-23 16:03:30 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.19

  - Keep the WDTRSTCR.RESBAR2S bit in the default state on R-Car Gen4.

----------------------------------------------------------------
Wolfram Sang (1):
      soc: renesas: rcar-rst: Keep RESBAR2S in default state

 drivers/soc/renesas/rcar-rst.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

