Return-Path: <linux-renesas-soc+bounces-20219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A8EB204FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 12:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C93F47A2012
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 10:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F416C2253EF;
	Mon, 11 Aug 2025 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDwP+B0O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFC22422E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907221; cv=none; b=KS6VPx5RBxAdl3OHVoLzhPRwJQ6m1UIsuH7sytH1jT6gVxpltqgQ/DWC9TMNWy2vOHoQDbw4U2HeJukM0lz/d0ajHguGtTYZMx0u9gz21IuPYxYcwlKYp0uJIwt6IKgIQpAmbbucDGwyWDAWZwP/yuXUwZMHE2m+x/UaWgaAGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907221; c=relaxed/simple;
	bh=l9bwAwp+otURd9HsCSu4lr2vMqpgTZAdByA4pdGWXJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOhV4PAbRFRiUc+SAQPSbQ/tWJqyY/3SlPowfowAQPaH7nnv3sMEU0oMIoWyEpJaXgfn5kVR0X5aNqoj48RtuYH1d1TX4tSZilkluTp+jMLkAGYPCCyQ3FcpKnQAQMaj8jI9mJXY4Pgutl11sh8OoSnEHkreL/d575EvTF4QPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDwP+B0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dEZl007682
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=; b=FDwP+B0OX5UBuh1A
	yaBnSgBA4PZ6KYN6UyxgXDpyNLwikqLtNO6NVZchMnFrdq1fHAr9zI3JLW/AKlB5
	nxIdKbXb87PbAZ2UiPni3kloNPTITgFmGv6lF1CH2AdwpxGy6DNhc7/lMRaa26ok
	AXFCp45EK0v4y/nT5fwiGnPWYU5wcC6mTKy1VYu3ol63+TOPdiuiJhcv9r7YqKYs
	RQyuqXukejuJ37d/tRE8V2Cn/2VVJ0n0OTxLwyvmy5rBgwi3p4b6oJM3S+Eqe5Zd
	9GSCTxs/jeBsJi5cJ0uWNqxOvHZKxGtVOz3gUSCF+MmelO9zM2JtUXFL9SlErhyO
	3BHiYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm60m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:13:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70739ef4ab4so95115376d6.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 03:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907218; x=1755512018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=;
        b=agc3a49+REgNZQRnryZ/6wvDv1KeYySOpHDaaXDZypZtBUFocHFeAkekmqrGHHBfm3
         FU7Xbg92QcdTNFy0d3v/ctTayLhnxm2tpR46oYv9wLhs0cE/n3LnxYQDMpxFDBS36mXp
         CkdKKE67aGbQjc7tnlJfmbYg8ZTQ5j548txdDuFg15PFBhZwimQvwVBcZlq1jHRwczjp
         yZ6+tJiiDS7tCSwnrKhRi56ZI4i476f18620pJU86mdza7wraUdT2JdSdVPKBDgJXale
         2apjn5xPcswfszr04O+QB7oz2fkMH8mvUPQavfI8yXOpt8QhPihnGlyW8VuTwmpsnr21
         YH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUt4a1sBcdslEXkcQCzqzev3YTwTa6jgLXr8/c+Toqlupacqps5f3BuE5zpjlusPKgqa0s99hdTzwqHwZ8nh6m77A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp9EEz345BH/14XYneleZkHLkX5hZoxAmrFRQHwvO5bWAwOCyH
	SS96USOswzzW+OJv3atC7UJM31BB5CejL1cGZUtyka6Q7D5slipcuuuvGOX4mvj1clZFXNbY0WU
	xZotejEp6u2V3VXv5B67XRPwhfDv7QSd1+iSWXWfIF8FNZf6pOSbGljOBOgyh7LTgnrYiXTUVGg
	==
X-Gm-Gg: ASbGncvZrdfp4rnMYQJWpLNBnwGuG469F0ANRXJvEzWkrifnU2yyshBVVFvZNqvx45e
	1Z0q2w3P2/klgHCtOiD+3SwHFZST18knH69aEAzG/dfyrddOlgjkSajaJSD3kNHqzC7sERF1/u1
	F4X/Ruk4xBta4N3MGZHfjoS68E2yxbvA39s9GGc6iJ3wxBhh8JCdlTW5PE6x79LTo7ZFdPvktCv
	JcQOGrH+9QrZH+3KDxCLvdL436IRJEgDkmQLWroz4gKm7lnAyNEPJja/N3zisIZDsLJXztrqqDr
	bQHhMKz13HhH8JMi80vISQGQN0G6GJP4X3I9UJ7vyRpIC3Y7SaAOMHvr1i8fhxYyxTfBwurpCnY
	EUv3jo4C4DCszqLCKeTkKyoDMmS4HFwcs83QE6TsUxdRECKXag7Yi
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id 6a1803df08f44-7098943a0camr242700226d6.21.1754907218055;
        Mon, 11 Aug 2025 03:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BY/zT1y+b3ji4GZxhC3ZVhQrv/r/mWPNZE1y3jpndTSli2Cjg/bMQSHGPbSf9yhMaetFWQ==
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id 6a1803df08f44-7098943a0camr242699906d6.21.1754907217606;
        Mon, 11 Aug 2025 03:13:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a905fsm41770471fa.21.2025.08.11.03.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:13:36 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:13:34 +0300
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
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <gvshpndrbnojzwewwa3icd5fjwecqj57jj6gfgoips5xq2oo3l@3dsebzcjwr7t>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811092707.3986802-2-suraj.kandpal@intel.com>
X-Proofpoint-GUID: baDV3fopHmjUwGD5PvOoHdfiEFDoRtJT
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c253 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=JhAXgKmwuo5aGy_CkLIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX66uo6+BfDrCs
 iO/587D85FEEWJs8lnqFn4PQ6fKYWGG7At0XDGKamt9ien0JG3m0UYfAh+mQICxa8Ygw3PX58zE
 nVxXH3mu7URdJ+A7/0P5Gfjb2T8m08YXjPzAs37ztIrJ1ji4+Zi4fsCH5UKucpGM9MMlGrS4Ca6
 bur2MjoFQhawVzG9W5AThnHm4MCh1ry5tyqgOlB62FT2zACt6jPeQyGIKbiHgPyhLzVgjBbEDrn
 hnJOqYx3B4XBlXLdefa5xmRQVRoDmGJ7RY2zn8XoP4kWA/eHQDJ2BdgjD2IfnIzoa5kJc6UcQMD
 ZcFN/ra37hrkP1s3QIQVj0O+mxIEMOQMAwKOkIBeeWmqYulgCW6cW2KM2GD3iMLYn4eRmmikcsC
 2Ud9egmS
X-Proofpoint-ORIG-GUID: baDV3fopHmjUwGD5PvOoHdfiEFDoRtJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not.
> To solve this we move the drm_writeback_connector within the
> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We do all other required
> modifications that come with these changes along with addition
> of new function which returns the drm_connector when
> drm_writeback_connector is present.
> All drivers will be expected to allocate the drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
>  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
>  include/drm/drm_writeback.h     | 68 ++++-----------------------------
>  3 files changed, 89 insertions(+), 72 deletions(-)

This patch breaks building of drivers:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c: In function ‘dpu_encoder_phys_wb_prepare_for_kickoff’:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:487:36: error: ‘struct drm_writeback_connector’ has no member named ‘base’
  487 |         drm_conn = &wb_enc->wb_conn->base;
      |                                    ^~

Please perform step-by-step modifications, making sure that on each
step all the drivers can be built and function as expected.

> 
> @@ -2305,6 +2360,11 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +
> +	/**
> +	 * @writeback: Writeback related valriables.
> +	 */
> +	struct drm_writeback_connector writeback;

I will respond to this in another thread.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry

