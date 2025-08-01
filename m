Return-Path: <linux-renesas-soc+bounces-19842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE7B182D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A05B1C21A1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6280E26C3A6;
	Fri,  1 Aug 2025 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZixZKNRc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565D126A095
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056284; cv=none; b=ZZvBOay6xnmFh7Mf/mHrNwB1BMWdmOo7cR5JHPNLIpsZMKBW81poSroHnRXGBYHj/sScrXJxxEHm3leBnBF2/ttug1cuI/qqzTCnLwu5jLHSNMKALoRL6uCXE4oQpZ5kFxjV04q25fxlNYLUgoc/jY7XWZCt4YNnOB0DthKcG9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056284; c=relaxed/simple;
	bh=Npu11OGBlNLZEIA4iffNoHuzYf6/Fg1CUI3VmwQheFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXO87fO1FmVRrhsafbOvQUbwqWHMb3JRMsrTt1Rv1TA5xE9KrycxbCd1NbOvSQ12lwFPcnFXufYrc2hXLr+l1tKd4XS64vjIdhenHeAU9axx2rq4JTZusFz+l573gWTkG4V/TP/RhgvImJbmWAfZe80uCq3+6auEbFICpDeYGYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZixZKNRc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jfHU001430
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6zL/GI63V6YYKeGM1mEryAObeKPOCarM9uKEFJtsyk=; b=ZixZKNRcrQRvodJd
	apim1u6KzeyYaY//ocAWtkLz/m17cHyGdmVUAPav/oemBLjXWM8v5jOvdHVocNyI
	rvLr5FVYTG15cc0OaOsqlihXATZGE9p9a0nu/gA7i7Y7zySFoyb9RqfM+39/kq0c
	htiK2coTBIDxuR0EvVp/uYXqFjE30OEiAdkmtfDLs07DkBNbumDI9dasN5TB0CSJ
	2d5r6trf5sCoWrC6aDCOov17JxzpbWd3mKWqpVLJ0oHEYu0bMDsIMgIK4yRQxBc/
	KO6Vtw47yO6PTczVwalcNZcB1iTGnDVrhZOnTknXWFNdnJWnjDsD8VfMLNWAUU6C
	+MEndA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyucg4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-478f78ff9beso43035631cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056280; x=1754661080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6zL/GI63V6YYKeGM1mEryAObeKPOCarM9uKEFJtsyk=;
        b=r5HT63wt5m/7OE/XIb7VvJJJovRXRK2EjQCLq3wKelAji8WnzZTMKAYo4BT8h/L59o
         tLD/Zf1EYUuDi5ahHnmyhjzqAlV9ARyrIcwvj1mlqiZIrxwXCPuyqesOZ1w8urq4k2Ka
         16wrwvD3FijWYDl3jorRUKFh/OBzamp9FPrpfZh8l92UiRpPU8ME2my7j2KRnitBFNtJ
         ewPtrghI9kkAPqoFCXjzzzFWwr4UxUNbrfhb3z4Uc8G4MKBsrWWe1rAhM+xIIKkDMKmP
         s4uI2DVweW7gIByHAyEWJ519jF1sm8tbkHwEP3fTAZBfi9L4Px4s56CfewGuY4zyJdxz
         YS1g==
X-Forwarded-Encrypted: i=1; AJvYcCXk39+eUeHcH/jJBtiHptfsYXYcnCPbx3uKgiBYZs33qpS5UdANQginPolZtzd3E47jHPRXdKM6RmjDL9pSYMlUqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkYwdyhDRuivN8pxH+wKVozd0IXfshxblPGXFMD8rxw1bdPimR
	LQoPolzKZyNCbfPFrJCV6fUn5axaoqpOirCCJmoiT1Ex1QzUobZHiCms56lD9eLptlM3vSfj4Uz
	z3dgZoKopOUgPw2WVXeokAfZ94FGdzQO28zdtjuVO/Sk3Dy/CbKsXXFPC44JVr6g7b7YjE+Ly0A
	==
X-Gm-Gg: ASbGncvQn80LAmKv2W0z0ZxWLIx8ltaY0m5M/no0prX5ZqYUjiSBW8LqtbtiHLhe/D+
	K3qz/Jd/nyhlm0kJ7PfgJ4Sd2md7aBa3CgJ3vnKQe2SLtI1mqQvGMl5F2IMQgFz+wylKEmgdujy
	c+dZJoXYGIKiBuOlWIKQ6r1Om4yVXjzlxsGu6L0k3dOUUf0duhZBq3UxZVl+KAOMrJe4tMVFfOo
	hquntXOLiUxWPrgWKsZl1jkVdkOD/QYrjCckbPoBNXvHlaUQtE6RUzLQ3gJ+Kreq+gKCWglhYgA
	dIL/psz0z+JdBXxkF3ZxySfXf0mEWHg1cPn6t6PqahpHIw2g9MEaRTkdb+lUQdW0uIBzCfRxQJK
	zn5Jukm0IhuhowwNxFYi4Nhm4UkuIcePzy2J0HP30NYsW+N1kjmsk
X-Received: by 2002:ac8:5813:0:b0:4af:219:b8e9 with SMTP id d75a77b69052e-4af0219bd62mr28441231cf.6.1754056280007;
        Fri, 01 Aug 2025 06:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR0G/8/mp3NoMeNSdNh5xGLdgi/uAIOcZPk20PI9XWjmBIPiXjC/zontxCRxjb7k+mVn1ffA==
X-Received: by 2002:ac8:5813:0:b0:4af:219:b8e9 with SMTP id d75a77b69052e-4af0219bd62mr28440731cf.6.1754056279485;
        Fri, 01 Aug 2025 06:51:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:09 +0300
Subject: [PATCH 1/8] drm/amd/display: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-1-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Npu11OGBlNLZEIA4iffNoHuzYf6/Fg1CUI3VmwQheFU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZSZXL0kc9QaXkC+l3w6n53625xXoOoWi1Rf
 w1dSHbBA4+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUgAKCRCLPIo+Aiko
 1bpSB/94A2+Addr9RNnuGBvk1NYZ/RWjJSnSxboR9iOfirpPVgua99XOaoDsSnhD3nuxJDmBBgF
 98NqAbJF6AFI97xmYBM/6ZHsdItWame0lELe7Aw/j7btMsZu4+ROQl6Y0xZAX084XeDcL/jBaJP
 xamILenkg4IgIBeN9bJeA5pyCqsvRXSezPiBgNrZsYGeaqPvNmK9Mn0W0Y8TFvSvDNOvYTcOYSP
 iArGGeNBhFZpGcWJn4cJDKYMfOSQLAW9ZQg0/3fe0/pp9MfDoYSyOjWvZsX73WeP5lIM0vOShqs
 9ONfy5Np+vHNO0rlKWiXD7XgdKfRRU203q22p1TS+tHpzFKa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vMfTRV7qga0M5egGcKpLNojKtN_0A2cB
X-Proofpoint-ORIG-GUID: vMfTRV7qga0M5egGcKpLNojKtN_0A2cB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX/6zWguolEb7z
 Dum7VEKTjHoGUpKUNocBpudpTJB73eVhYXwuovauuYgM31p/2izvW5rI7wFl+E31rxf5SjkPVVl
 idEm8fApmVtNljiFJRhjIGCD13WfboktkUqXlPKpMOaKeM2yhmnu1XFn53KYd9ulJOiPhE01QJi
 javqu9atGot2xwGdQxWXyZhCV8Xwnyfm0T7/kDoy892iAnsWBu041vC2A0aaHRWJvhykfsWbpaQ
 /eQXXEKPg6I6iqcmWCuAph/DWKD+RSDp7vIyx9LzCFMHfLCCrVfamr/Lil3i6e9ViSVFoadHTuf
 cs5lozWAOXIngPmv4SUlD/Ut1tVKCm2W3HUkELjh194lGsEcC04bb3IzavPnV2tjyCFsSPw/Sjb
 XzHaIMvuT9BHpSVu57SJZqDjWhyScRy4+TouXhg3SQNkAPzA2chKAgqNiIucGUuXM9nqdETu
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688cc659 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8cP71iSYcfV9S7Y4u-4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=939 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 096b23ad4845d365dad707deed4e3e84b1f9945d..a9948e8d67a6e9556d21090b5cdd101258d62480 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10003,7 +10003,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
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
2.39.5


