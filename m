Return-Path: <linux-renesas-soc+bounces-30537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHgnIkTzx2lMfQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:27:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0556034EE11
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BDE23015C96
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 15:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB17B34751C;
	Sat, 28 Mar 2026 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViJBSHXv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C132B99F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711459; cv=none; b=gLUP8+Pdkp4dzPJoplJZrPTbRzoGnjbapevv5kabi3RJk6SrGlNCa5GTWwGhGOH4KK17BbOoyAq97cYPauv8kNDi77j9CpyEh8nvdP43xw6tPVAud+umLW/VlFLAK9xm2C6uQDn6Y1HBgFz0nZM7HwP5a1eyE9t4TIiR42cCVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711459; c=relaxed/simple;
	bh=RJe9GzRsVnP9RgGUrpNPFKt+FZ5gT6tjolAsDsfcPn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrsYWEJ985Hxf3phuuJ84idvIGHctOjcTZT0t4h02mPVwTS6wBIAutoLLglDeRHrFvivB3bNRihezO6ep5b2247f+RNZ0cG3nOaCwRKIiHd0WQfWFRHD/ONV6klm3xMvxIPmx7IFNSwz6X0/Dj7qFEk0uISuDyqxrlLpmSjptxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViJBSHXv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8f9568e074so462506566b.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711455; x=1775316255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X4Hw21VVlfFhBGvSzfDwQVT4JNcMNCdD8bUyasxiZU=;
        b=ViJBSHXvlnxcZRbV6cpoqW8NXKfZ9EsoJeB+BX4PYz/NPDC+0MUwhBlujKKZPYK+lc
         Gz/3/WyULZRxeIgK0yEgP/QbtyGlTVsblTwgUR9K5w9mUeB5Wvcm8Pz/G2sYftOBpnU0
         PEwOx2Nk2WV4HcgNtD81f9vLIlHjS0pSuU3MuHJ+PMGTxYXO+yg5EXJA53tKgk2SJuOD
         fspGc0rodEDBARVBxEBOJUIpvtXr3wQf5nEAIfa9rC8Gpi92dlA0YBH1qug2XcjzKKru
         dvrCDp52xCXVUyxH4GWRc1Zrv8OK0W/Y4fKWQ97LtTy1gsCI5xO3rbGmPrlCyWVRVEeE
         tkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711455; x=1775316255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X4Hw21VVlfFhBGvSzfDwQVT4JNcMNCdD8bUyasxiZU=;
        b=Ya0R7diuum/k1UdLTncHFwiISsPfX06BNgsmxFjz92agSr2pt+PNHymiyNVqGXalNd
         uo1lQJtobN5HQRjAtN+H6NNyVcDUDhSxOtJYFbbXxySrX1YPt8XQJ8+MA2Xaz5EOUGY5
         hCcK8VQKznxZ/shfg0RoFfMOxX0Er4Hp+XgtqtGR5lM72naEZLXF8DLZ3YEcfNSI651C
         kXsYMSWZOgupgSBuyiuvK8V2R+C4+KTsdbafgCZwDSmxFCx3RK3DPgvDGT63HpRPCiLG
         LZ8M7T7/Kff5mI4mUS/qaTg3oDtyxbCU3TSeBhONOA6V0xkupk2b1nEx88B9oEk3WmzM
         tVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxYKGX3vKOmmX8WdQ2UOvua4BQ04bJ7+To0Ii9uKGZt+bosaYMLfdtLOXY2xlwGr7kgTRYdVfjQfgDKRLWhRFJmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybyUUEVV/ryxMk+vFLMKCMJVUfdycxKe114wJacK/BXYUDoYmg
	2Kz0QS3g5zrhKGrC+YE9LjlQYDGNhjNJmi/1t2Jsd6UaEsVtNYNCVeC4ufJKRdCaPBY=
X-Gm-Gg: ATEYQzw/jDTD/adPlQeMus6yRkvRSa6hYd2wwr9xqbdGG80/CJNJoSUZq7BKDZC0WaN
	6ow9PN/q+4JxOoEy5DIjNaJ95KFvmnli2HjmnR3c+Ua9Vnxlx8peSuu18zdLAOO2ic1lpuzxq8/
	jwB9xehb9DqFgJyFeG9qxwT9FylU1A3TkAQZ6LqkCwcLwT8bsw2PMbTsWEbTArCTvTs4/YefVSv
	Bb3ensAOiQO7gdlIaKLTfMZx6LUngPPBUWO+yiILyeN/fpoZrfkIjmwtVJ3CUwb3w93KBjdhqoe
	s71FEx0jK4mKpfK4NecUicoAmKwyXPtlgzkwAI6uoJLV9bQoxNn0Rjdxm2eM3dmvZuY9b4B0ZLS
	gkIKJpeWbngnppF2DuKoa/VyqAzF2r+ECgHaxNlCruymZVy+P3b5DbuV2PZkQuqQY9UwgMlEXWw
	x8oYMfUtd527vW52Ssl5jDGJAaoWLeC3q6lTDTkYnC5c5p7Dp+A3H+nNB1IY9tEjNwV6ezagmvT
	7c9Ji2o/PP+fOvbJIB99bQPwyXlx4uviM+MhkqUAvxe464=
X-Received: by 2002:a05:600c:4e15:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-48727d5a16fmr96169455e9.5.1774704568187;
        Sat, 28 Mar 2026 06:29:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e1de:7c03:e16f:8136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e265fsm5369110f8f.1.2026.03.28.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 06:29:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 1/2] media: i2c: ov5645: Report streams using frame descriptors
Date: Sat, 28 Mar 2026 13:29:01 +0000
Message-ID: <20260328132902.776757-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-30537-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 0556034EE11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3 [0],
- Added a macro for the source pad index.
- Updated ov5645_init_state() to use the new macro.

[0] https://lore.kernel.org/all/20241018153230.235647-9-prabhakar.mahadev-lad.rj@bp.renesas.com/

Hi Laurent,

Ive restored your RB tag with the above changes. Please let me know if
you have any further comments.
Cheers,
Prabhakar
---
 drivers/media/i2c/ov5645.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index b10d408034a1..df9001fce44d 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -28,6 +28,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
@@ -68,6 +69,8 @@ static const char * const ov5645_supply_name[] = {
 
 #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
 
+#define OV5645_PAD_SOURCE	0
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -817,6 +820,29 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 	.s_ctrl = ov5645_s_ctrl,
 };
 
+static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	memset(fd->entry, 0, sizeof(fd->entry));
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
+
+	return 0;
+}
+
 static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -897,7 +923,7 @@ static int ov5645_init_state(struct v4l2_subdev *subdev,
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
+		.pad = OV5645_PAD_SOURCE,
 		.format = {
 			.code = MEDIA_BUS_FMT_UYVY8_1X16,
 			.width = ov5645_mode_info_data[1].width,
@@ -988,6 +1014,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
+	.get_frame_desc = ov5645_get_frame_desc,
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
-- 
2.53.0


