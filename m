Return-Path: <linux-renesas-soc+bounces-6175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4996D907C79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 21:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6750282F4C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8621553A7;
	Thu, 13 Jun 2024 19:18:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31F130AC8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 19:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306305; cv=none; b=e2XMBV5ufYkiLPerW9XaQk0bLEQo0iyeJ0/GU6vUtEIQuPQwj8bTsJyl3o6EG2jsgKRf/oFIhXlagdmqTFe5pMARqUReU2n0CDF/7HKBuJnenQUUpp43gPNN/Nk/1F/I5tfAbi6abV78jTSHy0RStyMUunpkeFfIN2CImxr6QvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306305; c=relaxed/simple;
	bh=FnN05GM8vDYZMAvxvHkfN+j13yu2M7/BW/pNimOsW8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UAoPi6yNmOMmSob1N9BarP7jJ/L/gsM4FXhG0mEk7dFtZzbxnPLbhgiYJBbvQfpB1GyhskYr+S3Bnvxw82UZl8Q6vhlvWaeFoFltTfvZcQ0LmgzJDPN1TycY+EDGVf5Bn0IfYU70g1aLpIeYHUpM4H2XdqalGVOO1Y7uZrymrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4W0XHq5rH7z4x2Z2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 21:18:15 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by michel.telenet-ops.be with bizsmtp
	id b7J62C00A3w30qz067J6ad; Thu, 13 Jun 2024 21:18:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpwS-00Ax6x-Fm;
	Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpxW-00FL8f-GF;
	Thu, 13 Jun 2024 21:18:06 +0200
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
Subject: [PATCH v2 4/7] drm/panic: Spelling s/formater/formatter/
Date: Thu, 13 Jun 2024 21:18:02 +0200
Message-Id: <5a11f8caf8759aaa22d421034d3047368e9d5f33.1718305355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
References: <cover.1718305355.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a misspelling of "formatter".

Fixes: 54034bebb22fd4be ("drm/panic: Add a kmsg panic screen")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index a9972ce05d7e6fe4..e3c51009d9b476b3 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -138,7 +138,7 @@ config DRM_PANIC_DEBUG
 	  If in doubt, say "N".
 
 config DRM_PANIC_SCREEN
-	string "Panic screen formater"
+	string "Panic screen formatter"
 	default "user"
 	depends on DRM_PANIC
 	help
-- 
2.34.1


