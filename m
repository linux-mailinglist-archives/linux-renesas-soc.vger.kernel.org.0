Return-Path: <linux-renesas-soc+bounces-26299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C7CF4AC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CFFF302C8EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A869D34DB52;
	Mon,  5 Jan 2026 15:57:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96734DB4E;
	Mon,  5 Jan 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628670; cv=none; b=msG6Nq3ozZqAHY110pDJ8Ivb1R+8PYVrSWt9E1pBGW4q54Uvun78niJo2jrtnOfZFvPSBqb7Pvgux2vTONW8+WMgu2PMaRDoCN9Ra5FCNlGg+M9JG1sjkzqvLh+ROnHgzBjxZvG3qzesvdDKcQ8lFth5CXowi6KKn46ji7BCiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628670; c=relaxed/simple;
	bh=oUnHfmnatDHKqx2vQN3xikP4dLMIbrldBite4mRbVAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qc/JlC06ClY2WToW24LN/lvizDRlsibSQfAoHzWowBTQlbQzDeHmsjIG/DaJsMVL6XOwrdrNJ9IZM6cZazz9hnzloO0StIBle4EZ8d33UOZVOKsOOBU7OZzEKcBW+5LXinM9c5c48AWNdZ7uDiGJGPxr+k7jTBtdGPb1HwznSSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC36C19422;
	Mon,  5 Jan 2026 15:57:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.20
Date: Mon,  5 Jan 2026 16:57:38 +0100
Message-ID: <cover.1767628165.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
References: <cover.1767628163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.20-tag1

for you to fetch changes up to 898a23193bd860234342eef6ebcc00e9199e3513:

  ARM: shmobile: defconfig: Refresh for v6.19-rc1 (2026-01-05 14:39:18 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.20

  - Enable support for the Renesas RZ/G3E USB3 PHY and RZ/G3S PCIe
    drivers in the ARM64 defconfig,
  - Refresh the ARM SH-Mobile defconfig for v6.19-rc1.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable RZ/G3E USB3 PHY driver

Claudiu Beznea (1):
      arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.19-rc1

 arch/arm/configs/shmobile_defconfig | 2 +-
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

