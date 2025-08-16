Return-Path: <linux-renesas-soc+bounces-20578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E2B28F08
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 17:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9EF91CC5EEB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 15:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3222FABFD;
	Sat, 16 Aug 2025 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3Qlr/sA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCB72F9C50
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357587; cv=none; b=l/DNhBgdSYT77XwmYpoLt76ZuXtI4+ZvLqKsjVJWK8HdUUed0BungNnIS7aVjUX+Pd48KF2/5DzRk2Hwkr+fWWL7hLTU7YKN7cSq8MGI1m2KF9Myo5w21lUul96l9WwQ5TP6TLIJKTmahNm0Ws/ekw+OcQP7+oIYft/DLbOl++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357587; c=relaxed/simple;
	bh=FAStH94G7STx9dmih1BwY2moi+ekwJevO6V7oZLap5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qBgI0SvyEQ3xc8vSVATe5VyjeF2HhmsGf50PDtlGBst0A5BQRccR/pWDym3fjdoueZpr73vjpMUNLNNhM2V9xhXr2fLzdVEW3zXBWe+JxMUDPqOFmYccEsBinTKFkJzXmPBTe0hBa+lsr+2FCjdyZKWN8LNMMfYceBvYr2VSbNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3Qlr/sA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3ALVc015783
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=; b=P3Qlr/sAPTtXhNia
	iUQgs6sum8tN8E2pMz7a8TWihY4KgSewQaxH/ZJfgrXZ/PY5pEOd6sL0FyqPO2ao
	EzUb0Qr0R7ABXtB4JPF6KXf+02/u1iWYhU1ZiW0IzksMzTKQEWmWU6u7bYQiY1FP
	TUgzSv4L4ouPTCNd2LzYsZ3B2DLER/+5SadEdM/kMAOlYLhN/irGfubf19o4irlz
	m5NxVwNbLFM7Hg46WPSVzwhrfhZsZk+fNN8A2tUNdN/QhtJ26TI5JVza39u4mAbG
	+cHMw1zhe0173LPmx0Ejm9D9WORqMv8135jgO6eE4GFLFLrgYQYKZLCxSuyjsIIW
	mW1kMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagrvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f5b078bso30247506d6.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 08:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357583; x=1755962383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LiTGbp3yrZlb6BdgcZ8Qpq6CDIhRX/Qyb9HMEmTyzM=;
        b=EDQUOEiNuq6n8jQ3jXRmuOzjvIW0guJzoEIvHZcXi0SsrFqYknG3gCPM68k//W/UuF
         LTgKOBRFGbSugOo1lfOLvBNTN2nNGUl1zioA6pMl+hgKOKkLcZ9c4D63rF/+Pgii04ed
         eDjnkS/3cURy+FFq86cHYOYmQ4WbHqYLAjGtBMfKh077QVMjjl/xtcmaddSM0uCmLeTy
         9mD8J4KqjBr7APSIDXtD922kjCLj/La+2O2Hp+eqORQi/FexhQLoR7jQfmbTgLJe8bul
         Tu+XGd2s+v64yF5CqZcELH48c2HmuR/ZdLDBHwV3toHD9x8wlwFFKtCw5o7QuyB/mahd
         Bt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFKoINt2LE+jAMM8bg2kEok9Z1lbNnd/CZNQwOh0kyo0H+Eys0mbnnbQAQXNd5TQ1yU7mvqLKZStMXbAhz9d7gEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cTyn+u4qvIt/FAirztS609jW0Gsf18c4FcL7K4lY84crjpbG
	d9GoIRDmBTvvou7dpec60mWN5Q51jWTVqICdSBZe6ZYPvC5cIbSls/1Abh/GdGeuL4P9+lZVzsq
	dou53kHvEYuwKIujKzMjSJZOslOgwigQmx9TK8LJYq9lb9QxuUu+s73XCAyE20wWW4DZN9lcfQw
	==
X-Gm-Gg: ASbGncvTEDmfbl+CfvwhmsfMs8NRsZ0ze4TqDPbpI8U8ZeTqe8kScz0lVdvF8clHXqn
	jJsasyFoKgl/ILoZk8Unv7trlEoi0ps5la++DM3IBfHGtO9mgZ7W9fpca1boLM8h8PacTYXOJJg
	MI2rSwiSUJJu9OMkV3tfdk0FrJD5huaqx9tHdv0XzhDK5sHjczEjxlre7tEyOVe2l0hTPVMW2LI
	DUyjEzudH+3n77f9xhti55ySQTrexRx9y1k1cw2wF1R2B5NIpn1s4NPL2kTu21FfxeZEIJ6p/5l
	mKZoPG6Dax3He+CSKnbbffAVtL7+PPkoM/MX1Lz7lp9MOsqT3zn2iBkbg4y0vdvj9hfSx8TIs/6
	Baoqz+QEmLELAF826EghHNrALw4xOqxoqHbhGWhtGDVIHstUXUS1g
X-Received: by 2002:a05:6214:2aae:b0:70b:6e6d:20a with SMTP id 6a1803df08f44-70ba788e6a4mr73534956d6.0.1755357583361;
        Sat, 16 Aug 2025 08:19:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX7AXYCBCRqrmrQsT1LQyM0jWdKsXIc3YtI6BivWlsRGdFHgTuLmmSZBXhNj3Yos1Vch68qQ==
X-Received: by 2002:a05:6214:2aae:b0:70b:6e6d:20a with SMTP id 6a1803df08f44-70ba788e6a4mr73534476d6.0.1755357582786;
        Sat, 16 Aug 2025 08:19:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:19:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:36 +0300
Subject: [PATCH v2 2/8] drm/komeda: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-2-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAStH94G7STx9dmih1BwY2moi+ekwJevO6V7oZLap5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIUlMQQLFiAtbFNdCE7iTeLG5NXVUIOYxXM
 6vF5Guen5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1fS5B/9UEdB+BuXCj2ytlEfQ6Knryb/dViwFtPKUeb5r+e7VL1yRxxxT2kglrR7LNYMiS8Ecly9
 LHIp7j3MT33mN8RC2G81OBI4OYtosKhm7rokBbqmIN41yeqq2u1bJMK8qMo2JqOiK9qcSM9vZ8r
 SPIxl7ppjQ6vU1W5glfl4pxwjQeQvE8Be1Bo6s94TZCPzc7eqIe0BBd6re6aID8AvZkrbDyYVWv
 weP+MlXsuCXqWcP/RTxNkuwcueGDhFU/SuaVfTwJr1pI3asqMrn0GD83quiimxOrlD7Y/6SLA8b
 unH5GSZVhqtU7/2VAXZm3fwx4gf23rPpFp6ql62lXHM9YY54
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a0a190 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=EE5oNXVUeA2ILyHCr4wA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 0khyIIWobxapjmjV5pjZK85JJJqdJ-xb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX1VFt4sOjQLX9
 dsdkgJJcTZcLWl2Xxk+csieQ4J7RJ7vX+degJUN6BcvD2ZGHamdFIc8N9sRygFWOmv/2atHlTYF
 H/An6s4YrT1eMKuSzmVRfPUQQuxr6/fqLU+cdxb0ugiOTg97TQKhruUPol1ehCQPLX0HMU+t27k
 e0TLyXvWn2F2FtMupBr15rPMXuMgx7nEsuBAIbyt3yxguWsYh7DnvqOdGqf8jyIWMS3eDKlIYxR
 DlMBgk/GAVPTLX5yiTlyQYZG4VhmIFOOPX9mAMJDUZSNAnXc1zVQY8XQoXJbF+6dgYIt/crazLC
 31vnTTffoxWqB6uUih6xoP2t4kE8SKCyqPM1QY5lK3nGmDGBZi/uYq1jPTVbifIuq3Smlw/r2rA
 Bgrza7tT
X-Proofpoint-GUID: 0khyIIWobxapjmjV5pjZK85JJJqdJ-xb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9dc97e736049feaa8a1fe1bcc82ff..bcc53d4015f1f27181e977272cdcfa35e970fa62 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc(sizeof(*kwb_conn), GFP_KERNEL);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.2


