Return-Path: <linux-renesas-soc+bounces-6895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 361ED91BF6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEC861F21B1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E908F1ABCDE;
	Fri, 28 Jun 2024 13:23:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD6154434
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581036; cv=none; b=BXR6UHaFFBp1I+Eb4xK335CuodVDEOvguoxg5S8a13Z2oJE2lYLZXWWobR/5lv6PyqMDCU5rGkCgp1tI716BRk3rXYj9jGsdmV9oGmN7JsmraKjo9X5AF5ZZqSQRGb5+Luufpa8x9UroJzGzSq6YS6ujAygJ6uVlLalyZ6qU/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581036; c=relaxed/simple;
	bh=bmFJ9AZXbjNi/4pTTLQljSY7ECzLXd+RwEVvizCS89E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hymYAb90jaNkRuXw5Zs9DouJ7QsCrjj/TvwksYPnN68cUXtDTAMhXLNN5DjpwMQa3Vd5SID203d5tOH6PdyUz6I75TgIAVZ0O3zacpdKxTFx8xJ4twN74aV6TWmzxYMqacATRn/nu2Hhnj3wXH5kIcfT2dXZT0OaQBRgRtbp08A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4W9bXx2sZkz4wwn5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 15:16:01 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by baptiste.telenet-ops.be with bizsmtp
	id h1Fs2C0035ECAAU011Fs38; Fri, 28 Jun 2024 15:15:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBS6-000VGS-7c;
	Fri, 28 Jun 2024 15:15:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSC-00BlRI-3P;
	Fri, 28 Jun 2024 15:15:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.11
Date: Fri, 28 Jun 2024 15:15:47 +0200
Message-Id: <cover.1719578275.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719578273.git.geert+renesas@glider.be>
References: <cover.1719578273.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.11-tag1

for you to fetch changes up to 0aea2e4bbc584dd92e0483a6d249f11054a8923c:

  soc: renesas: rcar-fuse: Remove unneeded semicolon (2024-06-28 09:32:33 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.11

  - Add R-Car fuse driver.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: fuse: Document R-Car E-FUSE / PFC
      dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
      soc: renesas: Add R-Car fuse driver

Yang Li (1):
      soc: renesas: rcar-fuse: Remove unneeded semicolon

 .../bindings/fuse/renesas,rcar-efuse.yaml          |  55 ++++++
 .../devicetree/bindings/fuse/renesas,rcar-otp.yaml |  38 ++++
 drivers/soc/renesas/Kconfig                        |   8 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/rcar-fuse.c                    | 201 +++++++++++++++++++++
 include/linux/platform_data/rcar_fuse.h            |  11 ++
 include/linux/soc/renesas/rcar-fuse.h              |  41 +++++
 7 files changed, 355 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
 create mode 100644 drivers/soc/renesas/rcar-fuse.c
 create mode 100644 include/linux/platform_data/rcar_fuse.h
 create mode 100644 include/linux/soc/renesas/rcar-fuse.h

