Return-Path: <linux-renesas-soc+bounces-31971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K0OJe84+Wni6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:25:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8654C5447
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16DC301FF8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 00:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536F42765ED;
	Tue,  5 May 2026 00:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjvPE7hn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELlSm6mr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5023507C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 00:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940711; cv=none; b=okTzQhl8Apaa6RHA0/gNNZ12HaOB/xJli5SP4YyKkpkFdDRJ0I0XWNc3lIppzRnsTRLsR8EgLmdfAYCecwzHLpFyg+4MdfyhMMQmqmVZoQ4O94sqGY4/2pDqnRNrn/ymyfckZr8kdbz5uaXmrp3GX+dEXI2Ifp4Njs56zKUuwyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940711; c=relaxed/simple;
	bh=5yJfYD9nv3EttqjPI1vJyzwvXDJhLx4j8rBATQoCCEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l/YfNnNasVPfLCcKBnHYLvHt6mAEqA67WEOJfQCCEUcDIbEjznKFyM1d4/fl7C2b8lLGH/0l/V4VAIIFQKCjchiRFTQnhmboqRc38izMq0Zz2eNIxH8hguW0E0Oxj0D0o7bkZYPEZu3YF/dlIhrCRrfa+YzU/+8OEG/mxwhSD+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjvPE7hn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELlSm6mr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LJLIK1960741
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 May 2026 00:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7QLod9dRReugtdmt8pQOfg
	aPMeJva4633ho398t5P0U=; b=fjvPE7hnM88jQx30FVC2ZWXIf7TWjGN3eYN63h
	Ue571PL1sq94DOGQ/hNxaOgRi9+dU3csOkwJyqFcxBF533sMQMW4FAE6r2LAiXsY
	6Ml9hkYOpYnhamv8OgGXa70y8ygkyPhvR5zoSKZ2KVyB+mVNmNZgEgiWz87aL0vD
	u8PSYdhEl6Tp1krK5PFbfmy3M7IA3owYqXO/yfXArBBc2zjcMp4QfOOEdnfbwLTV
	9K6KX+RFqZhLp2N/mN+bRVxGzzz/jgkGZzY8phKOs+6WzF0oVLH7LlPCKqjvpWNR
	7Q4+ekzx0uBChicnA/9htOSTwyoxl1XtuVlJmDR1sK/eOEmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dt13c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:25:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff051e189so126396541cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 17:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940707; x=1778545507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QLod9dRReugtdmt8pQOfgaPMeJva4633ho398t5P0U=;
        b=ELlSm6mrsUfcM3g0/2983ru1zU5aBeleoksOMM/GeJ7sVh8C+J8qgc42ADoFv5NyRR
         OU1MCKq2/lgWu8r0BfmGPDXEQwK5cYKod4v+cM2r+S9mqmuu6Id/qrqCAD+qDPxXoEFF
         9X/ToitSVi9B/HZmasaWz/L53b3iLx6Pepp/r8Mfcv8sXUx9Izuw5r3S3bcSg8FVSr1A
         GBBEkKOeO2Qi2L8+vfmgv4k5X9kc2I+CrHghFKwO0efB/wjFksH+ZQUx+J9k3ob3Q0Kr
         29D3FHa9MPt4I29nCTKb/3W7fTyFrZ7XIwbHqjAPGq6+KjQiso9nYOxKG55oUgYInFCG
         ftwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940707; x=1778545507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QLod9dRReugtdmt8pQOfgaPMeJva4633ho398t5P0U=;
        b=ZB1GJ0TaGx6JMpWIe69R6zWJPW/8+6DX3zmKoItj1fX8m9KCwxHrFSyBuElJho+zvh
         NR+0nfoew4IOZ1h1FVDt16RKiqyvqMpveXBuEZMfq3MBPHB1131butcIPR2OdAL/NS3j
         9m0dbOUH4WkfScyaVH6PXkmVUuN2MhuGtFL/saNbQxKOUJjh9QACIH2oY1an/Pl39j7V
         28lztT52UmwqHiUhBxpYxB5G2E3Nq4S9w0H8AJArTalBXYx6pyjERMXZ4Nap/xLCluXZ
         S9W1RJLb+6r/r91L46DadyRPyFuOTkF6iBdbP+nuQN42FdcbqYsnmseV+g7a3CHXr5m8
         ZJQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Mj1ggBwYAiCDJwasE58jHrJhCRyHZ/ghhaTj6QmYd3XMznkL4JFYFW9WFgt9XuEcyKLeDNoN2IJ6NY5azQ6jPHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBy7ozPG/4fIbN9rJE2pyHCMtSFtJlC5CKScha7TV/mR1KCPy
	f3c6CGiMHEQp00c7y9Ar0hrt/kRNB9Tvs1HlLZhMNccVs5tGExYrNbv8FdJ580FaD+/A2Ms+ij6
	+XqVuT1es0TOrbPmPL4vR2Gwhyo7ITl10layrr2m9jDmzNIUBnbcYe97WSRNBKzQtwo80W5HhHP
	ZdZ0w40g==
X-Gm-Gg: AeBDietLSiN/5/6S4WEk00jqINwsIZGsqOuAWGQI0TELjmYrNLcybMMoqvZfmGhjP+t
	HCLgYd2+NbskrVe6CXZPkat6WFVcD/wSgt6v3Jqyh/tQUkyTLIGWg6MxFoVRXSOP4fF6N/CGy7m
	dld1S1HcnPMf+PctCagrunINaUBlaJUlTC3d9wpvEG+bWCOrlgnxMTJR/I7C7Cq32vi43aiSkGc
	eviqbLOe+0sDlUaZ0qkcEUdJidVtM7loTMCNnFQ1jvceMV2774zfFkq2qstQ2Fg8JEUSSC66JL+
	82WzEgrNzuFQboT9jXy0Me3LsSDxrxLJNP9nrvm1UXqIs7R+x7GL9z+2zOhPErHx7R70IjoMIe5
	WZSW6WXLgmeDv7auowNPozPsp7/gh2Zc4GaWo/c0w4MHIuNIfmQs/juVN0ikN1OinyQBgzwpV6y
	ylVskIYv4ZqJeGaOcqJ0vpCpdeRjUpzvnEULMp4a3eZIKReg==
X-Received: by 2002:a05:622a:5908:b0:50f:b974:7ef5 with SMTP id d75a77b69052e-51306a7acc5mr16373831cf.32.1777940707065;
        Mon, 04 May 2026 17:25:07 -0700 (PDT)
X-Received: by 2002:a05:622a:5908:b0:50f:b974:7ef5 with SMTP id d75a77b69052e-51306a7acc5mr16373321cf.32.1777940706560;
        Mon, 04 May 2026 17:25:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Tue, 05 May 2026 03:24:57 +0300
Message-Id: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANo4+WkC/3XRS27DIBAG4KtYrEsKGDBklXtUWfAYGqTaJOC4i
 aLcvThRq0iuN2h+NPMhDTdUIEcoaNvcUIYplpiGGsRbg9zBDJ+Ao68ZMcIEUYTib4t9TkcMg0s
 eMtadIa4T1gvfoTp1zBDi5SF+7Gs+xDKmfH08MNH5dt2aKCZYMS65JJyFzu9SKZvT2Xy51Pebe
 qCZnNgLQ+WSYZUJWlAPhAce9ArTvjJ6ybSVsVwZaUKnSWtXGP7HUMbUkuGVEcozBVIqTeg/zP2
 5uAync/2B8bk9ZE0BPDfFcdv43OM+Fvf+W+ABLmMdvf8AiACrSMQBAAA=
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
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
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
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3303;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5yJfYD9nv3EttqjPI1vJyzwvXDJhLx4j8rBATQoCCEs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+Tjbf13SW5UIUohb/OBxNm4E3L6S3xwe0xiFX
 czRU0ec5PeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk42wAKCRCLPIo+Aiko
 1Zt2B/4lVv+bnZzJL4SjTwu9r864h29OcYwW9NO1sE5jzL++++8t0xfzq7FVGRpBoPg1namlp5s
 WlNEasWgUsZ4o4vi+k9m56KWbTrT6B8wDgElLrG+DhyTOmGgWTKplqjlmrfCgj1qS1XGXavhbNv
 gynPNIVrFyGnJh+DCdih5/F0aY8BcGsr0DMKHR3QOlQR6uTW3hwPLm+Z+AwbEjeXlNiU/C+zSK5
 eUiCXhl5JGm+QdFKw+9bJauuLz5Bgi02RcYLx6xXMsHOU7t2qgZnnuCc+aoXgVK7VSqOt76PGJ3
 u3wUBo6qBsD+7vJAJYNGmzyEbUXgrBVGLgLnlbYcxw4unxIp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfX1pA0hshJlZu+
 z539v/UK5jrEGVSnPL2uSMe/zMWkhvFsp2wbtSdjTh9YPrkPAsaDfPVveXtMXBOrGSt1zu7Mxvi
 nvjrgpYj+cbVFBJpVp4VnBbXcuTe/4ajZN5fgUPqvNdTvSsSvtz8c/VKxpkpRlAhCj5d0sAIo8S
 T3bnF/f6YQAK6AlhCKtwAvsI5MpStrjs84q/pdRQk6iizGzcaa8F+BcmGHApNUAmKaK9itj2HMA
 SwtVcyl2WJdC8vYXVXIhjplGCtM7Bce+Z3zHWGgifNT1GmWJCVj/j1dgChz5Mstc1dcXjMo5DIm
 9VwZe/SFMqeFicunDxXtVdh9KSIkcK3x+BWLACIH6BiAlyx8LbWHRH040WvRmisBBmqmMao+lkQ
 lEUQChZZdk7HvEOch9O1uCE4f84vYq55ZW4S53Xz9pRQ105hQBZ7CuWRecZpmU7tj6F3E+i+11Q
 P9VD41cGZ2e8dOKhIMw==
X-Proofpoint-GUID: 2JhdDAMMEawSu2K7yuXGnTyjJt5yzOpN
X-Proofpoint-ORIG-GUID: 2JhdDAMMEawSu2K7yuXGnTyjJt5yzOpN
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f938e4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_H8M4-vQE-x6SST4HBsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050001
X-Rspamd-Queue-Id: DB8654C5447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31971-lists,linux-renesas-soc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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
Changes in v5:
- Rebased on top of drm-misc-next
- Expanded commit message for msm patch, describing devm vs drmm issues (Laurent)
- Expanded commit messages, describing why the drivers are converted to
  drmm_writeback_connector_init() (Laurent)
- Link to v4: https://lore.kernel.org/r/20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com

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
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 22 ++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 75 insertions(+), 125 deletions(-)
---
base-commit: d4c14903bf5e28e740516c4fbb7db01e0dedf3af
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
--  
With best wishes
Dmitry


