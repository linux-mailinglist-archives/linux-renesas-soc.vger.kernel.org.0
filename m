Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A637E3DC254
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 03:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhGaBdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 21:33:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhGaBdB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 21:33:01 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B35042A3;
        Sat, 31 Jul 2021 03:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695175;
        bh=t/az+L7jVGOpqWutFhPkj5SbAHGUlT9F8I1swd7hYQ8=;
        h=From:To:Cc:Subject:Date:From;
        b=F0ItPTTZuZc6nUwO4JPE/nWEs8sxs21RaMMuTsIZQI8TrhbQ2OfZcEiFgR8SqLjHw
         O9EsXf1oCg4Hg4d6FtV80E/MCh2hlLSpKn3AuonJlrM16cWiokkbcLdrP1kVZC4pCA
         CliJ2q7Hyn/6VeOU4i1hZb/89jRmySGIEwDkXuPI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] drm: property: Replace strncpy() with strscpy_pad()
Date:   Sat, 31 Jul 2021 04:32:41 +0300
Message-Id: <20210731013241.11656-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

strncpy() is widely regarded as unsafe due to the fact that it may leave
the destination string without a nul-termination when the source string
size is too large. When compiling the kernel with W=1, the gcc warns
about this:

drivers/gpu/drm/drm_property.c: In function ‘drm_property_create’:
drivers/gpu/drm/drm_property.c:130:2: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
  130 |  strncpy(property->name, name, DRM_PROP_NAME_LEN);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are three occurrences of strncpy() in drm_property.c. None of them
are actually unsafe, as the very next line forces nul-termination of the
destination buffer. The warning is thus a false positive, but adds noise
to the kernel log. It can easily be silenced by using strscpy_pad()
instead. Do so.

One of the three occurrences, in drm_property_add_enum(), fills a char
array that is later copied to userspace with copy_to_user() in
drm_mode_getproperty_ioctl(). To avoid leaking kernel data,
strscpy_pad() is required. Similarly, a second occurrence, in
drm_mode_getproperty_ioctl(), copies the string to an ioctl data buffer
that isn't previously zero'ed, to strscpy_pad() is also required. The
last occurrence, in drm_property_create(), would be safe to replace with
strscpy(), as the destination buffer is copied to userspace with
strscpy_pad(). However, given that this isn't in a hot path, let's avoid
future data leaks in case someone copies the whole char array blindly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_property.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 27c824a6eb60..32404891446e 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -127,8 +127,7 @@ struct drm_property *drm_property_create(struct drm_device *dev,
 	property->num_values = num_values;
 	INIT_LIST_HEAD(&property->enum_list);
 
-	strncpy(property->name, name, DRM_PROP_NAME_LEN);
-	property->name[DRM_PROP_NAME_LEN-1] = '\0';
+	strscpy_pad(property->name, name, DRM_PROP_NAME_LEN);
 
 	list_add_tail(&property->head, &dev->mode_config.property_list);
 
@@ -421,8 +420,7 @@ int drm_property_add_enum(struct drm_property *property,
 	if (!prop_enum)
 		return -ENOMEM;
 
-	strncpy(prop_enum->name, name, DRM_PROP_NAME_LEN);
-	prop_enum->name[DRM_PROP_NAME_LEN-1] = '\0';
+	strscpy_pad(prop_enum->name, name, DRM_PROP_NAME_LEN);
 	prop_enum->value = value;
 
 	property->values[index] = value;
@@ -475,8 +473,7 @@ int drm_mode_getproperty_ioctl(struct drm_device *dev,
 	if (!property)
 		return -ENOENT;
 
-	strncpy(out_resp->name, property->name, DRM_PROP_NAME_LEN);
-	out_resp->name[DRM_PROP_NAME_LEN-1] = 0;
+	strscpy_pad(out_resp->name, property->name, DRM_PROP_NAME_LEN);
 	out_resp->flags = property->flags;
 
 	value_count = property->num_values;
-- 
Regards,

Laurent Pinchart

