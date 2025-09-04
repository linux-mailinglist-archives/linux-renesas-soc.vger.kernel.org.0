Return-Path: <linux-renesas-soc+bounces-21412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B48DEB44859
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75210188E68A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E62229BDB1;
	Thu,  4 Sep 2025 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQH2Fxz6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE0328934F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757020617; cv=none; b=eq8xaiP8l8+FnUsl2altRCfYbilNYYJ5xA06yFF/eJvt+Eg6SDp3wcbbYQUysbmFYV7oxKs5SSy8cwsZoqLRVIpNxyJ+IuH2YtWsinKJ8sAfTmFUcIvHyS58HiV7rQrX0PmCu/bOuJJ09ru3n6kyXtwqG4cVoFZR2KQWVH1rDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757020617; c=relaxed/simple;
	bh=5jElI79aTeUe/J69ij3K0O9HaHlhMaLrW3syJ0LieHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsDfKvWR+NRXsVftMwkBJY6bzlq86a7tNtHYxGgkUGwcr4KF9LJHrN5wxrhMlR1CU6BHvKDIpCJ0I/BCJ8LK5EVgy3u6gnITpZ+Wwk9NstdaA3rz1aMH7eeG8MemNhT4JH9SQCqXpm8tZznUNfPLGxHbf2ZsV3Y9ytufL/dbXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQH2Fxz6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJs0u023074
	for <linux-renesas-soc@vger.kernel.org>; Thu, 4 Sep 2025 21:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mh8AMrdW/g+ZTiJBMaP3XjJz
	yon1YTwT1+baWuYxfZ4=; b=FQH2Fxz6fog71vdvkBS4rxNYjUGXV7+eG01OaBsm
	yMLaThMXmXuStGfvH7SlNCZcTUY3N3mxN3SP96ZvFtCpl3V+kAL+2gKrqafbdKFP
	6h+IMRGKFLs552kncQiW2Vj812qgGGXKaKqHRie2b10QC/ZL9qNVBHXFqh0fYqRp
	S04WQ63ktqO15nxPE+ieUpJfYsLPQjODDxWYw9EaJ5ZSfIFZVswUuOxorYWXJwLY
	ww3BGPrxCccGuJ+9XBeVgqxFqNvVIteihAWFtZ3bcituFquZqzIg6XTNCoUYbB98
	XnrxeeMDjZ6gWmA711DhdTNJ01pnuynxy7+fXAZ4hy2tsw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0es261-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 21:16:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70edbfb260fso21634156d6.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 14:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757020613; x=1757625413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh8AMrdW/g+ZTiJBMaP3XjJzyon1YTwT1+baWuYxfZ4=;
        b=uaNYS55Qnv8qC/wPQm7Cqmz3tHqIh5yG7HKkRWfC4eghc9FdfhX3cjwELGv5RIeuQI
         JrBE1EnFbXKJ9UWK9hmcSwyUKNhK+QbpIUXhsrVrqMi6dBJJWV6CUZk9Gj2SdLAeTT+V
         R/4FKpzLPOsyR3JoXyz0HJu8Q5jxdOKloN+aSzx8xq7ZUkEJDlmPm9u0YB9vdXekEhRt
         gc/kKuvlLc0sjqrhFze1RwgzbGGKeV1xXhokiyovmh5+N3FRuVEhdMNYHZGdTrFFTOJm
         ko+e1ZrPycOQxsG/dhgxz57dkDWEl6/SYqGqumzBC9svHu5mVdsI74N+9uPptKHGC9oG
         5CCw==
X-Forwarded-Encrypted: i=1; AJvYcCXXqlawdDfB94+ZU0N6r/h80LRDDO1rG+/jLPRMF+vUQDwpQGhPj1jSCMHOB2LBReGOI81bV3esVd565mIP0qddHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxwAl2G/AZGL00+Qk3O8obrYY7bRAhYlwHgb/mHu/fKW0PQf5l
	I19FT8oIDsdpUOfwXgjae5jqOWdDtl3au7H9B8D/1rGPGfj6wB+8iBQJkKuwQe32rsxk7vN+cHK
	mEkglVMor3blXyaKHp1lGRkuZ+4Bw/X/UoaPdMze8zatM2xHuU5qB0DD5qW/mVik9jsRV6En32A
	==
X-Gm-Gg: ASbGncunrJMzwtn5DR7SoAP+UDdDr9cJ7YX/J/xFCibSx3zc8Og0gwNYb7rwBuR7ulZ
	8pjbrhXFK7Qz0stMGP7g4++uxPhRoFDGeY5foOpwnY4SPhO1Ewu4wjtHS6z1rRF7SgxWS10seDT
	n+wGOLVI62TQ9EygDw6qxGZR8F40UjluNRlAZ7jPRed0t/d/cJiGAhTb31V8bOqTX3l4u7PKIJ2
	qLtVdJtfoOIxSbH21K0BURdfz6YzP37iMliXNjuyYfQm/KJdW9ybQTSPr058QELpKnIw3Qz5bfv
	VTWpqjEWxm/m0nsxpZbmU1wfsqEy5U1DszF8emyamytC7GmXQLfdo7jRUt1R3+H2/NXhg2QzY6l
	B8WqFi/o0PC6/DvYoK3fLZ9FKRfb4WdSJDT515ahMBk8ImL6SiEHq
X-Received: by 2002:a05:6214:4002:b0:70f:a9a3:251 with SMTP id 6a1803df08f44-70fac7877bemr229450116d6.24.1757020613075;
        Thu, 04 Sep 2025 14:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2H1du5auKnvQbtV9SHrDXiNbYxgk+GtJPZ9m4TugfdymzyxBYc9+tnOTS22ROkQ9dqLXTOw==
X-Received: by 2002:a05:6214:4002:b0:70f:a9a3:251 with SMTP id 6a1803df08f44-70fac7877bemr229449596d6.24.1757020612516;
        Thu, 04 Sep 2025 14:16:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c226sm1447746e87.22.2025.09.04.14.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 14:16:51 -0700 (PDT)
Date: Fri, 5 Sep 2025 00:16:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: ilitek-ili9881c: Add configuration for
 5" Raspberry Pi 720x1280
Message-ID: <ojrgzagempsmmlpm44kp623zltzynkdcatq42necy5a25pvfoq@ntkb5gaknszy>
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
 <20250904205743.186177-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904205743.186177-2-marek.vasut+renesas@mailbox.org>
X-Proofpoint-GUID: 76gNxSJXu-UNjAAS02my19x1cI2fqmOs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX7LXyBtM9Eo2Z
 mbN7rUOYGObdc2AAWTAqZXxp8D1WikN7sHXd2iDnjRYFHv9/X2aZTWfStUo1fdIy3OQbWkkXf8d
 P66gzvrZEjzXXZ8AX+Sg4/ILjDg1KinXFkCiXsdiKyGZICWLrqi3VsWrzif/SQ7zZFV4ym6uSaP
 DLSOtiW5jAcJ/fARoHAjnuH9TWBN5uRb/WdMrB5DJypgb5WrTVaR1Lo/rrbmG4VzFrtYRex3rzQ
 qBv0wVIQjaK7OD9lyrfhu2s2mesjSwM9AtdqWytaUIi9QAItmF4IQy/2l9qolioxlHLWrqTapns
 K2iiCY3WpBziqFRK8RvzWS+bYNuOCp4GTeDca9Rhh3JiZj8wsBsSsSWorBuF+oXT6tXzNiOZBIm
 CK6jMpUr
X-Proofpoint-ORIG-GUID: 76gNxSJXu-UNjAAS02my19x1cI2fqmOs
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba01c6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=RF00TdSWAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=dCZUmJHuHaGrPOQQW1IA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Thu, Sep 04, 2025 at 10:56:57PM +0200, Marek Vasut wrote:
> Add configuration for the 5" Raspberry Pi 720x1280 DSI panel
> based on ili9881. This uses 10px longer horizontal sync pulse
> and 10px shorter HBP to avoid very short hsync pulse.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Turn ILI9881C_COMMAND_INSTR() params lowercase
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

