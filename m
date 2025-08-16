Return-Path: <linux-renesas-soc+bounces-20580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13641B28F0B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 17:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18EF35C701D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 15:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA752FE045;
	Sat, 16 Aug 2025 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq2p6ZCR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F42FC889
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357592; cv=none; b=BiswMVuyo6HMtU34Cvy66vLdxmDhv3dULy/hCBa88p2aMWJ0o9raI+qvPFcb7+O8c2IqagjFdUm+bDjXKtNRcRlZVeAjVDFwpjcUMCcvNBpdWMHAvxwu/Vr73zcQ/vC+oK8TyK8VETgyCkrnvYESTfHpPZ5XB+Rle569wHlXrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357592; c=relaxed/simple;
	bh=SsfbY2BgCwVOdMoS0AB7dKBbl1htE78XemRzUg21Jp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5QILsAJ/krxfgiTg/bMIWtO5vzC4LX0hZPd76d9Tvxuw1b6rL5znmbJbdwsNKboeuvQOzRW6r5DlJo11UEW8LlE3WxjiEbMLP4wVRbFMlX0M2l7xHQk1DZrRFBJJorr5PFBxoeTuZ4c+FrZw9SD89WOZRB3f8iekq9meKYbs5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq2p6ZCR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GEtRLC016797
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEvIV2bV6AlxqzM7m9xsvqcJBh2delxnqohnrAUROZo=; b=Rq2p6ZCRr0spzxZ0
	77c/jJP+Aq5MegOt6dmVaWnsD1K1fiMgfkNxzfMZCTefVuTHV/4/fIak+3av+jUQ
	CZUQ1TyIeYAAiwf86MZ90zppw4ikLmmdYy7UzEyD5U22cD/5qGbrXv6nFTPhJsxj
	KZc5Bv3I//PggYVGIZGVv2+YNg5v1xBzv4lr8oyMxPE3j5e1jrSjZLQjX7eMnK7m
	E+/fWwk4FzT0XWqbU+lbOVqR3XwXUTutn2mNVAAs5C/27u6xCSzKcOwasrm8HGVA
	bflEF9yCI/ttaC2nIovn/RF+XYvx8CkO29dE3lQIOVK1f+ghxzc3dkaML72LyHTg
	cCAHtQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh070w4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dae248so58947236d6.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 08:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357588; x=1755962388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEvIV2bV6AlxqzM7m9xsvqcJBh2delxnqohnrAUROZo=;
        b=D44ITfwOtNR5XHkZsGGtCSNJSsBghO/4cXjDqwcDPUiTkRCvOtbBAm2lRlnpsVqjPD
         eRWGxxMu+uw6Xfe/5nuJwupDHq63vl6FJcBn0GiQH9yo3RSe9CFEIDohMQsqpnTNG/yV
         dKxSkBQr7utCbSos8lRkqsMIUropivwMpsPOnK+b4JsRitbnVneXz7OFmLDm3uLbQAvp
         44bjxZB7LMGsYlBMt1kpa90ocyb43YAholWz5xMFKLZgOC4CnrIQo/G+Zjtl5KTEg+VY
         Zo0EWvmR//CLWarM8WxjNMH2mT4cQ8gAAR2N0m+hf0oyvL8cxADpgfxmqmOc8KVc1Uz0
         HiBw==
X-Forwarded-Encrypted: i=1; AJvYcCWzGk4P5mhKzCI/8EFmba5myJtFQ5HNmztovKDm4GmXIgme+tZYhMk/E+TPAKLlv9I95H4V/oY0N+oB9yXAY545Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyaCXFqIlv2zD5QzreDWqauOdUMLOwRQJLUv7CFaiL0S2RI6Ut
	XII+djabt70zD22sYFKdEunItWgUdEq2i6S8zb9C3vRnpnN0IK/ET5AevGIMdNTcqin9Xe6I++z
	ebZt+dwnnCl4B+HSuCAxdLgrFq5GAvKNDlxDll8++uqVyzlhVKtV4JAPHwdWlPqf23ejUNdG7DA
	==
X-Gm-Gg: ASbGncuceA7rBzxf/giLNRHkntshGpmFXtk7jcRnvL761gnoxE9rJKa0bFxIoXfxlQj
	x4jLqeOmdxE4GCqzRLCdieydBDC3y2UqNk+AV9Tri+kvVHYlAdTf7scsfeDuR9ntB8vxjOn2/HD
	NWl4oJN8TSzcqy2D4boxgAcsZ7wXlDq7zOKAbY4iIuWHG1iDqYCoDvY05Q+LJ0jf18b8uShhOg4
	GQFOsVKnOpDa6hqb7ldwNzZA+FdVqZyShwy+9r/5vxOmfsKvLbpM391AVHK2wRzHoWjZw3PcKJl
	xqsoahg1p0HNO9LJfq7ihwKZX/u8l3X/kgxtb/PXjREz91q7ELq44IR/IV8EqdMQBJTVeB3AxKU
	uGvMg+zdBYBiHVSZpmJ8c2BH1QSXMPC7auC4AVYSa4BW4Hn1zFgYP
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id 6a1803df08f44-70b97d50e1cmr134782536d6.8.1755357587629;
        Sat, 16 Aug 2025 08:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGElAmZI2U8Jde4TU+ICdrflTejDEsiodGV0TbuZxZ/JkbA4U1g8hagzZyjmkD4GE9Spc44Eg==
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id 6a1803df08f44-70b97d50e1cmr134782076d6.8.1755357587134;
        Sat, 16 Aug 2025 08:19:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:19:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:38 +0300
Subject: [PATCH v2 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SsfbY2BgCwVOdMoS0AB7dKBbl1htE78XemRzUg21Jp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGJdDsbpspC67fG8mISRpjdFMuBL5GkSkS6i
 1YB1BXzE2iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiQAKCRCLPIo+Aiko
 1R+zB/9gVJgtlwuaXv286oPUL9YSSVxu5wvJRyS4WQ5lemWaU/gD7xFDGPshn+e2TlAUr79nPTK
 96TU41SHn4rJvfF1yjT5zrSVt39knNzks20P0e1N2/kooOaxT1XXy2MtbLZ4ttPfwnQYVHz49ZI
 vrXB8KznoEhnSXUNJSGt91MSRuu8BsA3Ju2EPpnZ9OcPApZHYZgeSbTJLLX722M6HN82yun00Mi
 h5EbNOZ7z599t939ktW4ogS9gFbXrfpH1OSTFHXNmrGEFgNJtlzv7sSSC27KYq1rMFBU3DSLW/z
 RtCbCCGPzLhyP8pkwOvuLLihiQ+pB9/+eq8ylzIiVxNO/dOE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FhNYBm3uD0RYU4rENBAScVyqoKBcwS9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXwZ5HND+bomLZ
 qVkduv0LYIItWhq2CHShvMyTK2aQVd5QpYVj+WuakxNg9C2/n7n8mZW5M1homyJObYTKHmRM5XB
 TRUMW6kJ9WO6KAkbNrswaQLRkp1nH6IcFZusnohKg/W0MI1hzeNS0Zcx0yQNb242z7x4qAdpbJI
 IzqO6ky/Aa+EV12iOv5omqISv3WXh2zR3JM9kK69EJJPlkL1LKLBH7k/I+aKXzyMMTb2Qym0oCh
 E+F3B5ycSfuz2eqwBGbuJTc5dYytGOC0n7bk1072IAURI8P6gr9oEc2bdCp7x1icaj7jmqgYEwv
 ZdDYXEXOfdc32OutKzx+irk6MAVjlTmHcSZDozjIVAual/nte8fDw4LG8/GD3g+qVjP8dSE10r/
 kr3Faugk
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a0a194 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UqIHtJT1QCIVCAY24KsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: FhNYBm3uD0RYU4rENBAScVyqoKBcwS9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
-	/* DPU initializes the encoder and sets it up completely for writeback
-	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
-	 * to initialize the writeback connector
-	 */
-	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
-			&dpu_wb_conn_funcs, format_list, num_formats);
+	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
+					   &dpu_wb_conn_funcs, enc,
+					   format_list, num_formats);
 
 	if (!rc)
 		dpu_wb_conn->wb_enc = enc;

-- 
2.47.2


