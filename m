Return-Path: <linux-renesas-soc+bounces-14313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C6A5DDD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 14:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138BD1885A09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3932B23A563;
	Wed, 12 Mar 2025 13:20:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8F1EB18C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Mar 2025 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785605; cv=none; b=CgXthNDQ2IgNYDTVnzYZRbLx7ho+525TouMkewz3mBOglSaGicm362AJ44aYmpNBFm3vgjQrPuFhWFCJ5l0c4Kz0USKu1mO7Z8Oc5fGqnmURmD6adqcWuAy0XRk5UED3j0f3wy3hVuBoaBqqHb5WMtF1DKE8ZMO9GLNB5JELZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785605; c=relaxed/simple;
	bh=kNf0Cf+gfA3SraY4l1M3ix+9vGbLWtLRNVOQARgzRv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZoTnfE4ylvbSSYV0fHEdmwRH4FoxKYOTiwKqWQ+8YrDKRsonCBgKE8DTUPTQS+UakFZo/B10ryEv9YDdSMa0oWIb0plrzl8d2Yq+R01fkDl4X5SDcw8dXVaeiry1QwL4OKi8iWnWvrdFIgpr7C5sMgwr/lmAcddUccd7GxE7GFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:bb30:6286:99f4:5b9d])
	by andre.telenet-ops.be with cmsmtp
	id PpKu2E00D4xs17S01pKui4; Wed, 12 Mar 2025 14:19:54 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tsLze-0000000DhMT-1wJ6;
	Wed, 12 Mar 2025 14:19:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tsM01-00000000bbj-3dAr;
	Wed, 12 Mar 2025 14:19:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL] Renesas fixes for v6.14
Date: Wed, 12 Mar 2025 14:19:51 +0100
Message-ID: <cover.1741785482.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.14-tag1

for you to fetch changes up to 379c590113ce46f605439d4887996c60ab8820cc:

  ARM: shmobile: smp: Enforce shmobile_smp_* alignment (2025-03-12 09:15:37 +0100)

----------------------------------------------------------------
Renesas fixes for v6.14

  - Fix possible misalignment breaking SMP bring-up.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: smp: Enforce shmobile_smp_* alignment

 arch/arm/mach-shmobile/headsmp.S | 1 +
 1 file changed, 1 insertion(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

