Return-Path: <linux-renesas-soc+bounces-20576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5FB28EFE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 17:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDB865C0B65
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 15:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4B72F9C31;
	Sat, 16 Aug 2025 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCAgJmfF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71132F90E8
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357584; cv=none; b=DtCPhFgVcXWPwHs9Qrkz0ob/cCGiUo+utBq9Yw3kgigMyTObuBZ7+yEha0cgBUhHxITM09krYyV0ZUCq9r82C5WuWUjPvs3lITRaMwhKr+QgaY2dY+dzPOZ7eeaKdmJzhggdGsIcn7Pc8XWd/ElYnFsLxNkDQGt0xk54rEgffY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357584; c=relaxed/simple;
	bh=A/d943iupZVCsxCU+H3jAnKd2fBEwptYqE3Wnl3fWfg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/VY8anXaSoq3ww0kI0N9Uy1fvvMis/cHXM2bwQXZIWwAYYGM4Dv6HJYfbPHKnFDv/kEsGyVTwg66CRp7LijbCBMxfplvvSmGa5KY3gyyzKFr3Wc2fxzBkZKgnaKm4AqLEef24haL5sH92x3KKkTrJzK+hTkd3eGB1MX40j4aoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCAgJmfF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GDYF3a013020
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5lryexlqd0cwKQzcmybpaI
	+3EMl9PhbQcl2IWaTvkAM=; b=oCAgJmfFi/I2hzZFvUUpZcIkfXUtBg3UORsCZf
	JW43oqB6fB7mnzKdW1JpGIZ9TtzLtE+W3jZ36ZMH0RXXf53Mhu96U37P8XUnxarY
	oimPLzWmgJZFXbICcXB0HBA1w1gu09hc1CXhdn16cHauAmztii6bPGsJnEFJoSC3
	aYiCb5CpR3aeAnly/872UnqG7qWifllQ4xar86OOnxToYp63YUVDlMLJ7cDGODHY
	oH6TvRWa1VymRh1hvQ7/2Lbt+4Mcrs7mZQrgFZ+OPFp7MRkfVs3ANWt4JXNERfd9
	6AHTINJsBENxDPhLNKJRYyljl1ij1Dn+lNT1choVU6dt8tAQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7rsxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 15:19:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-709e7485b3eso73484596d6.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 08:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357580; x=1755962380;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lryexlqd0cwKQzcmybpaI+3EMl9PhbQcl2IWaTvkAM=;
        b=tR/XYA/nVfpQl8Sgq6KLsPsaRSUiGOo3bC+LKanxlzlZNM+9F9icl9c1Q+u8ZvA7vW
         XV6tScB3nGq8kQjLG10Ntqon3y97hRzvgpKELdqcLLxH6wcTz0d8OEiK8KqBRAr2jFov
         yu83dK6iv7MOR4OUjhvctmMyPC4t/K1629zZI1Ur1szRWhDUIuzYF3ccC8c4DpRWg8Sp
         qTU5x1hrWpjfbGauMqhBRljLdgEy5kGh3/74AkXtqY0HwGxbY672kqTACZ/gJETlONCd
         AvnXPjwmRcFgnscFVHioJ7DQ3dTW3/MQtPsrezTF69VNUe/vvz+0ZmM6Z0TAIRkgppCq
         mImw==
X-Forwarded-Encrypted: i=1; AJvYcCXKMwXcfLvzIavKgauJIusGS0gGSYhK8lhndhFalh10saMcTLW1QNVdslSupz56fFfvQKzfYwfvVHBPdkdOpBh12w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOttsA3w/RtUHOLjfiALxUIoFdQuIYh9jvDgsKNWSgq4omyYLO
	HhrjWRWlpVMTkxEDHvVFq/n8hjMbIB51li2HWWXOH9NabiORpzt93qr9XgJQT8YRfD0fkmM/j4e
	QFSr9q9CXKIAzK08DjqVeriloHctl5ShdkhdQdixBvaVMXqi5z/wUvTfN3aHbYbf/Q57v3GGjOA
	==
X-Gm-Gg: ASbGncuCywf+Sp/AS9wqNHamANTZwilURfOOME44d03aUxnQpiQET8jf8aA4Nx4Tl/q
	Y0sHRQx1fNUnC3IdEUX17Zl7TKuPXGmug5E3drj03ETZFedIAYMVxLNjVU2a+kelbx4G7JiE+vL
	ITsPjLnqSbrwXfOrU/mcara2r8tCjeLen2ar8ixAzvqJA2+euoll4lohoH2xjFj3r+vc3/yaoEo
	JOLr0Yix5/OK2MJHdenk28FznrVG1IA4dcj1qQSV3lqlVcuuvZAs2MI1sYms0h6PWgcmiDHgxQT
	jQD621M7vT8AMLCcCrcLDs4uoA8g4X1xF1i/taqq3+WFB6237f1rAQ+T4Q8Z4XVHzDGtlyZNjTz
	/+HTtwWQGBuj7rggc6dfTz/NuehB2xX+kmcirLyg/gg7PrCi79DJh
X-Received: by 2002:ad4:5587:0:b0:70b:ae3b:4fcf with SMTP id 6a1803df08f44-70bae3b53demr47856756d6.23.1755357579709;
        Sat, 16 Aug 2025 08:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfelfomvA5wci6xz+3wi0J8SULNHFeOUuYXDPXJ1C+6Dag8vtfdR/Y+CaRJy4U66cTGuwdXA==
X-Received: by 2002:ad4:5587:0:b0:70b:ae3b:4fcf with SMTP id 6a1803df08f44-70bae3b53demr47856216d6.23.1755357579187;
        Sat, 16 Aug 2025 08:19:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:19:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Sat, 16 Aug 2025 18:19:34 +0300
Message-Id: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIahoGgC/3WOwQ6DIBBEf8Vw7lokKtZT/6PxgLBWkioKaG2M/
 17U9NjLZmeyM29X4tBqdKSMVmJx1k6bPgh2iYhsRf9E0CpowijLaEETeNegrBkAe2kUWrhxQSX
 PapUpTkJqsNjo5Wh8VEG32nljPwdgTnb3f9ecAIWCpXma05Q1XN2Nc/E4iZc0XReHQartZFgcp
 /CsP0GkFg5hP9K+jJTtoNNOXn8L9Lj4EN2+MNFAzu8AAAA=
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A/d943iupZVCsxCU+H3jAnKd2fBEwptYqE3Wnl3fWfg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIGMd13UWHpYiChLD84LKwc5yW7HTOFZ5Nc
 BeTRdJYMi+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1VU2B/4olLxWynZ6yiMZ4UeXGeUOQWFTHVS0OmcvLMCYAz5OQG0aZQ8ccKIlHwyxoHSBsBg78Mr
 5QdHuJQEQDktITLER+XgXzSQGcAgijiinR/nhTa+NfpLIGR/EZrDmm2Pzno0MlDiSYg29IhxB4T
 kEyqTv5mjfkGwilg9DYt3nua1zSszeQdW1SnwwmS2bJ5BNDrwFKw9Be1apeVE0V5bbt3gjV9cJ1
 CTyH4/m6IJr1ZW1Z9GAeYcsmchIGnAeuuUGT6OENI6yZkiEVDemT5O54HW7bSXSXNU41/Le5fiv
 QQeKwVTkV8cEZ7a13v/GM/cWDBTcehtOQTW4bxGUsGsKFDS6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXwgg/L9eqQ8FD
 vbPdauaXVLC4qY7LFGT2zEgTM2EgKFbOE0gqrlt9UyOUfrhnajTvjGqQNw3vOc3r7RRpNBOICuT
 Tqe5yJmR8yNHANjWvcjEEdIK+7dXxWTB+wQKPx1W4+omZoTt7NtGPBVEf5VQWxcsliGS+xSubx2
 x4rrhtrXk/b93gVNynR5WUFBNENM7EJLRAnXkgOVaNtWHAUKYg2OTp1OB7NMaJN1iM7A5VN1Uzg
 hcROVDFKHviSmmkb+7ixhMa1fJrJTWqxcv443tD8oclW/3nDsEut5r5UbU71XwEKX1BjUg9ID7q
 SgCIuXY7Qw/9Ii8fCVJDiFf8I/Sy5qIYFCr6FzHsJCjR9PiQ2dmd+Ylds9i794Tv0J3gl61goNB
 8uWVaQYc
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a0a18c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: KHiljjJuqCftZ3ZbVzKAIcYdgO6Lm3Ge
X-Proofpoint-ORIG-GUID: KHiljjJuqCftZ3ZbVzKAIcYdgO6Lm3Ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 10 +---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 77 insertions(+), 131 deletions(-)
---
base-commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry


