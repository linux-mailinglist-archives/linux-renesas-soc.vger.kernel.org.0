Return-Path: <linux-renesas-soc+bounces-19843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDDDB182DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 15:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9938F7B7011
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 13:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC5026CE32;
	Fri,  1 Aug 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBASkNa/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F04269AFB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Aug 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056285; cv=none; b=CG/aLRGLu94MPpNFuC2TwLhHm39boxZ+HcGNT4mO8Y8RGqz9arO7YcekyOL+J8XpO8sRnaoYq455saaYf1LTQhY7KEr03wBTFJ6pKIcylM4uNRJ4/hvWxzZjhMCSS6E3VDliHKKFt6ewjmCVoGRNYc3YSmY0eUH+iYGTfeS81cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056285; c=relaxed/simple;
	bh=R+5orXaZWYFqlHQCgWzWcWIKZBQ4MU2KJjCzPihl1hE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J5kvq1JrI2dl8qEZtdPKcN7jAOJJ5yA/NNcP3eb8ySV3SABwpW2Y6yXbyWI97cy6WtYg4D0bnCj7LIlzig1gIZf5HLJZSQy7Ia4jIHhZGHJjSWi7XF0xzqaEVi8jfPtb8EX8lgBNgp9i6396vwx8by+VS4IXqlkyPQ5/lslBrgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBASkNa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57199t4U021187
	for <linux-renesas-soc@vger.kernel.org>; Fri, 1 Aug 2025 13:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R5/BhHZWXHfoz2PoAt8iPP
	dFYjTG2bedIk3AU8wQfSM=; b=HBASkNa/Hs0jzEUfn96lq/l0dTsR7WwCRZ9RvA
	qB9MjzTzt1vriGZRyYaQRSKNBcJgKm9wvwqONDJYP7GuRxfNATw1LsVhdEFVFbYD
	7wjrslaRLBoAkTJ3d5iZvYr06nWoUswLyIortj2vIabtDE1ebc3o6deiCd+FmOvr
	GZGjRkmVCxJr9M0d+3GCiJZgbsp2epP/OmnI8FmK0sbnz2X8sashd2IDdyAZEAoK
	e8yQE6Lr6WorHOPbMZqWkd5AJii2P8o1CBZYEFA2k5jSqMatJLyH51+Dv/S/f6bp
	ZLVkr94qUy7F3dpg5oxw9MtqphMTwrKwZHO63y0nyslNS37A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1auw2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 13:51:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab801d931cso41442941cf.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Aug 2025 06:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056279; x=1754661079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5/BhHZWXHfoz2PoAt8iPPdFYjTG2bedIk3AU8wQfSM=;
        b=bV51f/tZPsI+7YXFtES9D3oM4Ap9Y51T4iDqSZZ7PMuu6vmwZ8nsnfbFSz0XAaQPNM
         n/792TIvOiHiclH8zqm+RrKsfQL9ob++pQMnPX+P8UZePF+nby3y8OyNBz5l87yyJZHO
         LVS+3WJUQmfDgaqoxgXlsoGGfqfk/moMrXUzxY4mxeF4AjXqEGP9OL+lmY3woQiDyLD4
         cFsuTFoyyC9Cgp/e1i7Mx5mRb6JF756yylnpzKftBWREUt6MYnrC8XnUyq7xWVAZuI9j
         vEk16JQ+0vZU6F+6NOVk5wGskirwAqnVhaHsVtMXKQvqS9OfWR0wJV2EOfSrUUhvPvFw
         WkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmFRk8HCsAY/LmEKP81clzEe5GvBFUX4gBw5L7VLPUk/f2xzx3tunho9/vB3KdCN89+aHyRo9MveYNUfEJEXJrGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxprD2mjqrtSyQ0fTA8I4ej77FefVuKkynKhxDdT0s/vBrYWooy
	tStp6NuVjxpdfaw5Ux5JnyBWCrd6UjcvpJhKn2XJb2hk7Y/kPC/LOaJOZ5C08KkaFFfyWPaJQch
	uxcNS/IUKW2SGaTCmw9sdB/A/i/txwJ4DHffn2Gv2ofpEBuQ2bl//vhV4dWwi/Fm/fbJWQueMIw
	==
X-Gm-Gg: ASbGncvEDtdTF0iTg3z9ryhnwSuU/ub3/8dZNpaR0h3yTuGsO6TyZzKvx+Stx6JSqyV
	oNotzMnUiMq6JEb62LI2ZNzh3hjbOaAFzt98exLnvfSnyh6LiirqMkqbUTXHC4h32+uveRjF8RM
	5yCAw4JbziNbt9VuApH+GCfQZpY2KIWmK2SRuKwOtFMrPWVtors5iU2pn7vdBwK/PrxcaxM+kgf
	ROuZxdJEA5SOdKqfMPuqvObkg8jqgLcGaDJ259ZSbpxVBKngWkriVQRdyyzPZJgXVdPSfIc0GQM
	gTAh2Nvtqh/ziFUddJFtGD33P4FcKrItLPfCakHUhwSdD6ZKfZUk1dsmUE8pqKlUHZb6IIFLQpM
	u3xNkeRD4f4WUAyaFgiQmY4reEUocfLHpCRpZ/T+LmNMlDNY+jmA3
X-Received: by 2002:ac8:5784:0:b0:4ab:95a7:71d1 with SMTP id d75a77b69052e-4aedbe7beb9mr161744201cf.55.1754056278862;
        Fri, 01 Aug 2025 06:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtbade6pZ9wkxnorEF6axWOtrohHvqQculMvY2mHe46exVpYNBH602aw6FU7DeF5T4f4fIgQ==
X-Received: by 2002:ac8:5784:0:b0:4ab:95a7:71d1 with SMTP id d75a77b69052e-4aedbe7beb9mr161743521cf.55.1754056278246;
        Fri, 01 Aug 2025 06:51:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Fri, 01 Aug 2025 16:51:08 +0300
Message-Id: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzGjGgC/x3MMQqAMAxA0atIZgNVKFWvIg7aRM3SlhRUKN7d4
 viG/wtkVuEMU1NA+ZIsMVR0bQP+XMPBKFQNvemtGUyH94akMSEHH4kVR7ca7+xGlhzUKinv8vz
 HeXnfD6NH1jNhAAAA
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
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R+5orXaZWYFqlHQCgWzWcWIKZBQ4MU2KJjCzPihl1hE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZSfeMebHGzi1ad5D9OJIiWxXkAsbLdE3xg4
 nZazyGjsZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUgAKCRCLPIo+Aiko
 1SdmCACyivvAMPFOURSFjenFZ8ROTLDqjmHCkE57/8pbDDtOmnvDfJ7Fi6i01/G4wEPnTGHed44
 N+uX0xC10aDYDljZbg9Ye2oCBvC8b8VJfxf1JuBphl5iqinO8bjED8LaJHe/Z1IQHal1TB2a/oo
 PG6bYJEhwq7tv9+s0dTyKqvksmESoD0WDb1DipCPoHx0hVqHvZ1tmNdtf7u/JgHibuAZQ45snAg
 0cRP4v//GNyZU6xiXtGe3Y7K95lbOvjZiSFO2fwFx9NrdrFXD+QX3+JaMCInjnjVO/qKNVipJ10
 sML3WPF2VNylJRkIVccwbCu8kIidTpUocxHhmfn3G52M6APm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0c2XRsDQiFtcW_umzmD18mccSdupS3pf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX96Efb2k4O5hr
 zMOWX9AUCZWVtCKYnZe82uyEaOpoLk/eQCeLCLxz8GJ/ufx5ohrgc1fZMfFT0ZswiCFlp6VcSPm
 gRUB2ICIxKV7BrNJ2Es7uNBT67e5953MjMLfiEKEFjpT3qFSMAPXWAMhlQViXPPLqfyR/zx5yX7
 TG+0GMuhRN7kkNvEWCrHqUZStJ+4jAkCp8GiwP1gM0xkX/siJ9NNX3qJ8V5y+goz2lZGMvssSoJ
 mgC9n4mmbv0/D3P2QaNtroLmLYFw/niwseYHnHxJM/MSsdqB+wtAKPWpcfrvHauHD3Hlme2DXFR
 r9I9I/ZoRTA+L6GzCSkz0mlqoe41dM/oB43gPsXnM4RbiQWC9IGxSj4Y0TpboB5SnqudXrXGEDp
 wpD3rqZ1HrC8650Mqwk3J8D2XLzNSUNqDciRYyXqB+FfC7AupuvH3QAjFRdLkyaxPirGX+v9
X-Proofpoint-GUID: 0c2XRsDQiFtcW_umzmD18mccSdupS3pf
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688cc658 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=891 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105

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
base-commit: 94f208ff622b09309358abaf26d7acca0c318fae
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry


