Return-Path: <linux-renesas-soc+bounces-19849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7CB182ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A69391C82EB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46EA272E61;
	Fri,  1 Aug 2025 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRpZth5d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED039271450
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056292; cv=none; b=nAkG4euKvg+hF9iMHUbSbTzHTBvzGLN0it/RlmmWD6NW95lArEfZoUkQwqqrrqIwlqstN8vblP/osYnGoHy49PchZIkFSl3uo39wI93XeALzPymYR9RLd3l6qWHAQB2a/R6WStzheGCQoeU2wynRTYe6D8snZO16EcdjWTr9BxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056292; c=relaxed/simple;
	bh=gZgct+R3pIg8eXO3IJV5mPFQorUlTRSoPS4dZG7+aRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKboIzGMuVMszSVsokywU8UoIYV/zls3RU1J+NusxWWwh7Yjeg4sR9oZbUO20ZQATxL7M0iscEbpVqYgxCbyQeGA51z0x9pOvDldrYp89UXIMBuyQrfJpalAeR9VLEvvk+Co82a9+ex8zVUxo/lzyz6PiEU2sb/E6/D3vEkFR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRpZth5d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718qCnL021732
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBx5bn66d6vut0znzeSHUeN3eqzlVEi7rifsJB3EV/E=; b=XRpZth5d5B+ArEFp
	qt2j+OEM5CBM1SM0Rgw8MPgYk1p7Gp7Cr3IBPVawEsN6bS/LQyBfA+KyK8zQyKhh
	0Jz9lcDtN752a4bDJjvFiaW1NVgh8Akyro/bvduCAMu5FvQJ4UeRHJw8/DTtxAX+
	lQV9goHAX3AmRDdNZxT6KMWWZoClrU6rpVxGgASMZvat6MCGCoGgoTmoAs/lT2Oh
	sCaDkNA+GqByye4emPzarqvh+ADlVJd771iYZNeZQGLFFgq18ydQcUL8AtQv1tR4
	pu6ig8WH3QAPcfRM3ERR1wgo0cGuU8D/ElAYl5UQ+nrrZKmDLj/fVdltfVEAxkd0
	QKhPvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrm7qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fab979413fso31780146d6.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056289; x=1754661089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBx5bn66d6vut0znzeSHUeN3eqzlVEi7rifsJB3EV/E=;
        b=Z4ADjOsZ2O6d0Cx0ov+z5ovlFx+kPd1wfMKQ1OJhgJomhT7Ny4NhY6YBJfre55xShJ
         gnwxTZBgcn7JF1P9FaQR3HIUupVbzG/LDPN6NQ1APV3CYkIX4JFCxDPNgPWiIsyE+O4m
         aZQqwpOYzZ8RFdLCa3jGMzUNWFuT4F9fYuMaD22JunvZTaYc7X0Lh16j3KlsDgNaXD6U
         wJmnGRf/TRVKayNeklqnD8QR8cV2Wj7Okwdt2aUiP7HdD+h91yV6kUDSDiUVjOZ8eY1F
         ARxbvBeVZYg9CHwoWJ+1IoDEUrPqOHbiW1vimMKHnWLVFLEi1ergfrFwr8cozf157JnF
         QIHA==
X-Forwarded-Encrypted: i=1; AJvYcCUimFyN5xAoaRALKKsnbzVbt7vICRQxRk2bkl8/8oupO+zKMWf5p4vtUP/7GXyEBcC4caRhvKQn7CWP+5kkwuSX1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx86kGajvHoOPbF6z6jce9LZUUrtznEdhFkt7rfrwCwjJXPIdSC
	XvmJQb0u6pgWxoAI5ZrdHtNchI6F27A6u3iMCnXjZmUy0oMCj8/WAeusqkfd0r3TwkOyZcC+tGS
	5abhxhcX4cnUnlIuZtesdEFlLVdkWabTENeVj/wOJsG2ElpPelOxFfA+w3IfyQrusylbOuCzPwg
	==
X-Gm-Gg: ASbGncsivIexavuvtRAaOkx/NjzeA93p+maXVR6kHj2vAIDbCcH+dcy8K6gTCiE4wc/
	m+QL6nKhFFtGrUkfx9zn2uGAcJ+dW//FJS5gqoq5OEYxnCqagzzVqCH+Dv4Y1vEF6sQ+ezXAchI
	IvujRHwurAzDjQQCynCdHAUTMhRLLH6OqeVcu1WKwXH4EY3Kmb9oBx6oBaJG3sGHU5YItjU8VYS
	OiQUXrJVDogkUEvCT6Ju7EphyYRCuLcVEXAEpI93299zAb151T/zZ16VKVfapvAKAQuzwu65Tjo
	P0eST0Kpq1b4N4rFPo3VnXX1+jnYcgvEJbPipkMNhiFFRbUT0VeszElqEufFFtZqVj2neKYzARy
	dcjj6jKFyr7Ki7/+gG308MXR8shuWNbqGWCBFddkrXzmFPfUYBgpk
X-Received: by 2002:ad4:5c6b:0:b0:707:642b:cdf4 with SMTP id 6a1803df08f44-709266e5b39mr33801936d6.44.1754056288569;
        Fri, 01 Aug 2025 06:51:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGllYuESTRqftyHKDNb4inezLURrR+fzmRpNK5DetH32nfbPqtCnDKyebMVY5gAjPzgta1wgg==
X-Received: by 2002:ad4:5c6b:0:b0:707:642b:cdf4 with SMTP id 6a1803df08f44-709266e5b39mr33801266d6.44.1754056287837;
        Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:15 +0300
Subject: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gZgct+R3pIg8eXO3IJV5mPFQorUlTRSoPS4dZG7+aRg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZUui4aeAWjDE1KcnUWDiWpmo7D1w9CnyLW1
 NS+7irQsJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGVAAKCRCLPIo+Aiko
 1VnvB/wN1Uyqu8Gb7rElaqvtKoq8ctBCnyPLrCinS1CSpFKhE6DmjVLZ93duHSs8PhT2XLUl+Gk
 FHlskZNC8PV0yqTDNDF8ljaQxml44/wm5h6idVdLatujDJKa4yVGpox41E2mkKxMFg8cJEQdUHo
 mDOKWaFTl9tTkseYzULna9+MamFoDNn7K2bAAkU2sqZHh242r0i//UoAcoZD6jvcJOxYtjpoOVT
 Mi8lHRiCI7shQ+XZfD6Lt1eS35mbm7RQbHnUF5ivVS6Ytsxx8DInpU4WT+Vwf9Q8Dfv7UF4vMzV
 h9maCrN7tS9BsiflO86XVabEVhHS1tEOnD2ABbu+CMWr4Bsn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfX31bEq8h0kEDB
 Ep5enX/J4QD42H1bmSeQJqidrFB2XWp9ltxiJ37XTQlD9yveSePNtl0dWSb1LX3fvDPWhsQQjF1
 sCZ4k8+WW4sA9KTG8I/gVgCD3rBlJI61LdtWc0LsA5T0tp59uxos4/2wUZfl3NCObKzJjcDJ7Xm
 dRvD0Xl0AqaES3fGwMDqmDkrI80rS00/t/5/20i/Xp7GPH5oPjelX90DekNnGxTjGT8h5uQ1ijS
 PqpQMn8L1PtEdMzaE+357LlaH0zeeE/k9erp7h8Hs+lx8Wbnu2ZDLkaUW2rNfO6y8PoBAIWuQl2
 85D0ruZj2pdbeWEFoIKyI28QnUiLKl23BsXU4D1M/NAXgxqX3+20FDudmySBfshBpCG+Lb+mevY
 8JlH1YBEcL+EyZmuE7Pxkcr/vzz3cexE6rNEFsEwrakRErKOWVl3Dnvs8cuirC3kTbxIlbR7
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688cc661 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: PoBUsMhLJS5TIK_2tJFzC5athLZ0C8PF
X-Proofpoint-ORIG-GUID: PoBUsMhLJS5TIK_2tJFzC5athLZ0C8PF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=904 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103

Now as all drivers have been converted to
drmm_writeback_connector_init(), drop drm_writeback_connector_init() and
drm_writeback_connector::encoder field, they are unused now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 95b8a2e4bda69230591b50be15d14d0b3692373b..1a01df91b2c5868e158d489b782f4c57c61a272c 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -142,61 +142,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a3616fa070c037d5cc653b0061fe6..879ca103320cc225ffb3687419088361315535fc 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.39.5


