Return-Path: <linux-renesas-soc+bounces-33959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wQg7EotQLGoWPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:31:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6F867BBCA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:31:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UCgfg1hi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ce5QDD3O;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D11F93021266
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BB93812E1;
	Fri, 12 Jun 2026 18:30:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE5392C20
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289050; cv=none; b=hkbRfqvLKqTn7kwICsHNCW3fgRSOgeJGfVRtZNHDPINjvsdNbERtd/zAD40Ns/r/IZ6xTLKOi0I9zC3USOjyxKhGKmjZBfkxYHgbQpj18GR2NYbjJaTVe685NOo/jxJ2qr+HZfLdoI5e9P9fK0m3q2Z7iKk5JhWuaytDVL95P6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289050; c=relaxed/simple;
	bh=mE50BYUB/UAw+zq2VOqPPalyAMn1gAB1RtsYcBWwgx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMqpbhnbPXqhB1SDwWyGy052FDblB6JKqYBAJ2SGIrTNgWY97OEjIKtgqBaREJt9+MO0zBvgUEv1DtfwlDqOHFUVZWx4swvLT91rg0iUnjOLtgV3lgrxOk7VsL2hkky5WA4GAfR03LwC3g4CIB+OVpf1fbSraC2lr1+PcNODfB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCgfg1hi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ce5QDD3O; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVvK4019748
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=; b=UCgfg1hivTnuWEjv
	nioBWrIUwJRrqQ7jqClIPM7Q9GYwG0HQ7iDh8MAi0XjxAVvMqTyoEbx8KK/TIL3y
	vqjX7Rvr8tZ7E9ALoeN+8V6TSaiQUZ3EWRoKcR1R13mevpluMOzlrgeNrqcVQpg5
	sBrUTk1uTzm2v0AP//5vx4kISvAxP7Rm7WRRSNQHBb2rEjHbae0bNQ67GMPV/GBk
	lI579hdewc4qZOzJT1FAnZWNBV2OWdHak+EwLedV+VXZE+mFynZmpx7f7TXmqhtd
	b5TCpsU79jhUL3L3pGUHnRxQ6y/3aa/h2ik5gFKkR7c4kQMG2ITTkq30i2qTU/Rw
	MBQNtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbmh3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915d1d4fc5aso214159085a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289048; x=1781893848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=;
        b=ce5QDD3OFTvHCRcY3jZRcy4wq/kc7IV0m8hc4rv8sCcDj/jJYpVhVNbaadXDv3gFJH
         gm/nXxlw3CO2XMVUrZAARX9jehA3OsvAIR/am64jCq/ZYOu29S47I/shnG1Cq/O2fNKK
         fqeIMXvufZOemjJcueJse0R3XUxA1Z65yCZkwlD/tqPAFUXVXKFJRXkzLLSFPnbZT2Bd
         xgOmldtv5pm0DzduyvLlx11PBkdq1DfthRQokIKNcdLtwwxa8RsIJuwvFxW6HRegCw2R
         PFrXXfIftIC33CNjxDv+9W9TVBQ5hecTB5PygblUpenznjwkEM7ezpBPXI4xqv5tRWqk
         z3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289048; x=1781893848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=;
        b=b0Xtou5vADNvIonjghXXWHIEPmMyXAB71icuGkoMRW0gvqCbVRFRawcVGtx2B5oYN7
         hpKDmv/tv7j1gJjPfhkeV+qCnG1wK0PoQN8QW0c/GV7P9Tg7vrXW28ApFFeLRJnTbtRC
         hEs9aie+BtwxqenYp/LxHCWkEWplATo/Bhq/ZLwerGb8TN+/VSJGZ/R8Q1IHvQZspAn0
         EOZ8b2wmYVBhA9MLtBh+ccxQ5+t4l3GZYWvaexvZuh0vsrx2WXOq19Vpe7ztIwc6OrHq
         WMKrzdMhMSFsVdvxuCpJhti7juCr1PCpID2KRiu6+jKwxS9b7ZN/j8O4AdEhG48csViB
         wOng==
X-Forwarded-Encrypted: i=1; AFNElJ+vQnnV01JUAotyeP9Ptmbf0jmjS/2oTL9ansdPNZBI3fr+qh6egNT3A5lxTDPgD89ke/NpFGt+VGziNYQYEjHf8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXto0heOcvTQGhJNnbZZ5mIb3G7la/W0DpmfwhhY06GoKI2eFC
	MEgA7U6K/jiEw2351PEzOW+KZdJo0dkU9UjVbNxdwsi4SW8LKYMLomBJqu+6eX1tUES+lf56Rw9
	ZpD2SnwEXpEQbQKfX5NHm+H8vWi/cvCWRsaO1m5GAFYpwlDXcbLVKHK04ed905aNfbtW70Xe6fQ
	==
X-Gm-Gg: Acq92OHjxDq+2/UAd/Is1dm5NmFEhhxqyiZBdp5iBaOh4A8LNgKZ9LkVuq96IWJIp2v
	P7n5O/bUEjCmLmRE0yQjd9cea980DPHOnjRaBRjv4mzzwCaxdE5wfTEWvJOZtwg2Z3zVibvCTFY
	GZ+2GRAMjv0KDKbGJR0dc6iRzR+FEIy18JnHd8smC6F1IWyRE3brWPS6Yck3ynkdJoO9xJ+cPRQ
	fDul8vn3f1B4aEIFXpBjdCOBcy+veuSv81CZQ1oVzjMXpwWuIA+/CpC/yx4ci8fnOdll5Jwn3L+
	KbO6kt9pi9Q0sEBCJV5U798trbIErFYZ8N738ARhw5UBLKXU2S6lgDdR9tVpJToj6Mzw1VUMwPU
	Wd9KQhd40hB71/ACw9uASqHQn1kFNV7HE0tKO/mWO71XK3AsMkqPQHwmjDphlq+mNlLcob/8+xO
	sxc9r4TtQEivHRaZdCU6vMhjS3AZcxzPuHCB4=
X-Received: by 2002:a05:620a:bce:b0:90c:a08f:c5f0 with SMTP id af79cd13be357-9161bccaed3mr616261185a.33.1781289043356;
        Fri, 12 Jun 2026 11:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:90c:a08f:c5f0 with SMTP id af79cd13be357-9161bccaed3mr616175885a.33.1781289037649;
        Fri, 12 Jun 2026 11:30:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:19 +0300
Subject: [PATCH v6 9/9] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-9-9f3a54f81310@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mE50BYUB/UAw+zq2VOqPPalyAMn1gAB1RtsYcBWwgx8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ZOgPm7hKVaN3b0hT6bcClZSGAmt9jj62VfnGUivxSkl
 FVM9wnvZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE0nay//c/97a2SbnxVfwx
 od8Z9RozxE2/d3rfOSh1P0zje3yeaSB/S/XRfVc0gwKz1j4p+rh++94Wl+wgxd8TAkNsea+yRuk
 IzkpZFXNW2f/Zg8wPmw1neZh0rLrQlVETKHpl3VR5PfVNW16uC39wPqQnxifsyP7V/znnhfAU8f
 19MOXqHOZwNj8mX8a7OduLjdh/1QqcVFZQWWhREPJEaN6UF5xep5gyFXZbeHiX64vXxD6IMfQwS
 a6umKp2szu778CpkNkNe9qmsWueMrZnvzTvmvj93HkySrOP3JyWoKt/4CG/r2KBWtvqmXUH9zu7
 xsdlhL1pebleUHSPr0iMxOp6xdx2Hdk7Pz6Lsx63C/cDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JPDfwjYvlOi4LUUC4H_hFE0AFZA6WQqP
X-Proofpoint-ORIG-GUID: JPDfwjYvlOi4LUUC4H_hFE0AFZA6WQqP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX+8gWSJt2jCT8
 Ud11tS61FY51aM1VG8WgC4Q6KqHPlkKGcPUMrFdn4hnKoZyon+lljcsMCc1J9urSwueDs55Octn
 I6ixAk9RFVa7l4XRq3SXJ23Jswo39m8=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2c5058 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX+/Mot8zUE+76
 vcYvFvdIcTqFBgExcNEzQ8i2RQdEzRgGDc0qN2WqCo5Auk7sMPcPyLAWRMKUNrV5cKT1FBalKZH
 zJotCeLKhpSyphhY2yeE14ZsXmbMVki73JHilDGFH/M0X3xdgZJ46xGRP71DwWqYTLj82/Uegae
 QC1IYNiLtTCIL711FZivwVz/B2d4z2ZSYS88ZoZJ4peKX3GXZEqBUauAEixblW1/XANYLfTc+1U
 Fyhf0aTzcEtwsBf/QWVBYf+up62zSapV2hAbkdRjTjyeeIuETaVACn3mdBSdaKG+R96g+PDTu4B
 q6KqpC9uMnx8Pc2H0384NU+fJZItXleV1GcSU/1mL/4SOvKMz9FiSgN/JC32PqJUESwcOZb2GIO
 e/YMRLDimRqSNZ80wNoY7ioRWjNypz7Ov+0uQRQHjQDUqK/hHTM0qupxLvXfHXU/l13dqYwUITe
 QuMdhYureyN543u3jwQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33959-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:suraj.kandpal@intel.com,m:louis.chauvet@bootlin.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,bootlin.com:email,intel.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: DB6F867BBCA

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
 include/drm/drm_writeback.h     | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 9fc15168c34f..68fdac745f42 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device
@@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320c..958466a05e60 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.3


