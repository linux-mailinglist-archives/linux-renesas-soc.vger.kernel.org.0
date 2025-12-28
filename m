Return-Path: <linux-renesas-soc+bounces-26139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB31CE54B4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2E1130329C3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B31246BCD;
	Sun, 28 Dec 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEwij8f4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEzJdehz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A8F23ED75
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942507; cv=none; b=hI8BujXxYlIczpAmHknFoNwB2oea9VDaebh3G1G8rod/g1LlSnF2Gu3bZkw0qmTY+6yMz8LsZ1oKDwZMyWNzkeHE04AnVQdpFnBtfN6uJShc9np62IgGKmCZRp02pT2gcX9LnLLKuiwFkj52OZrHnbztQeOXA590ZaQGnZEF1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942507; c=relaxed/simple;
	bh=AhjL5n0KqMn00LisHx2T5B6vTrBvTjUUJYkgUx2rS80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ApJht1vjY7Bz5Ic8lJKiE11o4+/Vvdv0uaus26HKXGewqDnlqtXGk3gUGfzE6M/zSb7GHP1G3qZzUYqmvR4wjFlHrlJbMKCw22cc9HfzA9e0hVgrL5pK07PUQFLUbeM2Zzqxu/woRn525Y8fHX4Usw7exmfBNuXF/1HD6CLs3+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEwij8f4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEzJdehz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSAP3sQ2628256
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=; b=BEwij8f468punwq6
	urKJB9CgqrOEhjKjBPwBBQXG2Ilhu1me2Y8M2L+iFIkvhgwNJybHYhrBCyDkvzOp
	jVx5gZ00XNtkC7J/J7VguH7FjCj78ZFy2j+LVOhNLFfRYXYTgJ62udHdIwgIo3sr
	3221YP2zI1V5Au/JthDmcXGCuik8AcGoq9kLIAP5RwhdRtLDvAsp2zc/T8vqth+1
	eZtJvqyr0V+idOdxnbYqL2mGH3JXZ4lAuNnt09lwMr06yJ0lIQB3RdC93fqswMGB
	xXPfIvwWnEvqC4V8o1z544t+W/lrFu15e9AQzQWVPOQhTxXnDdZ4JsqLkdRg3Z+3
	lEga1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsafvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a43d4cd2bso108682876d6.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942504; x=1767547304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
        b=hEzJdehzEDgL4r6QE7OHKvTRUIz41FBYOwl1WrMcXWSeI/LMaXYrFo+oINaj1pqK5f
         8FNUgD9mwhF/ZYAFNPsZHUc8c5D21a6ERMlvN2gd6I6QgiPjQ88GbsMhHvqSKS6PQ/hz
         gyGBgI4l13J569vbvHEjkLOayDTiF7uAM1OMhNe546orh4FdI7KPPIKLWDOTQLEn7I66
         7tF//Dx40rs3SvqMphAIWvxTsCxBUqo57ZH6PWsHX744GRBKTcPij8LBA6Nm2PDsVJ2u
         9uS8JxLUWNyKuVj3F/MMprh6X4YGBQkDJMgvvSWSXOGJXql01vnjakrvOUaj506qewEA
         xFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942504; x=1767547304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
        b=vQpaw2auXgfmkNSt1lZw1onh3jgKjna+Vwkn8eAEJtPJWe0reT2l+UZ56j0EFG+cgx
         VX3s5ZB8TIwjpZXmOVWINiix5l0yo5w5uB9UnKA/OdMuSG7gPYJOeDiYB0igM8wkRd/O
         IzIZGsPOziYt/0+EEEgXxPFCzfCk6v/lv3JJXQK29rx7kj3itWxiIyVoNsg2RW/YLM48
         VrWZsZ1zZUyn6XHEjgo/vIYp7W98Nj+ugCDYxGXFSr6jyaTduE1MvInd7a//NyHhpE3O
         k2fAzttNusemZLBG8xITdIZ/8DP67dXt7vLnwbqvkN3CXIcLglUyaV/Ny42SJX62Iy+f
         zbPA==
X-Forwarded-Encrypted: i=1; AJvYcCXlZxvOblOX51PXJyC86lGF54BARzCPET3dpZvz7JLCzjN9+JJL/dqB6mRbjNX7oe2js3oBn/hqzADNBebqgRbHAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRMK34BfaCZti+qQmQS1tjJmAdkqYqZREdjE5CBEPe4NTb5AN
	euEmIe6+5fSdMBjv/NzMiV611i+kk8fRv9/uRVW47HNWeGfouJIPZkJkPiqljMSzwniG0xyubpI
	Vg38q+DTeIVkxpl5CxOrfBRbiiy6wP7ggo+x2vXXYNgiIJX05B1k771Esxxr0TkQFgSeXGHez5Q
	==
X-Gm-Gg: AY/fxX44dPYmEi5anETZYohod9BNXsqx7OvyJWKGh06ak9iFYdvMM0tGNSu0ogbyZNb
	tqrxFoC/2r1QLDamf09PCvHPrc0E90ukOjuGcvZWJOh7Kf1sJYZaoQKhLSAZX44kqvaQ6/mIgED
	ZPcWGDTaVTEBb705ONtWIhor3VZxlNTUHNP/Uh3ox/SxCZ5Ph07fJngcyxJqGVmjMYcWydIjFBu
	Krk3cf7dkAA+R12CGVEqKJJCF7p9yKlSa5kXci4SlgZE3jIhPSU+GrRWLuZbDKMveabnPEmuEmq
	ozmBhaZAHcxW2N6xdzevJfAqQLhQ0X8FX3n6+AzgRislAjA+rLVhH34m0oGORpBOe4Ep/7jkgED
	lJ6y/NIGTEDp//FI2vPRewL54NUIOFG2dvfH7r+E3V/E95yElfoqyDILqeDW4jd96GgDfK+psLU
	3NR9VOlOvYezsoH/TeXUd0W0o=
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id 6a1803df08f44-88d83793405mr311516476d6.40.1766942503352;
        Sun, 28 Dec 2025 09:21:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5EUG88eN7xWHCQu1kB/Om4DasLN+n2uCUeGVvVxm3AjAOh3j8JLRR73QWpq6YGG91jGc5zw==
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id 6a1803df08f44-88d83793405mr311516016d6.40.1766942502851;
        Sun, 28 Dec 2025 09:21:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:34 +0200
Subject: [PATCH v4 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-2-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AhjL5n0KqMn00LisHx2T5B6vTrBvTjUUJYkgUx2rS80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciqEro/DFsCfKaexLHG7KTjaJzdmaEO/86Q
 /tztctUKI2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1ajxCACH793b0lsnrCbvP33cFhq6yL0q59eHuPMhmnMl4PbAf74U2q6vkmuhCLbqWCyjjympkm2
 F/QcVzF6/2fMsBgWaxsNYMVRtMEayNK7VupJM/1PgLNA0wAVIhFcD1nGQ9aAoIUL3hD0ssjtLSE
 9+AjggpuA2/LVew7AVfi28UvHarYVEjG/cdGTOH+shJS4pH7Uc7xY64PV2WAV7gcxdIF6LMqZF8
 zVkVffrU80TTqtUmnaNTLFzL5KTn2ydJbita7NEyIvP5RCWD2I94OLeJHb90rtbkm2B4OL7NFwl
 y1FdVeZNaoJYHJgm5XqKdUx1uN271EkIn8vhU3oofzZ79v+n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: e4YIR4uyXAQCCrk4G1jig5BPNvK5EXck
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69516728 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8cP71iSYcfV9S7Y4u-4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: e4YIR4uyXAQCCrk4G1jig5BPNvK5EXck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX4nMtLvDXjVR+
 ZXeKS1tVeB6XUj/5NnTEpNqHzIUyruaPhigAH8MeTzjzmIhOaqwNjmdD2Y+BgaMiGimc1ZYo9E0
 7YforZ7kp33N0QRHQvNSNokWQ5nuYByD2QRzSZqAwdT/9HwKKNvmTxdo7b78xXzRelKi9vKqNA3
 7ycGifIR+1wKUpnfN4lwFyS8XSijulvhkLxrcN1myXh9en1KPd+dNnYHwdrNw0HyLzRl7Cf88Qy
 7M4WO9FXlPlbUAbs4ApuBbpKMb7F7UcmMbl3Gkst/cAQvNG+3WXxQelPiM32vgxBLefWVDXFI4z
 VIN4dqCj64OhPuir4b1EkFoh2F2LQu9ub/LzHZUIL+a6fmPFITwDEhE9hl9hsCNeCV66sx8Jaic
 U0fLMYtOuXVwVXlxpu3e2h1+/Jb8uN6qpL9FJXXDWrXFTleR019ggm9nhNYoy3fhzcyAHVNKA0P
 h2PsZjada+gpHeeYUPQ==
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 740711ac1037..45b3c8f16b23 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10570,7 +10570,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..80c37487ca77 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -171,7 +171,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -190,17 +189,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.3


