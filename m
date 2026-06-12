Return-Path: <linux-renesas-soc+bounces-33956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xENKBNdQLGopPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:32:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2EA67BBFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:32:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oRWWBt6A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aMajdtHq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17A0C30208E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555033A5E70;
	Fri, 12 Jun 2026 18:30:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7EF3815FF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289039; cv=none; b=jbS1BQS8xLYTaUusRWAUi2AoScBPCaomdr0YRGjtDctoJkLqrnUyr3pVQ3gtxbjXuditX73ekN+Fjiz2x6lZKA9sZpPdlYD8CYdaLPqz5776VYhzbqAdoMnPslIBz7PpsBq3+ClYzyzeKvbMJs4GpWxJ23792Efk3rtbzs88ZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289039; c=relaxed/simple;
	bh=6KkNpyC526rgMVIeY0D11Z3gyU75WDlgdpp2dL9pdq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qJ/P4Qx83unuMKcBKeo7UYD+vpba+HEmaNv2FL0mNo+1kj+LwIzf2wcjghWXbTenb0KDmsgu/cqxLOMx/w5hYtkP9vpVCC2lt44iYtN7hT4f6rzXwX8LBpC6BCF5r8/dVU6a/bc15oG/R+e+1EYlqn9lUtg8EBDJzQP15D2acyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRWWBt6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMajdtHq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVOe4046500
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaIMgG/IEi5Ad5NwXbrOlQk4Ovs4qDGmtqlsgR815SE=; b=oRWWBt6ABEqt5eXm
	crjECfTbmZn3hmv5zjdzfkecPBLuWdzAsMuK1dvbN9+4HEx4qoON0XSGX/thQhl4
	FyW/EmTg8fdQ8PqTuKFQtilSnf54Rt/j5teGI7/rTy4p4hO8YHrhZi9m+kWqlexa
	3jbOfFvYxLa1hz7XrbcFcUKIAlS0psOKYvSQAdB/+GVB+UDJUJ6KbYaffXC2Q9R4
	/CZsJTzCnVEKd2nty0p7DZ7kVUOzNV2EUSPltDGnuvT80hmE/LPKnVIKJueVq3wB
	ILlcMdzhPT9MPmSLNvWDCv2BoJLG6kopu7HZ6vGka+HIux2UfrYpmo71qUaeehEX
	nlvHXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ek2h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c1997732so295176985a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289036; x=1781893836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaIMgG/IEi5Ad5NwXbrOlQk4Ovs4qDGmtqlsgR815SE=;
        b=aMajdtHqbhDe0BO6nEpaDot9PBN8bC1te/oGrI45uY0GS4146jlkTEF7ArgH45+W+x
         i0n/kpzZ+P6DoCwzlAzK8IUGQPhT1RAbj6UMjCkZ8BtAEaNELAnW2FDQAPczeRmhQfvr
         qLzjhVcE/+lSYwAANHyFf26qBmkfcofpeecofw08wsvDKVmK+oaUwiE/apNdxo2O25Kf
         /kViI6nyqk7FyJXcpHjILNQyFKDfiVKuGCCD7Y529SHuBCDDXKN0cVpyDgz9YwHFhO4p
         XUfl1dFuhu6zGLjkGxPaZBygx504kgbaWGK2FPng5yXLcWGmkAxnflgMpdDD6+WPxTyc
         7CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289036; x=1781893836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaIMgG/IEi5Ad5NwXbrOlQk4Ovs4qDGmtqlsgR815SE=;
        b=AI8XSIJK2aWLbbvfl/KQRCfqokLws7qiYAYsdOHhghT+gOXngKKVdj+MfJJa5gNzx9
         v3R/+uGEUCNdjPkM5yP7lPnI20/QH6uiK5fsD+pZlGeT59v+7XCorjxug22nkVBJ9qpf
         zxwLL2TBqTuOz6JbCWIN903ibjHKt5Dg1qtG9sECCS/ppLBgK7MDJ2yz3iEblFyKCF8a
         CQ05CRBiRQo4ukqMilocrrX6hhi+IAYVRFn71ZPPBQO2xj65foxihdcbCsTlToXeaERZ
         RLHdKH7NNMThMSXqW75hzF5DyxSWjWdDeTYAoixFYc1sPTjhc/q2HguFwHTTP10Y6rWd
         wxOg==
X-Forwarded-Encrypted: i=1; AFNElJ+OuECjrn7t4tvPaUPyCsZjRz9DZA3JZ3iJGir/y5H8vj2BXBj/uoOYogNalX4cQEkS5s368ny9ImW6d/lxQbg0Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/lQ55SYFuIf3MCui8plyZHRhFlkolHjnPm3WO7XnbexEGlI6
	5Wl9iAmzZAcOzcKHZEIPyodCuyVsIC/aWvZop2/lLB8f7edlpl5FxmT8cuoHrkxNekITSTErQQ4
	DwPc23i2MWtfnxzsbaRON5q6co6RwvHNzi+Zyqw0K9fiN/avEcI+Jom9KnVIyVztqqnGRUozt0g
	==
X-Gm-Gg: Acq92OEmZ4ww0aOLtUzINOUfTmQZv21QWY3CCIsxM0eRwYha5fSge/Tw+s/Vg4+pF4r
	GSYSrRixT8Y+2cKktybv5rRSX803mnu097bvuu6anvvRFVkQeRQv8Rpb7aFx737qFkbNqm61oB1
	bt1fry/MbSWdpzj0R8t3WABCxsg734LNDCH1E0DhV1k/XQDlnL5rvQ36T0N9CLTbYKWW9Ko+02O
	rWbRzcJ9J3IFrlHQCuVKYxhTgywG0U/R9mNnb4M7d5wXpcTEyf8ZyggL/QXf5RexZK6F9cDAyq0
	glDuta8Z4Y+L8A79z4Pt4NpsVV9Fe53yPS+o76G3YUbL55AUg6cJiqxUgaf0Ha62WGYXXbLJYCM
	0xtbUR6zkc/y9hVFBd01UVP6wYlPRuwx9i5lkaJhFYZBJFOJ4DzE/92eApqivBdFcjg5nKH0nnw
	m5ucwVEIboWwy2FjFTAs8+hyyOblneIpi0xXk=
X-Received: by 2002:a05:620a:6288:b0:915:9125:e63d with SMTP id af79cd13be357-9161bcec31amr573646785a.43.1781289035946;
        Fri, 12 Jun 2026 11:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6288:b0:915:9125:e63d with SMTP id af79cd13be357-9161bcec31amr573639485a.43.1781289035445;
        Fri, 12 Jun 2026 11:30:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:18 +0300
Subject: [PATCH v6 8/9] drm: writeback: drop excess connector
 initialization functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-8-9f3a54f81310@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6KkNpyC526rgMVIeY0D11Z3gyU75WDlgdpp2dL9pdq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA3jhMYBxZuTwA5P8pC0iOzIEdJ7fr70b3ui
 c51TlxkhXCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNwAKCRCLPIo+Aiko
 1daWB/4u2v+4zU23e3Xdhf+ZULhAcCbc7KPvw3poBWoSLMiMVcozrKDBfgSWbwSIQaYyWKcl/0G
 rGIMRuyDsDJ34XQRo4oLUBfA9Y2piTv49SnLjBpEXNh3YK6BuIm0hpukouPxJWhBYpFmRsmkxUr
 9pjBpnGdQDBbvDbPCX5DNzKxUYzMjoaULMuQ+yqa6fDQcsAhq9BcCp6ahC6z0whUx9BrKDtpc2G
 1P9N+IGrF4eJivzCB/LhONe9SJLkY9NRiNsgbfi5nJ9+n6e8uAsjeXmPXHIdw3n+aBUTb2e5vj7
 kTbZwrgAuTMpFWIQ36Q0w99dnWIe2bX9Fqir8Cebzr6dyOpm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2c504c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: cDeYm-JnL_fiRdlfaKeQYRTUGrblR1bW
X-Proofpoint-GUID: cDeYm-JnL_fiRdlfaKeQYRTUGrblR1bW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfXwz4Bz980b7B/
 d3Yjc/Qe7mZiKrrA8qJtJCSMt6cSK4pBQnBqNBrxBKpJCRWmbQB/1bIaHRkgT+vXqUrgAqRM/hA
 5NGXSJBoMAopotu6+FaiGRUs2u609HyTHsfkWxf8gOOZiIVBGa9qEdoJ9nqNY7iVzyzjBHfU1VX
 MT0zdmTvmdLw1VaDxUlyYMQMg39YHSn+WtMEhIWFk+8uY3DxTDNNkFYoQmJZ22914btuGmOQX1J
 Kgxp7c3NhfsRvi+WSI1QP/n99s5X1LV7la+nhBcmMBaliEh3U7HxMA+xeuXfpnThhdqrArXfuNc
 vwL63bLAVCIMvRAFI/DkXejRxZkExzXFC60p7R/1qTPHjA0Sd76TQKS4zdiUirsb+pX4RcuDuei
 ej0je1f/MudDiaB0HfFkNL2r3e1PPkpaU+VIZmLrWsJ6vC2fFWDB5o0cLFkkESqHIoyi1gzWuh3
 iE/oQQJu4jVJeDGo1xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfXyWXgSsBbm+Xt
 t7xMP1qGTiAZclQET/e9yUDJOPz8MIbwSWl+kXUPEDeW7SASnZS4WNGDqZBiXq3EEDqsSUL7Ekt
 WA5P8iovLR50BBCGm1ToMP8gYGnOSFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
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
	TAGGED_FROM(0.00)[bounces-33956-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:suraj.kandpal@intel.com,m:louis.chauvet@bootlin.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,bootlin.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 0A2EA67BBFF

Now as all drivers have been converted to
drmm_writeback_connector_init(), drop drm_writeback_connector_init() and
drm_writeback_connector::encoder field, they are unused now.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 4da5d6094721..9fc15168c34f 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -142,61 +142,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a..879ca103320c 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.47.3


