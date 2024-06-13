Return-Path: <linux-renesas-soc+bounces-6174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D709907C77
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 21:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3836B1F258BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 19:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653A7155345;
	Thu, 13 Jun 2024 19:18:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63B154430
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 19:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306300; cv=none; b=Pd+iX3ZbPQIH7OEe8TXoItHhj7ucvOcpHtlFtyiHLonzKq7IHDFxq39ZkaGVpWREa5qd4cUV3ICsWGWX877tBv7jWuv4VkXjiPRIUZRWlHSLXrEDjXX8Ve3UB1onasjXFu0qP0quirCkNUxlPUNt3TwXlDdnLlreCAhjFN0PiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306300; c=relaxed/simple;
	bh=UxAu9ZpRkWvWbNN1J/6zVy6HrV4IEqX1PYFL/kiWvDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MRqPBDM7TYiJCaRbmPXvsfZ+ZMTL6ll/Ib/F3XwapzBNezjgIW4QB0xK9W4CCH7A7zmAWyx8/P/pZyjasmt6E0PEbRInls20y0LA4HbGESQcng0DzjR6aJ4sjNtSKR+HLmxo736Nfgix2NAoS7xsUXMILGy1tlx5zdPUlJDVokU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by albert.telenet-ops.be with bizsmtp
	id b7J62C00K3w30qz067J6PC; Thu, 13 Jun 2024 21:18:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpwS-00Ax6q-EI;
	Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHpxW-00FL8b-F6;
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
Subject: [PATCH v2 3/7] lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if DRM_PANIC
Date: Thu, 13 Jun 2024 21:18:01 +0200
Message-Id: <ac474c6755800e61e18bd5af407c6acb449c5149.1718305355.git.geert+renesas@glider.be>
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

When CONFIG_FONTS ("Select compiled-in fonts") is not enabled, the user
should not be asked about any fonts.  However, when CONFIG_DRM_PANIC is
enabled, the user is still asked about the Sparc console 12x22 and
Terminus 16x32 fonts.

Fix this by moving the "|| DRM_PANIC" to where it belongs.
Split the dependency in two rules to improve readability.

Fixes: b94605a3889b9084 ("lib/fonts: Allow to select fonts for drm_panic")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 lib/fonts/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
index befcb463f7381d1a..3ac26bdbc3ff01a3 100644
--- a/lib/fonts/Kconfig
+++ b/lib/fonts/Kconfig
@@ -105,7 +105,8 @@ config FONT_SUN8x16
 
 config FONT_SUN12x22
 	bool "Sparc console 12x22 font (not supported by all drivers)"
-	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
+	depends on !SPARC && FONTS
 	help
 	  This is the high resolution console font for Sun machines with very
 	  big letters (like the letters used in the SPARC PROM). If the
@@ -113,7 +114,8 @@ config FONT_SUN12x22
 
 config FONT_TER16x32
 	bool "Terminus 16x32 font (not supported by all drivers)"
-	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
+	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
+	depends on !SPARC && FONTS || SPARC
 	help
 	  Terminus Font is a clean, fixed width bitmap font, designed
 	  for long (8 and more hours per day) work with computers.
-- 
2.34.1


