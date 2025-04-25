Return-Path: <linux-renesas-soc+bounces-16381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B3A9C91A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 14:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A98217851E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BA2248878;
	Fri, 25 Apr 2025 12:42:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411ED24BD04
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584939; cv=none; b=MnldiLf7rpwhMOeWfhmXGlch6286Q1488JLN0UV/sfKvnrhUymYqR6jr0yFsj8O11yY+VFDhr2cUBkAGKt8JjoPbO7Xcb7LvcTJG4QoZFhipYwtSvttAKUyhwJeR1QjoXjMVcemQpeoNES58gYU0UwMYgSD6AJRzZB1JxAl53C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584939; c=relaxed/simple;
	bh=d+a1cGYOqft3/rd8lnIjN+xR007wruZx3X1yJdJ2nWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tx6vpgNhamLxhaNsByrMa+bNYFsusO2CDMZDTV3iiuO8xa9Qoo4UtRifw5qMRR0/VAOwgp+QZQ31rZejDm9Zh1FYHrT/+0+DR8dwGGUlSLvEHKOsvk+cdBU4qR0BLh4LoIO4SH861rDXnxGDiouITj+00ulkX8zzz38yJZDO4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNy49DHz4xX3x
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 14:35:14 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by laurent.telenet-ops.be with cmsmtp
	id hQb42E00816PE0201Qb4lN; Fri, 25 Apr 2025 14:35:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJc-31jS;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGl-0000000CKj0-3zoX;
	Fri, 25 Apr 2025 14:35:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.16
Date: Fri, 25 Apr 2025 14:34:56 +0200
Message-ID: <cover.1745582589.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.16-tag1

for you to fetch changes up to 33d5bf70fff43fbc612450164bd0bab6b9ada261:

  arm: multi_v7_defconfig: Drop individual Renesas SoC entries (2025-04-09 14:56:03 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.16

  - Enable all Renesas SoCs by default when ARCH_RENESAS is set, and
    remove individual SoC entries from the various defconfigs.

----------------------------------------------------------------
Lad Prabhakar (4):
      soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
      arm64: defconfig: Remove individual Renesas SoC entries
      arm: shmobile_defconfig: Drop individual Renesas SoC entries
      arm: multi_v7_defconfig: Drop individual Renesas SoC entries

 arch/arm/configs/multi_v7_defconfig | 19 -----------------
 arch/arm/configs/shmobile_defconfig | 19 -----------------
 arch/arm64/configs/defconfig        | 23 --------------------
 drivers/soc/renesas/Kconfig         | 42 +++++++++++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 61 deletions(-)

