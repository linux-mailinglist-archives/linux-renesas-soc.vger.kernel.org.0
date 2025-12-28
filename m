Return-Path: <linux-renesas-soc+bounces-26137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CECE547E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC95130036FB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C406D23A58F;
	Sun, 28 Dec 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNjuVKYq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQnAq+Iw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FC185B48
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942504; cv=none; b=GUjwU8pvirvJ9fyNoGwJxZUrDx6a+2PVgNjP2P+bbpc4dZFHBoocQu+7uMlh6ReWXUZ1PYfkIa+OoYQBJwpAGCAnjIV9ILXf2TxrerSftSNg/nE1IcC5RVm013X5PYV4oBXB92FddqiMPqtaHl+jSSWghgNEKd2ZLApJv5+XgSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942504; c=relaxed/simple;
	bh=D3eLDF/ONraT+LuQe8030Tgbd5SBZ0lrgjEs8Csfuoc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DR4NuKg3w1KEXh4jZveKfva8XqZ6ehpsPrbKUycVV/Lr2WAU3Zv6bVXUx+rtJMesVQIfkTWXUjiMf8JYdSMKMEI8AHZxmJYBJkxDYHn9IY/mwbCEJ0kDId1ToNp5xTdUVImmnWxrljVN42Xo+nAOkcxBZJ6iLP1y56PBI+4ANSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNjuVKYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQnAq+Iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSDAROc3110732
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=npwPiqZPrPU3R5s5/Q1G9H
	2LQKQVo5umALTPvs9VpAM=; b=jNjuVKYqLyVHeDRPDfJP4BL7ITLMfohoZXGubK
	njZ2OQY9In69Ksj9v8xbCatD7iglvaXSjQ0zAJxME5igWnxTopRbRXYIdzRIGOuN
	fQ1A11IMpsFQP3ipy8JmTU+nrKrEnJDHQXWyR6H6DhZSHckGHxwFb2gedQZMYfbM
	JhVpLdH4IAd74/fnMHK451q6b5A0ebZP0JEDlUUb1YEBP21zIDbB/Nh3ncHRe5vk
	zzyrxnVF5iyiluh2m7tSNgNDaQQzxaWP8thcad0rIr85a54K1sjBkkjZ29xsXnyr
	oPu5iTz8AXtrKaAfN92inqCwidyplmCmJ7KADnTGRzTbzmJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wtg9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1f42515ffso216912521cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942501; x=1767547301; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
        b=gQnAq+IwNz6goF7ScbxpAp4hhX5j+a+9IB2UnDrvP5x1FBnIZNCsFHfyi2Qxi9jUP/
         LYqWytBue72kO/OpW5bGMjPVYuXvJSkd8J0CmUUejomaMLkEoM82pDx5PYBiwD/hlNzp
         cI3NbAo+kwi5ng8G3LEekafpiyEj7fSGp8TRWAlu1ay2/gM+jqgzgAGg8jvLVRt/xcDN
         lRORTiYQcAHeHdZyhoaxGN3bc59ZdeEqloaKeYrJEvMt0VqL79y3VR0zM4DaLK/4wGl6
         B0Ro7BsKua+4/mOg2oq8qdTQxhKmssF/H/yjph5KMj1HwcdI1z6IGVbjwkQdGj6JczLU
         XtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942501; x=1767547301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
        b=jhPwXdKKV9lMzhkPLLpR+cjs19L2bLfZa/SG1H6g9sC5/hmFIivKSHCqM3VIC2DUWX
         1tRr5e7/tKQMnnitEHjI4QN0um7XSx8jhTIDBA32aFk/0BU/ERd8QH8KQR2Jpi7k/3cD
         nerhRHBcFqyw9/Wk+wGa0aEw2tfkO1F3LKWCJ6TY4tqgXOfQQ68Mj8Tze9PAdntljrKP
         +z4h2QX1Op0JPAHAuTefR9VSNzlcjUlXp8VQxwFmycdRy7JMegf/kmbIxWgJw7P0lhxz
         8Tc3gfBB/jRfC6lZSsfhfuXhYzA2XXSIHZ7pdQ76DEYwpXQ5eoblsXtUDSz4P8Xpd13U
         39ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUW1YJzv/MeXBPRSSCcIE1fv2xDDS3ncVCKo3/i/1zb00P4wpBQDgq4Dq8oTHokUrmsN/PN8QkTs4tj8ZZTcpBrzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6NRR0ZNDEJNqL1HAnx+4YoM0o+bpe7YKlaQfrW/ieKVDHn5/
	Elt7lhbS4dWuTCIMpWVL1cAEWHFI3gm/qbsF8Xx/TuStXpD/k+iV5XbUjed5Kb3HAVr1CA4Urh3
	aaiclcFxxcG36nM2NNGaT9/9hd4xIZ46K0WAJVdT3v+EdMUfdTHDhoT72OdpoWOdpyuu+BfGAPQ
	==
X-Gm-Gg: AY/fxX467XCYkX0W52xCKJm8fXiGpdagLCb3qYQPjkHFTUOofpwvul2yjFhxiDKHqQg
	gYDNqLt1G0qeD+3gNk5Ktfw9tY2kxCDgNbtM1DJVy0o+5xg5cSINNuKWdhO2qXe8bdnyaiKEbww
	WxnS2JHlGHKSSseMCQT9rmvlXfU0OOCQ1cqTe6tLaTEA2dwMSYNDvOW8p/52Y1/jI1yWDYSSugV
	z5dmxyX9jTU7TVhwEE2P9a1cD9K3HIupYV0J10pbPLde+dqCmuKWrTCNqIhH6FqJ/B28hTbmCeo
	EnBsg/oit3/LoXfiiHKd9+cWC1MlaPprl0S45pHQScyW+JJt5U6eEvwrH2BwkLePrKI/Ige4OKO
	zYsdWD7Jjkwd6cW+T2UxDisn0HyovRw+qb3nZ2jGuH8ejcAdgIcwRdw96Xfz+z/cZN1Ty18pB3v
	MV4aQ85h7s1YyoOeDdJk7b4Cw=
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id d75a77b69052e-4f4abd16604mr430244441cf.34.1766942500977;
        Sun, 28 Dec 2025 09:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwPjyBUi1UQCzq/+IC2coGHTnCTbnWaC3MbyIVz6JKpNNu1oBmd8akd4pb25eofkn5Y3rA7w==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id d75a77b69052e-4f4abd16604mr430244011cf.34.1766942500365;
        Sun, 28 Dec 2025 09:21:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Sun, 28 Dec 2025 19:21:32 +0200
Message-Id: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxnUWkC/3XQzW7DIAwH8FeJOM8dEBJCT3uPaQc+zIq0hBbSr
 FPVd5/TalKlrhfkP7J/yJxZxZKwsm1zZgWXVFOeKKiXhvmdnT4RUqDMJJcdH7iAbweh5D3g5HP
 AAkZb7nXnQhc0o6l9wZhOV/H9g/Iu1TmXn+sDi1hvn1uLAA6DVL3quZJRh7dc6+ZwtF8+j+OGD
 raSi7xjRP/ISGKi6URArqKK5gnT3jPmkWmJcWqwvY3a8Nb9w1xuGxc8HOnr5tvazNmKsDaledu
 EMsKYqn/9K2DC00yjl1+UvbV/fQEAAA==
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D3eLDF/ONraT+LuQe8030Tgbd5SBZ0lrgjEs8Csfuoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWchvMQTty0uidqYbUpbagdcXDCL/HNaNtTjc
 gXyLfXm79qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIQAKCRCLPIo+Aiko
 1dS6B/9v4YpvNb+8kATi0akALEa9MAmZaPvRBfo2I7SBnNWUTZs62wLmxz9qRqqQCfnQxeADXSR
 kwiG1sur1Im1iK1bk4XPHGEYq3DBHehmUGkjdUWCcts+Urt0/3qBWUscnAKUAXd+cKMx1EDpzMl
 HYSEdzZ+HbmSj5nXgs9nSONxq2uqKHmrg9Bds/IFFFR4oNHSYTjTL4xDNfII/WwBUbMmfnbhCwB
 MnsOx0g/aPtdaSn3weUDoE2KCHq9TQyml8iiAJkSEhl41yNBlbGf4+AQl5EAeah7MbDQ3IMrhRe
 RpISU1QfeWdCNaLXMpRQr3fq54fkXsA+iPtecT4mtcbnbZY9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfXwt4thOOSEh9P
 cybzJNqxkmhopLkNwSTW5m+jfEVG1dNhBCyhFiUQisObND1kyaIgiz8CHcVh259cvPRCUOi8SL8
 lfV+rPtkXnx6jXE4u4//p7Zj4lMXeyGQ3sWzPBa96A6hlqyakzxwsXdrjNlDz7zmQtuaR3JmZ5A
 HdLqdz+jiz4GEltDkvVJdiWA+LHjnvA5XcNtWC8KiSM7LGoCQhKnGxIuWhjZ8VuS74mHgAdA2b+
 XotttMp726ZjXILM9LMSdLmu0weV2zqn7nCXDVxsEAby4aesRpUXHgAF2YwPZ7teD04snoX21W/
 KxqqPhtmoSY9LSnZwGo7t+krxSypY7XzJ64abiYLHsZ36n9N9NqYAenmXJZUzn7DfgpaNqVrPG+
 IZQVBNkEzgqGAxmxa98asfxE/ia277LnS9ChFGWWB8VSQarD1KY+AH9fiw5c0tvscSVQnIAjOMI
 IhtXT0XZ7dqxsfoJj6w==
X-Proofpoint-ORIG-GUID: sl_IvwOQT-dwfsQkujj9k0IIDIgvrVN6
X-Proofpoint-GUID: sl_IvwOQT-dwfsQkujj9k0IIDIgvrVN6
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69516725 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159

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

Note: Christophe pointed out that AMDGPU driver leaks connector memory.
As it's not related to this series (and as I don't have enough
proficiency in the driver) I'm not going to fix those in this series.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't mix devm and drmm functions
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm: renesas: rcar-du: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  3 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 76 insertions(+), 125 deletions(-)
---
base-commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry


