Return-Path: <linux-renesas-soc+bounces-6105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C01BB90546E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 15:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6015D1F264AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 13:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA99717E90D;
	Wed, 12 Jun 2024 13:54:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23B17E8F2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200468; cv=none; b=K3JCEtDKEZHQzu6xa/8ogAQrR8cSOtTo7p9A2axNFzlIW2eTr0KeI+aZZSm9bFxz4V/2l024APU9XaqJTqcZHeaXH9o/T3nBtk/WnZE1jTw0DRa3gvrGGwtwWbqeunMpx2zYAb53P8dRH5EwyMgrbEMoTlkDpoAGemPQQX4gLmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200468; c=relaxed/simple;
	bh=QHtiiHlP+5Y6r48ThRNROuC9Vt7FVjxcOdyUmTsjd8k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zx9Xm9S8FTIFcozwEIdW+J19yvUQ4azp0gYpRgSmYC7ZOOji7HRnndG/rtEdqumc14nSYV61SdPZT65mNDk2HuSaVaHTRizhsHuYtUOgn1tqTSk95fvBCVzUTVakuIPLIawF6vwnlb0WfhC9Qt/G6uvlOL9Nqm7Kw/4nE50j7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
	by xavier.telenet-ops.be with bizsmtp
	id aduH2C0053axqkY01duH19; Wed, 12 Jun 2024 15:54:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHOPX-008eJi-SD;
	Wed, 12 Jun 2024 15:54:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHOQa-00EdFe-V0;
	Wed, 12 Jun 2024 15:54:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] drm/panic: Fixes and graphical logo
Date: Wed, 12 Jun 2024 15:54:07 +0200
Message-Id: <cover.1718199918.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

If drm/panic is enabled, a user-friendly message is shown on screen when
a kernel panic occurs, together with an ASCII art penguin logo.
Of course we can do better ;-)
Hence this patch series extends drm/panic to draw the monochrome
graphical boot logo, when available, preceded by the customary fix.

This has been tested with rcar-du.

Thanks for your comments!

Geert Uytterhoeven (3):
  drm/panic: Fix off-by-one logo size checks
  drm/panic: Rename logo to logo_ascii
  drm/panic: Add support for drawing a monochrome graphical logo

 drivers/gpu/drm/drm_panic.c | 81 +++++++++++++++++++++++++++++++++----
 drivers/video/logo/Kconfig  |  2 +
 2 files changed, 75 insertions(+), 8 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

