Return-Path: <linux-renesas-soc+bounces-33957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ub+EJ95QLGoqPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:33:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC5F67BC02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:33:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WR8zAQI1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HIdrVYP4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 331113021609
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34E126056C;
	Fri, 12 Jun 2026 18:30:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285A1369D43
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289041; cv=none; b=bPW8eQtK+gOJ4I3iDJRsBzeuIB+Ccyt2M3j/3pLOSblAPlqqQyJyfwTIj2buJ8tHS100XRWICzeU6U9WTnoTwU0pMoHAEXcPIGw+7JK6snmF6boRtWg47bp4v8fnmHlwMvM9Hl1vJJYk9bjuwdFWix30B2Yk+5OqPp4k3vgyI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289041; c=relaxed/simple;
	bh=WHDRI+JhBcNuBgC+0OtPNMX06wOpYXQsdurLSHRrbWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=la6zSx25k2hWOEoPd5NVap/Ax0svA/Nq4u1qkpatbY3qrqgnlS7Q7H7xaV5j4u8kJaEhK2zR7uHvoGzTETRULlznMT8trTMn7Bc2gKN8vx6OfICtI9dD5+2h8ExfFiFYQyoPwZg8npk6VqkZpBXjWPOwqce35+85JexwTT1EMHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WR8zAQI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIdrVYP4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGWNvx020191
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPWo467A1KtBfknXLUhzGM05jfJhVUBGDG8kt4+2Duw=; b=WR8zAQI1Ce48sbsQ
	iko4kevADzRuNsFys/yUaT2wA08EO8kntUazpR3SYgJ8qEQ1mCbCrkD4hWZ7nnet
	QfCrCERbHHPoErM3ZXgBgnCCnNGEM7pBbrXhpn/cghbYrkA5K8CRcHrbbRV6fLry
	HJ82D6zeU4RQJc8MeriCpWHeG0iZm4CscGQjMvXbE4fLGj1WNnffM6lrsBWfaWvi
	KTylmWw4szOJRozfVJ51Wfi+XQ87hv7dCUCOJ13ulkBrhsoOjurLWd/VhjbAV4dh
	CKIFwJkRM1ZOXusNS1w5n0T24KqXqhEoGpp8pv8qsaU3VCum5Ik7ZtCop5gh8sKk
	DoE0iA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbmh1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f1be083so216168985a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289037; x=1781893837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPWo467A1KtBfknXLUhzGM05jfJhVUBGDG8kt4+2Duw=;
        b=HIdrVYP4s3OalOnYzAMpinsXHlKkk8d2la4IfgpqoRcyepIsDg5sbsRKooWQH9c41Q
         MnrAr37f0Li/6xDkRMjH4t8Rw+Ase6m7dtVdip+Q+p0nse4YdLY7B2KbgXTfo9jAY69Q
         GKO6dFQmFFtetbaPsrJXYNKyxBCPpZjWkNNDte8NTM9SbRxF7R5Xl5mRiGcAPjhQDtHP
         Lb9ArFjb6957OA/83AQqSoRYDNb1+yHt+UQUdqqo/4YptlleQikpkPA5QP9q5LX65TLG
         5KThgoSw/GYiD0tPqJTFc/mlkD0ILKqpIZHExfXy1VClBGeJ5+NqMJjzQmGYLcJ3WzcC
         nvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289037; x=1781893837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TPWo467A1KtBfknXLUhzGM05jfJhVUBGDG8kt4+2Duw=;
        b=Xx7cEvvcZrddNs7/p0uvAVkjHjLInlf+s0Pi7TZNoIofzGQPTOpKkwfMZX3jYTOz//
         oE2QlPnlZlTf92fE8anwwhZL09nVjSmNDdhf7J/4cbKQw6AyYsD106mH5aAZYJ1C0doH
         05rLocP69N/x5i8gO4AlkXeBIXQZmtdx6PAohiZFMBHdfilFCLsSMSG6NBKhy0swkBku
         dECqCywEdBOlqC2Cs3tY2KKx3kVaZxrggFaKcmBivF7hjgkSwP8/FKazJah58PtzJZDH
         NBdlSC7NYwedqhDio+c9eSGy7yEYh4UZgS9sQ5YU4Nw8iGmd5Rt3Pc+pio3Vm6Gykjb4
         Kpcw==
X-Forwarded-Encrypted: i=1; AFNElJ94kcnMnqaHBWHlGuYzKn1j1jqaD3PACgUVhDbi9Qz1kgVwTm1PI7z9hdxfYa/vfBbLutt3VHH/zV2OpvO8wN8nEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YpxJnmmrm8ra4tqsEj9UIWXouaf5XY5bl+yGxbNIyouTEbK9
	lEDEL9gomcI/L4XUUmWDxNxp/8LSQlOhtimQv0KnZ8Ri07dpTcwShQLQ6mBrUhn9e4XUNFnUosv
	BeuqSYm4EJYfaGGHPzehcsxpmDkFSLhkqiwiCj2eOcky/yR3Ed/jfDWJPDcErcyH6IrzQWSaR1A
	==
X-Gm-Gg: Acq92OGWO0Iasy4EvMnrbQ5Mke59g7EDwXwuPiY9/pswjDKhqCOMtiizLf9056iy88B
	7Vll09LS7pKNdZ7AqhtTl/HfC48WraxxYzIBVbB/RTysIhmqYP222yD2Auci7Rg36kYWggR0X5l
	QKHMaCI0bxFlOfMPSRjKYeBgADmX/wj9hMfKCPFTlUCU/cz7cGJqz5lKHktUJLYW1PbJy/KluE4
	Zu84F9rQ4B53wbwf03o5VZuqzmJ35Twjf6KvVwvga7o5/xK3UxlgluHr7ZwCdvY+LumUzVK544Q
	18MOn7wXXHCcPxIypBrK+sIbIijG7FhyFjIZAq3SNqJgjo32fuHZlf+XUpXdY3dbHlLDlPeX/hs
	dfbd91blWKetBoe7fRKcVhUKjGfsYkPn+VFc1gr8ies5Dt49vf5MKbjge1cK7S3+3JrElwt8WpP
	W/bJkFV25qP0w2+XzbzMS0RyBQrAL+8wNRyRY=
X-Received: by 2002:a05:620a:6cc3:b0:915:a5bd:d82b with SMTP id af79cd13be357-9161bab53d7mr621082885a.9.1781289035516;
        Fri, 12 Jun 2026 11:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc3:b0:915:a5bd:d82b with SMTP id af79cd13be357-9161bab53d7mr621044285a.9.1781289033033;
        Fri, 12 Jun 2026 11:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:17 +0300
Subject: [PATCH v6 7/9] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-7-9f3a54f81310@oss.qualcomm.com>
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
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WHDRI+JhBcNuBgC+0OtPNMX06wOpYXQsdurLSHRrbWw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA3w2eA8bVTfCfHWtbd+wRuk4WZ7UwSCELFb
 NxOkKpvyhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNwAKCRCLPIo+Aiko
 1Zs7B/9AUhF9TKQrWA7mEHSfv7WVuiuih1udWVrnH9RNj8QpmTWalWgAaq88xcqtqfZQ1rKIgyi
 0g9nwOMEU8kaWGhLFEbRXwS+0IEmVPcYdrtHtyILGIyAuThnCUQPQ85n5Pyko1tQY4J4AzY5gLx
 BO2pvW2aGpYAwpdiU5sipK7Wk6hcQnmS5tI7hYVq4utxYb761SSAMwC8E562cRt9Eodyi9aba5D
 xjvI7FKExDv/WlhOoJbXDAELkCQwM59yfhR2U+yn9b8sVAoGz9vceb5G8NgGI30BppAUwjAcJrU
 82zcn3Il4qxGFNUlheHmOwHsDcH96KoaQpAjKpqqd+4WzXud
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OcIdTU2KLj8V1dlchCgblb9Kbobk8qMx
X-Proofpoint-ORIG-GUID: OcIdTU2KLj8V1dlchCgblb9Kbobk8qMx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX3c7EvsZssxU7
 d+m/vUzZGXzomZtMaeFqiizNahG/KCXgIEOgT5RhAVSvW2VmMgnCUD336N/cLGZJFCELclgg/Zh
 c4wjV5G3OX2Tcc6ZtarATZw9CWrkuqo=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2c504e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=YDDQE0DzCl7hcZedIR8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX2h82Wxqrw2Sg
 ETILOVQq93weg0nxjxouCi3fLoA5/l8u4GksQKji7mEtnjgyRDPpr0MX/EGZahE767nALC+gcEG
 f6SzVckyWq/c2n2k3gDY3jL/yZtjIioN2+1IF6/tIAYWiqcYewzJ0VEDsPiX+e8XH93Tl8f6c8j
 O8rhnhT6E3Zxe5meMw59zRGmMsDkuPl88QeJLpi9QEfGwqncBjW9b4oRtfJl5ZOB47Wp+S0veM6
 G6WbEdCseI3Go50+JQTTAUyz/crxKzYkgHwTQvRQFLpWodHcGX77P9E/aonyQpiinASy8yPbhMr
 VeTisi7ph2AWBeHnq2ndc2Ox88cMJ+eAO0Z8W1gheSybscRdJcOMhLnFexN1+pSF9QkG0lptUyz
 Y1vxieAyumrgOTu5ZPEX6/u0cUSoXH4XYXaRuq1aMLe4yo7hYwLE4UpBDrOl+Rutx5MUFgwArSW
 i0AJAXV7yTkWUWzqjWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120173
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
	TAGGED_FROM(0.00)[bounces-33957-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:louis.chauvet@bootlin.com,m:suraj.kandpal@intel.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bootlin.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: AFC5F67BC02

The driver uses drm_writeback_connector_init() instead of its drmm
counterpart, but it doesn't perform the job queue cleanup (neither
manually nor by calling drm_writeback_connector_cleanup()). On the
contrary, the drmm_writeback_connector_init() function ensures the
proper cleanup of the job queue.

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
index 66b6f2acf862..3fd89fccfa10 100644
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


