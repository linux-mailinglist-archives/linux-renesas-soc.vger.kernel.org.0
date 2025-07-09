Return-Path: <linux-renesas-soc+bounces-19463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F895AFF2C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8852C18962B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED9C242D79;
	Wed,  9 Jul 2025 20:14:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436622367B0;
	Wed,  9 Jul 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092044; cv=none; b=iFMgUMcO0OQIdkScrciUs8HJ2yF2Q9JAlK6zltg9xHpn3JL1tajRBEUbDf93B8wWF01kk+FFd/Yb92R7mq5miG8PNM9L2FbRCL/g6fikpqes2ZAK7Xx9tL0A2boRggM0NSfN5lab3+GinrDCvs+e6Y6Z9QF5DEcPpRL9N1q6s5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092044; c=relaxed/simple;
	bh=+LT4N6AFW/kbLUhZCZ09nYEaNMeVypxk1v1dXua8kmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6cQRFqiUvKLg5RZdntu2pKQdAkTM1MC5Pn/eXIp0V+/Tq/Bcb00MLQ1FzI6qjKTBJyhywDDPymjCTWmovgD2p35UaJBHqRqwY2cvv3WcGPxo9ziFnFg+UQovPmNKpo9ph3gv+0qRmXtc2U6zfVb2Mtp6Tptlvguoz3WOM6m3TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C85DC4CEF0;
	Wed,  9 Jul 2025 20:14:02 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:25 +0200
Message-ID: <cover.1752090398.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752090396.git.geert+renesas@glider.be>
References: <cover.1752090396.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1cf74da68cffc91b00de7a188aca091f1b956a1f:

  soc: renesas: pwc-rzv2m: Use new GPIO line value setter callbacks (2025-06-13 11:21:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.17-tag2

for you to fetch changes up to 2d9f884ceae80ae5ceba90990fb8d824943602d5:

  soc: renesas: Sort Renesas Kconfig configs (2025-07-08 11:55:31 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.17 (take two)

  - Sort Renesas Kconfig symbols.

----------------------------------------------------------------
Kuninori Morimoto (1):
      soc: renesas: Sort Renesas Kconfig configs

 drivers/soc/renesas/Kconfig | 316 ++++++++++++++++++++++----------------------
 1 file changed, 158 insertions(+), 158 deletions(-)

