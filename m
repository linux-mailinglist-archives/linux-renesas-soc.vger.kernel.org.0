Return-Path: <linux-renesas-soc+bounces-13487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CCEA3FC94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F280716E094
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4A322A7FC;
	Fri, 21 Feb 2025 16:57:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2D322577C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157062; cv=none; b=MzDBigT/xsFYNcCd3oje+2OxD9kyi+XRJo1WgA2vAImvZrknzzgOpZtPATj8+SxJu7hzJpc9KtMGiJOelJqiu3awBn8YCfBxfl6+aK25YpRAcv5rkyh9Zq68xQPc8K5l7tE8dZMP94yu3A+wn7Fsdbsze53tqe1jDvLSEJwhG/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157062; c=relaxed/simple;
	bh=AYOmPqcxiI2fDrybH4xIrj3aYh+mqWf6obMMpZ1cfQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rSBnDOxC/tcjmTh8awJgW1YrZ13wsu7nNHTxMmY8NENj3UAtMneSz9AzCt88fxKXz3yOMYL7VgWZXolk49EVQLBCQNouZ1T2WG2eSFitiRarPzfvq7tEKmweMNxlJS8tiWwm0tsZ63TOxVBDUfkKsEBTyZxj/5J3XL7ca+9KE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by laurent.telenet-ops.be with cmsmtp
	id GGxX2E00E0y8aK501GxXFY; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsN-3PeM;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOql-0uqo;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM defconfig updates for v6.15
Date: Fri, 21 Feb 2025 17:57:22 +0100
Message-ID: <cover.1740156738.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.15-tag1

for you to fetch changes up to ff5a81e0178e5c032ac9700093f4877632d28c0a:

  ARM: shmobile: defconfig: Supplement DTB with ATAG information (2025-02-03 11:03:40 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.15

  - Supplement DTB with ATAG information, for older boards.

----------------------------------------------------------------
Niklas Söderlund (1):
      ARM: shmobile: defconfig: Supplement DTB with ATAG information

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

