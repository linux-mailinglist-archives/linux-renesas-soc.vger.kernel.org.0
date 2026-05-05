Return-Path: <linux-renesas-soc+bounces-31975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAOqKmo5+Wni6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:27:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C04C5573
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 454D2302837F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 00:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DC278F26;
	Tue,  5 May 2026 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcLh5r+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IOgn8OD5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935502765ED
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 00:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940733; cv=none; b=rZGB8k7I7sZzG9iJ6n8It2662llbt0qPe0MzxgW7lzQD2OdpiyZ9/yBEahvISlLx8WujDu55JqJ/7a1jUInfou+krY+za8EmH5+teaQKPLRRRUbrWHTdP6y3FYuLZsM6tY+ebC/cJtCFb7BtqzWdcR3cNGI/tb/aHPdP0qP230o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940733; c=relaxed/simple;
	bh=FuBHZIwie1er5ktaJK0YV3oa/OgU1IZweJZeXfhYARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0CA13kNUZfU//qNLcranjiuguz8bM/uEurYT/bBtGqsN5U4hiSkLbNfTQ4KR4KjB3M4sVO7c4lqSj4myk9hJjgtAjZAjXbfSbRzhsDzE7Ix7q3Y8LEf1Jmo/jiLjjFguNWAsyC4+r5bAJptDlDkMr3oKw2so9nNrHQOMgyTLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcLh5r+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IOgn8OD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FOqZm1346361
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 May 2026 00:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWAgm8yZqkTEWO3E+Iv4QtTY54HVAbGewYLkSKrtuKw=; b=JcLh5r+NdnvDXCPH
	SiN8bTU7T2LYWQr3hx1QzJnaS3z5Sdwb8B+XSb0fjl/J8d9ptAouwR9lBJp6e9C8
	Vhc7IGi/89P+wfGWADGvSvVAUu17Q3PyVmIf5CBtLNh4SF/tRC5eVYDcljP/5v2A
	L3WPQudZERv6PSruEpBQ/y8SuzyG5u5jj60ShrTOuY9fiSedc6w8lEWWCpXyGMaV
	vYDCG53sZ8fQzNJ7YxAfaS9qbc5pjbSvtmIk0iAKcjgUbo0ObdEekw9pq3hM/Kj7
	akRnUcE6AArhWtGsTa7x/Slbpz1y/HezRXNADmQXDWvalNUTzaj/jkfwJZds1qRq
	7+HpZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2x9r1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:25:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso117432991cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 17:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940731; x=1778545531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWAgm8yZqkTEWO3E+Iv4QtTY54HVAbGewYLkSKrtuKw=;
        b=IOgn8OD5+vdGjV6GS2rrJcSke3Ry1176rZc65BY1+UgaZeG5PfboaI0Ddif5lPr4Az
         yUPKixpLywqehWHa0+bIJmZMKzstCPThvACACr+da0WqmpI5eAL2JoNVYPFM3xXQPPUh
         casCMjXbf2fJ6y8qs7y0BRfJ/WDg/wAoGIxh6avoDclmvZBRz7D9Myc3UwfdSkL5RF7L
         S972X23RhqFXtTTwIHuQeJfq4iLT7nmjYtW2z1tZegZFIv8AtV7yf+jyaBIUiyENhDzi
         I3uAUEYcSzlPZhzpKGx7kxzZlkNKTCVXP7bG43/74yz2+e9cCvpWkCO7Zdbbf5IjYQ48
         vUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940731; x=1778545531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWAgm8yZqkTEWO3E+Iv4QtTY54HVAbGewYLkSKrtuKw=;
        b=P9e04rVBFaI5H5u3Xap/7+0JaXvtcjMi0vyh+E2/gyMYSxGd2Ij4JDlQj6zKQxNb6w
         E+KHQAOL5GRwmb6cCvKS4kwQBKi0LibN73/w5M8eRO25Xc3OMvW7QvZQ8wycB9T/CUc2
         /wDdh0Vj5U0dLHbKhZ7VYdGOOAZs/EIO3XXbw2pSi5hMh6CFQDa++L/k0ZmUfQpaSazH
         tutQy5NNGJbUwVlFLlhsQ6ZXEtWUdv3qn+BXECWbCidzaTgAQpBOOUxIsBpTPG1hmoz5
         Up3kpEg7PZTNf1libZmiqzfVDA6bKB0VJslLlWIZBjBF9v/Gn12IkS0OwmyUPzNcgv1m
         GDEA==
X-Forwarded-Encrypted: i=1; AFNElJ9b4DsUrxrnzb9O3CP3SrXJEfqRyhxTe1VBA1m0s8fum6fZ9AzhI503OlO272/f0Q032CVm/k6/L0VCr31UjBNfgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBlLIduN0wmThG+1EIUbvSyocbkNQEfp/00F8A/Iu/hg4wOf4
	/+k1ImdYiIByoeMKVgK0RPh+yrrudFVYRQggEXJxUX5lrqFAddVeasLWDTI1ocZut2tr4h4AgSr
	NhSKs79BtVWAivc8sOlhPP4aQi6/CHFDiGk9Ku5FKA7S5PsS2t0mYPQhXUu5BxZzISj9Tdea3Vn
	M4Mb1ogA==
X-Gm-Gg: AeBDietxDmEQBfZbePdpfHYikfyKUgNy9gPY0RJbvSzjK2yJ/PEVw1RoklejQdW7smJ
	hModTToYQ/MUaRNaJWwgx0B1omDlycTgrJ2gD0EXDgczfLojo1mGcrOm0ekYL/apI46dQyfpavU
	g8j8J4scGGTnpElskT7HcGArQJsSlXtd92nt7yeiGbQfcle+AmzMM5GAx6YpFGI1YtgW/Js7Wy8
	2Bebdwz3Dh1mvtkvuX9es8DNfhrkQkmBdRD62Jzf0KPSkL8hul/e4EL/CCZjUkdr6lRUU+kurg1
	fpc8Efry2DqJtJ/dz1rW4t6dESvEfg56XgyzmcYwHsIzdSPxK6/G0KGihrHIcn8Cu/H0eE1vdO2
	Dj4/Evrv0gofLPOr0V/aowZPAswD03WUff3evfwL2upXQ7sBCck/K64P+PEQoNpM/bfhT+VQh5C
	ZZZgJt2iysMhp9LjUJAnGdCOjaxHq3XMZ02FIQFqLqr9yd5w==
X-Received: by 2002:a05:622a:90d:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5104be76597mr167209291cf.20.1777940730807;
        Mon, 04 May 2026 17:25:30 -0700 (PDT)
X-Received: by 2002:a05:622a:90d:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5104be76597mr167208721cf.20.1777940730379;
        Mon, 04 May 2026 17:25:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:25:01 +0300
Subject: [PATCH v5 4/8] drm/mali: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-4-42567b7c7af2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FuBHZIwie1er5ktaJK0YV3oa/OgU1IZweJZeXfhYARA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+TjcU1af0jhKXjV6ovGMeL570EFt5o7s8n1nn
 fsAtjt+HqWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk43AAKCRCLPIo+Aiko
 1U8pB/422R8VMg8H+IB6Dm5C7Nrxv1ibTNuhkwFXdQ7AaJY61xdh0vXl6otVYKN+1y0dwFJmSxW
 3JKx++z5bAUk51vcm6jV3j/y8CHLhWXNVds+KLFlMo5N0VBbdGeLV4eWQdIP/NUpLTMBjSQDEp5
 AYF1h8DxpdRxGVF7t3yZKqSbGHFMUKtjFJ6YKX5VY1K/0HJzKm2ZYCB0SIxKAem3ztMYcW+rFay
 4F5x2Xvmt6HGtMBSA5Xwb31d/kzJNYih3pg1QGhM5mmXUt+lzRF7UIAz/Yc/XGGklPUKnxBmQzL
 cqMryMtUBc/TY7M6wUO1QpRFGIa0wJ+v+nQ+Dxr+y9LreE10
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f938fc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rEXDA0v2x0ZtafRnR6sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: o-pRYJxHRTW759gl6pwbrtiStMKWuSpN
X-Proofpoint-GUID: o-pRYJxHRTW759gl6pwbrtiStMKWuSpN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfX14zLoPxoqznQ
 FGpJv0k/DBEATQ8pM34nAB+EKuU/UtPhQJEo7J44X76TTMABN52s+JR40NG+BZkbPb3VEt6ycjK
 S01BX8PIjxzegtuBeWrHoVDRhfZaFJQVijnKwnbv4YlhTzGzBvceIQnhlgR4kGuhj0F9NVNcdo3
 RcycbZOJy0mnIJRRtcWE/72DsJrOO7D3MeURYAlTDb4/iM/GCjGyu4n4JCgEdVngzjYrArLKAb1
 3ddFZfgTKBgcvxFo/tiXH1Q1eVKCWUq+gMUdKQURcaBWllYvsWMap/wd0tVKohsoP/XEvj6i3og
 v79lVkp81z0vETLYgvylcdVQ/Ww0Fgh318o/A5lgJGwknjpJ0j2KXy7Sh9vN+rjvElQO3yFwvmI
 /gsWdBM34Ac6URJT/pEAh4Lqs8FcN6UXWm6jXOjHEi0vbTWBmi8HubYYlxOFHdhW6xqubKkO9n1
 VlcsGuZAIxMJBZHnG/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050001
X-Rspamd-Queue-Id: 174C04C5573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31975-lists,linux-renesas-soc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index fad343842038..6e0c78e998aa 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.3


