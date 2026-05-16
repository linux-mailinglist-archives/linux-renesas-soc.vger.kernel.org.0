Return-Path: <linux-renesas-soc+bounces-32701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCi2L3SMCGp8uwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 17:25:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2B55C5E3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 17:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C50F30036D9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 May 2026 15:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6063E4C66;
	Sat, 16 May 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP+lXIOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmP17XX4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851333E3DA7
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945122; cv=none; b=jFqVyB2sV9kxW5kx0/unzq5XOFqxG7KhpqsmRHBoPy+KaYyJdxp93j/ReEudXMrX+L8WZ0itsCH6Cp/HXi/ki9SrmMpKpRG3N3sTr8UfgL1VTWuf46eN22dIxFziYrMkSRGVg7ueqU3oFo4rpIUJWUUPj0CZgU3Yy6WWk1XkntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945122; c=relaxed/simple;
	bh=IYkXLGpODyZu+AX/KfR2hmxrZu7ht4ALW0vOZEXhBsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpBczKxibzqI+8euYNzfEi1sEb/w4XpMR9D65Hu0B9ihW/7Geqjogndm6cCu8+vRH+yEgeuiAT1GhWz1iL7/JrWZtVszraataLwvX4c6F9EwMBDriyS7cbo1vVdLTeolKzqqkblUbk0usSWJLm+pl/xf6kZpHSjZ+DfDR2PFKqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP+lXIOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmP17XX4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3muAi3269387
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 15:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2gcIEHC5V5+zmW6nZ7rTYwHa2UuXlAJLQXFWHz1tXY=; b=XP+lXIOHVEQFtbxM
	V5rN/AB+cz1T/pvmq8MyBHVJ8Fc7kO/029iL70BdgS7IiH3ndzr+jmh8v9AstqZP
	vbe6NzYcbDHlY/HecPLbCHmy7T9EobwnIxx38IAPlhkavTxYdOY5BfZuk+qs4C4S
	IEn3yuyaHRajuT8PjJk3h4KY8HxRj1DrO02wgaudUa7zypisXl4hHBGLmi2Q3gJm
	JMvDgxDrada0bEBbBnKiaBN5lV4D/gnFdyQ7IqDV9wFGSc1/286sD0SFXWEojQEk
	6R0A+hovoNNhmy0VUlmzrCQOiQbrB/crOaubXDkp1kNPEV8pu0FP4QIZHopfJeNC
	XkY0fg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g148x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 15:25:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so45332441cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 16 May 2026 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945120; x=1779549920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2gcIEHC5V5+zmW6nZ7rTYwHa2UuXlAJLQXFWHz1tXY=;
        b=XmP17XX4yIhkQO7wvZzWvy4qv03lC+XvN9KgIcNYt+b+dSxoqVqvXxtuIxKlts7Otw
         sS/tBwE6u1uws5Jt5AdxV4vQuJ33fgHscpzjPGi4qMo0clg9d0KrvPzy+sOqrBOuAU53
         fXjk+uxhrIzV7vo7Rx8tsgttrPV30ftxE6dxh+H8rUTJEJjLRPk6R6XrnBBCDKWGRU9q
         ZZBSBxMj6RhrGliQnQqT2CEXr1dgisJyOyHUJJzIM9+DqziCekUo/H2UkL5lLBt7uRM9
         Xh4eJGa9LjKl5ONypX/QTL7xt9+ffvqCluVzdGwvp52Va7Ornhs6OZW678bzf366vjHJ
         kGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945120; x=1779549920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2gcIEHC5V5+zmW6nZ7rTYwHa2UuXlAJLQXFWHz1tXY=;
        b=Wq+dHwnjUlJ6ctYn6/qoZSApctjMEQf0AFGMyQD/ZylWnPsuBuC+/yVNv5KOso2xj4
         RhaUDW36P+yVUbchTeCaUH6x2EetDkkGZHUuQQbNBjhN1zKZyfxDFmieOJk0oaSmKQZK
         SmPeSqHuzXuQiL6BprqBOXh+LngoT4E0SGoekqccw3x5/rwsteCY0DHZHDYuB/ID8Q0S
         mhMkKjUcg/DxVGUi9MX1IG0G0s2iVfOamBUCa11C9u215BPtkZJCTD7Wd6nwmtnuC0il
         y+a6YdfTvki/fGjzH2jMlNPI13tRa5LHZDSP6UowMBEZabynu2r2BVG4kc3/7ilXVVaO
         Cs+A==
X-Forwarded-Encrypted: i=1; AFNElJ9lgosRjQqwGkYnoO27gQa9/UhGb9v8+Aq6GREmO1VMMMp2Oyb1r/W+5a/R9zli6ePa/3KAEYR8iPiE2BrEZIrGyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4GD4wpHag0hhpAvjNVmJaa3IRpGVMy+03qkm3CWp1eBhCRD4p
	MgO8RU96arboKAGTLZjDu2Hq6bTQ1oJGl9SBiW5ruV7r0V+VAiSPiRm0+4thKtpTOXn7UScjuU5
	2hmV8U+9iKsfGZtoZ8yqRFEfxxPeT1VMGaalGSfsml6egbIWe3M74oovn6QyrtYvb6tHsQj+lqA
	==
X-Gm-Gg: Acq92OFiRswW9qcFOZGh9MlMTgG6CQD28TLFldy2gkhS9jqty3E1fqXfnmIpyWe89hO
	C+dCVwh5MWYgim8adU98Ou6gwC7fNmy4KsdN+mMda8LvI7+X/HdsYOlmsRe1Us4Hdp6N80pYG4x
	rpshRZP0QRZPkEfrrSlIk0nFs1NVgmrdDhzA/7/LMhQI1fss2SWEqYYZh8qfwPKDwNLfAZ+3cgf
	FSkp6Bzyp8uBzdlt5rG4S3+yQMf4/prMqijUBaB2yoBd47DQx1t4H/5xb2emcaVMfHh8AgfSezv
	a0QSroTjNkqyyvmzdMENjzFd1z2NdEelw066N4hOEcQwfK2kshiMp2agBx5OMMy7oDGZSJNMN4f
	XQsrVnABXxHK+gawRwIwe/Omp7fsOGD6X9nQre7g61zZ6tiD+58eXgboq46Jye+5UlXsNVzf4C4
	ht/2DL2skbn8UkpBavmQ2C6Q+hXUWta5eEb2I=
X-Received: by 2002:a05:622a:1386:b0:50f:b7b3:2ebb with SMTP id d75a77b69052e-51641928873mr165222411cf.33.1778945119701;
        Sat, 16 May 2026 08:25:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50f:b7b3:2ebb with SMTP id d75a77b69052e-51641928873mr165221841cf.33.1778945119241;
        Sat, 16 May 2026 08:25:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2057972e87.70.2026.05.16.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/8] drm: writeback: clean up writeback connector initialization
Date: Sat, 16 May 2026 18:25:14 +0300
Message-ID: <177894506978.2448625.17152574519326512949.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MiBTYWx0ZWRfX9v8Oyq6L2NID
 bm8f8aZ1ycvbnXMUxrYDRPLnpNqEBdPG2n8d3STNooByxMeL6cOirzNOTjqQPhPWHLTSn+v05hm
 5J1Ou3N6O0Ul7wRQZAhhrf0AqnM5CiL5qjd3FbQx7aPu9OtyHViUSYabAQI2jT/3vgMgPFJyEJu
 y+9+96X6ZRCGfB8cGItR23stl6b8r2g3mZIGSvsCxWtGNIKQJcRBJLFNv/w6DWBdJ3s087iPw3o
 /G1wAl1ZTOm9ihsp8BoGcCmZEvVZA7uEGd5Cjy97yVWqc91Fzfv4CJ1R08GY+Hj4ThgJisZ/za6
 TMsnXnKikM0wcLAdM1/GnneaITuJNpEKlbkgPwuQIx9TAAhgnlZcezfTQqNWywien966N4gF+6D
 N/QHpriQeH2p3BLPcP5WpXBuNz4khyGMWRD6AmiifX3JZYLyj9zLsIo25ZeHc92Rbz1k0ykPdMo
 t9zaXPj0P8GHeXujfWQ==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a088c60 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=XF3gkq58PEN6Oa2goDkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: gGbhuBvMfeIyYxa-45g_nVfo4jjhAUHj
X-Proofpoint-ORIG-GUID: gGbhuBvMfeIyYxa-45g_nVfo4jjhAUHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160152
X-Rspamd-Queue-Id: 5AF2B55C5E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32701-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, 05 May 2026 03:24:57 +0300, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> to use drmm_writeback_connector_init(), drop
> drm_writeback_connector_init() and drm_writeback_connector::encoder
> (it's unused afterwards).
> 
> [...]

Applied to msm-fixes, thanks!

[1/8] drm/msm/dpu: don't mix devm and drmm functions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c0c70a11365c

Best regards,
-- 
With best wishes
Dmitry



