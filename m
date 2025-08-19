Return-Path: <linux-renesas-soc+bounces-20731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EECB2CE12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 22:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A644E572C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 20:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBFB343D79;
	Tue, 19 Aug 2025 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFhsWMUV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4F343215
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635595; cv=none; b=R58h1xqxpYpmtEAIPhVRC+zGZFzVtS2xAY7G91tBpXXctuZg11cP3J1CaU2pEtYZMVgJh7Ts5v65tdwFkgYfqUysMlhxXVoN2Fqkzx6W7K0Qcg8DQJJMw3Im7shKWRd643OHicZVUptN7PsfiVHlSOlWQAVocyEsBSCnBo2klc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635595; c=relaxed/simple;
	bh=/fLUas0t6+pmOh4Lpow6ATkHgTqazIs0UqCL1npG8PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5AAqDJRg8Uch7sn6LgTNPWV2kOfw6weaE7qqpTe3cbjRj2fuK9KTx28GOxf6zpM38S2xX50sbx1ZonZKdTEZQbKxgNtG2Ae60i1Y6kjR57A3hq1XHFhOT+RsaURUmOwR4p78L6T39orebuN8ZvoNlFq7azoBZbZ9AxHVR7qVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFhsWMUV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHVR5C032168
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=; b=bFhsWMUVsK/mgqrG
	NSHunI1XmlSLZElpNwvyRiwZ/3mr5cI5bLIb1UdAw8uev1a4V5yaOTBLATlcDjlo
	W6T2VMXL2ko8M0yuICaEq3v0kpOrPxbN+up8MuHWL6BORh49znwHpRqIRtEx1mDc
	Q6cEZwHXvWMCRPEBCjTph0OTdUlQGHZihunQzqU6FywZhRRDCD4biEmpLD5B/rOu
	1V4uzyP2u4Aki5+U6rZL/RzVEMNqvk82YODQUSK8pF0jMFx1zxqkq7b1qgiBgMOn
	zJaJnoJhF0utusTDfKMs7NoYxNWPE7UkQQoinG1T6hTc7q4t+al2Yt7fkJCIMBba
	D7heoQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uhxm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 20:33:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a92820fd0so56649206d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635592; x=1756240392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=;
        b=BT76w3r99sP8FLKf6ELwmriTw6cr1VvWrvlhpXWTlNsYMm31v9KWX3RwfD0jXUsxuK
         3AS344LHFS9Nyi+kGBuLe8RBye8GeOWzPlrajhSftrykJI2NTzxEqecGK21dgPeD/6CX
         Bv5aykr3mQ6DTqL/KfzkwKv5/XTMSL4KwklMxbwCmI4qctyvj9CZmca3+ceaHyQpYHrr
         8C/UdSF0O5Mxe8/Vko6epSZKaIsCksOsBnmswjXabN3+nk9CHhUtGzxXGGBczuKUPj9Y
         IdXQ4P4BjOE2yDxXmC1AkoUpFVoLHQR6p0iIJ7uvMboDCZqR+XQ5cMlERP3lKMWbMbs6
         X9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVwrBue08S/lthO5KleGtnMUdawSxxYZ/8w8jGK28BjgLEfbUmQ3w5AZhRJV87KI5zhOQeiG2NtWJMh0PQWgMj8Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykUgVYmW0lAwkxTUhFqjW8icvfxg5OM5wgunYdKhKYVX807+8P
	nMKl6T5xmXjjSGjR8Kp9Ec+byU6DrKRUfafs9d0aHpqY4gn9f+BRKYL0nlrO4xKXjdiYuPy33Ok
	/oGqzwYLbbQPBn+jFANRwshbPoj8AvUT0l1rx4xcv3M8G10UP+ZedMaXUkkmSYDarcxr6DZkUng
	==
X-Gm-Gg: ASbGncu0yPe1RM6UUkafduPSAmZy7dgMwDEYUctQVC+ExdXSlzhkqTKmZ8+nAMtEIwQ
	pbKMoU53EdCbjmaFPklLym8V5tohobJxnl5zc/kctR5mQWW/ajsfE+nvpusistxxVDgJt2FMD+K
	x0jvQ05GAZyzu8UOjFaGEooy+Nf8AdZ/7UQGrc9wjVVIJv2EV0QvZOxIHQlysmkfw7wC+gLZmil
	+DigtThb3JMVxK6JrKVZfRtWVBWDUJF0ZOjNOlWR6C6WBJnL9qmGqiaRxTmGOzMvXaIm5c6yVRK
	TLN5z6HfRh/7sMG7TbNMPxJciqWulXzSX+bXCxiWd4zBoOr+3iQuy8Ai2kM6TGJH7s4u/LesZjC
	kPe6ftam/HnRh8RoHZQJljX+q9m9hxJHn/G70PN/kXxqJ7hBrQF50
X-Received: by 2002:a05:6214:f2c:b0:709:bc45:b9f7 with SMTP id 6a1803df08f44-70d76f57943mr5196446d6.14.1755635592210;
        Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDKziY91eNkFu9vLBSCg4AutRFh33SncxQFOgdnIxYVcxqqICtOLRE8iLeaVF2g0WJIIGjAA==
X-Received: by 2002:a05:6214:f2c:b0:709:bc45:b9f7 with SMTP id 6a1803df08f44-70d76f57943mr5195916d6.14.1755635591529;
        Tue, 19 Aug 2025 13:33:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:59 +0300
Subject: [PATCH v3 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-5-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/fLUas0t6+pmOh4Lpow6ATkHgTqazIs0UqCL1npG8PE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98epbohhlNRN+h1NEK1xOyQcbh7iWhPdJwQ
 SZcAvaENneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1bc7B/92b1GUfl19mLZdEdSZGXv/W6zvpY2/xRH/vjYXBUUv3SeYkNDpWGIJYROMyeOMzlycp0t
 99NiJcVMQjHVA9trbZTbH2fW5xaxO9f2xrJEiQI1dGEDFh5gnRoB4crRkxVTZ4um6S/atfDU271
 6TMvCy1ix69lUxiKHMicdLVMUhrFcQZOqKEjZ6ZsuEFxw7QP2lR4k1YTbAiQvvheHYuoUqQKxhO
 2dPVz0uaYuzwXYgBK1DtPqxj7JW2d2/YLaeMirNINj3QRZpAf4MDcQojRSJ7ALdp4yatPvOIFx3
 b5mdkvmeWroQkwwNhePwPDJItO+iuBw34yibnRlo48wTJ9Xr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a4df89 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 66cJx9_PnbqFeXbawHZSX1pRk1wNcuee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX6qAHKlXqx1Iw
 QC3XJNnJdQZU4xiv4MHNzuaOk5XqBSdHO3Ue02wCx3ldbi8cA2aG6A6MzJWjsx3PF7EazaAG8b/
 K8CjyP2cqvGjuMF55kY4KSYjYZ28XL9t19FhYD5ZWWcHg72xlptaaw28vlRv3XTMaHWxDbAirUw
 Qc7uTeo0uFge/twEKGqKOaXUkPo+UmWnxXcSlbBS+RnG/4Ae0gBg8on+ac/ecivMu19zFqyaoST
 prlMuUG2qRmOboRr50Xr0fa71lbd1U8c7iUgxSHdn1DegQKOFYZlOtpcrIHffakTnv9g9B0kVXM
 Ojqgrn5f7DL2K26bXoXA9GBLJsSO3XfaApZ+cHvxip54RCCSCLFaQgYK22wurvv9fDtas7S9lm+
 WcIpA8Ub
X-Proofpoint-GUID: 66cJx9_PnbqFeXbawHZSX1pRk1wNcuee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

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
index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..64cea20d00b38861e22fc53375ab41ae988ceb59 100644
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
2.47.2


