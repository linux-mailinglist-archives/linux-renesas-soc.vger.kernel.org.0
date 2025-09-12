Return-Path: <linux-renesas-soc+bounces-21810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E0AB54ABF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39B2F1644B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 11:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E142FF16D;
	Fri, 12 Sep 2025 11:14:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0BB296BBC;
	Fri, 12 Sep 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675643; cv=none; b=LaFXCNJyp9/HiZJhysNwvzloa6bhPSiJirvIowKsjnBf4gQmoLe02hJX2kN7pQG8UpGsSdyLq2Cy2+W07tfWlgiXpiu1WDeOYuC/nS26PcOTioUwkebU/De62ylxOS8hpCr+6pS3/9SI5m8S95jOmQ+3Y9kVeMzorcIpYl0m/WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675643; c=relaxed/simple;
	bh=E84fNNUbZiSZWFkc+wgNfBpf1kuCBRJe1gjSrJC8X8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gk9mDGIjTMWjcvz0dDiQeOOaxlJzzQDYKHIdJgA9IUgkrMv6DpSpB4hALGM9JLM2Tbu2ziM2G3CJqyHH/uEvEnMdnmaV1kIPL9P+S/Q0hPVYOKU4JFhR5hKaTqNf65zZ1FV2y+8D0j3vmRBM+3nL8YgmihP2SEiT6D3EuBtVErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCCAC4CEF9;
	Fri, 12 Sep 2025 11:14:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:13:51 +0200
Message-ID: <cover.1757669914.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
References: <cover.1757669912.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2da2740fb9c8e26b6b5e20d74f2ed1d49824236d:

  soc: renesas: rz-sysc: Add syscon/regmap support (2025-08-20 08:35:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.18-tag2

for you to fetch changes up to 5284d0b09d1bdc695256d7240915881d71997899:

  soc: renesas: Identify R-Car X5H (2025-09-11 20:21:42 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.18 (take two)

  - Identify the Renesas R-Car X5H (R8A78000) SoC.

----------------------------------------------------------------
Duy Nguyen (1):
      soc: renesas: Identify R-Car X5H

 drivers/soc/renesas/Kconfig       | 12 ++++++++++++
 drivers/soc/renesas/renesas-soc.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

