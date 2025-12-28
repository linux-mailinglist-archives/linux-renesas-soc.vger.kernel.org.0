Return-Path: <linux-renesas-soc+bounces-26143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 371EBCE5466
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7E7330351DA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DA32D6E71;
	Sun, 28 Dec 2025 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHYPAMyU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEzhhEQQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDEF29B8DD
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942516; cv=none; b=fg/XEY3HOltXisyo+GfzrucJCfO92HIz6nML5lzHvL19CakLR8bEzQOr4V/Zpl+MLor+KQHjB1wBCFfcZFFQvGrw1oN1jyphcGtIHKOfUgfBlCYJNRX5+cRm2dKmXUtxAW5ATEuNRCA+0bd1gy1gSM/6kaSxlRCmhfcTxuViz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942516; c=relaxed/simple;
	bh=xzYTa/EfA8HI5QOy/2+R2YoV5rkgAh7n+QXK0lkObWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbiZebX8j9GucavX0cgeHdpyhiDBLmn/k1TXPj6XL/DlDevxqbBMV8TxNexUORdJilbl2oshOZJdd/SI2+FL/SEyvMAvKqYom/38YDJZSsAwc4YnPom+9cNJWzgi9vlLm7YFjkNcW+WrUSGwKeCuUGqAQP1NVn7vigBY7b3vFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHYPAMyU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEzhhEQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS1e2ao1252178
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=; b=nHYPAMyUOg4sCsC4
	eB2ocb4P+RrJTbrr2y+1AnS4GWXykf+30iVKmKrxfhWMXN7G7naVKHSGHx/5gaH+
	Q/Qjm+FpVgVYXStDPg86nHoGVpaZe8s5N4+26SfuTnzB4XfduT9iKuavdpu2aLlX
	EAf1wOxVxh3fQv4KBwz0bVIU/hZF5h/fqhg0wOoAjk3R+ZemDHhRvM+dqeMmwiQS
	IY2ufqEuY2hAz9DkeWrRKpKwc6osNB5VY5wxro9fHx+ZcjGjkc+LG/9l9PMCQF7L
	Qu2ew0tn/y7tbJtB17mpXJZKvmoO6SXpKmndZ6KxVUDKubC01Fnp9pKxKx+5IMgP
	4dF9Ow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg2ha7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so166132201cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942510; x=1767547310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=;
        b=SEzhhEQQiXK5lURKQ3i+S1Qr6jV1zr32fZNHQua1izH8W+AM9l2d1A6JQ4/cUuUuuL
         9JATqmdz25K+5P4xQ8KzBlRedA1BFhg9hcsEMz+8Ek/EDOCPa96eRtEmy4SHWlcOfJF+
         Z1yIzv7XpEiiXhHkkZO3hLo1eIQmB+rGCZhkAt3bGmPxUyNYMXebvOA0eSdz7DYw73Gy
         5xnF/45D4ccR+OOWQTDsVfCvjBcl3iyNGG22x6ESl3IhsQ4oFOB/TfARgAEGWooJDOBv
         NHkCt1D6c7Ze8A4EvKAz54qX3g2z5uBVorljDW8OkpPqcN0Yh8LC6gBku8RoUQwGjnXQ
         OH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942510; x=1767547310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=;
        b=RVgEq9vRxYMyszG5l8JT1fXACsxdvkFvEV2uzI4UdHRKznWxcQBNL4rorhxoERKTUH
         ENjhZCb6ezKgFNs6yfP+gR9ax6wHej9Fv5jIfrs9caaolIShpN37EUsAEw8pKfsaTUlK
         pGlaAkSuEiz9GPdrpe+T4gTGl+tOBNE2uv699zkVJWnd/z/o9vSMe6pDzY0MaEYOmyDJ
         EjHrPGNLrt+GCbT/I6VBkk9m+ec50WeVrvC3Eutmhzl6UFtRS2Ei64tKu01TydQUK+1H
         fI6TXsmp874FwuCyRg0HxNslXybr/Rx8Q6Pxh1Q47yVd6Zm/QapGKr2gWFH5e0pu5mBp
         GuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa1UFhQkA84YYH0adbxfqy0vxp50xJ6bZtLu8COYMJYvTOEsf3uFB6OwOOItqIuLqj4GourcU4OFlRZ3uaOfzXTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx+3TjILL89H6YveJNmc+Pse5OaVL7Ts4cSMAZREgUuATW8+AK
	Y/hlSpk3XIOxrNXmH9uSIdVj7ZXdmRPckD44RP8g/FqCXrWDIZQm4jiyZbWUeicm6inh/ivGAiK
	bT5Cxio5gswHAQkKC1UAZ+w+gCbOiSYu6olMa0werosc5Pch+kYW7CE+tedZSV8fcJBpGwyrx5g
	==
X-Gm-Gg: AY/fxX53e/+M54GQ5eX6pCtcBcB2jpyKzz9ZETYZkbYoWgNi1YoOqsh7NryhKzyZo2g
	RR0KELQBY/j+yE7cK9HzrBIClnzopFrcXOqWNXlQCkHpIB30RML6wDSYbtfg4bAyxYlXxE310tL
	KfbGMyzEsTeyN+HOmuh6LfWpmSN9Tm7qppAHQfnd0qbgv8v42CQQFktkQS7uxaq8lIG1r3AaLxi
	c7nVSvtz/LD6wYJsMKBJeienjVgFRYYURCq6PutSbQATHuxKjviXze7Ini6/KaH4MJEjYScS6dc
	kSrk7d8HBIe5ilkiSSiKsfvnNb0mSNYjbN6loBx19iqP0/ikG8iC3yUbW8eW2BNlxYB0UsBqm1M
	7FGay9JBiTpxJSPYH49AKoGYrtFretf3eM7AmAoyt5O0xAYemtZsk20Gc+ovgVHzatUg8CRt9S0
	jqXknRqWl7wzHeGlHvNkLOT18=
X-Received: by 2002:a05:622a:1f88:b0:4ec:ed32:c3f9 with SMTP id d75a77b69052e-4f4abd055b1mr480630001cf.29.1766942510583;
        Sun, 28 Dec 2025 09:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE46X5ME/cJSAhXh+LJc/4rpNKJJcT6TLHe0qPrboYnIgch2/evOzlw9QUxO7vnvIRO7gsLtA==
X-Received: by 2002:a05:622a:1f88:b0:4ec:ed32:c3f9 with SMTP id d75a77b69052e-4f4abd055b1mr480629561cf.29.1766942510201;
        Sun, 28 Dec 2025 09:21:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:38 +0200
Subject: [PATCH v4 6/8] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-6-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xzYTa/EfA8HI5QOy/2+R2YoV5rkgAh7n+QXK0lkObWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWcimSXjC5I40z+YRP5l4N9Pd8rbhOQ57vQMn
 zZaKY2yKwOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1R9HB/4mQmUa/OGajO4xKbD2IFdVvt+++OOPGvLicDm0j7FhJTr7p//We0wf1N+GA+QqJGZ0nxy
 V4ezDgOozgp4Uvx8QVOLOfZz1xUCjntHe6O4xTR8UBlaj/LqAjoRFm0lUyAdxxLMEyEU521iP2N
 ZbOLK1AC3yfLU5himWI3isf+GJ2dM/3dxP0Q1fOlY0QNu5wf6/qTsYGOUaKHuaiiVA6Di+FJC//
 +rGCKFkjOC/N5dGVyYL6EPg/z37Z0bKg7Niw01ZUka5FxAQFyR/SupZMD46M2HW1QCY2VYCZ2nb
 QUVy5ElbO6tShYK9+5jf+O7QjLkgOhuEc9COHlpUlxMEv6fO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: K_yLxnfjbueYyyQcR7qyobGpHLHbXkTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX7HmQ0aOeZG0B
 KyYTC7Rz/es3QFMJhxS2S/raE+bwnuFKZ2FuooD++MdaqFJ9x2Xb43qKEr/ECjSxbWvcXkdWrpy
 WUM57kF/9hQbUPa5LcpjgbDfmwuUlPpIGKNvT1U3ddk2rxTAa74/MRjfH7aj8beByXD+Q9xLQVU
 Hr7+0eL0/z4HCR/i0fAFWF48Lurm4nJcDVkaqwWJsHpPVGuT9B196paYoh/X4s6F+/chY4WjBON
 jeh52BMfFFoEzffzvkq6gCwfF7cbrCO89e/92BNrWsfZ+CyWnYvER7+r2GyzODV8XJLPKlGBnWg
 K2rYZhJP6sxWP/9tCz1Jww+15TA+wLfypejfUh3EXsglhhyxYg4ZEaLykuYeazwGTt2CDEdcX4u
 aD4j8PDV5FCQzfxR5qIZV5AwDxCii8hmW9zG9Q1zYl8YjvoGGeNADIFuMD4arF/aox5R5fQXAxt
 UptGvWbK3qkCq4vPNNw==
X-Proofpoint-ORIG-GUID: K_yLxnfjbueYyyQcR7qyobGpHLHbXkTy
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=69516731 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VKUx2AQ49gFIcjACzlMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280158

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
index 9082902100e4..befdb094c173 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -378,7 +378,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -602,10 +601,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
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
2.47.3


