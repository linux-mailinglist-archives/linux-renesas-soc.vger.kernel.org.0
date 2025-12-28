Return-Path: <linux-renesas-soc+bounces-26144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED76CE546C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 433F2304392E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427412D7DCF;
	Sun, 28 Dec 2025 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEih0MQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VD0N/aOd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129652D73A6
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942519; cv=none; b=aiPdfQiuo3JRMfM2NU7rX7g13bBrw4D/Wg+XnP1+Yo/Ibo9576zWv3huTRzJnEzev9SqDG5TJGxRPbJ0zgXwK3gPx+Kvu7dzxFOKLIEC8PTSaVlAzJz4+Bma6sYb6iAsaMA/zGGB2voiLwB/9RQJAmlD6dw7yWRO4U4Cx5uOXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942519; c=relaxed/simple;
	bh=H3BLuh7aucG+4twvP/0GQJX85YA5nUk09wN5sJ0vud4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RoD2WqyuxxGR9GRcNUcwqCm1A8qUq6GVTJyDAnStiFh9PzrnMCRpB88Mh5fVDheaZKeXAKwbS6FCGj9++FYdc8AQQdtCxpHRCRMJrmCghQAB3mEJPRiEEcDN69aGA7WZhRfzP3NutXvof6ik6Npsa7vQjwWflZ7uf9FhwJQbnt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEih0MQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VD0N/aOd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS4oOZ52141002
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M990uSOPBnzSQyXKdb+7ZT9yeTvRXfVYC9QFNhhhHfQ=; b=JEih0MQJoOeD/dP0
	6h70r8Oejwzp8CNd2hman62RK6uLIxo7z2CKaj/HxKVt+r64Xusv1zB/iSx+CmZo
	hdhUQtT4P3IckCAHmmOTPHD1D5z8qQHCvP7MqBaqE+rrkXOCfiPDYQG4SDhYVM/w
	Bz3HJzMLJVvI8/YNNMJpbDYO57srM/rfrCuVPTLD7ov3aG4ehTE7zNiw11U0ZVRr
	BcnuXEu27tfIXlas0c+C2jY58VMbjtsO0LllKdrlf9ctMk3pNKVdGWXWAsdr4suk
	5r+nsg6p2aeG1DtjcaidznjhQt+Wk/Ug4EGYjSpxy+X//cM24jKmvaV+XLBhku4c
	fSfR1g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wtgbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88888397482so260058926d6.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942515; x=1767547315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M990uSOPBnzSQyXKdb+7ZT9yeTvRXfVYC9QFNhhhHfQ=;
        b=VD0N/aOddRjOal8j/nd3mSV28hOFuUVpBjta/ulDZTLTp9GtZoURzzPwl8HZrm2QON
         dLdxVnL37sazQ+l2Pp7p+KMjYrVsx/rKC/Oq2K0Jk4iTp/Et9lqdHrWCjc37xL7LqTBW
         rXpUd5kdTaFubguJJmULave4eB+HIPwhceJYP8HCdg99+oOuS2f5MP4bpzTJNQqSjg3u
         vuYPU/oKOrnzqRqbiPDM1l9mNuc3a0/538oXNuIMsSQB4wwMfe3OyJOysZ0x1DFeu9PU
         VxlpCkx+wJr6IK1dRHeUfRX6U32v37pDIbsqKhXg4JPvAEYmLL+YnhduXgeQ3z6mI8rg
         D5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942515; x=1767547315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M990uSOPBnzSQyXKdb+7ZT9yeTvRXfVYC9QFNhhhHfQ=;
        b=Uc6QnhxjZARdHr/EzHmzQ16auXxhQXLtquR9QAa/clLMprZGNcur8L6YIzex78NXsL
         X7vAjg2eYg9of6+Px3ZBpDKdWA2hC92xHdYcgxF2pCyP8JKC1YIrlDyGq4b8MZBZZAnS
         nF11c6aaqEX9snakEkthya4lvAljLDs7+xjp+Jget2A0k4o3QxD9KPvxrjr2K5FdKtQg
         LfATPeh3J3esP/BcvWjLp3i8gHwd6TNIxAvn9cazn9VeC0PcRWtoHYZXA2QqH1wCL1Qh
         KAdzJc1rDPbgDJB+w7oMsl3zLzCC32ZQj8eclafSzTlpJ5GHofdHlf0Vj3oPDTqvHl+u
         TOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/KZ8qSzEod6O5TsnDb3G/x8U1NBzQBE/N2Fy+KKga5lRxptpmYa4KpVSPHp+neuPEQJdQwYrVa5s/vAWlISHDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBItA/tfDVCn2f8BSFKqOh/iRVZTxsmorj972UdVA5bU5KJ+iD
	VD5IV2yPAaW71aWkqM9fP8U8PVMk1zA55Jc9rit6nr29LH5vjJGSAndIgX4I++FaH3Z3Iluw0Am
	AZaCy/AW1VgXCaJvTx3WZGcHuv6CGDxq2tPFu7HiofCTlkJEE/Snjm7aVZ9Ur3dqcGQZfxHAJgw
	==
X-Gm-Gg: AY/fxX5oWo6UAqQ5sxjLt0Uy79LOqIRyR1Av7+If+yofUwFqvnb1LkXJaRzxgcOgZ1L
	1gNCjjlISroggAEr40lpLkhliBWnPHKpbnCranfq7ZYLIcyeTvc3ACADDEC9tYsG3wM77i9z5Ow
	n8+8h+E6Xh3JgPgISd4Z/2Kw4/2CNpmUSHFnDj+GtRGNFGOW5nz+qCTOk/ZxXaes57RgX9clFc1
	QwKNElWeOmUIhobh830D2WVGum9+/JGIpRQOC7A6WuOkoaxMSc5xKLNfokPgb0l+/41Hy/zTuL8
	qAipeArkKZwkl1xMHONXdzpQshzcjjlo0UoA7mbMAzQ8/J78ixCSyUqk+OrRSfaYiusNIZPKYmC
	FySMY44WeNUnzkveLIqtEA5uo0WtpMgkCH8vDf0dLmQQGsDNmENqXAUF3Hu3Fr4U71gqPq3Cm+m
	qLpf37I6HieDoPaW6M7hs8KfI=
X-Received: by 2002:a05:6214:498d:b0:888:81ad:16b0 with SMTP id 6a1803df08f44-88d83d65945mr487316566d6.53.1766942515420;
        Sun, 28 Dec 2025 09:21:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcvwcNsJxfckigfIUDZG6GhjNkeQtH1Am+DpUUIQ8I+HISHgd+uxyslQbQQtyZyzXMCQbCGA==
X-Received: by 2002:a05:6214:498d:b0:888:81ad:16b0 with SMTP id 6a1803df08f44-88d83d65945mr487316036d6.53.1766942514996;
        Sun, 28 Dec 2025 09:21:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:39 +0200
Subject: [PATCH v4 7/8] drm: writeback: drop excess connector
 initialization functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-7-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=H3BLuh7aucG+4twvP/0GQJX85YA5nUk09wN5sJ0vud4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciJUZdvn/acE82l+E9R4nQ4JakRQmCYafIQ
 s1/38m2bxOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1QADB/94vJUoLDr35ABGIIs+eO+dZA4cM5aet0Kwybz4Cjxp3N51brjCEaXdsDgsZ/90lPqKS0W
 b+f3i+yY8HvyVuJgS9YBnxcf9atoRGg8FzThjUU/oStVtsQ57eyRwG8DI125wLXdZsp23qPsGoI
 9XvypdYZSQ5t4C33IrSsOQMEFDw8piZrNPTp1bNE0W4vlz2GHGZIeTDYqMHRtUBWSVXw3NHwxLJ
 jGLBjX26NQPfhMfNzJVJOndj/8vSZedyk9Sfl3/5SKYZuUKicSdIb0f5pkEXuSiSRIGdDJtJw81
 tOc2aBGjkj95fKSJpzHX/TM82L48RAYFfNuvGKSYaw59kw40
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX46nOPKJOPbA5
 SxUmHpZJ/yY6UrB+vJ2vejws8koScVI1i+fyxN2hultj5F55d24EDkzU1xkWoYz4WmMfHQR3scc
 F8bZr6Op0p3caGLdsKKwcugmRnHWUR38YaGEYycBg/QCycaLYM/yWiLdUpb+SPFyGxh2VZnM9yx
 ObZB08wo4kR9yC/BkOU0JivVv4r/ndceaQos/0wdUhU2th9FQeLhWVYanaSPL0LcjBFeAMIa+Il
 hkW85Pr3aZ/yERLoZgyCwE+CMZr7NE7thUQ+Pb146wuM0O3+Hh2Mxge5YMolEJOw6qCW4xYmQmq
 3gnzzKZIAP3Bm1c+2gKbNE6ggHQTukiDLzKsATNyRyn3ZKXhh8fhbo1eNUxLkKmvKUGEK3JcoSp
 X6vhtKcRdSNuYio+tVmsagW8GvaawCCXvh+l7SWcx1B1+3p8Cbb7VZkC+gWtjHIhzbBHdVVf2Ad
 j8JgjAeXOd6vS5l8/mA==
X-Proofpoint-ORIG-GUID: S60Z05fIwhxPqO1R-wEhbygG903_LlRP
X-Proofpoint-GUID: S60Z05fIwhxPqO1R-wEhbygG903_LlRP
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69516734 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159

Now as all drivers have been converted to
drmm_writeback_connector_init(), drop drm_writeback_connector_init() and
drm_writeback_connector::encoder field, they are unused now.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 95b8a2e4bda6..1a01df91b2c5 100644
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
index c380a7b8f55a..879ca103320c 100644
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
2.47.3


