Return-Path: <linux-renesas-soc+bounces-20729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC7AB2CE0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 22:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D6DC4E544E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 20:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5333431FB;
	Tue, 19 Aug 2025 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOw0gzB0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1191340D95
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635593; cv=none; b=lzTKFZwrI03yNnudgSMjiuVCNPysL3Dc+75qImjUerZIb+vusiXcOOZZgG5iA1r1hkEQvkOjZnWFUlP8mHhMOnWotODURGrovGXubgXZxHHGGcm0CT2LN7GDd37F/YB/4ppfzcMiNAV0QOerBiPtYMh5670I2HRIRNtg/7NZK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635593; c=relaxed/simple;
	bh=bSu7BtDX/FJ/CYhdTG49eD8oSIyWKKcC6qKfEjkvl9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOTuuue4BLg91udnq7ZoNUjkPiC8JqXqqL8+CmxXyB4/0XVBlz4Cr5JbkJaWyYl7RE0/fV1Zf1MRClb6K2k7eThFCkEIlh9SKgkxXkRcsUGKhQ2JDY3SRx4V93JK15CzEFSHclrg3UG16A0FrxXiXQR1MVQayTSN6ViUdKsQn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOw0gzB0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH74Kl007193
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=; b=AOw0gzB094/vDr2i
	z2iu5TdlCo6XWCCXSc9Y0sx5QYAEBOj1Azj739aDVgO52hmdX14GEtx/lMzHirDa
	w1ezg4r0DxiL/qIciNJH3n5aTX3CoKP2nfgy8tk4eJqbugDVkykePpOIvQaoptGI
	2JEZXFIyPvo4sKDhJqO0WP6xr5NZMRc6A+lpA98BwggLLtDobFKxkFWDIQxkVUEp
	IBjWiR9zFKHh76Gc8LCRf50emHPMZYvDxkLMGt5nrky7vpmZ2Q3ceWRMHPg9ros4
	iOXelJWmZz5EWkLA5FJiVpzvf4jQ7fMquaDN/NI8Nv99ajmqB6dDZIpjqChu8qY5
	OnHvGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj74a039-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f5b3601so140067786d6.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635589; x=1756240389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=;
        b=wNXGlEg9pmeOhR1Kq8SThYGcGpJ8qSXroy6S09CFKetc+ygVJ8iuw+0P3j3UNzwOVo
         HE8qT+yEp8ZOEH6ibUx8873NiYeVNlCAqjwjh9jH2rQQ93ZQJ073724atY+QVxlWPH3X
         0jiKYodu+te3C9fmezrtQW+F3TdnixP+gxfZ+/N9wdiVyQMhHvBI44kuPRUSEbK4RXDu
         1Jkb0igsiaehoza8NOZP5o52+e/f8mB20CmSWGt58UCmLhJbZ34dcYYzPOvqsZTT9YOu
         HKWDi46uGenCk59jx/eEvVAcHXpsBfQ8557opC/1Dea5Mou0Y4A/acGFm8sQyn6/0vA+
         WH5w==
X-Forwarded-Encrypted: i=1; AJvYcCU606Uo6qUiqtUCioJQxPx+ML/+Mgj+9ZHYOYtsV1gGxej6DXOafPvrAzlpoKV3WWfRXZumnDom53GjaLdooc/p1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLsl3bBnChQfl2gFwxQtwDFyXe0JoG3TG6zp0NlsVkwZEsUwI
	mSRmjq9/DZjztnFQCEXPwb9bsiOdKyvrOL2eNfJzbDUZjO3Y3SuLBgxIgDpuBRrBR/j1OU5Vd+E
	Ivpx9sKEQQ+iQclmOHtu0WA0xQc787unJM15pxikk4Dd/Jbzgxod9m7RPtPZFU3MvbeONZOtPBA
	==
X-Gm-Gg: ASbGnctneVzcsIPnSEFhkdPN+EFhX1/Obp+oBdJsZxsSmV/8XfMnqxWjg7oXVaLrt+U
	MvCiwi5dXAsdK86ZGH+o3HV2uaj0FKt2VJR4gNHzV3RUwi6BZ+/YdKo8wNVMADy5LBQEkKmLD95
	ziZDaqZUZAzvAbI07hhUbMipPaX/YjDgnWKQLerl0Sx7pThUCInRF3ZVG80OcoD9G+RjCkABlBE
	wQyN4C7MkOGGEED3Ma+lTHHCfwbBcR/Xn8GnJi5rYck7nVrviJyPDB0odyPsNy/nO266ZbBj0Nx
	EYrbgrrTipS2ZwLlcjjAjGEyZ32/hyF/E/1bRWxifAOlHRreLun5aIiNhnjj2QxOuExtfcQF7x3
	gtgn2eG1XF3z5thDKUbhWrfgzu463pJe/eH+nmlyQu6QeXqyNa+u+
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id 6a1803df08f44-70d76f5c35dmr5036846d6.7.1755635589175;
        Tue, 19 Aug 2025 13:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGNkRtmHZj2kwRc4y9joiW0/IdD954hX+cZa8EJqfg+DQk+Kuir2C5bEakrVSMmh74F9NL6w==
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id 6a1803df08f44-70d76f5c35dmr5036196d6.7.1755635588384;
        Tue, 19 Aug 2025 13:33:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:57 +0300
Subject: [PATCH v3 3/8] drm/mali: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-3-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSu7BtDX/FJ/CYhdTG49eD8oSIyWKKcC6qKfEjkvl9M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98jRiShnU+tPqXA3NgCQCoCCCxsblmO85Nn
 1h8us24U1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1c51B/sErwvDMVP76IuxwrizrFdDwWxd1TIobv+DiOASR+c4gjQ1luTuJnSzftykasC1wY/qv/I
 egdxs5YNWQ+6aqMuw6GyB/W1jqi3zuaSvJl9Jf5djSqI167jMOYFXvbT+RTwSJVcNVX1EccXB2G
 0u/wRJ7ySKBTSxN9gLAXZ6cE23vdGrPt0nYKZ2vSMkVtFFc4V1WVsVbd7Fhq1aVn6g58KMBSWZU
 I/9zSRkIaFzUE0OGTsMAFXrCVM8V9ipB+YFoC+9NWZbMjSQD8zOMmyM/Zaa847DFNIzpziBw0Nf
 Motkscyd5Lwe6ogpT2PUjhdWq74CwRV6cUefxzNnte9KyU+3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: S9ScGU4T3aekirmcsbmVM4JsbIOaZC59
X-Proofpoint-ORIG-GUID: S9ScGU4T3aekirmcsbmVM4JsbIOaZC59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX4+YKn4cjTT9O
 Vtl9dGAawRTSMkEXAaGv2o6euG6t4goUrZvSOu0N+jP+pXDrz3AZnkiPLyANq9iJfasd3p3sCmV
 I+uI9nUws2OE012kts71H3qTyfKgrYfNq9nCjuAN0XSxcLXXdEo1GQoSTcQTOa0F21FmnRt2pTP
 ynUqL6DLkhnDEGPOynoOFDVhoj4RTmJ502D/skc4WnINZW3Wet/4WIUpSQ414GcrPXtSXtV55Be
 lQMi8KgyVDUhLIf4wOyw1Joc03hRVImYXfBT+M82xCmN0j8EMiWXOnvY+8VknraSqAVLes9WRvD
 XdTD8yhPpKhbnh2/g/B//viksyrQRfvZibkLlbNiMqH++QqUJtF/gDwqDhpUXG85a60WzdYYPmj
 15c5iJGq
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4df86 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b15d0c30f9f79588f40cca07437ed8..80f7f3474c4494554c6b6fb392e7f396b3b49c83 100644
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
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.2


