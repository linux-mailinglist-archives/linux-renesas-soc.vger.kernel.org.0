Return-Path: <linux-renesas-soc+bounces-12145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD3A11BC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 09:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE8D3A8A0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 08:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A06B1FE44E;
	Wed, 15 Jan 2025 08:22:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF55C1EBFE8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929351; cv=none; b=KXSckr0x85HmGq8D+6X8YjMictCf1RjIw+dkD6nfH6hilV2i8rev6jGIOYOrP17cPWXyS5EfPNsID2I5112G8q/iIWUhEjzTGvO0JlH5x/UuFvEYsv2hW6LbJSMpvcOaxb2fwDHSeD0qKKvDQ0Rb5uhLNvSQNZLDV1KKn31lhrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929351; c=relaxed/simple;
	bh=Rd7lNU9y4AuP69qNaW527V9DXUPmiFQLmoG5T66xt08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MX03G2xGHob8NvdrxpcXVR+Kwy1eRRaydhJoXWSuMeu9DrIatQ2IkT7yGnakvUIWNx8N58XsD4x1PsU/TFXP4vAS1ogMar3WzILHj73Crr+NtglBrmXT0WktupFr/tbgx7xsYshWdIpVTeCd8y2xemwvpmy7IZ7tULK5Oti5DIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YXzWQ4R2kz4x5kL
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 09:22:26 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6d1:f8d8:e962:cd35])
	by xavier.telenet-ops.be with cmsmtp
	id 1LNK2E0051NY9Yg01LNKoq; Wed, 15 Jan 2025 09:22:19 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tXyfG-0000000CWql-0tN3;
	Wed, 15 Jan 2025 09:22:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tXyfK-00000003PzV-4C2Z;
	Wed, 15 Jan 2025 09:22:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.14 (take three)
Date: Wed, 15 Jan 2025 09:22:13 +0100
Message-ID: <cover.1736928826.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 829356da700bbe07e13b4403997bf8c5aac64660:

  pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC (2025-01-03 21:09:19 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.14-tag3

for you to fetch changes up to accabfaae0940f9427c782bfee7340ce4c15151c:

  pinctrl: renesas: rzg2l: Fix PFC_MASK for RZ/V2H and RZ/G3E (2025-01-14 09:22:48 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.14 (take three)

  - Fix PFC_MASK for RZ/V2H and RZ/G3E.

This late PR is a fix for an issue which does not show up yet (because
the boot loader does the right configuration), but which may show up
when more device support is added to the DTS.  Hence it is better to fix
it sooner rather than later.

Thanks for pulling!
----------------------------------------------------------------
Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Fix PFC_MASK for RZ/V2H and RZ/G3E

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

