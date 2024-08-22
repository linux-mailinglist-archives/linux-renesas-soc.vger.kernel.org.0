Return-Path: <linux-renesas-soc+bounces-8002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BF95B0EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5871C22293
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CF316DEDF;
	Thu, 22 Aug 2024 08:52:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2239B282EA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316733; cv=none; b=W7yiXRg0Fjl8JFEkl7lkC+0SmJkHBV0nJ+yYh3re8UahW2okSMfX+WncHfGtAohSaLfLBnPaY4wEI4Bcm+KDjgezbs5H+5uCzstHG7vG6uiJKvHaM6qKe9FPcxah42p5tUWDxE+VIDGlV2lNHXm3lC+14DxPoRe44DjzTDv6Mqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316733; c=relaxed/simple;
	bh=NrPbr8m2gZgD2xfC7eTiuOutckhPhUdpN6lijp72Aug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0q5Q3WUYv3sOAzE/74NZ0aikxpVblhvpqWMaAM3z4EBqp139OOL+LXGF7Km1HK8ZrxF1RHiWvP9Ujxzqi5/8sjbD/QVLtW0AmUGzDg8GR6Zj3IyBkE1NKG9byEAQOOFq2xcck4Cc7WJfVGp3WX7nI4nij7KqVj+01+3izeLATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by albert.telenet-ops.be with bizsmtp
	id 2ws22D00X22R5AR06ws2yp; Thu, 22 Aug 2024 10:52:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y0-000VWr-16;
	Thu, 22 Aug 2024 10:52:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y2-002L5m-9k;
	Thu, 22 Aug 2024 10:52:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.12
Date: Thu, 22 Aug 2024 10:51:51 +0200
Message-Id: <cover.1724316480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724316478.git.geert+renesas@glider.be>
References: <cover.1724316478.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.12-tag1

for you to fetch changes up to 84542dfad12252887bc14402f2bdc6286262cbae:

  arm64: defconfig: Enable R-Car Ethernet-TSN support (2024-08-02 11:28:21 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.12

  - Enable support for AK4619 codecs and Renesas R-Car Ethernet-TSN
    controllers in the ARM64 defconfig,
  - Enable slab hardening and kmalloc buckets in the Renesas ARM
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Enable slab hardening and kmalloc buckets

Kuninori Morimoto (1):
      arm64: defconfig: Enable AK4619 codec support

Niklas Söderlund (1):
      arm64: defconfig: Enable R-Car Ethernet-TSN support

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 3 insertions(+)

