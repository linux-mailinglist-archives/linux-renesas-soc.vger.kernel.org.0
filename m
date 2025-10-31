Return-Path: <linux-renesas-soc+bounces-23955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6223EC248F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 11:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E1E1E34E1E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 10:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A8B33FE0D;
	Fri, 31 Oct 2025 10:43:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8670A33556C;
	Fri, 31 Oct 2025 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907421; cv=none; b=qtHalmDSFDugbysEKm5nmbWF3TbjFGNUxZhtMH8cJuDXXOEFxYK+7Gi6IGNXZfsiff8yeI8vA4qabauQBFuMWgfVd6GLkhYUw3UDUCIAvJQdVkzG8/pnkpCTlNxTc18PqD6Hs4pn28hLKZQCuB76ytnVf89Q73eH3a4TtarR2QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907421; c=relaxed/simple;
	bh=9e8C38Yzwl4krMaf09E8Ocg2PQ2F+5cMCBv0OV/8JnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k87Y2dZqli5ethl7MUBizn3SbEnH4VsATkJ+uB5fpinHnX/Ocf/LbyDA9ZKDKJlPtW/IeJkcEhje+vMnKiSJU3zVTpwPESi9S+11+zvx4nagOQP+CnNAuagaGDjhk/77AEwG3wEUEDV/7tz/kmqIs8ivK08LkCi65e3Cjlwk7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2553C116C6;
	Fri, 31 Oct 2025 10:43:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.19
Date: Fri, 31 Oct 2025 11:43:30 +0100
Message-ID: <cover.1761905412.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.19-tag1

for you to fetch changes up to e7d34657744a3e48e7ff3f61342eccd9852445bc:

  arm64: defconfig: Enable RZ/T2H / RZ/N2H ADC driver (2025-10-23 16:22:41 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.19

  - Enable support for the Renesas RZ/G3S and RZ/G3E thermal drivers,
    and the RZ/T2H and RZ/N2H ADC drivers in the ARM64 defconfig,
  - Refresh the ARM SH-Mobile defconfig for v6.18-rc1.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: defconfig: Enable Renesas RZ/G3S thermal driver

Cosmin Tanislav (1):
      arm64: defconfig: Enable RZ/T2H / RZ/N2H ADC driver

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.18-rc1

John Madieu (1):
      arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

 arch/arm/configs/shmobile_defconfig | 4 +++-
 arch/arm64/configs/defconfig        | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

