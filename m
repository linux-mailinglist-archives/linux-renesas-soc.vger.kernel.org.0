Return-Path: <linux-renesas-soc+bounces-26140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B90CE5484
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26A39300CFF6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34CE248886;
	Sun, 28 Dec 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uf/tp21T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqiP1XnD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04663238150
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942507; cv=none; b=i+saHk+ZOrbT761PuJgUAhzuvMtD+gByeEC9/GlDoJLR2TPUQYECcm29DFL3bADohLsLHSPxRjLBa2sQjeRt6gQ7C27ejnpaK23W6qTFw3a/Rk+TszE7QwH6HWiZ9Z+wgoN09DyRKVgp84F5aBl2+9lToGHGBc+smIjXlMfqSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942507; c=relaxed/simple;
	bh=eBzpPbb7DQH4mV13wWJlrn34m8m6zEyV2uFIH/bk69w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEPcqr9O5Zv75l1hUmt9V1GRtZj3bRnmMzUcp1izEKjkmmFUpuI4LjDEmXChGWxEcxt9s/MBMzKDTnVRSJkzUydak/MpeCVI16t1r9sZhHtnhd22Rl/ArNGc4D+FiBTtr6OQcPUgcinPLg3BKKTgg0sfO7VpDD24ErXgtwXBuiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uf/tp21T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqiP1XnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS4XSUu1949495
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=; b=Uf/tp21TzmBWEvgP
	Ggk1niZyXxbf3GCIJK5GcXRvaAkv7i15eT7pfYRdqlr+bTqB4vqzeGeFWOsLhWqi
	5TWVSKDykWL7DoizFvJHUYoviNu7DsrrYV1ELCE8T/aiP2xhE2v3i24MxhDUvc61
	BoK4EoM+GkX+OyrS8tQg+geE1N9uzYEut/MxxrFuFJvfVys8oYCjRk5O9jfXB+om
	ZdKQKF7Autqrftsos78szIQt9s2xwHC0eeMn7PLgTZ7CbyCvNuZdnwzboCHZjGWI
	3VT2PqngpmzH5liozgleHWSiYMDgm0OeBDK/MtqJzEpK79/QThu/ObH/qINGTsQy
	2SKz5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsafvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09693109so170510841cf.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942504; x=1767547304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=;
        b=dqiP1XnDhk68dhOuxWLRZcwfVVbYqffGEOjNjbnfTUDR9BX+ZQuntbklBMtQ2NjBVj
         oHQUJoLh9Ajs8yGXKuzmP2qR2ctTCZEuFwAzcs7zWVKkEbB7I/9fGPsF5Rb/qoRO6Eya
         0uS+HeiNHOGyoYaO6R7EPxtxSozG6gdzFnsImM8pQWFMKMwfgvoK2d2oV7W3bHqfI50z
         gnGF9tDPvBqzdLDFuF4BxPdXczAC2ERdH2IDLGDK2dQGAq8Wy3YXhgHqPOpw0OJ0voHb
         XZtgEj18z0b4aGRjyDthILk4IaZuNgt6b+cxrAUQq3IiBgiRxHnpGPOSZBjqWgaoSDbg
         837Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942504; x=1767547304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CGyPL6KHRYRMQ39eO9G7zyY0TeTIkBgeR3+nmWeanBE=;
        b=WnnF0kLZWxxM9Jc33tJOHQdLgHVc6tp/VhEw32m84IGX4QubKtEgoe7eOtIpiKxlO6
         d73KJXUOE9LqHmcL/a3T64Po1xj2iWdDqmMRoauczq1PQ4wtYfngGM2GV9A6IEdxfA8r
         7daKVT09urVIk5IJdSAwZYkim+rrAa+VvWtqNKwncyZPFpfV2j8FDUbL7JLNEGC+tKap
         47DYWqMhiv7alXvZtoW0fwRTirfjIVGdBR0K5AZyR03owzWqlxgiK3EN8END0Kd07ywU
         Xp8lTJqwo9lOXQYgjxcORJPdqd6zlOgz9ukUgGcWEJ0wlfiQBiDDsOBO6jif0LKUZXjJ
         tSxw==
X-Forwarded-Encrypted: i=1; AJvYcCVw43NRl/24Up1zYqEl+e/BSKAsTxbD201/qGH3Z2oNWy1CsAtlL20ttRRn54WRW1oh7BLJipzmtyRIvaTFkCAW8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGE0aI0W6Xl48bvUOpP4dKyCKtyu7clcW23nlnZFymVtUzt6E
	AlIrRIE1oXlPDddpx08FMSn9S+3Vm5QHbmaaTpN5F6EaQLR1Fu8Hfn9UbpqxGpIc4sVLpJSil3M
	KVn4MofvC1fHjKtxCNX5MCm+cqHA2sDAcKz0Qu1Fc/kFYEkbOlCuwud4Gr43BnNYgIKXJDd8/2Q
	==
X-Gm-Gg: AY/fxX7fgUTeqjVg4xqJ3bICwzEHUzA76eTe+AvW1BuSgnpB4ux1DM0fQ9YEnzJL6Wy
	GApA965C1t+RJsoSdGGU4CngdS28X9DE0BMG/249YK6FRJJzZ8oWcSWm0bFoy5XLnOhESGVFPkV
	gPlWHUElxrU4ppy75/k9/yujJsW0CatAPmk7FTU6jf6YoqRmDT1g6vrzzqDsZGZ4yCLrxfwBsTs
	xGHex6386kDHTyfXNgjgXmi/eZWzf2DjHL1jaC/frPSS5vW5AgkUXWjxn4ESa4690u6rEkLjOit
	7DeY4Zq5hq3NyWZShMgt11cbN/KRjxDapP6kAVBLq/ihm0NTP7IkgERlyb4se+h4YjYaxl59gES
	WVggDR4m+PP/xWkJu7IOoFItx5GB/uEduCmm9z4gzUu9cdcQbWnOqpIAcwlN2kdGEktqu0XT2tf
	LDVudfCOZSADml1bjEruqVrH4=
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id d75a77b69052e-4f4abde3e12mr414053021cf.76.1766942504525;
        Sun, 28 Dec 2025 09:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECq0Qmt0XAxFswq1cu73NAKtByntaPjKWodblDIcL0xgfkkSH03R1wkbkJ182GBH0vNXPH7g==
X-Received: by 2002:a05:622a:180b:b0:4f3:58e4:a35a with SMTP id d75a77b69052e-4f4abde3e12mr414052511cf.76.1766942504089;
        Sun, 28 Dec 2025 09:21:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:35 +0200
Subject: [PATCH v4 3/8] drm/komeda: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-3-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eBzpPbb7DQH4mV13wWJlrn34m8m6zEyV2uFIH/bk69w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciAKlQsujWkOpLqHFrKD2XVuk+2pZawHVG4
 1UF4s0FzrOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1Un0B/9wVD3LDimX5fzl+PflgjNQGNawH3LkDsOTuXS6mmAMJoOmVBnrZPVZmArDidHcXXPDeRQ
 8L712inmPVorbB+TBGXSGmaOjgkijlxEn4yrVivkSySd64MuuYqFe9fCR/0h1pzO5Ah/fhgDG/H
 NhtHHzJ0PSJsRjGwjplpouC5WpwouFW8FP3+Ow29Cw0LfLlTjzohyH28PwIrOy8YKDF3wBpFmZa
 klWf9iaFvj1N9WY2IZoSXXmrXNcuce8p/EVkjV2hsRb82YJX9P9Y4iZNXVKGkwMcHtP3Gp2P+w1
 OpGRCWk9mpNvLaUoTirYlk2vfUZrrS/pK+A5WUQwDR+Rvf9Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6frCd65M-Qezq0aOzLfWpI0UVxyyYlV7
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69516729 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=EE5oNXVUeA2ILyHCr4wA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 6frCd65M-Qezq0aOzLfWpI0UVxyyYlV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX9Sk1AJxkypEg
 3Sz+YHY92r3zTbQTP/ApYq0V/dBaT7JApSea7IcauX0vtvsuRcu4xtD/ZXmvu5eOaRjl6SHxtzX
 m1ZqpStk2sGo9z00m3c05gXDiU0ufhsmrj59twFT2/t1OLloFrScN+eU6Mq7xctAqOQMGHLd3s2
 fo8dCZ+ZsHtbhjFvpQXEF/rPDGrgv+i9wQVmecQqb5+9iRZJ1ZKq41oxsxA+XLliLwPtdGnp2MZ
 DZLtyUawNdeloA6zMqZ4Ju3/1qK+EtZSnHShxq0As2aejVPJExx5Ej8Cha5gNCZ7R7z9ihkeoHX
 PBWQjRRFE+QwHETn4bAd99s6x2LLCPNmZyOEU+pQFyy1K7Nbhja3D16ew64BPShDEjGwZRXYoVE
 KCHIdya6wISDCqYnDcd1llSrOvq2c0dtbIDAwLoJulgB6wLryj3N8A3fzmLOsSqUT+DQBKw4Z0v
 S69in99XZSwkJshL6cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 875cdbff18c9..bcc53d4015f1 100644
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
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.3


