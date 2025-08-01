Return-Path: <linux-renesas-soc+bounces-19846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1940B182E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 986B5A8187B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC06E26E719;
	Fri,  1 Aug 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ot71yDba"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B75262FC2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056287; cv=none; b=By68/X7J5QYVFENwk+bkOVQm09+Sdu/f9P5pNOwTzaHpfb11FJN0sqk95sGwS0RR3YEThYsmvXVdOFZXtqy8UMig3T8PYhx0ZnNuBiCgdJHp8Mc/ePw0syIuE7ROv4HzL9IDPRBiUXIP0NQV08elRWzzniGdaXL9dJ7Hl9spXdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056287; c=relaxed/simple;
	bh=4v/UkWVUd2usRk11ttudKMK/GFE7oPMYIMlz0jnkFl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ye7oSVaJkC5DJDtW2lkCocipRygvCtuDsWB4DMKf5wRo4ZhuytKq2OoG3mpW4tqJ5RD3MfScuZ4bjcRxPE4i2CM9beOfTCYt2pquFnteJPvEMxIdykatWMFYjo2Bb6MpAvQGkJvBwOuF56RKFNiBuKclOMjp+e++O03f/DZBq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ot71yDba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jfHZ001430
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	278QZ0lFfDm835VGauRYZsYszXs7O8BAZXSyOh2pTg4=; b=ot71yDba/AH2AD6I
	Mj2dOXKQojk6IRbIcHcc2poCjsJKGX4bm8HdAdEldXhvifVAQe7sLwhUihEUpDxi
	Pl1EpZu8O1We7/iLGosinar8YzZVZdqFxpd4LK2SyUoHWVYQJ4ci6M0px+NDMHhX
	TWDrEjYRBeN3bW4rjWFBYqF04YLNWilWVI6WjXUBHVAGo6EpOUOyOG0lPHvjUaS7
	FWyYNsJtUvWoilTT6LAhGtrPZp+uzfxD+fG908le2MPVxQLPA52G8WkI+6uoF7zS
	t8Zf4KA8nqADiu5GRVoxg5//Jm3JaqPRCbGsBD7mSZj5Lxk/IQv1Bv9DHg9xF+nj
	4FoyrQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyucg5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-707453b0307so26349906d6.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056284; x=1754661084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=278QZ0lFfDm835VGauRYZsYszXs7O8BAZXSyOh2pTg4=;
        b=xIpl3tcZSh3l9oaxIpsLMcFaMLKBMAjUbf0GT4L9uCbRkiOQcBkwNad68UWclBEntg
         hN1/IfT3GaNba9svUlLz4FXMZ355M6Yzg1BJrjaCwgUtheDyrnuCAfVdsPEE+SwBYy93
         6gD32KY9hiDEZW2aDXS5wVmrXblGXqx+OA0Gg9WWJwqOcX3JSsjkLEq1YAtGfURnCgfy
         6Qr7etjS4b/0HNELJW97kRzLrpaNXGhvBr+BWvGytZQIGuILnMm9HzrSMF3QqtdPdCjZ
         o/asjymvpZfFrJzaKLq4pvdmgFYf7EcNo4EdoXZJ4FKgwleinU2i0shHJA3izkqjBFb2
         RJMw==
X-Forwarded-Encrypted: i=1; AJvYcCU5/PCVa3MlNWT6FWbP8C+CntcF2gnK1gfQ77wZK3Bctt59eD5gDuczfirlaQodcO/I7fNb1FuTydJl5h2bhn/pMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9dFnNMcRXb52xKd/7INc6gMJblLIq9/LFImKv8eo7TF3qoVXD
	BzUIZRsswVCuLc4uCiFw5i5+Yz9oCgFzlUICBrTNHMhMFgdsD4xvWJP2kvOsHpKjWpiuxC3v06w
	p+1n7mKopYqHbkWPtjHqJ5BwFOVLolMCv+lOmjg3seya8wgPj09BsHRIf3qE65scQQv+4AOyYRg
	==
X-Gm-Gg: ASbGncuXwpvwCQSr94InOXbejtXi15gYKpcv09avGhG56mJK4zLF0x5PXpgiq4yMDPT
	p1NPoQEHQyqGPcECkGtS+c9MmY0rCtg0M3sWEhd8t0pL7n8dBtqD0oMNXjhuUj5vhsu3CqyysXl
	bBvai4Cf+bxSZmDgX646l/ZxD8nNDcr25gzmH1+mqzC38EZBheEIOmcnVzwPSIYNoBbsLtuFqmq
	h6gXk3gob/wwqSF3ssrli4QsBDZeFaPgWBCZ1ZDVOZWkT+odHbd4qr/ppKdGGh2NqTVqYGXN33n
	RQfBoa1nDH5fcg8cnHHCxqDlM0LI6t0KH/ZZngP3XOQyqjFLBZBVBTAtK8FwMAeJE3GTrKAPmZO
	fVG6jSOyuLCZvUj6rs9iwwJBrpJgV37mf5WwbjvV1T4lpqrxV3g3u
X-Received: by 2002:a05:6214:226f:b0:707:4fec:c0ca with SMTP id 6a1803df08f44-70926508ddcmr38892256d6.4.1754056283775;
        Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJom3kFAnf8JFuU2DiA4RfLsiaMRDn6FA+aJ51nDsVnUTvIGfyBP8DkrKWMMjE38R3E76PPQ==
X-Received: by 2002:a05:6214:226f:b0:707:4fec:c0ca with SMTP id 6a1803df08f44-70926508ddcmr38891606d6.4.1754056283051;
        Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:12 +0300
Subject: [PATCH 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-4-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4v/UkWVUd2usRk11ttudKMK/GFE7oPMYIMlz0jnkFl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZTDNkPGITvncNEDx/CNCeglk1Jp+f/ChpC0
 AXAHrPUnAeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUwAKCRCLPIo+Aiko
 1f8aCACjBXtlBxXcmFySHdDryhXuuyHrGFTLWoQAJYFbFPslFIRoxZSJT6mHErULJ228fcTw8Ww
 risQU9WSdjD7jV8ENl54qLAQNALPedsvbKGwten2/zVwwHND1/tHm62gE/zJVsv0AAxskybYyqX
 XgnflK5pL7cHdNq8kEqSnM8NrkQfgWCwS+NE00GVjlUOwvIM+Db4IxyZpw8ysGkKcOooYn0XV1j
 4zVzcS/pLcAgTkHK6SEWIusjCrJuUX2qaE0MHEDMfL/vyb+buazqF8TLWkgP4XM94aJOKBQFcAC
 qr7avC1KLtKnUu4777zLxpSwk41rREYYp97VOlRBxnyQ5KCS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2_wgd0Dr8104PVttWsO4xsYAzkQrykjx
X-Proofpoint-ORIG-GUID: 2_wgd0Dr8104PVttWsO4xsYAzkQrykjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfXwuyLXVOgWxYj
 Q5/X5oFofuGlXgWjwC6h+zftcdyut0/oO6UAt69WIfdIf7CMGK6DbstHCXtF6abNPQWCdc69MUS
 OFt7//sAQSXbutyUuKgIEAu5ZfRPr87Y/RQODsSvo/LR4VQSrekz8YwC1kqL4qE3Wcm5ceMcd3f
 AtpSlB0rzCR7D6C31Z9QvxcV5MHkJ6/pHTDaKVAyA+ZBjMPcJnutPAF8lS8LWhsQM5SAEmSQJHS
 73fE6Ay52zadsr++g6s4jU8xlX2NBO+a20lqR5lib7a4V6mQjRmZKnerOsKqmBhrXBWFypAcjuS
 QlR/o3ZLv5KDsA6r5uC/lB8Jjh9bkYl/3lzPXphUxnNEhLt/2KudQw3xzu1BwUu3wEVq2jdxKmZ
 klGSMHBaCTMbcrB0kTpWePhGYW/nuqPFd4VngQGEQlM7UaBtGQUXPqIGEjaO5q3XVYFd3GTf
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688cc65d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UqIHtJT1QCIVCAY24KsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=937 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105

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
2.39.5


