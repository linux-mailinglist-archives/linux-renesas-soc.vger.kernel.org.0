Return-Path: <linux-renesas-soc+bounces-33950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b3BdDkRQLGr1PAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:30:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13567BB57
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:30:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="e8/dwL95";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g6L5uBYs;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45C59300B18A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADDB3A3E91;
	Fri, 12 Jun 2026 18:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF839B49E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289026; cv=none; b=loQaj1b2RA4oBnuVIrn02pvsYx8NFA5YAPqajJz6KF8Ibk5R5wvhWeXkuPf2q1eM3lJLRdNGqjl8MjE1U1sKCB+z0zHICEtK8SXa5weEK80mQVyMzwMmuN5UtZwkB+MfpRvpqbUfD/lEwg1CClL3GmtWGT3Ok7fTnrYXgBXa9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289026; c=relaxed/simple;
	bh=9il6fypLWksHY5Vf6qI9Q21kNPjGAdIILaanJtMNbDY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o9UHnwL0HzzBivw4d8gOGN4Kd7ogOzvqKJiN4tBUuZdlCXsWPE0keHVjSG3pJWo/5SyCGdLRIdHpMbso06xZ1UTIAxf9TXHLoDGC+6xN1u3LlwTA8Wq6XvA6222OuCWWz4fVhv2PPTHu/lYiq5pxqN2irJDY4E42hRU9GreGtcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8/dwL95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6L5uBYs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVlO24113310
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RqyQKdmdhFpOP/koc6Y6uz
	FgnHqsPBjbh6L/Tsl5qEo=; b=e8/dwL955m6TukdEDP4m27B5Qjn1QRdzbXTYta
	HuLpRbl7S90126N3pTengdrOoLC9aIljwyDftACxeRNo124E6yzdr/+0ruubn4RK
	6EKofdZKoMvRRy2UMGANkWecXiWYVEQc7JBmJ8/03t3ss2pGInZ1sBf4ckgbk6iy
	qLVy6c/HfsUDwE2BHVgrlsdF9PbM511OtuSvgUaTS4jSh890NRWhesD701hYEep9
	wm28siusWRLvdCh58LyUrASrQVmxvfMRQ0DqtjGPJBtgFbzFgVwrvO1iS0QvZo4l
	2Qc1RaGrTLw8xOWRnEWi/JxM1x8JM45/Mi+NCovRvK70lJfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30gc2ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156ceb551eso193273785a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289023; x=1781893823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RqyQKdmdhFpOP/koc6Y6uzFgnHqsPBjbh6L/Tsl5qEo=;
        b=g6L5uBYsKTsIr0RoagGguDZRJEmk6aluLTjTFOo0H1fSrkp8wDv9IRtB2Tg1MwCi0W
         PaH3ePY/CJDoqRMw1hwpH3+/otTxr3ailenWbQKMTYBndCgUN0/sK6jcT/MPe/93KtfP
         un47o+uNnMibhi2hKEKw0RYfivVWKjr6sF3yvSeeB/FEKJtBhNTkwgT5T2UlhyGQFizt
         fP4v8r/CpVElrQptuPnvZH3RfViRg34MfqwegyiDTPUiSYfLDLQZGx40pQRrNhyxkYSZ
         v27MhaA5GgaSzPb1KfhMSTLYiVixw/LpXuqztvQNgNiRR2wwP7x96xgqQWNd5dMU0KFW
         bLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289023; x=1781893823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqyQKdmdhFpOP/koc6Y6uzFgnHqsPBjbh6L/Tsl5qEo=;
        b=N3ik5BeV29brp10OY+wkIVVV/jltDvWFLW7eamOoXKLzKcQr5zujR+Gx1X5qdsaGqG
         JeP1R56vAEk79KjYxXhFdJ2bjORHBbmO78ZLxnQtFyL+okqba0EjXM4mn8m1fNieVgb0
         M9LrMKGRd5ZNV1Qzcb/JmvAZWfohG9OAdQwFfRe2ErL2DTyhQjHHr2yDOsxakIGZn3WM
         lK4yBttYY3KaFJ99FQu5nfAaya4r4UvgEferbNEwmQCZsHpCOgyB+MrFMxeUJ6ZIWaR5
         A9o6T0pVExuJaisqaqbhVpL9CkejYHQqSYqzXvkbm17h0TVpiVPNLET7ns0V7PcjYV7/
         IH9A==
X-Forwarded-Encrypted: i=1; AFNElJ8S7850lLcycbflTzZxaaHxAiIZhr9t+tyWv8eRJ3AP/FRbySFj4Dky2cQtWlDD6Yafxu/5I2FuLeUtbPkaPfWfPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztCYNmno9o7MGe+m65MFkXmiJ4HFoY73NH3hjr+LXuQyXmw2j+
	BXc0e1BhMZD37Ls7QiI5jRYnl6nysfVQ2xLQ5ITqmH7yU5RwjsTtE2Nj9h0UvAKnI4MM86XdVaa
	HdRmbm4Cw7201EVSZW4FEO1Dbe5L5EW0rGTqnbHgwecqQNJVjRTDe0l7pksQce/ZIYu+qFr9mgn
	+8bcvXww==
X-Gm-Gg: Acq92OGt5pEamyvbs373nJxnSUnfPk+D+sjXv2CKtCSkQqG/Gzqbw6QNMvkKvHwCsY+
	1goSAEz+HxkFkU9fWCyTkweQoPC8WRpKlGwuOt4LX4DY4lQIUMSWqGsiJrzpn4r0mlxEON+0m10
	VwY6uhhP+ftx87Qfi+V030fv9t28xY67km4gv9dal3e4xF+LC9cghFo8jddB/M/ZYrh8+fSlW4q
	r4yPZtZ/NFgh4xpHkdcn72yF3UJN2qnMn2jHFIQEO3maG6SgmVhVM9iYgVNkQlTgUoqGNLuJlII
	RWbPCuyv361KDMqBJ8gPetYmILJ05qT5ITwdcKDgf3Kl/IElNepq4Y464YuPPVxHb8JKa+DHqp+
	w+bg+vYgpW66eWKkvMxT8GrujFikRfnYa0V0NwUbFJk9fRrbrYvXbe0vsDU12XGBB74vwwLjOZo
	s8tsDsudg67GrKglT1hNNXnAXQYKrxux0ZFe0=
X-Received: by 2002:a05:620a:2945:b0:915:6e30:5bdf with SMTP id af79cd13be357-9161baf833cmr572289385a.19.1781289020857;
        Fri, 12 Jun 2026 11:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2945:b0:915:6e30:5bdf with SMTP id af79cd13be357-9161baf833cmr572241285a.19.1781289018558;
        Fri, 12 Jun 2026 11:30:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/9] drm: writeback: clean up writeback connector
 initialization
Date: Fri, 12 Jun 2026 21:30:10 +0300
Message-Id: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADJQLGoC/3XRS27DIBAG4KtErEsKmGdWvUfVBY+hQapNAo6bK
 srdixOliuR6g/hHMx8Sc0EVSoKKdpsLKjClmvLQgnzZIL+3wyfgFFpGjDBBNKH42+FQ8gHD4HO
 Ago2yxCvhgggKtalDgZjON/H9o+V9qmMuP7cHJjpX162JYoI145JLwllU4S3Xuj2e7JfPfb9tB
 5rJiT0xVC4Z1phoBA1AeOTRrDDdM2OWTNcYx7WVNipDOrfC8D+GMqaXDG+M0IFpkFIbQlcY8WA
 kEUQsGdEYzoRUTnllI/uHud7/v8Dx1BY53peAnK2A56Y07jah9LhP1b8+LniA89hGr7/93VP4C
 wIAAA==
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
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
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Alex Hung <alex.hung@amd.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9il6fypLWksHY5Vf6qI9Q21kNPjGAdIILaanJtMNbDY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA13Wjb8f/EE9CA3w++J9kx3Ncdj59xl/eE+
 VE0wKwtaGeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNQAKCRCLPIo+Aiko
 1RaJB/9dozGc5nGDV8+8wZMl5wDq29h9EAVYVQwH9xyq2H0AeYw5dmrncFxw4kKmOi8Gnav/Mo1
 jesWVr8IH3fomshJveLOQZWQ550qu4/9UYPH6Fnz+vIvZFabLcYdZAF3kDtlfsL6SVuRb+iPs5v
 3VFnr+1BMjQmkCcrMxysAt6yO91OHnDUcrqY3cLGHCNEt/84tYF/ifsT4jHMeGUHj2WLSdCnlph
 IDxXY/b6A2AecTCJevTLUxek3hufKC6olvgyteP81k3eC/LXh2IZOqIHrgE3BVezbdPh6FeZSFI
 DuCOzO/pnib9JFq+2NPzwgtA4fB47/TOl38NUUBfr7wxSpfS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX7A01MSUgO+sI
 UVKIP5mZh41hdnIGB1KY4kqqjthqCx4ec1IGslykpztzNAWBFhwymmOkc+hSfg67WUtCMHGwBds
 kV0mZ8SXUbrbddAJycEM0dinCd/x31A=
X-Proofpoint-GUID: gS6Fc74w8Y0iHEPCSSwlr05VLGKUaenp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX3Mq1//2aEhbs
 kk1gku/j1WjTyTeIg3bHgc+V+PbuCPBosLdlaRTDSKPn0t7U8jrL0sK4FQIcLkkd44SbIoMD9dp
 dfzrXruD0j8cn32cpJbRhHQl8m51OMCq7UBF5pTJXXZdAKfKdmG6ab8NSWexie4k/XM+KyAiejD
 G4LVTGv2LBOsn5zjtUzloOhtzxNFI3aYIKB1h1QIJaL5tvtlxUWAvTgbRZjdwPj11kOKOskEMM+
 hz6zJjz2kcnU8HlTJmVc7Benm/rcDnRJTaE3My22jSIbZnLiNKgFs+uOMsjCR5KTDbs8MvjHzCD
 fGi7agFF+QfaoM24lpYpAtvd7sm5oEMf4gSvIsAPh/lUOrv453CUotEUWFpmf4WxhaC3dehEhum
 LOHv0qV70PNcjH5+FuaSqNXsb68y3ANQgVj/dF8X3k0PcGUYiJwcweaAjU1NKvxJWBMc1LN2aVs
 6olNScNpcEJ/ROIjR/g==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2c503f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=zd2uoN0lAAAA:8 a=V2sgnzSHAAAA:8 a=7CQSdrXTAAAA:8 a=P1BnusSwAAAA:8
 a=RF00TdSWAAAA:8 a=e5mUnYsNAAAA:8 a=lNIPRDuYLkTERnwjT3UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Z31ocT7rh6aUJxSkT1EX:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=D0XLA9XvdZm18NrgonBM:22
 a=_nx8FpPT0le-2JWwMI5O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: gS6Fc74w8Y0iHEPCSSwlr05VLGKUaenp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33950-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:christophe.jaillet@wanadoo.fr,m:alex.hung@amd.com,m:louis.chauvet@bootlin.com,m:suraj.kandpal@intel.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,wanadoo.fr,amd.com,bootlin.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD13567BB57

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

---
Changes in v6:
- Dropped applied patch
- Implemented suggestion by Alex to use drmm allocation for the
  writeback connector.
- Link to v5: https://patch.msgid.link/20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com

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

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Harry Wentland <harry.wentland@amd.com>
To: Leo Li <sunpeng.li@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maíra Canal <mcanal@igalia.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org

---
Dmitry Baryshkov (9):
      drm/managed: implement managed versions of kzalloc_obj/objs()
      drm/amd/display: use drmm allocation for writeback connector
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm: renesas: rcar-du: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  7 ++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 22 ++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_managed.h                          | 22 +++++++
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 98 insertions(+), 126 deletions(-)
---
base-commit: 2afdfc658f7a7e9ee2a67ec6663922da9c799c53
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
--  
With best wishes
Dmitry


