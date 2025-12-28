Return-Path: <linux-renesas-soc+bounces-26141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F009CE54BD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1F48303C81D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6ED2D23A5;
	Sun, 28 Dec 2025 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYHaLFlD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gl5kodO+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1385293C42
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942510; cv=none; b=Y27D/BmC/R3bKLZDRQX6EK6+ZI23ISjQ8SUSJsM4BnjyaJjdSQ6mxscdh047Z96X/+MK82txx6gxykYdzBfW3XbaVsKLzR50RX/1jz28y4Fyu3KadCmcbuC1rbID7r+Nr4dU5X95DzbjI3/XivknaGCmppCGe2rF1k+febR5TSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942510; c=relaxed/simple;
	bh=Gak6kPX23KHHukq6jZcbolLHfiPNT+W+DhYM18BNpYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GH7zvkE5XzB0iv4XOoGzdvSJ0M2R60b2tWvZRKy1JiSHEPhG2l+Mn7ycD3lCQZ2xIRlyVfsfQiXdoB82uM76tZNxxuaBkLSGNWvFvnnv7SZJnnk9f4btinI/s4VtpC4XhxJoP4uWW62ROc6b/M8qWUTzj3ByAtBCKUVj9ZIRZng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYHaLFlD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gl5kodO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSBK2jc1937941
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eDPUkbWaxp6KrkSFA85zDg6sVbEErv1b26+6ctk/jsk=; b=kYHaLFlDC35bkGHD
	OdWJbpsrEG4tXDjd8ZRlG78SP0I0IfEgHKtIOOXDXX8RQCV7YuIpU6KhrMDdHURl
	DN0+OTQmmUVx1FKwoiXsL0aW19RGu027RVFBeYo4cbLU1rUE/LgQO/kDkPahXNt0
	X8PO37DDjeAp7GE7oSBEkvggk4BgJG9jXhToSnvBS078IBzdedw5F9G+VTV0sBPF
	WDnEHHGzZooWUNtI4RgS09T6oCqlRp+6ErXP/0sRfqIyBA7Kxm9qxiWZgj9gWsQF
	uir8ymMHK3WcE2WC+VFV/3pfWbSZZSTXhs3cWObTZDgzdtrvPhPAkGeCdy2r9Ok5
	gOXxXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tntpa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1b7293e7so315909101cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942507; x=1767547307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDPUkbWaxp6KrkSFA85zDg6sVbEErv1b26+6ctk/jsk=;
        b=Gl5kodO+1SnE5qxuciW/5Ks7mRlg5P6Cg5Ute46YstHnUj3igOhLUh85qpm8mAPwXh
         qjh0j6uPPx3+3TGWmGWF+p0OPg+wU5LqnBpnxOupbeqF+Wc4f8EJnqqAytjVjOdEu3cC
         X3KIMCsnlvD6aBTLw0+BJN2IA2VR0ynWopH6UkxG46WDkG4AS5PjWEFqMzO+OYds+fpv
         D2lam09vOzBku68HlC8tvJMWhqLqFWFA1/dksSeVup3FmlCdaiuC1cBMHjIMy+dDPO5t
         XPHML8wQxVplzs42gDPZ/ewh9GERh6gvU3SE+5tX1jDKXmAK5TN5X4id6WxSCKaSib1h
         TiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942507; x=1767547307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eDPUkbWaxp6KrkSFA85zDg6sVbEErv1b26+6ctk/jsk=;
        b=WaTbfC/nnqLsdVyqI6vTOsSjRA8FTziCU7DwKV1gBCcLluMrKPI4D4p3DSGHrRzJSQ
         ogDe2lPjYv+fT7l1R1SF2gEUZSpU7zehK3F9mtSRfVy/stCB7HaH/rXTrFpneIohH0oD
         QlHLZrFr+mOZdD5yBuip4wLKIf4DQcGryW2acG2aZhSiVVnWI0v10hQmYm2TaOetm8QD
         Uc4tLg5p7DqhVObde0h70e+ml2FgERWSuD8Y+32VMjK2diO7Ib4F2fVTYpPdcbbcPH45
         sUQyl6QWnX8BCOcu6ykLnsx6FFiPp1IPUMpuNxTd8jUs6JRJBnnnEzKGHsMqkM8+ATXd
         ofGg==
X-Forwarded-Encrypted: i=1; AJvYcCV4cObfrgGUoxUUZ6Xj1gcqzDMY1zlujQrYQZAndYrM76c4T/3rUAJSnOMUufzo4bqRN/SB9oijDcoNG6zEqJl1XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW62kfXCeo3hsswKPyvK8VYlffg+qa3bsCisLsskIovwZoPyih
	1Tl2PoMZr57bdQrf7HN3oLBKLpYxcNLRlo2bzKTTKbUHa/Mj3f7y7LN+tIfR4lkgq/v42PNZJYJ
	a61LQIV83boJbSiZJz+GP3IcWPZ3zBBwZR1r3tKrlxILmmV/bIQEQ7UN4diURj1BAaf+0pZs1/A
	==
X-Gm-Gg: AY/fxX69iidFAUaQFCkT9wSDyCITVi7ZA315UzNOxviXVCZhKXnbbFRAONrnPpsRyQn
	VxqrzHTjR9A3fS7q8hClMwp4nvDld43Ty2OeipyV3jj9kYOyLQVIN6R9lsvX27FSKU5xwLxUvCy
	UnXVQ2BDv56EC9WzZYMCrEOMR9xuidjAq+KehPtBRtB7Url7GJPYflCPxJ37gY7ylOpCHIC25br
	En5OUbcT7IjsOwkSC/LleV6StcydJpUW0lHL+JGwpbyFB3TrZgYIEo5P47bCd7ZjcBCvcbiNs8a
	jlui59RSRw33aUZRaCsxw3IOrB0kHvN6+A+zSJq2q1RK/FAx3X5lWgX3Z+FBNERnTpjKHP+Ip0p
	AEU/2HiFNJiCaaqvWAdow41iaQw9iJVhN4RJ5u0hZelG4Ybh6gVUARMkQqJAN7AHac6GIOWpikN
	wB0i3M6xE3gaA5yYCTg2ZTkLg=
X-Received: by 2002:ac8:7f92:0:b0:4ee:24e8:c9ae with SMTP id d75a77b69052e-4f4abd80862mr441188871cf.53.1766942507011;
        Sun, 28 Dec 2025 09:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf5aTkXX2NRIiLpAzpQc0et6EQtLYn+LiKPc7DpfXcCxPaXlFr5U+z+AsfAIGACL8LJu3LrQ==
X-Received: by 2002:ac8:7f92:0:b0:4ee:24e8:c9ae with SMTP id d75a77b69052e-4f4abd80862mr441188411cf.53.1766942506525;
        Sun, 28 Dec 2025 09:21:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:36 +0200
Subject: [PATCH v4 4/8] drm/mali: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-4-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gak6kPX23KHHukq6jZcbolLHfiPNT+W+DhYM18BNpYA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciDY6HHVs6gK21qEbheR3ppdMAcAcg1J1bT
 HyuUH3YU6yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1bX9B/9Zu6zJxH8C9m/gvM/KNsj5PCPWdiWrODMBmBWvdZ0kS1Zzm5usg4fc68mBA3PeOEy4kLR
 HQ0l69wS2Y+h9iwJ9BayE9FBb/wQN8pzE7kVD8Drxw4TCjEbziAG6HN21N7i0laDyN2j6G2Z9mr
 QSK92QX3QgrGr+Krx9J9wX7b7qkNzuMaQk34CAn9b2RPV0U75LTpKkfFEufPXEgF142bA6taW7g
 DWeoeEI5Wvmbn57820/bNnAz4D+cyqwsf21H4zDvc+i+vIpciJwLuNigEBCTLW5gewsSF7UUAyD
 cV2GYEwZ3Qgrzw7WdMqOvqqe10L/fRWYeNaZ9KLEL759Utp+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6951672b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: vi3_oq6sD9z9mYVxBuHX8dqIIIyOsMO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX8alNtFVmAhdU
 8bX2H19PfFL9AXPM6rF8a66ZqZHbQdRh9tcrZ8Tw2tSPHjhm26pyqOA2RIABsZrLMMFCkj/pL+6
 /7sSpftqHEAxj5YDAHLk4AR4GafexC4fSgNmtBpUyAO/qBfWS7xEwWc49DoO5MSj93TZoLfevcu
 2gbN87ib0DPJYmaVpkd8WUsEpbHvqH+l40RvhRrbj2tBUHpG5SE0JDFuK8cCICVf4tZEXP5oiFD
 aEf4A7omvq+kLy1JZaSJn87T+3GAqLlYUBINEQuFIN1JTCcznyd6hGDKXcwHzZBOSCbMT28j4OS
 XEFAqF6CDmjw1tu3TLfRWaTw0ZZo/Ftr4dXdsMyViH3jTxz2oq4gaTwxzkftpVWzWEwk5YLDbm8
 wNBdGc3fW770FmYdMVUoldxCIvBSe6tIFxVsaY6JrjaVPtdgMUKLIT4tdQBrHKw+1kFWg7CERgR
 hLDX2wLHTD+ynOOKp4g==
X-Proofpoint-ORIG-GUID: vi3_oq6sD9z9mYVxBuHX8dqIIIyOsMO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 47733c85d271..498db114ee9c 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -85,11 +85,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -115,7 +110,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -212,6 +206,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -225,11 +220,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.3


