Return-Path: <linux-renesas-soc+bounces-13488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843DA3FCB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5709218986F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2089A22577C;
	Fri, 21 Feb 2025 16:57:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0D2253BC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157063; cv=none; b=ccXOUPS9OXWUu8YMNCPsEB8UO0JRcSydST5iGVu0GuQNpsM5D3OIl+4G8dcCQr+4XbFcbMoFTaZQ8znnPdw+Z/CGt/b4J+ptI1FDCL2g9xqyqf0d/9ONWUpgx7w/GERDGskTWEfXNkhwb6vWMft6Gjf1mHIUKxq/0H2ZHTiqcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157063; c=relaxed/simple;
	bh=xjVQPNsSP5xutsNtSPNHqsvu5vFNdRiGsOu0gHGOtzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6Y9oq4NWBAaGXeHsmtYS4D1/gGxk0P8BvfBdGSXCEZ1OwKPJWFSaTtuqAkK87Goy6h3HxoryYEbf34GdmBDuR60/Y/rkktGoUXX+SoWAMXF9euVsEKxKUCNCNXA9ZUBX5eg3bKLNsYE8X5LyzZu9aF6dGkxTJ5R8geeBJ1Qbk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by michel.telenet-ops.be with cmsmtp
	id GGxX2E00D0y8aK506GxXtj; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsR-3Why;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqo-12jX;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/5] Renesas ARM SoC updates for v6.15
Date: Fri, 21 Feb 2025 17:57:23 +0100
Message-ID: <cover.1740156740.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.15-tag1

for you to fetch changes up to 490a6291b17fbc65e31c54a0fd9301669ad283c0:

  ARM: shmobile: rcar-gen2: Remove CMA reservation code (2025-02-03 11:04:28 +0100)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.15

  - Remove the legacy CMA reservation code on R-Car Gen2, which causes
    issues with highmem.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Remove CMA reservation code

 arch/arm/mach-shmobile/setup-rcar-gen2.c | 76 --------------------------------
 1 file changed, 76 deletions(-)

