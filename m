Return-Path: <linux-renesas-soc+bounces-20732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29023B2CE16
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 22:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1F827B70A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 20:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5118345730;
	Tue, 19 Aug 2025 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcI7/53i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F309E343D8F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635598; cv=none; b=dL+EekVfHl0W8/9dwDG6xOntjxWr3+Pcfefmi7bJGP56VmcTkv8ZOCQD3ob1XcYyj4zAvGKVsARgfJm9N0crV0e4Gc1PcTFHV8upxT7b07VsXkta/oNV1SP+5i5BYCOQTDRLfDcPsjIJ8KBUNlPMtAZ9VoRDjwygPLy5nTj1+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635598; c=relaxed/simple;
	bh=9kPXh1enzh44Jx+JV9Ql6fG94nEVIAR8Tv81e1DfnG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mlhrM6IolPIcb6ssH1foWkJu/7qF5YRDJsejSsk/0rnJz8Hx40qGCMZrIiLTXub65r+tRg5aOpQkA4LQPwboYCZmukTN+rf0Q0q/QP9PcCDozhSCpuR9XvElL+J3slihY5T2fj1gzMUipkLscVlt1R55p4knfav2vwL5YR/TLr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcI7/53i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH5MKF027047
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=; b=pcI7/53ilcL/mke/
	pFPxcZ0iyDVn+aikqejKPYNI5M4gwpQ7Tcs9PHfZQKBYdpBLpCxatL+NffQnrg8F
	QEM85eoyQmp2/gTLmZNXcEOY9VWDtXSCE6t33xwfm2whXkLX+BEVU+12pF0OtL6L
	au9pE5/8IRHhA6h1udBdAG1dKXRCIEpev9TM31QSDWxgxx9VcELviP/dOu3mMS5k
	lo6t/TZV/YEUFSSoaS2Y+Pd9eoE1kDWuoY6KAIsj2SHCTbaS8ohFK/3a+Jxgf430
	4YNNdUUPqTfKazvmDW9a1TF303UM+QQZnc3uqpkMdVxW1OdzDyK0peAv49EEEGgX
	v/i8tA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyhvry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88de1e26so202824596d6.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635594; x=1756240394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=;
        b=pemlFe2H9lNILYeMvItf/geot5GR3NUFkW2F/KWe0hn2BDav5FDOWbsjofo3JYi88r
         dsDFwOSaNkT/DSegtK4nNhuZ9LdDhh0Cx8lmy0aOiLC0hu7PYI/mM1rx5OV9isdYOfo1
         1J8rirlXhJTKN0VLk4S14AIZfV7hux6EVpzOu8A/Ru5QQr216IiR5p55YOV234G3j7JY
         FLms7wje+bPqt9yAo9b8xQJ22u9jB8zlxKgvJ5m9/A7UHYGvmXWv1z3rcJ5H9n4p9vC9
         /soTFFS4AnId6K3r1JFqmxO8EU+1a31VRm6/qCH35EFEQOb0DBsGLDxcYTWIhpQsydpq
         194w==
X-Forwarded-Encrypted: i=1; AJvYcCU2ilOzIbdFO0K8HBskFg6a1HCLtdE3UrqdTcmBJdEhqG4sbk5dshnKS60ecBADM6ac1BsyVAI8tmmBZNZQfxjpng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhazjSZwWN9jdWMbt3tEQaGqaeNEIRioDy4xlkH3X6dJf4DboU
	pGlJmjaq9v4QqX0G24+pE/kke9QeND5ZoCLc83eg0M6NJ0rEqt3xmIK1k0CsZfv0fL8MzcGwpj7
	oqNCNo3wzRpp+miGI4tPOApkbYfnfgtnXrJjgOve3b4Ri8FtRZIBPWiNvk9lqIXM1ua0jlZiMLQ
	==
X-Gm-Gg: ASbGnctYXkJclpEJYJ2/PYRwl3DbY0KkPbTHeHSfhKBg0cQtJWN/K0IPlgfWXRuvm2L
	qfm/SQV8TjThLU2OIA9LTM2oyPkR3gfb85kHsbjyR0Mr7DYd9CUXTLCpvo8q5vWk3Y347dALlx0
	2bZawl/wQh+AVxezbBbIiPqvTI2x/3vpoCoP1aJQzR4rx7jLMmw5SaRQ82iP7cPOfRa2TKWhmsH
	SDsQDfuPl/m/G3KY52WxkLx2MlvTwnuaS75x2ZOXrcrC8NNZGZ+d1f5SbrP1U1P9Hipl3gk4AGU
	Jd/KwxDgS4Z3jmlXiJ1CG2ecMOqxfr/2vJ8c7NC7jRyxP9lov5x0qh1FWO4+Ft453HRYSPpQAX4
	2UJyp7wGLw+NSvWBCc4vNnc3lKOa5s8mWbPva9UBnBHl7Zh6XJSE1
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr5416896d6.19.1755635593535;
        Tue, 19 Aug 2025 13:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxihLKXa7JhuwwkeFQ0p5zKqK7B3jNVOf3qZbLFjzpePpJRXKGGlC8e34zDhvw9cZPJCBDjw==
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr5416336d6.19.1755635592861;
        Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:33:00 +0300
Subject: [PATCH v3 6/8] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-6-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9kPXh1enzh44Jx+JV9Ql6fG94nEVIAR8Tv81e1DfnG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98FeUHqsRMxqI2y7bSGcGGmIQ2ngHpJlEtt
 7qfS9PHwcmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1aEoB/0S0UbRv6Cn22F8M6h9l8cAG1g8kwox9gPMNA16YkeVOr6K95UiTo3MMjJp7r9L+aqIiYW
 4VY008h32adgxAl6T4rztlv/gbNcK6wpN5EIJcGDsFjXYG6mcjcx1tPbG9kOmBqd3reRp4s1wOJ
 KAz5KS/AtmLz2CYVi6vPsL1PZXzn0Uc9Y1E7/ZG52uZtIAvqY2e3ToYbYtmTF7RKaLy/uIYmZMS
 2VVTZTlmjclBLLn02HJiSZDsiFI9KByjQEssXDY1vWz0MOTsCsts7Jrp8LWNtE7St9nwsiUNJWz
 E+fzSaHhOeKC2+ykQjdy0xhRKprf1e1ISuEYVrlH7d6pc9Tx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: e_NXgACwxVPAUzuLSEypej4t_A8s3kZ3
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4df8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=hRdDZflY9wZGYtDLNskA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: e_NXgACwxVPAUzuLSEypej4t_A8s3kZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX2QKnrPJlEp/P
 F4DBCDjDfeQ3uT5zH4+bc84RxfbmkjoToOzvgggqK8KKKbosg29agmDlv7q7/h/yZVnarNiqzBs
 DnRvKOwMVwXnPxtyDUvhsHyyFrOSgq0s+AIKy2CSewAssIB2mPIBZy9dPqTKX036k2Pws5E1tGO
 9lVd29xx3iCcM5RvD4BZIVMOYVEVcyahRb3MOfx3K4SYbnzkvA98/LEOVnBhR8idfzOpE9rnXvx
 GaRT27BITI0ZV0lqczhbkmCQYPE/A+MmQpJx2AFWzeGX4WuBN7dBLgBuhybmPrAbwkOc0DIF4bB
 wNrIRcQsr3iVXO1lmRWKK11vljwnkRJhhCnkR9bYsSh19Fw2vUM5KQ3cr+mOdhzQ9yEyHjYhnIE
 0jabeNYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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
2.47.2


