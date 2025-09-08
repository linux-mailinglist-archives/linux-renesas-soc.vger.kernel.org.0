Return-Path: <linux-renesas-soc+bounces-21588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6507B49BD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 23:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AEDE3A7E48
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 21:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5122DE200;
	Mon,  8 Sep 2025 21:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAseqLXb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781BB2D7DD4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Sep 2025 21:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757366775; cv=none; b=vEf6CHZQz3XebQp3XktMnPe7eiArWhyjGCORWTf3GW0IIV2cse9MA+/wLShTRe+nakBM3gJjn6eoMc7CdZx/8/rwxTXn8DhIauie8dvF9xZmF1PyeHoLHNt6zShypKjpSCR1/q3nj02ksmA9R+SORTJZhDdYCRYfR3+LcH7hT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757366775; c=relaxed/simple;
	bh=0lbkRKJGiZGYmEhFGcQuZh1MmsainvZ02xYuAR9vExU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPQjzpxkgsUYBdEFfFn+ts4Co7YFhsbnJjRnc9aI6/HcJ6ngEXgwOFSQM8h+RTpghQilF4oaofeFTcJycgihV6xUSEuoNvo34Q8OlAQ9FTEaUoeZALLZiLuJHJa/Kh14fWiT+DFv6Pmk6PZCGjwPE0NvE8bBvDAdPhsUs/BwOlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAseqLXb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Djwet004644
	for <linux-renesas-soc@vger.kernel.org>; Mon, 8 Sep 2025 21:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ew5MG2YGxdvZ9dDI+UbP3xwO3aQkZtMmI4KUi7ex/LA=; b=CAseqLXbWnbuNaiz
	Zyh/nK1vgXCiGOfJ30Tn2i1riKNUXgoanNcoGko9iHRPCkQXX7MdvlJp6/9utbr+
	XYtGh9jTpWE2BZGWpg74jNEqRNq8Vy12nJN1UCCSSCkU/7ydrqZXBiwr5R7OCSmp
	X98Fs3niw2FqSe2w7D4JFlD3REOnXMm5CH9DmBD257Zr5ZCTsmUUmcKXzoRh52RZ
	MRI/ybhx9O/oFKAcCNSpgG2G3jK9usimPivLMI/AHrk3mSRt/SjIWAkSHGRuJKYk
	ILQrU81jq4WLMcBEqDt8JJ0SWZICc3S0oYR541bk47T6Q497Zi+99WHJAKdsi1fB
	TtU2lw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37tf8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Sep 2025 21:26:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f112dafeso91568561cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Sep 2025 14:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757366772; x=1757971572;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ew5MG2YGxdvZ9dDI+UbP3xwO3aQkZtMmI4KUi7ex/LA=;
        b=dRSFLj7sd8pkAN4p8w24T2HaevqyBYb+kmTmUlvK/jBcoiANsr62d7K2CiOu8w+yth
         7c5KXoiAKGjpdrz/nNThzQM9/ugXVJaWqIQyuNfCQPitagde/8JiMNplS1/jS1HgeHbW
         aMdeSCk28sRWpFrLLmMM5tne3Ftci8etOqDVjweXBAxRYWBgQ2KLvsk/rcfBn+mLenl1
         z8r/QUfX9MPcPYRJsCUKBZoo7z2D+vaowyAPB5lKBsp8qvtyNsGVNO7Vy+T6dayZjDa8
         l6I0d9GlvSJzcfjHDi31CdIW2te6eOv9Pnwf7nBaA0ZKZPOpV1SRcZzjxt1hpGLxPahQ
         m+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWrV4jqSd795W2qpVp3+OVjQSpq5wFXkqdtIqIh+ftZYnAkYiYzeJ3Y7fzJoADVMcxc/MWtpSJGhF0SO0POd3nhew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2iutBwHKTl6Mup42E+xqeGykyHWdszFkSmyHPaliiDV3v1rE/
	cwOHP6y/Ygtjf7l+DDzFmso8tT1ifjs4so5dfD20cn4vhbiASQELoGW2daGK4VSms6zXsmgUsWd
	YXbz8IvGKo+QTvrdaaW6QvQie4ee+S9Vi3b25hnclEssk0v/Th6KIY35l5CcqdWD6PBmKanzb3w
	==
X-Gm-Gg: ASbGnctaRw01WLWjmk5VR4os7ugo2gUnY/07Dk9cJuF79IH9O7CzS8NxTb8FQ6Jofgm
	ZO9LWP6TwtLhpldUNxF+ExGIEBhho34r6kC8Bictw60pN9R9SiVnTsmwa0YKfdueTKBQZCpdtgZ
	1RvaZpkyBi0haYhojOiogIli8uhRgcSXZAU0QEaxJxxJAXZHezpqMa5UF01tQaIadHyQAOn5vk4
	ytkBUaBTqtv+lKsLszbCbKkfk6jQy+O7fdVaaCFCDtZys27ayMT0R+FVRbECFB56YHgf/6WhCfN
	50dcrAfNp1DuNItEUqHUZm+7YYvTjVgjRnCv22RtJZJvk/hGvYiM9sixYOHXX1Php07hwiBFoN7
	HrYXcj3wVmHoZ4M1cC7YPa4sLNdnixwi/utwEN7XuJUAPtLrwOuM5
X-Received: by 2002:a05:622a:24e:b0:4b3:6dc:afc7 with SMTP id d75a77b69052e-4b5f8589aebmr107253441cf.67.1757366771914;
        Mon, 08 Sep 2025 14:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqvSMdw2mnuWqudtOY9nHtMhpMBFO5TsecOKtwKK/b6W3wDjCyZDgaQNZbmDLC91j16XyVcg==
X-Received: by 2002:a05:622a:24e:b0:4b3:6dc:afc7 with SMTP id d75a77b69052e-4b5f8589aebmr107253151cf.67.1757366771278;
        Mon, 08 Sep 2025 14:26:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cfe2496sm38381e87.61.2025.09.08.14.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:26:10 -0700 (PDT)
Date: Tue, 9 Sep 2025 00:26:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, alexander.deucher@amd.com,
        amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
        dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, geert+renesas@glider.be,
        harry.wentland@amd.com, jani.nikula@linux.intel.com,
        jessica.zhang@oss.qualcomm.com, kernel-list@raspberrypi.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, liviu.dudau@arm.com,
        louis.chauvet@bootlin.com, lumag@kernel.org,
        maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com,
        marijn.suijten@somainline.org, mcanal@igalia.com, mripard@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
        siqueira@igalia.com, sunpeng.li@amd.com, suraj.kandpal@intel.com,
        tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
 <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
X-Proofpoint-ORIG-GUID: Te1SyZcdIivDvRdwBMMR6pw9HHAqOVbg
X-Proofpoint-GUID: Te1SyZcdIivDvRdwBMMR6pw9HHAqOVbg
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf49f5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=TSbVqHtbAAAA:8 a=ieunMBFP7PMWw6OMX0QA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=NJcUIoPEKLAEIzHnl83t:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXzeT+nLd+i2+Z
 s1fmZfkIm0A93zxbZCGDSDe+iXmPIE5kUEoloWGe0VNNBxcIv6RnPM8v5sv8K9Ih2TyDMpKPr9B
 zCHLYj52WoNOqeY3pIiONacdbHF/hW4O8bvRKcOhUgKZ/B/3lo0a+wb53xlZFZpRAm6QsmYXj0Z
 cHK6PMXoY9Bbs3umxVo9I0gFpIf8k3ujx8FBLQUAfKpJ/BqTQRc68ooW608CeuPYAZvf+qXTPHZ
 6R7omzlH+DkceZ+O4Kt7Udd7rXfvpBpNK+09ni8HBAl1n/x06RzIgKQeLuzvOoYFHp/7V23vJyr
 IP6NVheo2WvJsEDAyR7Gl3CMFpp5tXzyszFAqO6IGePmm3bGaWX6y5++W7h71hhH92Burf9yh8G
 jRWQLmHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Mon, Sep 08, 2025 at 11:09:07PM +0200, Christophe JAILLET wrote:
> Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
> > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > drmm_writeback_connector_init() in order to initialize writeback
> > connector instance.
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> > Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw@public.gmane.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw@public.gmane.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
> >   1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> >   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> >   	.reset = drm_atomic_helper_connector_reset,
> >   	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> >   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> >   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> >   };
> > @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> >   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> > -	/* DPU initializes the encoder and sets it up completely for writeback
> > -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> > -	 * to initialize the writeback connector
> > -	 */
> > -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> > -			&dpu_wb_conn_funcs, format_list, num_formats);
> > +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> > +					   &dpu_wb_conn_funcs, enc,
> > +					   format_list, num_formats);
> >   	if (!rc)
> >   		dpu_wb_conn->wb_enc = enc;
> > 
> 
> dpu_wb_conn is allocated a few lines above using devm_kzalloc().

That's a valid point, thanks!

> 
> Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.
> 
> Is it correct here?
> If the explanation at [1] is correct, then &dpu_wb_conn->base would point to
> some released memory, IIUC.
> 
> 
> just my 2c.
> 
> CJ
> 
> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753

-- 
With best wishes
Dmitry

