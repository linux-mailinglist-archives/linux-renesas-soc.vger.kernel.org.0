Return-Path: <linux-renesas-soc+bounces-5520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0728D01D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE56D294790
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70E713A250;
	Mon, 27 May 2024 13:35:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E31E893
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816952; cv=none; b=OdK9tu8buHewXK2dj6GuI5ixzz38HcLNB2OahXwoMZ/L83KOJYdEJ3h4Hr3FS6f+ZPkJu9ApMvkmIcOAsG8thV9SZZvnDwM4VJBtb1Cv/68VXLD3TXctnQu8OJYx8RXVoMOgHtNva005+WVwNRAfHgtHDsnCXX/mdhCwFv4/Pwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816952; c=relaxed/simple;
	bh=h3pY6Ez4Djie0sm9/S0CRxDGj/eKPgLTiHMVYL9ejko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EYQLf2FKC99HjNkrGI6BDWQni9r2IQYGjf/GbWqlmRIU9L91pPT3HVq8OnC17YHqLyw4kzEo7FijZJ0IakOlG1no6n1wfNXobAAoRk8NvonvnXzn9i0lploZsoKPa71fsgTc8VouZ0X8pJH8DDvb2rPr2EaWo+E76DZ8pgzFOXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c993:5573:f894:7353])
	by andre.telenet-ops.be with bizsmtp
	id UDbq2C00T2nC7mg01DbqjB; Mon, 27 May 2024 15:35:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sBaV2-00CmUx-Oo;
	Mon, 27 May 2024 15:35:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sBaVy-003xeh-G3;
	Mon, 27 May 2024 15:35:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: renesas: rcar-du: Add drm_panic support for non-vsp
Date: Mon, 27 May 2024 15:35:49 +0200
Message-Id: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the drm_panic module for DU variants not using the
VSP-compositor, to display a message on the screen when a kernel panic
occurs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Koelsch (R-Car M2-W).

Support for DU variants using the VSP-compositor is more convoluted,
and left to the DU experts.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
index e445fac8e0b46c21..c546ab0805d656f6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
@@ -680,6 +680,12 @@ static const struct drm_plane_helper_funcs rcar_du_plane_helper_funcs = {
 	.atomic_update = rcar_du_plane_atomic_update,
 };
 
+static const struct drm_plane_helper_funcs rcar_du_primary_plane_helper_funcs = {
+	.atomic_check = rcar_du_plane_atomic_check,
+	.atomic_update = rcar_du_plane_atomic_update,
+	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
+};
+
 static struct drm_plane_state *
 rcar_du_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
@@ -812,8 +818,12 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
 		if (ret < 0)
 			return ret;
 
-		drm_plane_helper_add(&plane->plane,
-				     &rcar_du_plane_helper_funcs);
+		if (type == DRM_PLANE_TYPE_PRIMARY)
+			drm_plane_helper_add(&plane->plane,
+					     &rcar_du_primary_plane_helper_funcs);
+		else
+			drm_plane_helper_add(&plane->plane,
+					     &rcar_du_plane_helper_funcs);
 
 		drm_plane_create_alpha_property(&plane->plane);
 
-- 
2.34.1


