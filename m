Return-Path: <linux-renesas-soc+bounces-6458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015C90E0A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 02:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1AFCB2135B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 00:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2B64A1D;
	Wed, 19 Jun 2024 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QYEMK8T8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E479E0;
	Wed, 19 Jun 2024 00:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756287; cv=none; b=G5RS31yLMCfrnnGQSvAvUZWrFEzPHSTojTRTk5NDfgUJZZ4lTU2i8j/0m9r1Fdsvj6/f2fnAIkjdHgpytA4c0v+H6te6T6h5ULE3dijtvzZj9akLdHzVjePAYvBvogCferVn3l5SwwuiOEVp8whPQouoRWiik2omVFT1GuaT8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756287; c=relaxed/simple;
	bh=6qXtUTwnj469Cr3TWoelf13fjkf+UUMQS8aVXWRa2iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kvcx3aiZkDK9Ytoo+gAjBBTm2gZxN98wfsOaI6JHR7bEDY+QZqM1b32rjXcMZjvikKnbay04R5SwGmXNEmMee/BpH6god5q7ycrGFfqLBHZdx360tAtoAVxj89cwChzBRb3cxy0l2gytmocGcRQ2aXsG9Bmleuwxy+kV1XKg5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QYEMK8T8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9EF21277;
	Wed, 19 Jun 2024 02:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756262;
	bh=6qXtUTwnj469Cr3TWoelf13fjkf+UUMQS8aVXWRa2iw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYEMK8T8v6pyYabMpM2d/E9g0SfgYIR9FGAIQik5ixg8oYjoxBCnXtf/1jd3zyWs+
	 spKZ1gvcmnaqAY+jVw6nZQ+XIkopHPQpGstt34m4WPL6QlptbzCiJ60aDjvZhCf3Wo
	 LbMB7agJFpIZioeHtprur/py3tTP0GkuDiotiUiA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 11/19] media: renesas: vsp1: Add and use function to dump a pipeline to the log
Date: Wed, 19 Jun 2024 03:17:14 +0300
Message-ID: <20240619001722.9749-12-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is useful for debugging purpose to dump a vsp1_pipeline to the kernel
log. Add a new function to do so, and use it when initializing the video
and DRM pipelines.

As __vsp1_pipeline_dump() needs to construct the log message
iteratively, it uses pr_cont(...) (exact equivalent to the more verbose
"printk(KERN_CONT ..."). The function thus can't use dev_dbg() to log
the initial part of the message, for two reasons:

- pr_cont() doesn't seem to work with dev_*(). Even if the format string
  passed to dev_*() doesn't end with a '\n', pr_cont() starts a new line
  in the log. This behaviour doesn't seem to be clearly documented, and
  may or may not be on purpose.

- Messages printed by dev_dbg() may be omitted if dynamic debugging is
  enabled. In that case, the continuation messages will still be
  printed, leading to confusing log messages.

To still benefit from the dynamic debug infrastructure, we declare a
vsp1_pipeline_dump() macro that uses _dynamic_func_call() when dynamic
debugging is enabled. The whole vsp1_pipeline_dump() call can be
selected at runtime. The __vsp1_pipeline_dump() function then uses a
plain "printk(KERN_DEBUG ...)" to print the message header using the
debug log level, and pr_cont() to print the rest of the message on the
same line.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  5 +++++
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 22 +++++++++++++++++++
 .../media/platform/renesas/vsp1/vsp1_pipe.h   | 19 ++++++++++++++++
 .../media/platform/renesas/vsp1/vsp1_video.c  | 10 ++++++++-
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 3954c138fa7b..1aa59a74672f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -733,6 +733,8 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 	if (ret < 0)
 		goto unlock;
 
+	vsp1_pipeline_dump(pipe, "LIF setup");
+
 	/* Enable the VSP1. */
 	ret = vsp1_device_get(vsp1);
 	if (ret < 0)
@@ -906,6 +908,9 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
 	}
 
 	vsp1_du_pipeline_setup_inputs(vsp1, pipe);
+
+	vsp1_pipeline_dump(pipe, "atomic update");
+
 	vsp1_du_pipeline_configure(pipe);
 
 done:
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index f7701c5ff492..b45e1b4eb5a1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -301,6 +301,28 @@ void vsp1_pipeline_init(struct vsp1_pipeline *pipe)
 	pipe->state = VSP1_PIPELINE_STOPPED;
 }
 
+void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
+			  const char *msg)
+{
+	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
+	struct vsp1_entity *entity;
+	bool first = true;
+
+	printk(KERN_DEBUG "%s: %s: pipe: ", dev_name(vsp1->dev), msg);
+
+	list_for_each_entry(entity, &pipe->entities, list_pipe) {
+		const char *name;
+
+		name = strchrnul(entity->subdev.name, ' ');
+		name = name ? name + 1 : entity->subdev.name;
+
+		pr_cont("%s%s", first ? "" : ", ", name);
+		first = false;
+	}
+
+	pr_cont("\n");
+}
+
 /* Must be called with the pipe irqlock held. */
 void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
 {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index c1f411227de7..46a82a9f766a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -9,6 +9,7 @@
 #ifndef __VSP1_PIPE_H__
 #define __VSP1_PIPE_H__
 
+#include <linux/dynamic_debug.h>
 #include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
@@ -142,6 +143,24 @@ struct vsp1_pipeline {
 void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
 void vsp1_pipeline_init(struct vsp1_pipeline *pipe);
 
+void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
+			  const char *msg);
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || \
+	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+#define vsp1_pipeline_dump(pipe, msg)			\
+	_dynamic_func_call("vsp1_pipeline_dump()", __vsp1_pipeline_dump, pipe, msg)
+#elif defined(DEBUG)
+#define vsp1_pipeline_dump(pipe, msg)			\
+	__vsp1_pipeline_dump(NULL, pipe, msg)
+#else
+#define vsp1_pipeline_dump(pipe, msg)			\
+({							\
+	if (0)						\
+		__vsp1_pipeline_dump(NULL, pipe, msg);	\
+)}
+#endif
+
 void vsp1_pipeline_run(struct vsp1_pipeline *pipe);
 bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe);
 int vsp1_pipeline_stop(struct vsp1_pipeline *pipe);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 2c0e10df8f3e..10a0485abc6c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -526,11 +526,19 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 static int vsp1_video_pipeline_init(struct vsp1_pipeline *pipe,
 				    struct vsp1_video *video)
 {
+	int ret;
+
 	vsp1_pipeline_init(pipe);
 
 	pipe->frame_end = vsp1_video_pipeline_frame_end;
 
-	return vsp1_video_pipeline_build(pipe, video);
+	ret = vsp1_video_pipeline_build(pipe, video);
+	if (ret)
+		return ret;
+
+	vsp1_pipeline_dump(pipe, "video");
+
+	return 0;
 }
 
 static struct vsp1_pipeline *vsp1_video_pipeline_get(struct vsp1_video *video)
-- 
Regards,

Laurent Pinchart


