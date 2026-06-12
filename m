Return-Path: <linux-renesas-soc+bounces-33958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UywmBgdRLGo2PQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:33:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 165FB67BC2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kVZGJZ3B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VX1nnW3r;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DEEB3026049
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456D337647E;
	Fri, 12 Jun 2026 18:30:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22613905FD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289050; cv=none; b=rSFo6uXwtARd+m8o+Ln/G30PPiKs+ryakjvJAGzI7/jjT+MFfIMuWk2/kxjN6rsyl/3o0pzOOL3NkMmIkTcSKplJFP5FVFsp9LSee7awxw3iY5jtKZj7wckPg2kkS6WBP3aXsxOIVqSUdrgVjABduOE4X1T6Wox8N5p/sbVi81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289050; c=relaxed/simple;
	bh=hqraoBIhgsoA7488mFgE7E5Wa+zzdm/qHLJb+mlG/5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbi7Be0DT0quEHHkRe0sDpe3y87Qq7P79wb98hkG6DCti8/VytxRfOnSb7nvY+I4JDvZHaB0cshl+1pFpDl6aVO3eVRdZ2QXjnV3oMx6fXKHJu+mityOVPM0lBM+/gmRdl6MtHolqN99zdKI0QTZMol/qaQLBH2hljZPRggkbC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVZGJZ3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VX1nnW3r; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGUJjt053989
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXtGNwSbn+23h3fU54/tQRScTCRPWnaT0vFvr7Sg540=; b=kVZGJZ3B4K+cuLTh
	etACClER7Ykn+bsfS/JR//XpLDhYKlAQx0U7vr3ZodJtVrrOUjyt0r2p0PBNm275
	upsRU/dTJAlN8XvwxOjMs4r3v8iFLni1tY60wQueiS3dj1gaY6fjzWnPJr9kS1yx
	VQ7IJCdEY3P9Ak5VZTznpuvYgrIg0uSJOBvx4dsPqRMckHf/CBIeUN1yF3S0aZ0/
	dTCDt1+NsbNt7qnAC2DiBDPmAx+SQjedamokeR36s+Iznj5XrmZFcGQoRPXs/Nh7
	rTypSTH4AetIJoPDXl+xCvCRhljuMscXrQRWp2591WehC7AsHSBNLZN6xg1AZejZ
	nVY1wQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uv67a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d33f7c28so246177285a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289047; x=1781893847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXtGNwSbn+23h3fU54/tQRScTCRPWnaT0vFvr7Sg540=;
        b=VX1nnW3rZ0yqqfs6e3T6R7QvhyNrIGBpDY2M4/Tl6kQq3vet5tqHRJuK2FZ5Ghkq92
         9EwDmy8+TXG+wXj25oLa+HH2lHbjf2EWuElGsp4AsYzOx5H6f6Qz4cr4Lhbf8FQ35LsS
         3r9nnW9Vo+IYaJgm4AqvPt5g9pix1um5vCj3ijMrxhyk7DdzxFY9P0Bm9NdwMFEyuEy3
         k3vZm3F28z7pkjz9ohdBcxLj3lmkmy8WdgSWNBXv7LebJi37h4XdzCbCHhGxOgbOvP//
         krTtCCthAh5EliyFdaJBjChcLgDQpNBdIQdpNZMnsF6x1IYE6e0DVwyRPZJE3j3IBf5a
         50IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289047; x=1781893847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXtGNwSbn+23h3fU54/tQRScTCRPWnaT0vFvr7Sg540=;
        b=UHOJkh1TU8yNsUfWrHH8QsfTSqoV0bOrtnMuQ58hveRSpFlrs8yizrb0iD6zjGJdWZ
         BYVHdnthC3XNmMVuLBQ7zUxwMF1OG/MdcR3pDASxf4znBOzIC53qK6gnwtjZjivAVBvs
         bZbTmSxEnVaZG2n/GG+u50wGdOVV3yAP6ODyBPOER82PTbXxtbtOew9vzZR+6hpisvlr
         9q7IGr/jcAQxxOMyFF6uJjY88Q9DGYq+/EYeVoX+JlcuLJY+lGQGp8htJLXViGrcMVw2
         pmRtS1MhBy2tL8tW2LatPm+tL4S5KaYKiBEOl+3sNArsE6wuJlhJhf0tvRLfFoyi5IBj
         seVA==
X-Forwarded-Encrypted: i=1; AFNElJ/EBlY6WegYIBMhx/KOfcNOFn07W6KNkiM+h0JH4b9xVXBhnmIoGIvmcDWDdL5lUK0898vvOiJN8FR3Xb2nmq5Nbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VCHEMoc0adBczBttEJTInGZ1k4scy+W223pkrOkFWLe8/Rbs
	buVKPLSsrTs0S0KSGtP61KbL5N1PvCl8BeFgvG0euWfDaHniobPe3HZzcw/iocgP3fVnRCeiP9Y
	UvDuILfn+LrgOz0wghMW03VY25lGAoxw8aspemRhZNsw7ZiTnpK8lyehbYjzEYnbT8JKvoniwsg
	==
X-Gm-Gg: Acq92OFWZr+bLZ17o74S/atM6QSlJbs2YFgkE01SgD2A3I7jNhRzTiGrlZtfwUCNpJv
	TYnvzmZROL5CJ3PMsElaZadLyT3xxaxz2L8U7LCYtCHX/p1Pc33pRCBSy+YftuQ/MsrH/b4E4GK
	nBbsF63iCcAAbU2Xijra3MPl0UbUQUJbkI88o63dCdVJABRApcYFiYf3Cq6j6N+zT4hXU4j4E75
	CxSlwtQdizgb8OH1gSeewjLcvbA8UDEfA542Q48AAWWSzoLM9XekH1FUQVUs8cBNkTGRyEZXozx
	PN/2/6tQ9ejojRkeFNglhjser1dXKTuQJVDSTuvBHTlIf4fi0SfB2e3N+LiBBdkLwV5QiANKiLR
	AtTINXDQtrLR/SK58lKb2huQIky8CltU8eYvs7pDMWcrQ0lqFyWdAN3/vwH9WBA2y9znozEHN9m
	XcoT3tkI7iCVu59vahys+HuHDkm8Qz6cYGPWM=
X-Received: by 2002:a05:620a:414a:b0:915:6e30:5bd8 with SMTP id af79cd13be357-917ee4d8cf8mr137811985a.11.1781289039623;
        Fri, 12 Jun 2026 11:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:915:6e30:5bd8 with SMTP id af79cd13be357-917ee4d8cf8mr137549085a.11.1781289026842;
        Fri, 12 Jun 2026 11:30:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:14 +0300
Subject: [PATCH v6 4/9] drm/komeda: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-4-9f3a54f81310@oss.qualcomm.com>
References: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
In-Reply-To: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3297;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hqraoBIhgsoA7488mFgE7E5Wa+zzdm/qHLJb+mlG/5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA2aShkfQ4NWcs8hWSV/gJ8/87+hOs9SkyEQ
 I647fJsaOCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNgAKCRCLPIo+Aiko
 1aFGB/4lYLlcCC0eN4Dl4Jj27Lj0v182O24ArgNCoUv/0lOXuJBUpHJ3WQrRTWPQcktsb4msHdS
 zQM5LWwNwm4uSqkhlqE8zgwSBltp3eRPz8A3hJpAcBZxj3bRYxN0FZLq9qDHFYILD4kQ0TrIays
 BKCEWiDMd/NyT41rG/kuQQBqUR/Hqp/JKvvU0eeNHFnPo1wzO9+icOgiyChs7hnsgbacL15lz0f
 MXhI/HoKocbLvZ8gyux6T31biXcta4EaVpVdHwuVD5Q1+mGV2KQUGmkxI4dwALTAXTOzdIVqRXm
 AXQuEmxUAF0prLO9MqS6VTDsAd8tbX7KWWlBDVcTLRTAr0q5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX+PzCafWa9/8W
 XFYxkQnmENIl3lPyGMZEJ0C6mjcfmuDaVsIP/FvjRor3y9s1uf1IvFoFYrcyLCCrdT5YiM3yzg2
 lLEG3PJWh9OP1YwmPC4ktRphzKizzM8=
X-Proofpoint-GUID: V4WX4dHDcHuh3Iv0DslQpJqkkJLxk5kc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX4ZtRLE0Xp2+S
 BN3Z5OPLDe8X2zDrsxhWXAW3BeVwGUeQzP0e3Uzb2tJFpTzGKGyXQdOfEedY0JP4/L52Te3ImE6
 s+j+iVers1qbtg8/LEBq1EJ1Jevb5PlZD+hEqAFT/W3jeLZ4vW8sgKzwRXA0FYciXU9vZ3pvVvU
 bwDK/9LCoPEV+ehoK3ZBa1GLg4sf6cyvGt7n044wQEJoNRdmaL6qHJwH3ZcASwwpg4FS1/xeVPj
 lmax1ViSJ3oMFhPBglRZN+LlKyb53DzPoEi6MnSkEmJ8P/Q+zyy3nPt3mbVjdWlsHfQmW9QSen1
 PRRDFLgmY3y3k2fHie5kP9mSOVFzhk3uDEPc+HxTdVc5aFWLWmourPmLAt+zaiQ3dlO1xtKkafQ
 VvbIm4HV0T0Qx6N0UgXtXKXeY+s6kOGzR2UdqMhou1jmeG/u/5auSu4m+NBFR2uE37rL+r73GcO
 TitBudi0B+iLYq072xg==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c5057 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gYs8AAvg_5cFonjPjrYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: V4WX4dHDcHuh3Iv0DslQpJqkkJLxk5kc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33958-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:suraj.kandpal@intel.com,m:louis.chauvet@bootlin.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 165FB67BC2F

The driver uses drm_writeback_connector_init() instead of its drmm
counterpart, but it doesn't perform the job queue cleanup (neither
manually nor by calling drm_writeback_connector_cleanup()). On the
contrary, the drmm_writeback_connector_init() function ensures the
proper cleanup of the job queue.

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 41cc3e080dc9..bcc53d4015f1 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc_obj(*kwb_conn);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.3


