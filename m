Return-Path: <linux-renesas-soc+bounces-20727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC06B2CE07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 22:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E77B4E4528
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 20:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FE631E11F;
	Tue, 19 Aug 2025 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiUQr4VV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E223326D59
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635589; cv=none; b=g/AmvhmoP/Vw8f/1K0roo+aQ80nd1VmAjB5ub5Q4mwoDTyf055z3TKjDoNyHOy1NsXAVBUcbMQI9O7EITR+4h1tPV4DAB3x2FbRog6YkTl7aVF0yiyYfI1ZTvAupcbOMo1TU+MycIuZ5VVe0Z9EpSBqFmWWCyXjGjVlKcOUNF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635589; c=relaxed/simple;
	bh=pfarMdKTP3PKuK/rYN2PwD9JvqS3ROd0ZonPoWJ3yhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjVO8Wnjsh2MF5/vSCfRyvya8+zOVo2ymnWEwrToPBW1K6hcFq6iCtNL9t9AJAltDhhyrGUFjjmtVRY+yDDE4ge+dkUSRYR26e/SqjfzatKQhLNfmsA0tMtBxDWahw1KMwgFwSAgVckEn1iFFav9AZouyeZt9aqzRVwvktpUqd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiUQr4VV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHIaE0000431
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=; b=IiUQr4VV5TbyzTFC
	CN1iQjZqVwVVM/orFQS3P0PoGA1Pl93VgXACCmF+oOSbcxExjnyZ7dJ3BwVfTH5v
	vrol8L4OUtyeylkdzVy6WUHuRUHtXyDqIfl0NsIUzsrltwZ4xUEONym14TGAFzRS
	2Z5hXD+tfeEoZgOnAzsYYBYskF/9xEjZ+D073I0sE5Jl5QktSeP9/CXkALhB7/Zd
	b1JTJ28dkpcjZbHKQAnz6L2UDY2CtfpuEgn/u7P/15NZHnIVXUkA5sCc0IQe1i6r
	q78OjlfhywLdgYVAydE6CDO6dF4LMC40FcD9NfdjFLtBPF1D1ZJjtNKyRezZ8qpT
	jdN3rg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh079vg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88dd04faso203217206d6.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635586; x=1756240386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=;
        b=iMPxnLP0pr0S6VJcNhGcdk1FEQJZMgYgEZoJoNOqfwEa0NvBj5lg5YrpKldpJVi7Th
         gtOOVhHUodJwWmgzUvdHz8h2gaZU06QorZKQsX1pcm8BXa0wEZ5SDIMfC+vS/69DzQ01
         ZlYvicRv0rFzlNCrMhDpNogKl6j5ATakoMxd026JKvsOf98pAevQP+dhb92mWy85zD/5
         Z3dcVJKrH2OAz+8/K8v28eO8nFKesLw3Mo5MIU6shjdV4VSSxEne87u+HA5Q4aXdBdyM
         jlHrf2vdMnN73pXgfLVdzhrvVaDbeqp6wPpJ3XPYQ5aQ6lrYlBk13aatTj5/JXsu5iz5
         WmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhjZWyX4tzE4Tjp5vW20udl5X3/mhZQ1sjrqu8ZIfxFa3VcmapkmTSzCoBi27GZX+G7vRBkPEdF6GobKbTOXjeag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDDwbFupaIWj41YM02b/KCjm52AZBZKGbrE+sq5OUrn4blOhD6
	Wn8LDUN9BtPINw9LcZkEHRiYKucLBbbNZ8Znbibr5nf/EDC22FF3u21O7kQJNYJODNkdFCrgFPy
	slhnDu3HhvPQuxNtRKYM1wd1+Gi2tRMEEPhYQii34H+gBzIh+XxTLuqTsts7qEpoQ0UZNH6Mm/w
	==
X-Gm-Gg: ASbGnctpfpmNIWJI8y/oqh5i+cdQ7dGhVZhqdGDG7QMfB4yL88M7KZr4ex5JFSlD4vt
	vcGXXr+Qszvj9LdqsP3/T4neqT8MSX8cioVqvfuCoZW3I4Yya+7QecE0u33JCyBam45c2XZCgSm
	D4kO8huoj0B9w4bI0I8vSGwfTGX7srVH3Hd0jPs8rEltNGeb5yBtcNAJSPOUHbqo6EAqpZv+7OH
	W6k6sPW8yTfqZAgE0IF9OChLOjqRzrIe0Aafn/8fxEJ/ZYX1B7KwhGN3rNF0oMyQIzkLqK19PIT
	o4mDaC+j49zSedVWtDFh/6SvZXC1r8dCCDnbMLTQu7ZyI5rb8MlammsazOl38poH9sfnahKFZL7
	/dFoZoFV0KXkD9K71oPvUw4kAungiGyBOeHILHYoITr87kJ/p0NHX
X-Received: by 2002:ad4:4eea:0:b0:704:95c6:f5f1 with SMTP id 6a1803df08f44-70d7709978fmr4710436d6.34.1755635585965;
        Tue, 19 Aug 2025 13:33:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtlapPhC4VdvxehLvtICbE+wf4VkX5gXmldiks/+ryTub2wDdZG116DcdFZUySCphNajoXQ==
X-Received: by 2002:ad4:4eea:0:b0:704:95c6:f5f1 with SMTP id 6a1803df08f44-70d7709978fmr4709826d6.34.1755635585259;
        Tue, 19 Aug 2025 13:33:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:55 +0300
Subject: [PATCH v3 1/8] drm/amd/display: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-1-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pfarMdKTP3PKuK/rYN2PwD9JvqS3ROd0ZonPoWJ3yhg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aS+zVx+7sDXTal/otbFF9xSvEB653da1pVu5wcjWZwb
 P9p8uJUJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmUqvC/t+J/b2vPYfQ9w8Z
 7fcdbLozXYrsLgarn7RWWJkyI+udhmF3TqT3PPkPXdKqr98e2FnOcfmUBZvjJ+OHMwzU1X+XzH4
 8c7+pkaBR0rXaRzuc8vSXn3diK2C38P76+qyPl7q9wOZFYfahPLmCqbfOMi/xPHvDW2eKlkVy8Y
 +g9f5/Wd5z/c26m3dp6yIb0RI+2eclWryLDPW7Mwu3sSZsFb+3U9X47reNOv5+gmX68zVeCnmUG
 Z3dzGW37vy7Mu6zvYK/753+cDXLcG25q4HNr4XPLrptYufLDu1/981izUrO9Q3xVyIvLYif9lZf
 LCz2it/0pWd+3vugZlfn92Vhc7tUC5Noamr9xabCb2XnAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ONwaoHf-Mhsp9N4nEojykfFYlfpIDMW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX59e6ZKO2tqgd
 ZXUFgzE62xl5ezBm09mPAKRLwQTVvOCXvFsI46zS/hXdsoalN/PS1IEQ899FYosShXZVL9PLa6l
 zXWhmbukcsC5mF+nZMj5wbgwER7WmLh7S3rxLF6EimUPWFrKpAvfSqUlkcJeWbVx5x3A/H5xa25
 +wPyV7ucTgATbHsUpyi9zkbOZgEYL5XNE52aqilOT139NnDJQCosgdUwJXSR2QqEDlR5uWkBBua
 TS7l6L1Dk/iTgX8+JTBnIWeDqC7ldAttmc9lKqncsxwhkDGAcTYHGk3fUEAL6I/ZfXie5Ah3wFI
 KbnHeg2nvwqjBdPdfrUwLPDm2I22C63DyqFeV+lo0IXv5bXod2j/UUaMaePfxu9K7WT8YwloNJr
 XMOuKJVG
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4df83 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ONwaoHf-Mhsp9N4nEojykfFYlfpIDMW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd0e2976e268da41f576624c50ef0c76ede67414..0c9d347b1efc804a28fb3095df94e543a19e4159 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10006,7 +10006,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc878ef6916782ff9fde847813938461..80c37487ca77c0494eaf769c5b9a3c53486aa52d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -171,7 +171,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -190,17 +189,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.2


