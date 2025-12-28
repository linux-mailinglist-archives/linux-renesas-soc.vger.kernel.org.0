Return-Path: <linux-renesas-soc+bounces-26142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D0ACE5454
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657C23017640
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8554C2D595F;
	Sun, 28 Dec 2025 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv2gwtYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWyrgb24"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404302D3A77
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942513; cv=none; b=UyaVxA/EMsNsGmsMaTeOc6GFOcxRhwybnJCyV65uNUEA29cA2OuQur8s5oKK7kbvKAeQ74cYABBYhbtGBFabw0acseEifI765Ga2SbtV1k0exbb/szoH7lBz5Ei3Qr8LQJxhTwoPS5IEWBnxCtA2E2w3BY0yQBV3jm4EQ3EfqNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942513; c=relaxed/simple;
	bh=y1SVtonrqm+Vkemj18tTHMsAczaNy4uKaP+Hxds9BuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoH7eoZN4xu1Q0WWOAUNuRCF1dKHdOGfrTUd1ccy2VEFUAPlVSkiQrsSbvWqQruIxOKPlZUFJepbKrWbYwdhnYBjT6RFOjgxUytr6wEWIK3sA0S7LHlUcaG3KBNUcT0DRUXLaD+zMYguW02B+S97ZSL1YpKCOZQqxn7ksZS5gXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv2gwtYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWyrgb24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSGnpJB3726228
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=; b=Tv2gwtYhe9LuT/vl
	Ms24ndeqFrDVwYDolDRONk7c6Ce4NYzZY8Odkhnhs4DIf3Pim/yu/lou2Jp0JKmZ
	2yaxQGEz/r6vwzHWz6ytkOIi+qi4rvffeaGBLT9ADJwpNFjeXTK258jJB/lGrWUO
	30uFqgIcU/KBgho1EeT4RkrkVk+lH0gpB532i8rnllVykUX5Zv9/bZdk5MgHm5Ma
	vp/lyrEguZzkTs56kUHRgtkxJ0wMJbxrGtZ0Wc3bb02VnB8kJwRh46BV06xX3Yrw
	3wC3Sgxa5rU8a9wwL2/VCOBu2tZcI0QZ7gZl2F5HGIgDaRYYWdclCS/IsA3UYs0O
	BgSO0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f62jbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso233050431cf.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942509; x=1767547309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
        b=OWyrgb24XyTN2WAhh6ZlT9/g/0PUyVPGFPOjf7l86MS+qY1YXC3Q6jimjHtnCl7ucu
         Wn0FFbEZ3VDTGD7x+4GSFA3wjk48MO1e9c6ZF7EO4FUox1sWFvt5BMZwFMrn+ZH3sQSK
         +w5cMTFfQUlywobUghshch9SsQZEG7b8AzjBD/iosfPux9l9Z0Zo49WVpQdO2nE2nWCb
         i/qaH460I4uJBZL6HBXzrK2itU6Qu6Uvqh4+wm96sjqMxFAFVd7NrTWyWy/kBCV/h5dJ
         WMGkeHfCUH+rhpDujApbmq0ihFFKjeiB9+LX2iUhsC2YfqZU7lweBgdqvlrdWGPMX7Du
         aLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942509; x=1767547309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
        b=Ahz2cgovSMWqVWIsa5wR9ePR2z2/sDzxvETHovyeRghMEBITPdz54koQZVRkXLegae
         JQBPAWKXMdwYNvZTJMKGCqkgZEqJZ+iD6+Mc1+c4sekZ4fiTahNTAhm1SGVKtYEu0+yn
         4xzLJqI8MNyZUqieWiCOMmmHiQ7Gn4IUISp77CtEYZ8mtKmxgwhs2KYw9ur4M2p49Cn/
         QNNU/7wJGKPs/wY2T/Kz+VJkkjSq8d8s8rweQiAf32Jsz9+6v43dlbsX9SZGCJzN7bez
         KxyLUFfG3OXX15TsIrsb4lUtFkkhOBqjzbiXwiXTaZHtjtdOpXW0tz4LrdPcplFNNP/+
         u/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWW//WFR5gJEvsObi358o+ASCRBu/gP2zG6kB0mAQtbpMvHBYTChG7SkeZGgzXItarDz1AWHKpaYqe0+r8Y0eLRJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSnEEPVrr5U36hCw70mqI7qzWRJM0nNYcudui5w9f/G3BTkiT/
	IOotB3FsbrdN1zdpuyQ89N1Du3kXKfABD48JLFC29mi73pMCBW+0PfEDaIAFa4BxOf9tDc8tDxy
	+W3L0Sn/qt0Wiv0eVZNsshM4cVdCfQW2sR/yxFicfKdns8YtwjH6VR9jzeZRAC2M3WknX2fb1hA
	==
X-Gm-Gg: AY/fxX7IJ8ZZJLokAHCxtWBPIsnfCSneKj5iPG5ZAqQLVDGr0wenWrpV9R6M3tGGpEQ
	8TIg+jTzn3T0NPDH/d4rnRz7q52lWtjYusOn6lPeu74buHLZ0Ff1foW2IYP4jXu099YK3RtKew4
	UzqA6Ff8CdRKL55VfVh0PlAWRVuwHlcUhdRfnXSGzrM0IJDg8YQ5/dxtYSwVL59T3xRt6c/JteJ
	5cxJ32Zt860vbevIBmaLPrhUc1LDtdsInTPZdih3ITIjeTtY30vtKSa5gUQWDLrCrp8vF62hcb/
	wMht2kG2YWdNZ9pxuGrGn9Ao11ZRZ2vwYfIaYX7G63yTZINWXMHcd43hh9l7HPSJ1rBJQc/mTqM
	VsJxxpUMnBUc1Nkgh8Vi7lCqgfbIWFrjYL6xxdBMKj0cBInX/RpgJ3VQLB7MpRgzrX5O0vvBM4w
	82niJXnSlbQDANsAn0MbH9m+Y=
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id d75a77b69052e-4f4abcf6bd4mr375254301cf.30.1766942509448;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEFrvQBeWUWGNN3K4NBz/4O0OOqfjaG3q3yoWI/L8raTZ69fCS8BqISuUrv8qLP6Fu5J6f5g==
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id d75a77b69052e-4f4abcf6bd4mr375253831cf.30.1766942509004;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:37 +0200
Subject: [PATCH v4 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-5-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
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
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y1SVtonrqm+Vkemj18tTHMsAczaNy4uKaP+Hxds9BuY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZgulKVA3M8710WTzVthwCt77+n/UqL+imglvP1WFdvU
 tLLKu5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkezUHw3y7U6W/2AzlY/ga
 czVnPbq2vnf5299Hzepef3uYO7m4ILF8Xvi89I8fTDLiL9jZ7msSvvcteEb+PRnLiywNT65wSjd
 9WTeTf62lRYW4XqEY+45Kz0s7luTnK05+bSO9I7brv3u4i0bg35NH9VqXHJhjoel9Z9p/rWeb67
 +tzj3Zfe1rrcfTwmPrWIX7fvmruEtodQk2Nex6ergx8JPxukwBbtX6s44LXyZtNJSUcMnwsNxXM
 +uVmOy66LWbXgetvPBps3TSps/7bZiFLkc++/Gr7uvXasdZuzsrzVMv650XsZ1VEmztkizw/8mT
 /bwfuevOfPPw4n9Sa1EW36xWF3eYq/xlwsvVkVcsC03SAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: T-Y8MLBqZuYCi5qFqgBYSoV-7MWSM2aL
X-Proofpoint-ORIG-GUID: T-Y8MLBqZuYCi5qFqgBYSoV-7MWSM2aL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX0kvIp9UEDbMK
 hDpuYdiKG7WpT1JPl+jXyWpfvgkBFECx3zgVC7YQkoB1dWXQakI9ccISERVxu/XyTNZjjOJ/6Rt
 lSAg1JMfPewA78P9BXM9dfM3HDrKXqzHKZNgy5F+E83nYJ3+Y4gMkiWANKi/MJcVHX0LMraec99
 JbXz7miaYoixNWHGbqGwubr/JsBsUT+R5AA0lK4/Lm177flfiIMlogb+43WWU+IpS8oNGZvJfqO
 KHU7wdYjS1wbCXCVbTpTNms4wLp0f7xpR7XaNWCQJXP8fNsNi2DBFdSEtZY/cww1mHRV1mEKYvX
 QbSvH5MI2IuA/qK9Km9H3xsqL0UMsnRvkTP2U7fYqxpJfCBjKW6eZa/zjEAFHs7coTuvI5n5um1
 dnGWc/c5rLFgTT0BwKQ64hCLtRbAUNyZzWaeR/XMYEfITTfm28AxF1OrO4dc+y5cPmq21k05SwN
 CihqbRWp9qbuTgt9OUw==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=6951672e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280158

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae2..64cea20d00b3 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3


