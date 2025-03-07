Return-Path: <linux-renesas-soc+bounces-14145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A4A56C82
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 16:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98D7188F5A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 15:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3288421D008;
	Fri,  7 Mar 2025 15:48:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E9194C78
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362491; cv=none; b=c3qa8M1kep9+lzGZJqW0ySyKvFFtsQrLTZPe4G40v0Yt6eOUtUeEU4Pp2GLRTDzvHAWfH3PiyIKtl9KmDB759rYxhn7JAp21ARJTeVz91b1ScmBJeR1aj0arN9xLXGAde1HXpyRnkWU+8LVhtxn3HD1FhItCpyIfF4G/epoMTU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362491; c=relaxed/simple;
	bh=DOsj7nEOuzETluVCrKZYnhe2iQa3sgQWkcgQfOPCCKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyh1oJ+JGrrOPPhUSo2K0u7aqywdi15wKCcIuTOppMVexjesA0Hv9d27DO6/9T7bG0Fc6GwLDlCET7pVzO3PIpKEwn9IWLUp1I52pTKSMYc9oGz9uslnfEFdW1A9WIr5lAaHujPt2NENJRgPMv9+TnMkQ7rVxarOZ8kN4qm9MkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Z8W0063WVz4wwjK
	for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Mar 2025 16:48:00 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d269:b36f:7a12:a76f])
	by andre.telenet-ops.be with cmsmtp
	id Mrnt2E0042m8Uyj01rntjQ; Fri, 07 Mar 2025 16:47:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZv9-0000000DBku-3Z9o;
	Fri, 07 Mar 2025 16:47:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZvU-00000009ssk-41VH;
	Fri, 07 Mar 2025 16:47:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.15 (take two)
Date: Fri,  7 Mar 2025 16:47:51 +0100
Message-ID: <cover.1741362226.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit ea4065345643f3163e812e58ed8add2c75c3ee46:

  pinctrl: renesas: rzg2l: Suppress binding attributes (2025-02-20 17:33:08 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.15-tag2

for you to fetch changes up to abcdeb4e299a11ecb5a3ea0cce00e68e8f540375:

  pinctrl: renesas: rza2: Fix missing of_node_put() call (2025-03-06 16:41:46 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.15 (take two)

  - Add missing of_node_put() calls.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (3):
      pinctrl: renesas: rzg2l: Fix missing of_node_put() call
      pinctrl: renesas: rzv2m: Fix missing of_node_put() call
      pinctrl: renesas: rza2: Fix missing of_node_put() call

 drivers/pinctrl/renesas/pinctrl-rza2.c  | 2 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 2 ++
 3 files changed, 6 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

