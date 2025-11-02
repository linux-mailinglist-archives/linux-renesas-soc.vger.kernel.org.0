Return-Path: <linux-renesas-soc+bounces-23992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975AC29262
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 02 Nov 2025 17:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02B283AF30A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Nov 2025 16:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A0F21D5BC;
	Sun,  2 Nov 2025 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MofBD+Fv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4/WYBMG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C5224F3
	for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Nov 2025 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101572; cv=none; b=jaGc7ImIN2tKa9zsJ2/jWNh4dFH9b4iqJ4szxVcmc57frK8ySca0p/i/m8Ve1ItneFqncDtW+hhI62Dhqd51vWTAebmL74IQBvQcnw99wWa0LyAMEQD80HXcA0vb+yZeGSOKp8uTZop5NnvAWvwjtiXj9/adlEqou9eyCn+Wk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101572; c=relaxed/simple;
	bh=/wk0r2WF7kQ5J/280jubxtFtMyKSbwHx02KsbYzueY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHElUUSd12Us5i171oyFT9AgvjEp40ffHA8O9mfpaVcTdJlpYQhRrGkoucCnui1t7/MYHwmBNKQFtLj7i65iy+E0xJuU1O9KCSq4Dr9iGhejkb2eibWcQqZ5EqxP2vUEnQMXzzxEfIGvrNYRxAXoPWFJlFgBzkbtCenP/N0N/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MofBD+Fv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4/WYBMG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2EcTdj322077
	for <linux-renesas-soc@vger.kernel.org>; Sun, 2 Nov 2025 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
	Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
	/9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
	gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
	FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
	AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
	VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm28wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8984d8833so79091911cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=i4/WYBMGUBnEaKfVK+XxEk/1dI9+8icftO6Ih6AsYPQ5iNvgJNFgMwv/camZavyLKi
         iQawi7tyzOpGmVcVQATYY+a/wPi4CsicQPW/cUF5yPf6LhDseLy82Pqxz+SjkEy5nQwg
         4wzi/Gb3p98CLAY+6k3CJhIVs0luMkkVMvDE7eNSPUtQSm94l9011DJpvMQx3u34fVko
         cYWuKIbJ+sLCBQv5vwAA1tczUf23smCJLhwmSHfjHHuyQPPfs3IHL3PyNKxh19uTDcz4
         bJPp6UeFd4pURhT9ffnL8RHsgcFpcVxZ+A2zdYkNSTfrpLeW5dDQBhkfdPUcxXVoyA/3
         DnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762101569; x=1762706369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=K0tTLvNNzsq+CM6wPbBG8nZKY4KSW6hmZMrNyWGeHV/xv6zrYHE7k7hdfcixcOnM1Y
         bIR1RfjgNlbTKm93eGh+aa2Tojuug4lZZu516w6AqNoenEdwbR4gtiaM6v3bxMUgQe/C
         9s3B4U6ATQtZD9Gi/rNTDnJAmNib6KaeliPZi/SNr5rOx5a+yDWRHovjeULZg/RJoEti
         bfE/DfNsaRtpymBvFKkd27mzcH9AnSWQbLmLInHl+a/ysXmXTUeUhg6tJaI7usvkqbpi
         PEt7ce3hwJdGoUgeKn8hWqlGvWP23Ad4cnobo7k6ybmQ8jDo+dH/JOFKGvC6Jg+ucW2e
         g23A==
X-Forwarded-Encrypted: i=1; AJvYcCXG7I+Az4G1sf1UnHA1uQolUDrKQCZfz3tpCLBn7eWk1FfvKiR0WXUKKDnJcM5VGgpt5Oz24ztvHty1ucYS0ucupQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn63YuikuN804JjToQAQ5RgNrLKvb2e52fbGpqFIksm9A764cp
	S4k0+wSapufBKIB/3fcbHkU5ei4bHidMwMxCLDrZ9fMcafOdTT1D405ejmXjosCryFuaF7FL8r9
	iVCi+v1ehwaVjkIne663GJCY79vDx8bCX8rG7IIeQy7YsPgxiAybOx3EBO7Wk0RyNL12jzD5qUg
	==
X-Gm-Gg: ASbGncs3AO9+4u3RdLndW+NmDEHl4Kp/GA/BiakT76LYuLKnsq0aT/Op6mtGpNng5Wl
	EPVIjEUJAeSsbDbCNMPxv/MUfHMQMMTwUH6rXqXxtOcZ8OrSxZokaSYK+AdDlTp4VCR7lp6fCyd
	iZnLFM/Tc80Qb2sZ8aeaUO0RdPm5xF7PfBvS3q9OeJkdm7zCxY6RItPf4E1oZwyfYepKH32caM5
	LyeClVRMkIKvEy++t0fMcYnMlHLcl+BrRUoAx2irixVhi6utpbjTe6+OJrwpeCKEyTc6gCEoh1H
	6csrkzn4q3d3cd+lmj3vp4QScuAqxembPOPDKLoOc+weK3RNm6CWZiiN2nlPveSVe02tCcPrnE2
	stm2ETB4F1py4LhTV32BEg6Hx9cRBtfk6ywUfrExNqJkmD9cbbLVwdWdSS+yP72uFHvIXgEuStd
	RLnJ/TKC9/YmsM
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57411101cf.54.1762101568692;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:39:27 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
        tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfXw/FUsKYeTDWi
 vP1/F0w+U/+BKhfDv+2pOxDFh8OCs0J6jfcPMe/pei+7KGPkDxE36w2edDk5Sw7IWuB5a/WVfuI
 T3sl7S4C141VWtjldDqkKnckIaxcOLlrUbnxgWbHTda6HZyHKpGeXKjPJBrg53j8DdgJpBFP7Ae
 HhaCO6KXabzkpuf7yK4a5tmjb+2rLVRgD/YrFpfh2tU8WkNTgLvXel2K8Zrv6zfOPoBhIYwniuq
 vww7R0r+L+qVb0I9o8KOqNCosebNWTJE9wTLE7XNYmbFlp5TWG+YTUAnsO/c6UPDfbIQAGBi+IM
 T6LSDRdKNNZCktny19epXvGnKDR7PpK9Wx6YKscHlDA0FO3oX5u9o2cyp+unl6NLuzeSugwbd2b
 TMAh2KyHSHgqKgzFT+rnXdP9zg8gTQ==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: DVrKv6omnM1KE2TrSmGOItCWNcNrLNSJ
X-Proofpoint-ORIG-GUID: DVrKv6omnM1KE2TrSmGOItCWNcNrLNSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511020154

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry

