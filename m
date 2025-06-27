Return-Path: <linux-renesas-soc+bounces-18835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE4AEB7E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D940A1C234E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0592D3207;
	Fri, 27 Jun 2025 12:40:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB532676D9;
	Fri, 27 Jun 2025 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028026; cv=none; b=gR8kPyvuFq67/uAhHNMk+ovymFvuo/tXZBhTbIu6ZsjUun5EvIzhAu97Sv6q9V29mGXvopoY5bNU8oXQuWqnTvtW9REYdHzuebdLS3dsf9bBJZ2Ib/lP2CBDbrCEBchXGZmItTrdC6RIv7/paizQh8s/6Er/lPLByfUaWcapTNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028026; c=relaxed/simple;
	bh=fNbLqPBe2KWDtOO99wvCHnfAazdRZz3SkocH7ZmEHI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyWN2p/EWDmD1pDvcF3ldJWIN/biQw11Cjc+xRKHNtDnvhu4aBe4qw8z9X2mF/r2TI8Vh8du9bDgUzAiFSrootqvc20G75/VtSgIhjteUjpAv8w0DqTJuH2lEiG8SIATvm8Qxg0BG6At0tVSKtamkVSLpWKBTnmAedCS4lLnA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E17C4CEE3;
	Fri, 27 Jun 2025 12:40:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.17
Date: Fri, 27 Jun 2025 14:40:16 +0200
Message-ID: <cover.1751026659.git.geert+renesas@glider.be>
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

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.17-tag1

for you to fetch changes up to 910aa7765a7a12a5b485547de924fa97a21eb779:

  ARM: shmobile: defconfig: Refresh for v6.16-rc2 (2025-06-19 19:19:46 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.17

  - Enable modular support for Renesas RZ/V2H USB2PHY Port Reset Control
    in the ARM64 defconfig,
  - Refresh shmobile_defconfig for v6.16-rc2.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.16-rc2

Lad Prabhakar (1):
      arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller reset driver

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 1 +
 2 files changed, 2 insertions(+)

