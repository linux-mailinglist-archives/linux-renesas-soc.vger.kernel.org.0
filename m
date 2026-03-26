Return-Path: <linux-renesas-soc+bounces-30361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGOXMR9DxWkU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:30:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6D336CBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6A9317D3CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BDA3FEB21;
	Thu, 26 Mar 2026 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndIBRqvh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C8D3FEB14
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534890; cv=none; b=ikn65RvXJjKZ1QTUwFB4rzd3AptJxffju1i0UYcECY+aessENIBFEpZ1Rirg29RaXYsgsfoKNsHGdiye7pwZj/qQZUZaWyW95/TnrQ9KYen3CY6fYdk7i9D1ezXu/Sq406UgEP5qQJ2U3oOP73Y9hlW2gk4sF6AKVVUP4fv31v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534890; c=relaxed/simple;
	bh=RJe9GzRsVnP9RgGUrpNPFKt+FZ5gT6tjolAsDsfcPn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqgT71Z9E6erBUWGGUX9BxAcjvoQ6zXnNKcXqRn6ThtxdlIoXw2y2ozAHENLq6688GmBN6k/3Q/qTKUEUy5kK3Q7McDql3lRXEck7hzCw/7nsF+IVt6c+eVi3nVSDa5PFSWbFPvxCVbgZ6z9KC0aUXpuXn9jDzQhn1W5hl3kWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndIBRqvh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so10294875e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534880; x=1775139680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X4Hw21VVlfFhBGvSzfDwQVT4JNcMNCdD8bUyasxiZU=;
        b=ndIBRqvhSgR/rfSMgo4lBh3zXtOUIJf7/saNuIwdqWUqEmlkIoXmSZgBqC8R6cwiq4
         9aQVygocYQpZRDrh+wAHPKUnYNW8t+HZfwKL7yJOnKk4xx/5+2dPF2BykOdIhQ5DALpK
         kc1Kg4dP/PLFh94+JbSgB3LOrftzoT7N56/pEq44jZtXc75mlRfiKy8gGGV58JTkt8L5
         e4y1HMkq7nrpHvhwzkTzgTVO4+2/Fu5GypZUgIAjGc0RQ0AuayDjISpnh56vS2G9GpEp
         V9+NBqWdvRK2NIUMsEV4d8ikfJogbNbuxLUqc8oHijSzgZuq+WP8YRFDmeMZDYJ8VK6e
         fZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534880; x=1775139680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X4Hw21VVlfFhBGvSzfDwQVT4JNcMNCdD8bUyasxiZU=;
        b=i1rQVspNb3A1W+EtphCIF2RHE1iviJHu9eewu28lTDmsIgCt3MWea4k9jhdPaG4SLQ
         B4MOE8Eospv13ibDQKoRx4GEPbLZH7D3ftl3GqteUjU3inFAPWPXmt+5UJ2t8Phbwqnh
         e2i0fIR8lDamG0Uf3eIth6SE0XODrRLZj4GBrk1bklqYo4hXFQdnjz116W7AFRWiqsV1
         LCVlFXy2sNtpxl91K7T+HE6PVA6Jb6CftMgDM7vjINIE9/NhgTge++jY63uZQ04Fxtbg
         V3EoqWJHM/1exjsRpW6f+nw5Q3WO6Lnb201Pzpdy+O4exeLJZzwSeJDK9kNJ2PcGbx3/
         eVqg==
X-Forwarded-Encrypted: i=1; AJvYcCUmYhLzepDZNZmEuHzAy9IslpzRTtOKWKfw87UZk2SMCYqnLEV4QUx6Xo37VPGu309Ax3Y45XvyZXSTLBPTkOw5Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjInH2ep69Pcf4UE6l35VMvmXrOyVTDwgL5IP1ENXnPUf4MWW+
	H2+wUOu6FhUI1eqf3cC2c5AskqznhslcGlTD3flBcfpzuFfU828c6GGI6HQqYfokKBk=
X-Gm-Gg: ATEYQzx6fCosViKgKVdKgvy3EV3amooSQyZdQG1JTOnS1h31qlEN45ApTzvNMxO4Wrx
	767jTNqDrba/5BfwEjv7mVDXtPIUQBo3PXSwg1oSrHEjNzLdBtvVdxLe8nSWKTYs00HGDiOIKbE
	VmzcGxykxp1g2wYXJIU+onEgW3sutgA6Rc63/M4LWrh5Ts6fBbVDGpbX7gHMDUEPpREFNW4s+xi
	/STcMwN15BF2fkW78LuGHqH7r5zL8Px4BsZpiIdN5VL91f3ZL+HBhq71Sa0HIVBwmE3ktvDJD1s
	+5rteptmil03YiFK64it4ZSkJ4HyNZo3WTvwtvOSy1G5lAhmGzfAmhJ0nN2x85H2xWzh96hSixG
	YwW50Ew+v8Ni6mw5t5eR276flrD7YppQiWaaxjh3ZDkmCWq6HsQk01IGhjCrup/+K2Fy/T3BkuX
	1P/r0ZjKLJDpgd18dSiDsqqzmV3m2adrOOF9rk/ReWqopFly619EOVrQUTjP+cWf8U8J66PtgpR
	VMAnQe2JyiGP4/tkGjgZur0J9dIJhGYRJK8Iw==
X-Received: by 2002:a05:600c:37cc:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48715fbfee6mr126722855e9.4.1774534880027;
        Thu, 26 Mar 2026 07:21:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:516a:f94c:8d31:fabd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm63574445e9.2.2026.03.26.07.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:21:19 -0700 (PDT)
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
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/2] media: i2c: ov5645: Report streams using frame descriptors
Date: Thu, 26 Mar 2026 14:21:06 +0000
Message-ID: <20260326142107.297811-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326142107.297811-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260326142107.297811-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-30361-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1EE6D336CBC
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


