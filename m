Return-Path: <linux-renesas-soc+bounces-31972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH9iG/A4+Wm46wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:25:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A24C5459
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D3B6300B9CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 00:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CD827B34E;
	Tue,  5 May 2026 00:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+YeDfkZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZ8Xu01z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1323507C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940717; cv=none; b=Jq7bGkZgxwl54fbJ7gBMereLKLaAFRc8blo90BBKAUi+iDxVs5eIoK0UoBqxjfFkPSNazzc2tyCMkiO89qo7jTHwWNlKEiNmxi8cv2kpOCD8QvI3pvbyBVlJeT7TymifCT4bXLjhljIp3GYucl9d0KyzVYzXYxpCfrxm5DeXp3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940717; c=relaxed/simple;
	bh=dH38C2Kbg849nl4YLqXv/0VJPZa24rewDmxXYahkdsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=taL6C2lCqPHrBOSxf+eORzNz5sz9m0CPvMj+KyTBmAu+sy3I024NZ2jix36c4Y1QdzgwDtYvc1C/eGZXfQX0/vKDS7erFoG/yzfTYG4qJnLWGWAPuLPrSQjO7KJ4SFo0VMf/pvzr/m32lEX6eAAuDxiLd0Y0wl7pgbE6KbnKYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+YeDfkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZ8Xu01z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644NeZ0M1346170
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 May 2026 00:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lefrgJVtEuX0KnRNQkpJGxwI16qD4hB9JXPY0Y5ZgqA=; b=F+YeDfkZWHOFpsDG
	QKXjzg6cxfHFinv0XRe7h11p3xF+u7RekwweaodT6oPiCxc43o2E/JloWzGY7mWF
	lQSHr78s9pxYtfGvQqwL4R54mLHB5iWS3ZNXdKWDprfhazR77KFU5R+lE1Pu8sbI
	mNpoyH1wHenN8AFoV9z4b1vwIsQUOLfrx1JFNQvx4wExcnu42tqno7G/eeTofRml
	rk1cMxbPy4G13s8y9niO0JnYoYc08EG0YQ4meaILo9vG7S4REnk0osqvG0Htyi4G
	xndOs8uJYk6LBmvMmMmabl9xfWkvpMaRYJXzVWRLpscJG2QkJiInvxhzGUFQeIev
	fLxNrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2x9r07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:25:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso163418861cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 17:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940714; x=1778545514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lefrgJVtEuX0KnRNQkpJGxwI16qD4hB9JXPY0Y5ZgqA=;
        b=VZ8Xu01zXbsP1jQ4QPx0/zUg/is1deUu80+++WAp9i0wZSa4TLjUq9uAf+2KlgfC08
         rik5uuNaVlamYv++myZUJke53/qdsAjQzatWT8jbvAc18g1+tLuRH1Mb92o1jo8trfui
         cXACuFr1J+ro7vgw7d3CuKxaHQxWkD+e097idqpyTC/wsuRKlNLv2yjk/ZTVGV1Ok72D
         BhVrG4NxxtF33fDgOwPi20sZtA/RMVuKbq7RtLjQ4KPza1sz9S2e4CzMW/z++3n/dWuf
         DEeoIqSQTmIZeoeeydUtpUhziW3XlOgB4DLq+MZGOCmXwAEoVPUwS4KUnYKABtKDeo41
         HRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940714; x=1778545514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lefrgJVtEuX0KnRNQkpJGxwI16qD4hB9JXPY0Y5ZgqA=;
        b=DVO48e21gNkLS5aUl8Fh9+THWXcWaFZ0Y9ss4/DADhDFt6H5zngezrVbAI6sZhIE8Z
         tFPD+H9TGpipIdq/I198dX+0rcI8mstQ1iZ3hBJBzLbVPC0wdWnaC2rEbJbHjNaoUHOE
         ImhCC2rsFOOSzMXdw+ybVW7IXL4CSd0eldZQBUhItsusVFUicjTISjbyi0dybErTQ/Lh
         BqVGhwTN09QjLG9VtIkGVj46vcvTpPFl734ZeI9QgOuoRCLyN57tAcfBMQtzFj4g8LjQ
         Ui32Ysm2DbvwxwSidPP38GE8nZUOM5j+Kgg2vk5qgpaEyC4oWTXHiy2TCgVyTp6BiSI+
         sa+g==
X-Forwarded-Encrypted: i=1; AFNElJ/XK+1sS8JufniWKcazXcPT39tjJhGrWn4JJILgAEX1lTOmfTulB3w0I+YhIhWlhMSDNJCuIeJCsqJUF1qiOFOEBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFzBVrrOehpM6yFGbWX7V5av+3Xv0d1m20e7NDocl08Ul/UhD
	UBYyAlzm90qO/QrGpV1rLHKlzER/6uH91kFypIo4y2FGr4VWvK/RnJwAA/VWWetHASwB8pyjkEw
	WoY+EkoKtJ5Y5mw4naM7JpBq6lBHhLBufNAVQAfyWRZ8teMXh+UaoT9I4+o7dvTxXAirGZRipYv
	VrB4YiHA==
X-Gm-Gg: AeBDievM8ijmD4+u7oKyco1N83b70kk8eg9o6H0tiGnmCVPMZ2JumFzym9zOPlsavVF
	ihRd9w1YHn/ZhGcmfxNi1U30VjF7K5y2HniiaHsdyQXF7FlKq4N7GNWrrsuiO3rd1Omfe4Ln3tG
	F0rIJNTPETL5T8KsgepDBGyXXNvYQ55lOGeA2sYwi2tnpLz8adVwbezptOarM047PpZIGNvJPnA
	k1WetcXvaHetmnjNOJOKJMK6tGSVZtDQLCW8uDU7ZsvPTHrIZ+x11yh8zccRSzlLMO1gioxmIop
	SWWvEkyR6eM3sSeXx4uEbElX59IYnQdAAoQrUP6ipWILU4pRh/nK3fTL7f1tAQ0Lb3Otnlahocv
	EGxtQ9mMO0b8c2pUdne59rHA0QR2cI7xXQtXS4s8j1kQy257Yg8BIde32mz22750oPm32EVIOw5
	2NzCk4opVssW95zYZT7cKWXY0uQ15l5n/F4I3uvf1jbpF3OQ==
X-Received: by 2002:a05:622a:282:b0:50e:61c1:685f with SMTP id d75a77b69052e-51306b1844fmr14830981cf.50.1777940713760;
        Mon, 04 May 2026 17:25:13 -0700 (PDT)
X-Received: by 2002:a05:622a:282:b0:50e:61c1:685f with SMTP id d75a77b69052e-51306b1844fmr14830191cf.50.1777940713228;
        Mon, 04 May 2026 17:25:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:24:58 +0300
Subject: [PATCH v5 1/8] drm/msm/dpu: don't mix devm and drmm functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dH38C2Kbg849nl4YLqXv/0VJPZa24rewDmxXYahkdsA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ZPi9unXUNNI00Krz7+VDWt6BKz8kdLKWkRphtrvT+tO
 F3yoFekk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT8djP/t9rQ8Yu81/an5q3
 rJSazL88v6Qg6rqfci+vw4F392J2OXhb6F+bXn7AUl1C48Ae0c1tbAcX+j+ZJflB8KL5/HkqJTN
 ye/T1bjRqM0+PfOD7Ivx9ZcRf9SRLa8/eeJmSyWEeQg7iocemipjYJE66WOLjYqdknH9QZIZhhc
 SFWQmania3X3p0u63XXMTwUzw04VhArOWiPNv3Gadi7q6sCPrJZ3z3Y8WlcrM0Cyev5stMi14q1
 Ey0dW1ke2VoVigm05CXIVTAPu/wnl8LT7t5TSg3nf38A5NlKv/6Pe3mn+701XoFb52XvZ3V47Oz
 bMzx997pzGmPbn84VTR9Y1ffnBe27nwafrm3bhcXpxwDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f938eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x0dpNPXvP2gp0MABG64A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OoY_iPx4bZt_Av_kCV9je1_IQOabBklt
X-Proofpoint-GUID: OoY_iPx4bZt_Av_kCV9je1_IQOabBklt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfXzlQi5fe4+dZD
 vX6mfzI9YF6M0x8AKl0Yb7O0paVrjRfRw7+fSh4KIMecJoBAg/16hTKr6GzV4jSKmnSZ1uU8V2Q
 R0su8YDA2YwJ1gC6RAD4CpajlELwQa0C54gDtClL2iQ0L+Ff5GLrW1/uDm/oHiyywBZN43/huKV
 t/E1s6XRVaNOwa7VVKlN9apyMJn5YqNASwt001BIQZ04wec1uX3+osNOB7wJDte+xFWtBJ+yOvW
 o8P2K7asHdr6HRyXo3drgQDZU8ZM15aI4aPxK1Pkt2HnpE99NnFcAvRoW9/+brXD8kWIIPqYJHG
 lFOBO8zLovayqYJL9Oo+1WKyqd2ERpTjP3fibUaDe3k7ByHD5kxQr7gUFLpdtZU7nUhF9SL7wQt
 4Oqa0WESl1AqjGlgjmlkWJI52SlJ47HBEybSVp0+w0pq8gj8FM7ubflQHnfEG/OgH9EHR374A30
 l5zBs8Tyx9om79/ptpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050001
X-Rspamd-Queue-Id: 113A24C5459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31972-lists,linux-renesas-soc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

Mixing devm and drmm functions will result in a use-after-free on msm
driver teardown if userspace keeps a reference on the drm device:
The WB connector data will be destroyed because of the use of
devm_kzalloc()), while the usersoace still can try interacting with the
WB connector (which uses drmm_ functions).

Change dpu_writeback_init() to use drmm_.

Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7545c0293efb..6f2370c9dd98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 
 #include "dpu_writeback.h"
 
@@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 	struct dpu_wb_connector *dpu_wb_conn;
 	int rc = 0;
 
-	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
+	dpu_wb_conn = drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
 	if (!dpu_wb_conn)
 		return -ENOMEM;
 

-- 
2.47.3


