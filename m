Return-Path: <linux-renesas-soc+bounces-2542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7B84FA52
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757BD1F244D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 16:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FEE7BB1A;
	Fri,  9 Feb 2024 16:55:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E047BB16
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497711; cv=none; b=DszUDUgpfBjwyzAF79PVGCY+JBYkGMd1Hfutg7WYT2aa5gbAcv8SSdnEomsznzUt+pkO2DEMbbYIpgiaANT5T8MP6NEbH9b9db8WrJmFDPBjOPpgKvaV9E0s2NCSxKW3/K1mOPh1O72N6DmzrMy9sk5IyMlCOcrlCNjJo7Pfwzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497711; c=relaxed/simple;
	bh=y3fUgnazbm+yxFs7N4sxiwTlLq/6Dujk5hkVmHJcXLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gOchz7eDw193PpuqPrOm7xQR14Wj4VdT8QjghWWtMdQ7GkTjcUJKBOFZfDooK4bbsgnjp7mgw3mAabcrjIICjmUZHjAfTdUfdHwnRo1GnXgrRtVb8jMSiIFbVmltDuG17OzUOf/SuMHA363Qg0ApSvUVSZ1PA94AusuYPBVDm/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by andre.telenet-ops.be with bizsmtp
	id l4uy2B00J4RKXn6014uyDc; Fri, 09 Feb 2024 17:55:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9O-0008GZ-81;
	Fri, 09 Feb 2024 17:54:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9S-0061GM-FP;
	Fri, 09 Feb 2024 17:54:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.9
Date: Fri,  9 Feb 2024 17:54:51 +0100
Message-Id: <cover.1707487830.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.9-tag1

for you to fetch changes up to 14656ed72fa5d0a2f98be0ffd56274db30171f49:

  soc: renesas: rcar-rst: Add support for R-Car V4M (2024-01-31 15:08:41 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.9

  - Initial support for the Renesas R-Car V4M (R8A779H0) SoC.

----------------------------------------------------------------
Duy Nguyen (2):
      soc: renesas: Identify R-Car V4M
      soc: renesas: rcar-rst: Add support for R-Car V4M

Geert Uytterhoeven (1):
      soc: renesas: Introduce ARCH_RCAR_GEN4

 drivers/soc/renesas/Kconfig       | 17 ++++++++++++++---
 drivers/soc/renesas/rcar-rst.c    |  1 +
 drivers/soc/renesas/renesas-soc.c |  8 ++++++++
 3 files changed, 23 insertions(+), 3 deletions(-)

