Return-Path: <linux-renesas-soc+bounces-19848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792FB182E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465EB1C83364
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C322227144B;
	Fri,  1 Aug 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj6cMkpQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961B2701C0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056290; cv=none; b=SYXZkk5ixDzl25eklOPy49C6NsIbKuGxnguBrV1+FZDwhYXwl81se66fyReputZ96wjkgIJvdq4yx5qbGeTfrw7PatV8cOwxd1XDqDsY4XPabzY5vGYqjIgOnbgmtBvTELns4Kc8kebASqeSmEtjJ7IGumIE54Ti3X9Nq//PzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056290; c=relaxed/simple;
	bh=NBwFx/yH904VfCprkWLv97gvBydY/VJ1MCw22/7DCtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nz3QiAkyNscNBVNmGMJF0mMTl9qDTalqb00J0/mbC1TUYqCv1wNeQ7ncx/2BHLfMgxcEHiYIVst6kuQud/mIvnrQtLKI0j7HrLbhddrYJgrT+hxVQTzWYsK5kNAM8RshnU2DCTvqsytNuotjnk6YIKrxsrrzTt7LQNsKqaAUJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bj6cMkpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718xgKq018834
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLmvIm7aiVxs6oMFsxxhFeeRx+tZKZlR89XtVnuV08M=; b=bj6cMkpQ1CVvcSbF
	fWDc1EgzCf9Uy42mi859BDmHxMGZLuGWKQ0511T+iMZFf3FBw34+kmvRM9ZwZ2T+
	hqSiWO0SElelynghmVxziCRovCRsIoOp0DPCMhhygCXadGqFTBMY31fmCzil56hn
	TwN1uWP4dvOa9eW9/rLfqx5Hxzi1t9g/fc+EQhci4F7kHScRoMm18OgCxPA/IMJJ
	Sn+1TZEAkO1SA4NpsS9qT97FYO17Vd89PNXRC1ZFsXpnqbmMpUiqBr4iute12eU/
	HjisHaG7kQRnXCTRalQhsczTLaXyaZfligHAJKqA1HEeCralZm5qQxCRbtItymku
	3B47hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdabwcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab60125e3dso20315791cf.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056287; x=1754661087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLmvIm7aiVxs6oMFsxxhFeeRx+tZKZlR89XtVnuV08M=;
        b=xP7GOotdSotdrPdSRmOc9MBL8YK5yCrmZFA0OiYd7UICoHh/fjUbPnsmpsgtEUsEbc
         DTz8GeGfpL0C2brCF18iX2Mi8Ks0IK3hVD1XT33ArEqWcwj4U4Tfq/I8MWYQQ780HLjr
         pFHN9Phye9PQ4yOITNf/noL6iDuh8YT+cizENHXbsY1FBdRWWfZ0wEqEvsgGCmDXWSM5
         5Fq+PHtbr3TybKpTdj3oIk42SAG51WzKO3yFhrf0islznkMOh2uwNv59fV+W7LFF1331
         076V6pRngHu21VwU6z8GZ2vpXqEwh+QM+BYR2N2kxqbx5dufbOw/Y//V1xNM38sHq0Ws
         iIxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm/z43wFE/MOC5PQ0M3RbGwqcHMWje23seLZB8HhCU54Ug7LSdrNp1UUs1uoc6Z5gw14zAP/q3EI996McdLlQ4rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcfy89u48+zM0e6DNfh2yqBYVl9PL0NrLg6KPTO2vvqLQmIGz9
	8+KF7z6O2Q1xHV0GIntGHwizgXV6SXHQAZOy+JcBamKKoFfVLJ/e+JoMnpDuZKnlO6x5CYIJFpr
	FbkZpAtaFmtbX5yQ7ucED7d+k8D7lji1x4XP5DbxqE802BUc8jmFA2AjrzQbAJVCnOGkRdZOJJQ
	==
X-Gm-Gg: ASbGncuHa8Y0fyKmQEEY67Az5JEnuZXgCjIrERBZmKbfQdFQY5Eu0IfsMaEUCBjDrzt
	V5wDnRQUg9YJlOzr8cndzp/QYPdT+Klb8VZCrMHgysDcEOLnxsJRV077xgaPDRDThdMh3QukX9h
	mrUEHZJjnJ0ila7lyajmXyvwREDLHk8fG0pgXHejujXD6t6zqGQ5mGM9+Gt2BkFmlV2mt5ctFyG
	QJ33HuLwJh3csDnl5Rdm0EUBJzvv9jRRT3qYz4ojJclYiWsjmlRrI1f7ihw97GOWqVgLQLYxhV8
	L+ykpj1xP5WEk7TKr/eLwxk9DFaKipjQuENU5HkA7FshuKlKIOBgzBeHT59euoTJMEjM5iNFSgg
	8X6EyizC3Pkxk+uw9etal/6SbxpIRm0Lt9rMdzDgnmr2bSZVzgXB9
X-Received: by 2002:ac8:7f0d:0:b0:4ae:cc29:829b with SMTP id d75a77b69052e-4aefc3aa90amr71546731cf.60.1754056287118;
        Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2viD7HCKu6xS/QJRV2/S6eN0H8AL2SA3fKo1xo5upDmFhtIUjZt51hysctMnmpx05ndtrSQ==
X-Received: by 2002:ac8:7f0d:0:b0:4ae:cc29:829b with SMTP id d75a77b69052e-4aefc3aa90amr71546121cf.60.1754056286612;
        Fri, 01 Aug 2025 06:51:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:14 +0300
Subject: [PATCH 6/8] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-6-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NBwFx/yH904VfCprkWLv97gvBydY/VJ1MCw22/7DCtU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZTWODg7Z0I052lkDGy5sp+gbJXRPPW3+xXz
 I8SasIVGkCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUwAKCRCLPIo+Aiko
 1WY8B/42eKCXBjQZniwEwDivu+L77h8KSZkeqYYq+el8I39V5l9aHEmdvGRms2n+efNwV1ck0rj
 Jy1a9Cv67p7eEXrs8o1zTP+BGa3sKhKTs4lvZWHx3d6YjAcJr2Zg3df9INQWC7IsATuDKgfbA2E
 JhHLnz8c+tuCb07y0uqnRTHGpLB3UcVli5DjTVGH5gGQPYpegIYqh/FVxuacRujIWIvOW4qRCT8
 +FnwXJAsYkPA9arYZIm2kX8awv2FHs2ZTSNfz1ht3uGAjMo4BD1uCkmrqpvMEoLyEzE8gjHsSP8
 5aOgtKUcrk2v0+9aBgHAKiILYunQCCOJCo28SHY+jdKL58YA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: xlax95kFxFd37ZEieQ_1jqGgBh2dn1Fy
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688cc65f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hRdDZflY9wZGYtDLNskA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xlax95kFxFd37ZEieQ_1jqGgBh2dn1Fy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfX+xMtUPYgVPKq
 kA1kHuHYx0dIp/pmUZgznY3MojgrhCdTWysXW23F5HrmUXr8bswDMNAsueT2In7H78zkEf2wfQt
 G/fhSL9bMTjiCXYAiVMQSYWyY2kRTznSv9fzJx1Ta6DjAyLvqn0CZ/FfNGM3JOH7UtLE7ZA/1aQ
 +PI88+KuvVRYtaYrQh1zfioPgDeB7JEZxLXfQsJJjiFCnWZ8aqGkGu0BlOQhmP9A5dHHMQc+gG5
 8vLtvShMGWS4RYln9zhKXSK9hyLEJNSKsi2d4vNSc08mKpAtHdBMT6+/MbUnd8NucMuBuQOYewk
 JvHGpktSHdtQKUrtPsxgn7AvCsNxWAEYPJ80PhpvCP8tkjPSCS9e7SF3D6oQ0gJA7GB2EquSY4y
 DHpBhc0uZwoHTlwY4YPgP1X3/hqzHjDSfzZd3TWGs02b4Dj2FtbsmLVnDSLfWFYfz+9i25JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=883 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 42acac05fe47861ced226a4f64661f545e21ddb5..fef4e4ee47cf41d40de47c5201f0349dc36c56bd 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -377,7 +377,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -601,10 +600,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.39.5


