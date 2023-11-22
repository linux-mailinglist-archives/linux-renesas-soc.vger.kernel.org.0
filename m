Return-Path: <linux-renesas-soc+bounces-82-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F97F3CE1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 05:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83C36280C4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 04:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D9811C9E;
	Wed, 22 Nov 2023 04:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E+/79NUV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71515193;
	Tue, 21 Nov 2023 20:30:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 142FF1716;
	Wed, 22 Nov 2023 05:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627393;
	bh=Buh6B7v7m6WMMheOju8idTRbqhem5vve85VBKjdM0fE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+/79NUVt6fbeM10zZfkKQYi0ima6Vnq2d1DSfaW0CvwAAw41AQA88mzSQKyuJtSe
	 qdjKu0G+Tv2qd0soYSRBFN9M+7GAJupRXQ7Cwsks/Z/JDesUJNYcKFCZImvtyUzyVW
	 YUPZiFgeGN53CPFbUTwKzfDn9/EthNEMIqYVoCzw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 15/19] media: renesas: vsp1: Name parameters to entity operations
Date: Wed, 22 Nov 2023 06:30:05 +0200
Message-ID: <20231122043009.2741-16-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl complains when function arguments are not named:

WARNING: function definition argument 'struct vsp1_entity *' should also have an identifier name
+       void (*configure_stream)(struct vsp1_entity *,

In preparation for reworking some of the vsp1_entity_operations
functions, fix the warnings for the existing ones.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_entity.h | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index f67f60677644..42000d6e2530 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -77,20 +77,27 @@ struct vsp1_route {
  *		configuration.
  */
 struct vsp1_entity_operations {
-	void (*destroy)(struct vsp1_entity *);
-	void (*configure_stream)(struct vsp1_entity *, struct vsp1_pipeline *,
-				 struct vsp1_dl_list *, struct vsp1_dl_body *);
-	void (*configure_frame)(struct vsp1_entity *, struct vsp1_pipeline *,
-				struct vsp1_dl_list *, struct vsp1_dl_body *);
-	void (*configure_partition)(struct vsp1_entity *,
-				    struct vsp1_pipeline *,
-				    const struct vsp1_partition *,
-				    struct vsp1_dl_list *,
-				    struct vsp1_dl_body *);
-	unsigned int (*max_width)(struct vsp1_entity *, struct vsp1_pipeline *);
-	void (*partition)(struct vsp1_entity *, struct vsp1_pipeline *,
-			  struct vsp1_partition *, unsigned int,
-			  struct v4l2_rect *);
+	void (*destroy)(struct vsp1_entity *entity);
+	void (*configure_stream)(struct vsp1_entity *entity,
+				 struct vsp1_pipeline *pipe,
+				 struct vsp1_dl_list *dl,
+				 struct vsp1_dl_body *dlb);
+	void (*configure_frame)(struct vsp1_entity *entity,
+				struct vsp1_pipeline *pipe,
+				struct vsp1_dl_list *dl,
+				struct vsp1_dl_body *dlb);
+	void (*configure_partition)(struct vsp1_entity *entity,
+				    struct vsp1_pipeline *pipe,
+				    const struct vsp1_partition *partition,
+				    struct vsp1_dl_list *dl,
+				    struct vsp1_dl_body *dlb);
+	unsigned int (*max_width)(struct vsp1_entity *entity,
+				  struct vsp1_pipeline *pipe);
+	void (*partition)(struct vsp1_entity *entity,
+			  struct vsp1_pipeline *pipe,
+			  struct vsp1_partition *partition,
+			  unsigned int index,
+			  struct v4l2_rect *window);
 };
 
 struct vsp1_entity {
-- 
Regards,

Laurent Pinchart


