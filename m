Return-Path: <linux-renesas-soc+bounces-13485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B13FA3FC93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B430B16E06E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DD222A7F7;
	Fri, 21 Feb 2025 16:57:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84626225408
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157062; cv=none; b=Y/QxuEAuKu6x455FwjDmRi2VfhN6uO8A6v/cVLV7wajOY8S43oNgnNuWgFOeZ1AbMSbYK+uiPY7wLrXHcJA9R4KcWAFA5IFNRhr2RtgwyyVZqLltQ83abDRZ8RU9NIL6fV5Z5QPUBvX/yjdukLfZ4H8KftvWq8NgbYL/k3hCyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157062; c=relaxed/simple;
	bh=sEzbR+8wnxjHYAm+PwwXcksHb5zg62jDZ8nHsC5WBR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5eKJyu9aXTczExO3VP6GIvFuGOF7rHNsiZfZkRMQgI+ZIon7pk1/dsIa/z495On68PURtvaTExBOiC1uN5uG8PN6t2ReFKskhybSefL//CCkKEG+YSlTFNzz/PGfiQ/3+URlRMzeBCuYyEKcgwytguo12QLyht4UOYlKwSvtCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by laurent.telenet-ops.be with cmsmtp
	id GGxX2E00F0y8aK501GxXFZ; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsS-3cAS;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqt-1Ain;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/5] Renesas driver updates for v6.15
Date: Fri, 21 Feb 2025 17:57:24 +0100
Message-ID: <cover.1740156741.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.15-tag1

for you to fetch changes up to 25a5246b0e564d238e917b5a3684171718c950fd:

  soc: renesas: r9a09g057-sys: Add a callback to print SoC-specific extra features (2025-02-20 17:38:33 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.15

  - Add a driver for the System Controller on RZ/G3S, RZ/G3E, and
    RZ/V2H.

----------------------------------------------------------------
Claudiu Beznea (2):
      soc: renesas: Add SYSC driver for Renesas RZ family
      soc: renesas: rz-sysc: Move RZ/G3S SoC detection to the SYSC driver

John Madieu (3):
      soc: renesas: rz-sysc: Add support for RZ/G3E family
      soc: renesas: rz-sysc: Move RZ/V2H SoC detection to the SYS driver
      soc: renesas: r9a09g057-sys: Add a callback to print SoC-specific extra features

 drivers/soc/renesas/Kconfig          |  18 +++++
 drivers/soc/renesas/Makefile         |   4 +
 drivers/soc/renesas/r9a08g045-sysc.c |  23 ++++++
 drivers/soc/renesas/r9a09g047-sys.c  |  67 +++++++++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  |  67 +++++++++++++++++
 drivers/soc/renesas/renesas-soc.c    |  33 +--------
 drivers/soc/renesas/rz-sysc.c        | 137 +++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h        |  46 ++++++++++++
 8 files changed, 363 insertions(+), 32 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a08g045-sysc.c
 create mode 100644 drivers/soc/renesas/r9a09g047-sys.c
 create mode 100644 drivers/soc/renesas/r9a09g057-sys.c
 create mode 100644 drivers/soc/renesas/rz-sysc.c
 create mode 100644 drivers/soc/renesas/rz-sysc.h

