Return-Path: <linux-renesas-soc+bounces-19850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1016B182EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2921C834C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BE52737E7;
	Fri,  1 Aug 2025 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXVQ9LVF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10472727F3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056293; cv=none; b=Reoi2dvvjR+A29JiRfiSE11nQLEVZpoAlxvMs/SHfoY194euY5fWuAuQytHunXhFr0cq1O0tWNfrDrNdOKQ5UQ462OqpL0pdmbrDAoJfHH+FvAjN2sM+NjDa7lJIG8i29jarg2uIp8jsm31Ut9ooLGMz0DxC+ZVzGF3kXz4aQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056293; c=relaxed/simple;
	bh=pqburrqLe4QINUtvUHnD5bh/z2B1X5GNCfeW27TyBDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOzLkm0G8Et+jv/bMThDt4gNp4FLSWucLlmX6bb9uVQhu10lN5GU7EgZJMgt2bIVqS3r8s2JKW41jzScEjjRX3ZW5ZhuYoP4UlK8Fw8tZz5ozGPKCZWsoYMRGTZFVYV7wd9HNSiS31COm+18/notzltfbA0Dszcq0OzuFg0+hrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXVQ9LVF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719OuZS003387
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+B92RCJ6sUHTgOKCSTnvICSpksHijR6GnMpjqqV4BE=; b=eXVQ9LVFhvEmF8lP
	p9sioUtRWNt9qlqVfwKTdPd1dZALSuCSCvuZW72ZEejYAPH5sWUFPxZdU4BkUHY6
	R/8s63SNsGc607WfI7Cd2xNxJYTgezciEz7y1mc6Ne+7LgSYkC59/ssXEcgOShbc
	kRZKCH/4jd4WbuTIdT4Gy0mFisGvULyws82hWZ2gWBevfGFN7msYcdVI1ZS9EMUU
	/Z/L70BgzcNyrTIsgpte9+9Do3S/Xvewaot3JKueUJjFszQxfsCwoUHbQ468TZB1
	dvk90tLfShZfp5ruHToipUTTXme5/zz/XdnyGXhwvVVj3A7Pwxwp3YC34lf0pdVm
	4/xV/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbmbtma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab844acca0so15500981cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056290; x=1754661090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+B92RCJ6sUHTgOKCSTnvICSpksHijR6GnMpjqqV4BE=;
        b=o1FhHliXK6SA5Si77NvS2yu9JzhK1na8GpK44/n5fkbU0YgoQHQ8e6DnTjEQDzfdvz
         Jm8sTxBL2tvNciIVBJ5avw7Yt8ScNcHl/+4upBi8y6tMNfl+uP1MGhudiZaxNcO0oJEF
         4R0+RrHxUA3VMwOPfAxzdF+Ns6MuL0VH0BY21WbGzqxDvyYMrx9uYpaWlQPpsPlVMX0C
         5myIxvvC7+Tmw5TaStu4mDctc1LYJY5YjoS3YOEVLP1A82NN3GKTatiiXa8AxF+TCyOE
         psU9VMO72h7IU+6jP0d/Lqmvt1ggv3yg+8XFxKCp2SnDuCUMinl0dN8vxkrZa+f8BBLN
         yREg==
X-Forwarded-Encrypted: i=1; AJvYcCV6v9DBFPJUeE0tKCXleBVB0EoWwepmbYcEpsL/s2fP8kEIftz8UF3X2tY6t1StiSWdqeooBvjUy+MRk49UcKECoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7i/4zJBgumJBnUsfnNOM5aISIXFFXuZdKGGJLHT2YOjb44eJ
	sJEi634hxz5bs8qdgoiuwP/9kDIVSGw77QKuTPFAqGfZW0hqLVUAMOexsr6Bjx2FbXN4syrabUp
	Oz0+kszFRUqboYzmSKW20Hn67TKRt9tkbIAzzMTDBxcdSY6OJVN+yrkxvunKi5SwNbrxuyOz/sw
	==
X-Gm-Gg: ASbGncvrKc8SobzB0v3W9SxyjjeEIuzMT3Pz8xom1rdyOF7lSw7XMIeUWrdFEdKVgFS
	dQjRSbJfrxvaYtETeqTMhA6I8y2cEbklidzoUa3SHh2Htc7ij1t1VeHmFDWJokotk9Jmk0XXZv8
	IjBNe92Ay8ces8WN7ZAKAmW7w6zD8dL4LHe28Z7zO8LiYF5CNY480SPDg2VK/FkVcGeHOnD7eM9
	0ade733d0aUUaoW+4p2GFJRjPe/K7NqITk/8MISka0uqSGbMsrfYpwyFY4iGblYgJdL9q9eoqzc
	/psoSIqKvzhPBj6EzlIDsgAHJrl4u7I/tAhmpResEtIDBz60xRH5RHCO0cDw1w3Z74wcDSC9n+s
	JsWcM3z8yMNyopz7xJzy9MXdvHMj0fyR6Y3aEi+ePHTKEZ4ocQLIw
X-Received: by 2002:a05:622a:a20a:b0:4af:c21:41b1 with SMTP id d75a77b69052e-4af0c214570mr6065301cf.55.1754056289656;
        Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbygvQYA6zDq+LhVmG3CR/4GN/47/XqDWnOK52WBf4RbtBM6/jIq15Eol7L7jNRSofKyA/8A==
X-Received: by 2002:a05:622a:a20a:b0:4af:c21:41b1 with SMTP id d75a77b69052e-4af0c214570mr6064831cf.55.1754056289082;
        Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:16 +0300
Subject: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pqburrqLe4QINUtvUHnD5bh/z2B1X5GNCfeW27TyBDU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bPsZDobW4vfKRTTQ7I9IreLqleOCt7nltN8yGzxgf5O
 5s8egU6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRC/rs/4z+eBz0TL8iMp9x
 23dr/dQ1Qe+samT3Pm8yl4y0nTyTneN5y1e1HP+LUzWNVyv+fP3yw47Ygqk7Ou8KBvubXv/Z+ml
 v6wkr1itul793iittLc1Tu/GGfXu7OrvKnYlPZldYVMr+u7XGR1zk4Kdk5R3r3i04My1iUb1tpe
 al6ZesUs2YWnZ913bV2Ht0+8fsj2yFrhqx1Yq7uRgU6hb8DGpoC7ygm9C57ENL87bC+itts3SfT
 V7+Qe5sIteVwprDjHtjy//v3cXwTWnjW530O8VerTGKwX8P9fW/3xkWmH/WUDaWM25a/fba0ozp
 +QyFjHOYhBljH9fvkjvlXJ7d6jF3q9kRH6/lpiqmoY+4AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688cc662 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfXynLJAAA4Hq/O
 Pw1MTnGeejO+cPFJAp0yMXu3ogyp4ghEp+6SvjmCdNvizpo/1+v42C8vHSr280E1Z5EzCtG5gtm
 dOb0Yev2GS1bHGuh7JBvaFj5RVzAnEM+9BVzP/FyKxSzrz+wRsZFQPbKSwaO7KszgOReqH1FXyz
 ThMBi+qTEE4r1tyTbUgkPpqWrPAfi8A22qSyR1VPDC+qXJy+S75nlFmv572o6fYBqMHjtB9xpb+
 SxfEAiUS/5wCzq1MUQ2l/hbH2vQuik3aoMoQlYmfNnWdbHApZhC9Dz1Fxb3OUX2vUxN2jx77AFk
 p0NKuB0b3UzR2cCKqfE/aYK+8gfXUlzvde2C+71VhT/dDPJP1HTdC58MvumtGsT+R//gyPLwkty
 T1lymgfrFO13KbxmAXXUFmyv7BfV7ssi5VY0IiJ2SpyUnDFy9wHL9KJFnPKSPrDPR0SdBCbc
X-Proofpoint-ORIG-GUID: jowYDORk0p00-hQjJMZe0AQQMhdbTKDN
X-Proofpoint-GUID: jowYDORk0p00-hQjJMZe0AQQMhdbTKDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

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
2.39.5


