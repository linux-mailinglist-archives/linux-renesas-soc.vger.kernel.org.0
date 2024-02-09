Return-Path: <linux-renesas-soc+bounces-2546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC5984FA7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 18:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E31C4283836
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D9C69971;
	Fri,  9 Feb 2024 17:04:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FEA7B3D2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707498243; cv=none; b=H/kSKs5w7VPvi29HmEHww50WAaDAW+wFwR2hjeSXz6Q1tFeNPGGUhb6yl7Vf/N3QVdGcr2eNsfSDmZD9yHmCHESyGiTLAbrei/kO25KuQW6QVY3imVjJv66bY+dOZgwnVG6VCX34p1sX9RZlk+modKDnydHT+2IIevQ6MaMt7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707498243; c=relaxed/simple;
	bh=M2CEMVXIDMXDGaaHKPKMxtYy9MzDYyn+zh8GcMJO0WU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WHJjndu/UeA9oc/Z9/1omoJRva1dS5nxC3pwk8S8DrmOE074NoJcl5dQUep45SpmgMpqbWz58uSf8YSpX8hooq20Y5wz3i8x2lvVDKqKLF2+DLadE77d1dAUq1+RtkhA3g1E5U1DJDMc4G75A4WXreZna+k0cXmqNlTO3ronV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4TWg2M2lhGz4wwdC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:55:07 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by albert.telenet-ops.be with bizsmtp
	id l4uy2B0064RKXn6064uy1E; Fri, 09 Feb 2024 17:55:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9O-0008GX-7b;
	Fri, 09 Feb 2024 17:54:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9S-0061GJ-En;
	Fri, 09 Feb 2024 17:54:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.9
Date: Fri,  9 Feb 2024 17:54:50 +0100
Message-Id: <cover.1707487828.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707487826.git.geert+renesas@glider.be>
References: <cover.1707487826.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.9-tag1

for you to fetch changes up to 93189f33fcb4e678c9494cddeff96b123ef5674f:

  arm64: defconfig: Enable R8A779H0 SoC (2024-01-31 15:01:24 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.9

  - Disable obsolete board staging support in the Renesas ARM and ARM V7
    multi-platform defconfigs,
  - Enable support for the Renesas R-Car V4M (R8A779H0) SoC in the ARM64
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Disable staging
      ARM: multi_v7_defconfig: Disable board staging

Linh Phung (1):
      arm64: defconfig: Enable R8A779H0 SoC

 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm/configs/shmobile_defconfig | 2 --
 arch/arm64/configs/defconfig        | 1 +
 3 files changed, 1 insertion(+), 3 deletions(-)

