Return-Path: <linux-renesas-soc+bounces-19845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A44B182E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4D6580017
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AC426E17F;
	Fri,  1 Aug 2025 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5XaPGSC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A851F26CE06
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056286; cv=none; b=Fv4dLQTkLFe/pC1W5k9WdlFu2AHoqRPAgcwjWyuRsuddq5zr8VaP4TmM4k0I6Ze5kZvpX4LZpT7s9CmtmheNz6ICHKOhZWIFk03eF97bzPir9s+mLmKHW/57KaGn0xLwJG7m8I+/v6dtaqHMTBHIvP4CPHIZJAslLDgF8JeYS9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056286; c=relaxed/simple;
	bh=P1Z0Gdm80qNJHt3MSy/BfGrhTCWZS7Xn/sS5jUPkuZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlabsAfETGHI1u5RsU8DiuGSwJ7c9qGMJkLBqgPIo0Z4BGn6/M6E5h+m1YVcP3mNeFy7RcVFonEgJ4lJJlL+IF0cN+bCqd+Fw1INs0xuzk86FiGpJ36aQCjf4JwlQ/bu/ybKoJOpyoJRU7YipuIqfdSQWYwxBTlpL9KsT6NJqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5XaPGSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718heOe018840
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tVawR6mCQAAJds4EZ/RayxaIa/tzB6nlBY+m3oTR/UI=; b=B5XaPGSCzoY8/OEL
	nKR5SEJSQqDyUZCNVdUUJx5GkkDzxCIQUiR84wJQY/a2C82x0AGoGUkvBbCDJdyg
	9jC7I7Ppe5ZxSl41lmDWQiYGA+pK0uQbETAcfyB/oJZ2ckfzE9BjzXbLHUki/Opw
	lbFK9gXG7eN10zogPdA4kysRBnZyIZArwfdoUwDeWzusSXIWJLJ44+3OBfQ/Dbj4
	AfPPrIBn4GmZai08pEL/cCb6vvK4cj1cKsTIkCqxi9/f5KfkxdQP/Ps7tzMos5km
	cur9oiL6PuZWEZKuN/NWQqsETFA/iPtLc2KwtXGgLZR2CL7Ks+iMColNLasS37U9
	L1zpuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdabwbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab401e333bso72787821cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056283; x=1754661083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVawR6mCQAAJds4EZ/RayxaIa/tzB6nlBY+m3oTR/UI=;
        b=Fa7o+VAIkgyPSLb+1vqp0JIhxpMZ6HaxHxFGJgMtMe9+kaq1FQ9h0FPjDwuL5CfWbC
         J+iDcdpBA7Y6zidjbZkDWP5aq7UKG1UQXxhOcBz00IsLhHSwo8nuEiMitezYn3FZ8Vkf
         /swxWUkSO+l6YKArn1rLQNaQ55JgAVSFIKmZSOCe4H/ldzYu3ipnaD7tZDOKHadSlLQ/
         RNa2Kmw0XMF/Jw3bh1auCd0ARsKHvN98CYSBrjXHFVcmZf8CDQW0UPSkX8GYW1LcQMJI
         7GgVliuQuHDeIJPXjFKadn2Yoget9UyRki1QQePkT16ylnOH1UUhTXL9BL71vnKNkwPk
         Du1A==
X-Forwarded-Encrypted: i=1; AJvYcCWQUV8LD+w4vC9D9JZJu2paTrcA3ck+kEAQumaTDWvOGLZQtyp3oj4g/nuUsbl7ulTuF1et4roZpeIeDfuJQqo0Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw309eVxHq9FUrnwuU76iouCS2q6zKwQRVSzh6nAGox82jhhoBN
	EoLTUIeaQ4IesOTV+k7i5sKatC/KBWv+oX8ssPEUHFUOUx7KD0yc6DAKPoatCprWGnVKKzpqliu
	L6GsjCaZo/yn7B18CS6bfBXmn1BvdxILiUpCXTOPHDBikbIRe/mqY17hcvhXbYrjxcrUojnRuZw
	==
X-Gm-Gg: ASbGncsRBZ4BagZQ/tLvUu4WTjDUll1ALUPZlxkkcxLZNuAvr5OQV9jKpC0L/PqPnI5
	PIHwzBUVi9CTClZPgKCyNqTci8VRsChukZBwNw3+OpNU7TeIGcAjlc1fnocL+7Btg6xfUMmdaOV
	wMK94A7yDOpn8geYD63A4Oo0mKjNOv+5pOOFf44K6NsaLQno6dg4P6PqMsd7n/qKAnfjRB9Dny8
	Ut3RLnz++IPB1xgq8WROM9oeQqgIrD7y+Gkpk1Bsw2OGXnn8a8lapKpfKjcTuUPVfY5rO4nDFbV
	cSfazA60A7lKIBF6IaBDkWlR4TCWxMAgOKnCMR/BjPm2/O84gCpU7wRDvlhz346vMdd+v74b94v
	cCW8kTPb7caccZE5uS03yHH+6REjEQVmzpa3wQWA4tCfz5yrR1cL5
X-Received: by 2002:ac8:59c9:0:b0:4ab:722c:ff15 with SMTP id d75a77b69052e-4aef16d926emr76618611cf.8.1754056282378;
        Fri, 01 Aug 2025 06:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHinZAK6zgz67gxcBa5Qc+o9XL/d6M0vzQBd+as2iX1dHhTo8v0oERF1BzFlbp7qnq1jXNRzQ==
X-Received: by 2002:ac8:59c9:0:b0:4ab:722c:ff15 with SMTP id d75a77b69052e-4aef16d926emr76617941cf.8.1754056281863;
        Fri, 01 Aug 2025 06:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:11 +0300
Subject: [PATCH 3/8] drm/mali: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-3-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=P1Z0Gdm80qNJHt3MSy/BfGrhTCWZS7Xn/sS5jUPkuZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZTgNmCXsFmzp+S17Kx+aqN4yS4VmhyhMxrP
 aqLrBUR/VWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUwAKCRCLPIo+Aiko
 1Tt8B/416/YgM3zYyZ0WB5DeZyBJzXBjPQXXAaToCtg+qCkd5fJZPLQ3Vr5YUNhMTw/2trGwgAn
 fJVDfQrkMZQOKG2PrGGMHGUx5GIEUMqir/XjCmlH23+lEtuIWOzNBJHF22ojkfLtYI8VvBHTeIN
 vq4mYfMW7gxKtXuUdM5N7VFzD5teZBSYI86b7FMVT2/Xyk57ul4HjqmR2QyPSrWBPKiX9TcQLTe
 h9+6W2wC/ey3qnTTaz9jqTEWseyUjwxc0/MvAkor8AplA/Ef/FrUP70IG5LHH00Mq8S/Y00DaLH
 RGajsMZxfRPOEJpeRd2dJiyB7BHKG9eahphZY27/p3NrY5dt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TFGRmp-wexHDGVHXbJPmAqNFZYid8lmO
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688cc65b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TFGRmp-wexHDGVHXbJPmAqNFZYid8lmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfX8yqWWRR22is3
 43ZfRQdp027jIdzA7X2ge/RdZZCUvoFnZKmeeRKAma8D5xs9sBOENakZz0N+fzZ8UL6mkjZlr0C
 WTDB0IXBnFvGqtgPmt7+n2jR+IXXsskkfC/Ivt5WY1m5YKU3TvhHHLezw0clqn1L8zgIhtG5G68
 5mrW06/6BVBjpDMd+Ad1e0Z+XPmVmP00IZuxUH55lAJiHqUj3SvyKwk71AMU5kcBNuriWdDcDrO
 HL8yCyCTRETQkWlbVMGcuxywW4TQA+w//738r0+Jujs3A9qJPSgCFvlmryjYv88eCcgDXLQHae2
 ZQKeO24kt/W+3zTqU0BgBYVLjNeu9UeUU/gfnAaTh1MGTtqVAAgYswzmid/yhbLGEYBezQYmbi9
 bz8Um1OAFEy8Y09yLPunhrFur1ivmVH+mTw8ULjkkMLaKLW6It92VcycGFv55NdLYliq9dOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=770 clxscore=1011 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b15d0c30f9f79588f40cca07437ed8..182275c0c29cd8527c85dfb3e7317561da392c46 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.39.5


