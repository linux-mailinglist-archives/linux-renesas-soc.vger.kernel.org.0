Return-Path: <linux-renesas-soc+bounces-33952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bYgxDF5QLGoNPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:30:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12267BBA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:30:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j1kCkMsT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gphPfVaP;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12A95300B297
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64B737269C;
	Fri, 12 Jun 2026 18:30:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E239DBFD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289028; cv=none; b=oX/Nh4q5sjVG5fD572wx59xo9Z8HCOTPt6WUdjAuP3uPWIsBRagXyZ31tJXaIbebb8XQ3dhN0atNq5KJ7js1QX+5URNx2kvMbW9UyAm6r55jfVkRhlouh9sY9WY3+KbYk2PiRoQp9fDXB1cBLUbiH4nAqoWuEGJUNLQmaBerpL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289028; c=relaxed/simple;
	bh=MbaRBOLwFT+ETgHAVWF3UBcaA1Q1ln0hWBI7tVGYbZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwI5uakYtZjvYeAV1qSKKvY1Km/1Ts0k9FhmuHlYWCMx/bAwLuYQmJrqunjnIf7aLmJsrIDY7hXfthwxsAMGjurCe5ZS5l5+jKFHDe+3fjCmPQBrGXmoIr9SYrwa+io7Sfx4nJSM74h9E2UiRAqppMgnG5WH47rRozEV3Ny5Neg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1kCkMsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gphPfVaP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVfv74112827
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRi4QyMfJKJttBAEFdi1P15sbORxIAP33IpeK1RT27w=; b=j1kCkMsTOh3LWhON
	0QAKPzpA3acIfOXO/MvUweopgToy0P2xRi9aznHifE0+rqx+rgwxVa+amb51jiNS
	diq2pHZ3HdNXpLnuH/Y8YbB//wDxYLxd6pY0VEa6WNOA99OPxvS8iSEH3xtDC9up
	PoX4jX9sE5Vt6RQAkyTnGFs7JCsBrS37IDLHQPt/dsnc083oBVyOpRJUeGdP8ZKp
	Qq4EL7EYdFL6G6928vhzHGg7B3DIG3td+WYA9nEVqEAACrJxoWyf56n/pKwxPLti
	7K+ENyiNIW9Ed/7pTcKcHCxJHJz7oQI4oBDmb0ax0667GojX8TOl4NPEYVMSq05v
	eL/I9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30gc2p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157d38ab37so122897885a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289026; x=1781893826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRi4QyMfJKJttBAEFdi1P15sbORxIAP33IpeK1RT27w=;
        b=gphPfVaPsHHQ8EfI4Ix4CxaU/HswAy5BAhRgTRMS5bAUpfiM55kfLXjYFzZGiwF0eQ
         gmcERF8hr2kwo9sEbdKMXuTyREZekltm3yb8fq8LHvWbFksiPRbLXaD3BQ5LATECZtNg
         tCDy0dI7qMWx/8HspVxDtOo/m5xPhWTk94c8VWtp7eL06FU0ziYyT4deWwhraYy7yEjg
         5mBHAgapCA6ROs1wZoMlzWa0nYZqoJ1HspPv1RgaTkLtqjOPoHVuiW2ZMQG3ETQaGjsB
         EAvi673rN4JuxqNKx+yPyBL6e3sDipWdHqymPMfuM88rEFRThuFmSj3i3pSgRqydIcQb
         UYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289026; x=1781893826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRi4QyMfJKJttBAEFdi1P15sbORxIAP33IpeK1RT27w=;
        b=TzeOCdDuo5F6lTyNF8TlJFCycHKkvyIlEoaxW/P/vTCSoTiC+AHbNiKkJ+xeCEGaWO
         fTvYo2eEdguiInufXN3oeBDvl1EiXakqsMe4uI7ES53vQwM1Urq/rNok/AydZjRIaWpV
         pIDlBFM2xCxtkBBLs8xem+EQHSA8SRphlVeDGDPJKF0pnCoGaxazt3OmNxICu4A9wp9Z
         keKJQiqjqqov6oo7MUnYwIOIFYkqOga0JMBd0pS8wTEsOa0qIGE504r81psCQodm8BU6
         xfkwHJ/hsX374KIqwkHLunddkVmVMGRxIptO3Ge8gMWLk674e0Ybj/zIyJsBSH20mPba
         BWBA==
X-Forwarded-Encrypted: i=1; AFNElJ/Tx4mCzFTUOcwj5bQ8QNLngs7w1PJvMJTs9mRUGUFUHb4ad/wHbXtB0t63UsyBpScJ6skpucp0oNOGZ5Knai1kEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOhnfiH+lKdLaHaGbMKUnTlEXW2etTP13uGWP4lk2SR2hwVe4
	w6Dr7Mvegljvgs6IEY1XU5Hr2ngcowpQFvaTbuuiUdne3ePFszZ1hr9DYI82vLxavXoZ6JGhEi2
	Bm50xSF6fOxhqOFcU3i+VTqGDkqSd9GVI4BI45JjLKuM8iGj7cfG6rcfnZGcfzX1dQK4trGVSWg
	==
X-Gm-Gg: Acq92OEAWLtblmsWgeL9myFYfqcfLUSc+n6PG2nuU96qcnjaMYq5SHrGp0c2pbydaIz
	t80g40KP/M75R7KKawfo0uFZk57AUMg0rcBlL9+1YwGLvK0NqeemaTHYvlbpeSKvHkeBkrtpBXE
	ItejH/qbautyH2z5UxHdzcKiU24zy8VZyi/L4902iSU72F2EYmDDMBd/tH+pU7ZnpL18m2R5hvQ
	+e3c7pLnOrCX/LT362IZXZl9WRRcWdLF4lYy5XJAkxFJca5IK+mHKCuHWEMVi00bXx4Y22QqKVn
	vIJe/shutNq7HcbH3HSgG7k/gIcwo9JjkPknx7lNT3jsycBN0ARsvkE+ZmYzwt0ahTkxz5R7jYk
	dqL+AEIDggAakUPxJ0mrS2nrT2w7JXslTFsaIxnU/AppEzhKDyJCc+AUe3RnxGHINvyGB1YSr6P
	AX/kdIGe023zUNnFsyVQYmEBfxRt8Emvtx4SM=
X-Received: by 2002:a05:620a:2714:b0:8ef:ca26:dcf8 with SMTP id af79cd13be357-9161b954533mr612527385a.0.1781289025602;
        Fri, 12 Jun 2026 11:30:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:8ef:ca26:dcf8 with SMTP id af79cd13be357-9161b954533mr612513885a.0.1781289024928;
        Fri, 12 Jun 2026 11:30:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:13 +0300
Subject: [PATCH v6 3/9] drm/amd/display: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-3-9f3a54f81310@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MbaRBOLwFT+ETgHAVWF3UBcaA1Q1ln0hWBI7tVGYbZw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA2TF8iWOsdGp/XNhFFMMbJIh1AWUGAs9E8q
 XZNuCdRYNKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNgAKCRCLPIo+Aiko
 1edSB/0VjeuYOMaO2KkI6CX4me4o/IauFy8eyB2qW0cOD6x73XUrx6wzyhhmPiEQs9KITW95Aux
 vOlO1OGm4WTd10dda61ZQYwFQCxUQCr7hUhOhpYfjLILW8d5w6LcrB4e/y4VO+m9yt89EgCxZ84
 m8nTMxnSfypw3OwMZya9EzwpgnFKQI/emxXRCB8fJh3mYb69roMD5FzqMiPiMJoG4uQMv9uPEea
 UQC3upMrVgAG8LSU+oom9Leb8S4NQuNZEWgRfKGNF0fMB+9rQvKjr7Ga6EL6VshD355ZdKH8cNv
 KCLIdEljpwWS5Cc5UowFwL+muSXLb74Lh/zEqFv53Rdxr5ax
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfXxDnVx2u4mfwy
 +YtiMZ0z4J1gG+thJ4Uueqr4sM3ySgPiBYmXCvXPiGA2pzSdWyDzpV7YKMV0D20ZfmUbReIgDXO
 Sh3hrFtu8WLsbYhV1qhAK5jZ0ntrddk=
X-Proofpoint-GUID: ZY_VjZ4w3bljRIugqc2at1UObs_0hvvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX+x8Y9CjHHajX
 THCOKYcKFRSug+oCDglGrVrsFCRA3Tum6IzYyPBYv4DZcXS4X+xlDmpr/wtny3iqE8uLu4Yzbej
 bnBjJQm4f6l2ig46bp/WP1adhi4iwMqxdLHHVIymbLWLuCHBDJab8mfdtLlyzgi4b3WmcTn2Ue6
 CArxbacRLulGXStHj9GqwypbcKqPt2IU+SUm/mUUsTJjYfJIu4RmDudD4+1W5etVdoi4osVhHCs
 iIaAmSpkPwSJuc/LZiUA4g+1R4wICLjjsIwfN8Myu8XXUxcOFrcGM5soYOCnT6MfHoKMvnoiXNH
 7XyZJHBXX+ekb8XUGkpokO/MDEg8I0jmIBiEfCVCg6xhl0FiRw46Da7NjF7EeIv3ZiPBs8ZOqXX
 /omqmUZxBagfk88tzdJ55PjGqCEYAVLRyx96AAngTLZxS6FfKA1I6iw5xYCyHGRPzD0DEJSjcek
 DxLhM+EulNpXqRg+DEg==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2c5042 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: ZY_VjZ4w3bljRIugqc2at1UObs_0hvvY
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33952-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:louis.chauvet@bootlin.com,m:suraj.kandpal@intel.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,bootlin.com:email,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 2C12267BBA8

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 436562e32e63..066ba6b6ef76 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10996,7 +10996,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 110f0173eee6..fdc3da40452f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -169,7 +169,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -188,17 +187,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
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


