Return-Path: <linux-renesas-soc+bounces-20221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0597EB20549
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 12:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B00DA422E12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 10:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13A52356C9;
	Mon, 11 Aug 2025 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWvBRDlF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD6422E402
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907999; cv=none; b=Z2XIbdt3fme3qAblGS8vlxI0gGQQHEXFuhLqTd2eKw0ZdgEIytQIzSM5HFFoxapRKrw9quym2yUFqMNYEIxoFLa4laVHT9GrjUpN5qxjFC35v/PEJQdT2ZD+Sl4ul8V/WteDbyD+w9P4csI2XDkA2pAm/kZ/mAvIavzMU4UtQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907999; c=relaxed/simple;
	bh=iL4TDSQgL3Bbu/0mgzsxzafVNRhS2cEI44d3kZHxXb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6h2TkCFCVFag7ToLgfiThKYjELEbjHub1T2NrvSI0armBwKA99fpHZyiG+kiyMpCgVGAU1MAsqrIuRGbQe82GsDieRT5K1Gorc7zOkZFkp2aaoX34DT2c76QEoxd1HkQvrlTMjACYxNR8LRogvPFKC/Wjb69kLpr0bqn4RkarQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWvBRDlF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBcY013107
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4tDhgxFTFm32rKj8OsdQCqN
	y65/pv1+di1cZhSEdpw=; b=pWvBRDlFziWWj5HuLW6H45HJTcZttvz9ESkLk0uM
	NtbaIchPIMRUyLPnyIR695bRbOQWNCjwWRwgAk98kCYBnBk2qh5jQ9es6go3Dgpg
	SX0ssCGAI/alg9bRIIxq88G2InB6hzr1moD5U2QhV8hcyL7P2ZOnVtuws4dAJudD
	P4Vl5Qf8a60HnW3Xrnv7Nj+bn70KreoYJvyxCBy2nKp1EHBjp1VEjRzZoYaV7NRR
	wr8dg/RegWDNJIexQISYO07Ju5oRebJOEov79b/yNy4tD2rXH16OGqiewyhKLbnP
	XhaGft8cga81AclHPne3cWxWUUNOydlCvoPt9MBVsTVZ1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm4u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:26:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b061ad3cc0so132744821cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 03:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907995; x=1755512795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4tDhgxFTFm32rKj8OsdQCqNy65/pv1+di1cZhSEdpw=;
        b=rD2tS6fXgyz0VwTaFbrmh3fnY902DaG7/jRCtBpAdWZrAyf/dJUqpDEJqHUoUtXHxI
         tcDdcs16XVFOrylJXh2LtLkCRaQDCF/eeOpHO7vhXeOR1hPCamKM/DtxpEyr+bS1+i9r
         wSVgnZBQ11aOoQCklN02fYLyp5EK5JXv6h7EmIVxBxZNI3GuBvb6EsOOCLgWKHdcecRi
         k6WVoU5YaoWhzFb4BPoaVf+DSf3M1HDWKtMr8NC0x9bZ3k36AMPiRcpDqcF42KrANFhQ
         epnhY+TfpNJhkLOTkMxJ4aJlFNLLo3NTc7PGSoBpD6BfXIy96y3ztItAlEHhz1w0ccN5
         K3wg==
X-Forwarded-Encrypted: i=1; AJvYcCWf1AS194Tmyz6MgU20cWgl+wFOxedy9DaNuz3FaDLI5Tx4MRt0/ktNaFrf8h+oA+SExPEj+N20+0wxHhKfOC/sVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMvEV8uSBmQtcLWrioYbSGZXRsgtA0IconKpoQa5ll/V1zT1u
	ovIgkZFJ3PCY9MEXWRHi6g0CwNjkbI8ECQfFoRGH0TgGVZ66WSrq7MJe6s05MxDQS3zo10Oq4SG
	JReYUeoqCcYSJyXYqEKIjyBaaPiyMzhiUQbOR/zTPvNhi8NeX9mgR8d7XDYkVGXJeE69JVqvKwg
	==
X-Gm-Gg: ASbGncvaNoWsO8k+iyqA6kHKOQ3PpAQNAJzj+v03ZIpudwTTYQnx/i+PO7B3Ca9Hhgr
	ms7EtUOI10juSQbCd8/JVjk+eSSn1mDKrLek2wVpkwWWXY/hsV9nngjoAxng46SBB/iCQugQi8r
	xOiTlkXhmaC5JC4RjX1thecMMlEwFpmZhGHTWPi82t3N+5kbbMJkPZGEJ/7f8xbjIaahd8zSOCy
	WGh6e6uTBh2F3NLl5bma3xfsG9e7PQNDwA3T5YIEbEO1cQ+0bHFMuQducGScIUTgcFHmiw1/ka7
	RK1GNUa+qm9EBiGCX6FW31gZH6UvpbrBTbaJBofhu19kMgTicEe5SJYmhHs1Imi7ti9UYtNmKfh
	C2xOfFlccYOTCmaBnahpWMNxsGCVGSMT/rlFRDEeAL+ZqogkY0JzL
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id d75a77b69052e-4b0aec9df57mr160251961cf.26.1754907995171;
        Mon, 11 Aug 2025 03:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtZfXQ4QunBGnECg8IgNPTThfg2oORkBUD9GYQsf+7kkjIYq2XXmXZ3mbOFg4UkIpF+IRdA==
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id d75a77b69052e-4b0aec9df57mr160250851cf.26.1754907993170;
        Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fef31sm41894971fa.70.2025.08.11.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:26:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:26:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
        arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
        harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
        liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, robin.clark@oss.qualcomm.com,
        abhinav.kumar@linux.dev, tzimmermann@suse.de,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org,
        laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
        dave.stevenson@raspberrypi.com,
        tomi.valkeinen+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new
 drm_writeback_connector
Message-ID: <ag34es6qm4b22qti4hbsju6sk5ny7ixq5fiwtni22vf7tvx5ba@ficntlx6i2hs>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-9-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-9-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c55c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=Fxrl8DOH8qgm06HfJ5gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 8tVCJ1EZiVDqSBKIfgIR18PXMP9GqZzm
X-Proofpoint-ORIG-GUID: 8tVCJ1EZiVDqSBKIfgIR18PXMP9GqZzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX4z8WZp4pVCN8
 iLdJzYjiOLovos3XQt9pftPo+l1ysGPPkvtASqnxcElN72RorTvCPB3OOiT2JuwYnLfbz3Q1kI/
 JScqKO4Pe6dFCmgbDpccMzLP9ur8SwsLd5Cnsb9V7Qz+VCi3mOVluATh3KV+4nJnQnr+QlyBH8G
 FGpvEsrU6zyPrxOuuUoPZ3o6qTlJVjv72AJjXMfR3pTrdlFoozgg7wI50U/d71QzUOrqOnnp0XX
 N+kok3WI3mZPUK1zMiB8Xm8C0zWUELNFW7oFyxT3pTHLTCgTDjCALW/lCBoIlV8yMnLO5N+Rd2k
 JF78qQh6gYbf/OWfajw8VSk+I82fyTMr/G6F8ttpBif9+Vqsh0G82DXOHPyGQp9WfqyAWDoE+A5
 c8OuP3Cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

On Mon, Aug 11, 2025 at 02:57:07PM +0530, Suraj Kandpal wrote:
> Now that drm_writeback_connector is embedded with the drm_connector
> adapt the dpu writeback functionality to this changes. This
> includes changing the drm_writeback_connector to be changed to
> drm_connector within the dpu_wb_connector.
> Some other changes are done which are a result of the all the above
> changes mentioned.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    | 16 +++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h    |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 56a5b596554d..0e60c1ac07c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -484,7 +484,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
>  		return;
>  	}
>  
> -	drm_conn = &wb_enc->wb_conn->base;
> +	drm_conn =
> +		container_of(wb_enc->wb_conn, struct drm_connector, writeback);

Just store drm_connector in dpu_encoder_phys_wb instead of
drm_writeback_connector.

>  	state = drm_conn->state;
>  
>  	if (wb_enc->wb_conn && wb_enc->wb_job)

-- 
With best wishes
Dmitry

