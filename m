Return-Path: <linux-renesas-soc+bounces-20734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3EB2CE17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 22:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 577684E5177
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 20:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142F9345758;
	Tue, 19 Aug 2025 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ4lk0PG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164F345725
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635600; cv=none; b=gSS/p6DJXNwwD+frX6Ye/BV6aAuP9R8mtPwR0l6DGyOw2LGQNBN4LijFq/WqaMvCkKX6zMN1yjKIPoFwL9DpHFjvYndvEgGhRbbMvMOc6WXP9N3J+CmJpKl66E4AMNilTjMGAlAmaTir+kF014OAUDpyUcVrwBgrWQYELq1F/40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635600; c=relaxed/simple;
	bh=AaZVjuS1W7Ukw+8AzT9N6e3I54ede+nAI+GfJJ8GCnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wg9U1LqEJjKDk6DRkUB2Vk+vb5ioqvdr+n8z2BAPhZa0w6SzCIPfifBUhdB8H4/zJjl+V9R1nnkeo6+sb1Im/cuc/+2rX52LIhReAX4rvTUFBUyUPINwDUWnRH/xsojUgauLrPLtSmtge1GC0c+M3ZOY56UfrFag2M+MKTzCoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQ4lk0PG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH1hGo023335
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=; b=NQ4lk0PGxH9zd8rS
	jQMLEIbBuOnP0bMp7r3njdORq03oP3sTV3HCagJVJCbqP7OPz9Vk2GGnWiVxAXw9
	X5RfFksrq0jtW2+PL8/T156XPpdQp4H1t1uWJjVP0j2JFMQO136CABxChaHZjYru
	RlXTZK/9LEr8KeA9setcBZLtpZvWQ9Ueoa673eBekunJg8qUWpdGXNDNOtAoMxGZ
	1Cpb+jSHIpavEW5rmkcxF9DoOyMu1h4RFsVb4zxMx5pDjMqNLaXFk+9OHrrNwcUx
	NnToL0Fq8qU80z5Mwe3FqYeRdd1dCdIe+TLaT1y403w31broLxqqwfGje6OrW1Hk
	EgTaYA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vmv32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f654571so136858746d6.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635596; x=1756240396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=;
        b=SkJ5GCbhIFkaOwQkP5xKdSPFlwM/22wm1RNE7/ZxXis1e3r2qgSEBeMKN7aJsfntJX
         NQUrWqLIdgc7F2h/8v5q+Aw4G6hB/N5A9lzr8nO/p/Ilkm7nWwsseDKsXUwfzfeJ5KZ8
         kJm4N4odvLSVJxJAcGHMcpD/dnN6U2tepYkVV5afdplDvqfLu0afv7UR8Hc7BHg5z+MO
         wHp9vWzpKudNxcOBRilkapYtPd9Q06Ie+b1M/Qsyx3Y5iC2LfIT+lyO0MAZofkfHnozb
         7AhZcqbkwzpej8lQ2izfxFaJAo8UaPCqRHwSLRIyCuU6wV+081C8Hz/r5dvGsiwr0iGR
         o0iA==
X-Forwarded-Encrypted: i=1; AJvYcCV3tVfr5Lu8mLjauvXzrtcxEXdkycfgXax/3lR0ygG4uFgfNO4tgwacUYgrbIfO/MM+A2/wlQGWJqEjHP8C395bYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLZBAOtS7hsShSUruyvH+XDSY3OPaiT+pYDcUcxDnwd3Gscio
	/KrLRp9Hi7ZVkww8rvsM8DxRI+fR0K8JIkR8gN27q9tygAnUKaNSYcGzOmE8qwPOl9iyYhHS2q4
	E2nT2N9xz/SXsDyC7kVLqJki6SM87P2mgVkwL+lEeaVYq7HYMulwJ2pwBAnTwa1uOcFX707LfXA
	==
X-Gm-Gg: ASbGncs1KYb5MdWTi7TgHlkWKjOcciZFy1/0qV8hteddvbuuu3nhotNIGwhIBjqp3Rn
	8EhSCmT1naX3bv0tBfBxXoTsecPjK0O+zR2QlZFBbVbG+BFgdzwdMF+49KnWLeHS5R0iEjnQeiX
	KZie2uY3eJNQgf/Oj47l9UEOTNAGCDbtm1Q06n15YOK7XKatqkc1lMFCitC5yCNLlTyKw2FX4aq
	biiVuGbyufsGDM/myDlwrRjJY0Du+YmR16KJ/GN34F7bRzBnuFpjjhgT3qRYtFakI0Ev1P5XXe1
	ndl0KqvK2mCl1a0uj99d0CQoA297Pkbpq8AYCyAHI25eO2Q27YSgGWASdppx3w3LzU5f824TAQW
	gYsSMnReVml9VNiGtxmYO4fB4EuzbYIwY+eNGlpc/hLFefnDhIo/Q
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id 6a1803df08f44-70d76fb432bmr3783646d6.21.1755635596425;
        Tue, 19 Aug 2025 13:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCD6S7de5XOrwmykrvu3dZltJcf+eQjH0NdzU2XfVwlV04v3hGebHiPXpwj+mmyQIUx9Iqew==
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id 6a1803df08f44-70d76fb432bmr3783376d6.21.1755635595810;
        Tue, 19 Aug 2025 13:33:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:33:02 +0300
Subject: [PATCH v3 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-8-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AaZVjuS1W7Ukw+8AzT9N6e3I54ede+nAI+GfJJ8GCnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN99dm6iqCmd2YJ7ZHRhkVfYmgs7Ag8kc737G
 sg2F0T336GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffQAKCRCLPIo+Aiko
 1TZgB/0SmKnqbM0pHSATUnozt7o8QQGkCCESrW2V+DReBipmXfhrvcZS4AJQh24WpEQYL9nol/c
 ebxClJrvV1du0OGYX5iNJzyxgk7XmdDpAqG6QI6xjv23Wp9Mk49FZqWe5f2jqb+DpySqmz5wQvm
 WQQrRRUHvKQqWfz3SQV/PEd2/8R4fTf8t0t4Zd3aBLTwVbp+2YYede7DU6arrfJhv3FSXsH0j73
 DFlDjkj8wseSw79ynmOGSQrLv3XU75F3GfOBSZ6tw/V9uroFRBeDs2C2d8wSENzcp12l35llhYW
 NphipNhW9G2yKJehjLOfbVta9tJt3XVL9mdTv2lg2+L63IFJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX7UoFBwAcZ1bT
 H9L0w2RigfKc/zs44UQSCCgxv0fJVz7gsUt2QhmQexLi+UGRqR5Xi1sz0NmcIyLNz+omAtDuSyq
 2hTAs+ddZWcVqFVUDUKXQHcdg5vzHujN/2lAXfhcdfJzRzsJvTYgnOH/eq1DMxnq98SD+yksKfM
 dbirYfzjEabHHQuWhC7PoGnchjL9PfZx+R9Jhr3Wa07KRnTOyCsN+yXyGiny6gOTxTomB+ZHgCA
 zxJ+vQPn8nn41oNyFZ1sTwShnDe7iHNzVHUJx8v2d2/WFAJLXuxy9Y2VDOzcRh0A7+wPF93JUPA
 gUc4MJ4+oPym3J0iOvZ8mB6/mmWsz47O31jfAQ6ozgmLO3KyJnxSLnlGIwO/A4tOAZfIJ/ZIPXS
 pbYq/ivr
X-Proofpoint-GUID: IHoj-FpOg4__H7KwQM_KEmpFiNVNnMSJ
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a4df8d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=yAS5wIYi4md-6cvEWsUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: IHoj-FpOg4__H7KwQM_KEmpFiNVNnMSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
 include/drm/drm_writeback.h     | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 1a01df91b2c5868e158d489b782f4c57c61a272c..ec2575c4c21b7449707b0595322e2202a0cf9865 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device
@@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320cc225ffb3687419088361315535fc..958466a05e604b387722610fc11f9e841316d21b 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.2


