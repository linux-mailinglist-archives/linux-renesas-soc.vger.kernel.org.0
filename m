Return-Path: <linux-renesas-soc+bounces-19844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70359B182DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86792580533
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894C26D4F6;
	Fri,  1 Aug 2025 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1K+SC7z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD1266B67
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056285; cv=none; b=pTST5ieU7cC5TNYXGMIXxvvCmBMEjmguvoczdm1+eSlWWm3gwf4uOBcaVn73P9QWE0YO/vMnW3ZtownLjyVHHGA5RZ+hFkUG+/gluFGs2+34FzZUjOGAgPZhl+26DKTI5Jw11mFhWhXJBFm8oj+F1LPOyQu2S08RaYuRLiqYUVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056285; c=relaxed/simple;
	bh=goFFEhtD/Im3N1nsgGMsKddMGY0uKGtsCO6KqUCkWNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYCnsg0uy4S4NRNgJwCnC3tcTZ05UYKEWqrJBwlhGzY5vnLcsFQlyJpzDOXaZegRHU1wVzSBUI3bB7McdtkUnHOoLljyxAN4VOtE0HOtajWbLBxx8RyMhHsx6ejd2zvkVlV2fXllkD15qPHOF5JRE0Ck/7c/aCqu1FlW9qUGtXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1K+SC7z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571CLDHn001180
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oABhVeMhuZm6PTbnI/8btR4aN+7HYVmKHbDE5K4ACek=; b=A1K+SC7zD6GligY/
	GPqmET/omO6fzaL/xEUI482+gFAiZJThvM9z5pH9qdUiTFXjW5Rs4k3pjBcuyHLu
	N6CzocO6EDUiGpSlSdxWNTDbxPOo8AjShY6chKLTa5bfHzhCW7mgID5CgaX6KCCT
	VuYAUC23I706bpUbkvAexLDnKaFwsA6xbDLOo8eOK0U9H7yUAY4k0cexzk/1rcdc
	idAA8UDogPmeEEHbYVgnE0njWXQi4DbjNXxrzpyPrOPazxYrweuMlI0PJuFiwtL3
	+LA+xfwJkBx/aLuYLww/sTwK2LCTX6gc6fljBzA0V/t1xzv9EbbfSA17DEv7S2id
	w1CFdw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrr7d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70749d4c689so17490976d6.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056281; x=1754661081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oABhVeMhuZm6PTbnI/8btR4aN+7HYVmKHbDE5K4ACek=;
        b=KakPVyWdwT8BlTUhRk9oSoZ+kHL6jvnAv6OUgDd744RIkRQRJF2rYTEfLsWea97ufh
         DqKZPRNkru23cxUZGoYKhezgGr2Lmdr4NZhY/oWBWBAY9stqq95QdlpNv7vj2LTpusv6
         lt0ZlwP/S1Jl5I6vXZgYZQUMl+7/kFGAu8weJxO+v0QyTi84HdPhdR6TndSYFXYn8gL4
         NxGcf6kwZX0XefBnbm9Ak4Q4dopEN8vyusvDlPqvXezsQxj+J2YkuU1eWpB4XWNdqWUP
         p1xBQFuINJjmuPjIVOcQZz6W1iIyZggogDPqDZZUC/Kmoj5BZGwKNWTJZoInhf7tu6iD
         wdcA==
X-Forwarded-Encrypted: i=1; AJvYcCUWLpoL6Hmfipnf9wRQ0UtNo5byCdVejxpS/U2afZr+1m459DtkioGE5jn9buel3AdnBrjNuyYxZ5B9qGb9VbkbMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKKeSt7PQdj+BgtHnRmunwvT5xKbpAwSfRef6FSA3t4JeWoVz
	WYz19wpRZEBTPRyWQrWU3SAxxK4lGiaMCU9hMPwOcewB25DfACw70/0s1V1l+jn0s7gn6i9Yp0n
	iJ9r7C0IpeCWWHUdVbE1jeF4kurFSLgRDtuvtqmkkY8cAzmpknKfOl2HO2+XylrJRYXzNPG/PQg
	==
X-Gm-Gg: ASbGncuM+O8ptYD+3D5aVNaf/EBOZPR7w1vc6cYkGLS7s1zeptYFpD230V+3uDN/1Gq
	FUitotvTL03UjmHUDKKYcP8RNBLUYK5OO1ygZAIxTizv8Gbyd2/RLaBzShWMC9LKQBn/SBx9RC6
	kqVWxUPDr5bwuf7qmLavIa+hsAoxEJBGXOhhqhrUyoW3Vu5uEObSuoiwoQcMiDtc4duma7DDYRV
	qZrULSlQx8J0jCRMBrVyzlraeOsVdjUXGcGcHTNSbjv6KVlM/qEBGHYfhpGtvLYHz90o2VpTfKJ
	aUs5k58DSrnZjKsiBXdp79nhJ2F6Q+cqzHdFMseKi/gHWtqUPqQr/zCFRtkLurBAVNlToPVEskE
	Rb5bWYd9AXRpdJMFcBTUecGHKr81I/Lh8dR5AZsxeHBtNKvHdCN7+
X-Received: by 2002:a05:622a:6090:b0:4af:a3d:9f94 with SMTP id d75a77b69052e-4af0a3da105mr12354291cf.50.1754056281349;
        Fri, 01 Aug 2025 06:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG52DSwGwk7HNvgjkCq+ht7oyq6LU2s445ag3X2y//8N4s5HAyIOUu28Pz6VZOfWywVilLC9Q==
X-Received: by 2002:a05:622a:6090:b0:4af:a3d:9f94 with SMTP id d75a77b69052e-4af0a3da105mr12353661cf.50.1754056280680;
        Fri, 01 Aug 2025 06:51:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:10 +0300
Subject: [PATCH 2/8] drm/komeda: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-2-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=goFFEhtD/Im3N1nsgGMsKddMGY0uKGtsCO6KqUCkWNY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZS1/Pfoit12OsSUjCvlkC+n29kedgBSwC22
 eCp4uNngN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUgAKCRCLPIo+Aiko
 1VxsB/4+wGaVMLsVmpV+09A3+p8+foUBQSgFcdvA/I4/t5sBLeSCn+vn1JqBTR0JDVzGYK1vbkk
 BTWUu6ath0wbCVud8VRfTvlyySY1vUcez+mErbsBg45cP+wX3u5TLNpED0RVfbzxupTDV73iK0H
 seidFyUwfyX/E/LVPD6/ADYUNls6a9V+LUE8vk3HZ4mj77kQTZC6po3gv39kemSn2tFATpftS4e
 m0UN5xQ6ot7oxvZK6X6c4Zg1bwX7jnrbXPWb1OBC+2+Nd5Y5psNhY49pZgmW2815O6Zz5gB0iHI
 7WHR3RawPjs3QOkKKEt3YoK99Z3wcIgiSjmAGenNpj8/MdDB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688cc65a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=EE5oNXVUeA2ILyHCr4wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: _rl02myLrCSUYgMERgYUbYHVW9whEjkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfXzUnAmIkwlpU/
 GKGcLFEUhoZIJpIjf3pIRjlSKti5+SiusEm/4wwz3pVb9D8Q4wFXyMvyzbOe/2Q2GjkKuDPFt/N
 aEng1RMtRMZt3/rCV+Leu61T5cv6Qyshy+7HJ8zV5fa0iCKnhASce0ydQyDWlhrFSAqWQ7swRNc
 Xgh08D7IVsQ/4p22mXk/4cK2QuyVny6EkPIyG44zf5eqqn1j1T7xhhKbNkp4uLf5DMD1uFblPJd
 xazh/qWzqRy0ZT2Ng19UnTC/GQ9GaKnoVhPP/YPAOOZAHokNOBqbWDpQDmmOmGrVQMTdcgaAYso
 bxB+dzmInR74Ux9ESQH5v0hE1cjLRvj8MddRYaiv4A1xPNNy2WeOXiGxR76y0oTxVLK+IkMtwHY
 S33p5XDQKkPxadwEj9aIGvEmg1H7Ub83DC/Nn8coAKT+DuDO/bbHrFZfsZFgFQEZ1oNRDK0K
X-Proofpoint-ORIG-GUID: _rl02myLrCSUYgMERgYUbYHVW9whEjkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=825 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9dc97e736049feaa8a1fe1bcc82ff..210841b4453abfe60cecc1cfc79a84298be3e684 100644
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
+	encoder->possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.39.5


