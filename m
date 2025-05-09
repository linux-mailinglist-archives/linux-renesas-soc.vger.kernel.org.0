Return-Path: <linux-renesas-soc+bounces-16891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3CAB1748
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47C51C41EDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCD120F07B;
	Fri,  9 May 2025 14:23:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8E2144DE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800581; cv=none; b=Bt6lZTInfCgkY116j/Ki3RZM1boqbytKHULCGg2ut/24XHZuGcmeErc22/R1VZJ1gVHqzK9h4gUWZ9rxfvPraOxHpRiNM0uXhLHHXuZOl6oq/1S6hXfWNv0k18A543+54iBJ3Z7mZA/gTKMiZ0LqGp8kj2XyDW1fLERPAmNbOrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800581; c=relaxed/simple;
	bh=k1dN9wcNvLXks+RQKAdBk055UYUiDUHfoy1BOBw/reg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJman9U7riXEJkHNdm+JZV5bNm/ol14U6GgQdgyil+V/nDDdeoyBDEdAvz/hrGclSbUW6Z2MT+ZR7gyjAC83+dZp4Q48QrG/DppkeiRt20GrmABWw5dR9wc9yg+Z4Bm9YhmmLT42wdy9BmY29bJtY3EBnwZusyBhIDQzTGVwrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by michel.telenet-ops.be with cmsmtp
	id n2No2E00F3X0DE5062NomD; Fri, 09 May 2025 16:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Ni-3KEr;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADG-1i5Q;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:28 +0200
Message-ID: <cover.1746798750.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
References: <cover.1746798748.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 33d5bf70fff43fbc612450164bd0bab6b9ada261:

  arm: multi_v7_defconfig: Drop individual Renesas SoC entries (2025-04-09 14:56:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.16-tag2

for you to fetch changes up to 976c4626c5f57d9a0eea0f4618ce58e68102bee3:

  ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB (2025-05-06 14:51:56 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.16 (take two)

  - Enable modular support for the Renesas RZ/G2L GPT and MSIOF sound in
    the ARM64 defconfig,
  - Enable more support for RZN1D-DB/EB in shmobile_defconfig.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable Renesas RZ/G2L GPT config

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB

Kuninori Morimoto (1):
      arm64: defconfig: Add Renesas MSIOF sound support

 arch/arm/configs/shmobile_defconfig | 7 ++++++-
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

