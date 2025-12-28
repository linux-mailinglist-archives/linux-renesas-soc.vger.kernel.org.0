Return-Path: <linux-renesas-soc+bounces-26138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 785ACCE54BA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0362F3038F42
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8E124466C;
	Sun, 28 Dec 2025 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/F//Ujv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdrhQiNw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9322FDEC
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942506; cv=none; b=IpIxTFceiXTtcvy++VehLyOzHTVs0qSa7bKwgoip8dBFyQn2Q+KziZT/UOkER/Ui3VWqBx5HbTKug0o1u6ARLEVRj64DiL9CB01LKQoJ8eqooBowkERMQn7O27oxUDIzuDqIdr4udNRfnFl79BtDDYgey6i9SUXgq3Z9Lo/Ozp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942506; c=relaxed/simple;
	bh=N79ubxZoT9CfhEWVCl9adki2rUcnDYw7kQ2VYonzkiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qr49iVb7pfcspck3pGhsxytpM8c7xygAMZeSH2Tp6RX1vqMoorjQ1hbQWAeyf8K3afDt2ZE6NPNLvFRg3nvblPdoWOrRV7canmIfDAJ7YkhiQUOdhhQoly2eSwUHUOrKh7VRU0qoA8x/zuo1/X1VxKWjJKNh3I6HsoS5/cUlATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/F//Ujv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdrhQiNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSGejvu3477133
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YkjBaOunrqEoX2Aau4llqSA27ldPBblRpj5Ewz68DB8=; b=T/F//Ujvln3gn+P3
	xOTPowAJSfTTwwFxlzL0T2R2oiXeryHK+Fyk1S2VBZgd/Io0JkZezo6cU2moSey/
	udFWpNHB54jXt7AEDoqh31Ruc3b7T5vc+ADw2SWF/Mg9S6ysnJuaUP81JYmrRCu4
	H9FVAxSXaT4Bzy0xLNEy+/mj1E6FJG4MGH1JVMBMY1BGJfQWo6UozKjtPnjljYkK
	UzA40jm1YBofWOfWF7bm3KI3TPGcWdAwnx71TKo2+nPJOREOPLkporxuoMlW04tn
	soEjaZKTAdzcLUwpsnS5diHPQB2DBYtCH11dq4sCsog0tUU4dJLryMgQg1OW67Gw
	EeSbYg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jexe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso228814586d6.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942502; x=1767547302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkjBaOunrqEoX2Aau4llqSA27ldPBblRpj5Ewz68DB8=;
        b=cdrhQiNwLrneu2wlr7kYpZdht73JqYMXf55Y+CC6GGcXuv6jL2eyRmJ/WvsKMGHG2n
         tlt5uge3hBeVph14Tp4Ajp/8/WmLG6ojEZSVp/o8OUeRIywIUsFXOCFRR2CI4fLk0t7M
         zyCwyFcBEUqK8KO1b2dOuHIduqpwUaN91KQmee2H/nkznOwqPab8Qy9xogg8cHD0p823
         C3lxQ+33VwYdYlNctIhBfGYbjBXwA9/Nr2Nvc2rTSWMx0UYGiuEI4Pm2uAaUp9v+beee
         h139+7a6SYS1wuE837yTQ9twTgLC2qW/6A7G9N9cpjYB91QPA3YfG+lOnM0ZLnXb+pfz
         AmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942502; x=1767547302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YkjBaOunrqEoX2Aau4llqSA27ldPBblRpj5Ewz68DB8=;
        b=onK8NGyfje+LYe/c4fvq6vFknPg+9Bu3oMyi/InAeJmqJo/SFjGJ3aR79zlWRC5MTi
         aQRupSrHOzZ4VhTW1GUOdMr5/Vp6GK2H2SVzodjnmgx2Kv5cri8Xh9u5BX1TrU3Hztx7
         QvONj0WY48OVfbMTqWEDAiN87xnD5Vg8YUvcZAQVYf7L0lcb8g5d+TK9F+6m6Klfq6TZ
         QP2ItBWYGOj6+3a4fvDV2j+UO9nLXu+kH293/23UfwerWVZUfpYpWbkC+wOfrVmUarWG
         lWX4qGtDKJnUybzf/3YhuuD4kkYkrLWl9q+68M6uWN+w1qeHSHRKZC+zhsG2PD2mZAN3
         b3xg==
X-Forwarded-Encrypted: i=1; AJvYcCVjy+vO5oR0lKXBwY2IdvgFCREMqCNA0ibjf3o3vd5wTtAvCB0utc2jQ9ziShd8rXQcF+KueKzqtUvKdQe/NGtpAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjxhwai7MJLTwsjQBHPAJ+u4ry66NL0qL5+IDe5+8gjvmK5xdt
	ANC+iN81Z7vVj1BC5LQkSPEi+DbL3kemzHgiHmHFFeGS1gEUYQ9fBnNgc0jvzACaFZQKdznnVu4
	5D9I7XZgsoLyiYQES5uojUCCvMbP6OSiOnZQ/z3g1W7pJuJdlubSfjFPTm7pJ0HpA0wXsGBMV+A
	==
X-Gm-Gg: AY/fxX6mXDEis5ZJl5Ax/9zr/VHlXFdEUhRZaMAO598LPMREf5WulgJE2rmPkn96M4j
	c86YRMWs8h5LzjBtEljHIXav/Jtkf/W901oZGGT63y8WS6DkSmYh7/zJkfbikwMYncOLbshA5ym
	vYx5L4HyeyNrMvyG/kfi6OCPv7MNAX4QvA9x/FlT7LLZ/8c6m5192Kyg2uKkhYNi0ntBKSl0F1j
	BOWen3e1vD9P0vokS6FSxczFmQH3RU9N043PXAo14GYBCDv4nvqe4qyZuyWSvpkycu9BI0A0nf9
	EB/XFpuAhTkQYe4cZw/prb/RtpWuiJPGVDz2wQqpBctMMRebtcNcrVtK3tKVFZQ1qJiU4pMkt/v
	YSZBsoF9WRST/HrhvVpDQO3uvqKk0IefMLZAe/GZ1UPlD/kMc07foTJOrkG4c6fc1Ucb/qtsqns
	gJiPKwgUMaJ+0r/9xpEUeaVJs=
X-Received: by 2002:a0c:f807:0:b0:880:501f:608 with SMTP id 6a1803df08f44-88d83983b64mr336330736d6.46.1766942502081;
        Sun, 28 Dec 2025 09:21:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg43kpYtqQZC5vFkhsCgSUI1Pebt5euGVk/sNLrkaiCbN3dCq7BIF7cHpcCE/NR34DsmS7ZA==
X-Received: by 2002:a0c:f807:0:b0:880:501f:608 with SMTP id 6a1803df08f44-88d83983b64mr336330486d6.46.1766942501641;
        Sun, 28 Dec 2025 09:21:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:33 +0200
Subject: [PATCH v4 1/8] drm/msm/dpu: don't mix devm and drmm functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-1-58d28e668901@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N79ubxZoT9CfhEWVCl9adki2rUcnDYw7kQ2VYonzkiU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZgumJldFiuRbQyP4/3zJUTcu747q2+ukG72IgpoPrMo
 t3GCgqdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIhhL7P+X/QXtbmFRSF3G/
 enRO6WLlSfcCx4q+Dy9WTttzNlYztvRzWNqmu2r2XAl6zAm/NtvMrpOuli368lZN7r1CZeFtYxl
 73u+SLg0r35oyiRYeVDBn/NxhPMlYKaRyfnlYmHZk9yF14cQdG6WEdn+ZGzDnd2bk7vkGV+U7FC
 0XLeqb1XfGYWrVF9k4NofewBzWj4FfvS+tVFF8v/lWXmqagcOFKHPzq98XPnh/+WV10FmeS3JF3
 y2OqGdHfXrT9CK2fe1UyckNDHLs1y7nfOmaXrybP2TV4RO8e050r74mWe0/obqO9Unq7fMqm5gL
 Ag/yLp+jbV6hfFZ/3VfHkCPWjeuiz3+ZcnzhY5H4Q+l/AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4b9oFnImGBsAeSd3mE6Ro75LQg--osMG
X-Proofpoint-ORIG-GUID: 4b9oFnImGBsAeSd3mE6Ro75LQg--osMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX2QCVCpCtnPEy
 enFNKzIaotqyBdscI8+43iDHhGMfwssuF2sczvmMXb8SySIfdVWdufWvX9q+9IvXkyohytKgATF
 bmIwSwVryhMuecPa/+7E78V/QjfPSFGE2M5RUxMI7ZellVZSLc1rzR80v3nJSEN62/9S3w7JXOM
 ANbErA3h6ULn3v1jeJAdKu5NBcbJyPYTXcbsu82wAGKuddsbDg+obvkQFVEIY1cC5j77vavZEoT
 lHFvt7QmtWMeaDJU6z45HztY/H3IMGTeVcqMpLKW1nktziMe5p8jqBotjH7v7eeZ4k3R+SBdEik
 169ug6XSjDG1tfnEgBz3bPb5/T6ci63p8EjT9mSJbdgHPhOwnSVKdZSo7FvYnFRDWvuECguSizy
 rbkL6eRiwf9MVObJWeKXh9cVYUacaR8819XCpzi1ogmKfgZ2dbrWGds4J+/VBqeJfVaVJFOe/kC
 o7XqTsJ/teY4bxNT+AQ==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69516726 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LvVPTXtSEabqDirTlLwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159

Mixing devm and drmm functions can result in a use-after-free errors.
Change dpu_writeback_init() to use drmm_

Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7545c0293efb..6f2370c9dd98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 
 #include "dpu_writeback.h"
 
@@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 	struct dpu_wb_connector *dpu_wb_conn;
 	int rc = 0;
 
-	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
+	dpu_wb_conn = drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
 	if (!dpu_wb_conn)
 		return -ENOMEM;
 

-- 
2.47.3


