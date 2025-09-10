Return-Path: <linux-renesas-soc+bounces-21686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD767B50C6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 05:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A6ED466F36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 03:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB6426B0AE;
	Wed, 10 Sep 2025 03:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bO0ZFmIS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B270268C40
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 03:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757476072; cv=none; b=ZMOpA4DrdCc3FvWIQSSuamPRpdvjIpNEv8QELQqDnNNnmRvR4yPuRVDjrirPNpPDJGpVjSft7orhO76w6BHA76b8v9j6XrPs3L2OjAFUYS6ZJYlGk7BQYB4JD7tGrEZkl7rNrI187qj4gBrJlzZmiMcJiX3NeT5TmCtU18KWGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757476072; c=relaxed/simple;
	bh=KlZrz1pbD+u8w7WkB7tc0ktppzDB71qhCVPpVAstTvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7qzguQUahyNzgI5H+mvBXCjk1twbgoyFzVvclICsLL3PS12eL6/BVjz3vu3jy4GPzgZOTjqh5cWh4uZhx6/KU0VbUcFMOqQbAYMG0ddmoClI6WAy58H2jgMip2yKJQuIFyxVZirjECBEtY2Byzx7Bz8GOvtnSUs/eAGwcFgWsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bO0ZFmIS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HUkf2009097
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 03:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCNWr/PJnqEbKjEwmwT0GXBJuKsMc1dJPKa7LjJl8Cc=; b=bO0ZFmISrnVuDKrf
	yWEU/jW/fo1RofMz4p+NKil33EeiqO5YEkL2Nm+pr4KA+mKcoMs8pGZ+bmDUs76t
	JsfW9k/jxoJh6lrXqCu6vIqKKBTXpEg4ZmYxSOYlPswtM2F4CGbn+24b3gP0pRxL
	IVW924tkw6wBGw45ZQasAFGgN8Kbe/kNue7FqbN2UaqXyO24QLoM1mqUlRflIbCr
	vPY7nYzIopkorbyzPH/HzoQS9roVSPvWHnJaaSucI5uPasvRfoWqJEM8Wgpsa4Nh
	S+PKYBO8Au1dUrKJ92mAA637/pr3PiUKbUW7X9iRl5iFtquawHf3umuu0pKOQnqx
	3M9OsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdy9gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 03:47:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b60dd9634dso71263101cf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Sep 2025 20:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757476069; x=1758080869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCNWr/PJnqEbKjEwmwT0GXBJuKsMc1dJPKa7LjJl8Cc=;
        b=GuhS9Xp139vvxeGN2gGFtx4o1qSjAVrWSosHR5UD6GBFxoaLvIVpriOOQ8O89G5bGI
         c0llmm5JoNMxFll0lKbc04tBfEYJ9ZIgIf2Yx0Deu+7P1TqjMFFOWLBpfAUVgbnlHMh0
         7cOCEOJ/+PJc2+/f3rInDUT/uuM7FWrOWtPewULxXIsPELCggNNqKo/bJ01Fm0fOWcgS
         HZZDd45H96lohf7AQLhBPIkrZ5S/IA9qh9nkhcEBOAsf7G/k0ectq1rjrU7lKXHnbiFC
         0qVJ8EATB9E15OVSGL9n4nhNZH2vQksSkKoCqvhIu0mkB9eevcY80WY29ducvRzQWwPW
         RvNw==
X-Forwarded-Encrypted: i=1; AJvYcCUr6RXR43QLe85toOGVX6j+ueFBTrEaE5d5+mdXfvgjwmaPYBEQt60vCbL9tUPY+eda+YDQThU+tDGKi1S6UaW8PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/O6YEChH0u7o6aokTEljQh6jrvv+S5Ejj4mmdHKdltul7wL4o
	J2uU2K9x8VrNXAko12LS37GnKxNU8u27tQHewxZUSDLk2raRC+U7bNl9uDtrB+OxqTABnKNiv7q
	gECm9YUomR58+MZ+DqIu4Ckm6HlE3bPbaWldXb1SZrQNLCYzqyvX6uHGBJSgfq8onJpxaq8K+ng
	==
X-Gm-Gg: ASbGncs5+5rqEuOmTJgHR0VgOD9upYSmgEuXGq2/Jbz5MfbYH0x2H5g94y3uL8jprRc
	Kx2LDeNiwm+MpCs9wTWlbbqdLjUsHCMweI6Y2fWe6uujn3De6CA2Gw9L/+vYbdOr8miXUrxE5s7
	EgBZkiOpwNBIwu26kskMRRvZyDxgPrC1FCm0pV/nSNS3eF0K5S1pFRfaLUjDtUlVixaaNu2ffvb
	/I+pcHVFvJ3umZy6+pFL/pxOpoNkGg6vIp2iWCvzN6FBLOazKu2LibKDTTkITvVNxRoZwp1ix23
	oskC8kBLURuWQ3u2J6h3LBLK99X6BSP9bfgq3fP201rrCECBvN0rZwZwRQBMfuawbLXAeepTyRK
	UAy44MOoTlhEvuWeVG/KUzE73Stp8Woaf6iK/XNA5TJ8Lxp58vYZY
X-Received: by 2002:ac8:7fcf:0:b0:4b5:e8f4:3f51 with SMTP id d75a77b69052e-4b5f849015fmr159824881cf.70.1757476069017;
        Tue, 09 Sep 2025 20:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBudYc2wJoSz9sQAyJALk/PMOSPicrmz6rnXiONp/vs+u27Z5JjCV3Irks4nh10TLA3Cg8nA==
X-Received: by 2002:ac8:7fcf:0:b0:4b5:e8f4:3f51 with SMTP id d75a77b69052e-4b5f849015fmr159824381cf.70.1757476068434;
        Tue, 09 Sep 2025 20:47:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56817f5759asm960690e87.97.2025.09.09.20.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 20:47:47 -0700 (PDT)
Date: Wed, 10 Sep 2025 06:47:45 +0300
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
Message-ID: <75tzn4xg2k2zxdqko4b3xsplbtnolhrxzbowisdqogoo2qhfkl@szr3ar5dg5zd>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
 <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
 <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
 <654e04e3-d80e-4d34-a1a0-21f66d43875b@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <654e04e3-d80e-4d34-a1a0-21f66d43875b@wanadoo.fr>
X-Proofpoint-GUID: vXoilTjJPT_0edZ3IQeVRnpI9eMN8BQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX+7cP71j2Zbjo
 IPQW1zIKsblWWo9PIGZCOmvfwBAd/fWy++5pEgO2AtO0uX8dRWoMWJ6jx2CDgLTdWED/1DG+R8V
 w33U0+WXMJeblrkCbi8FAdxqpw3o5edldRrH8x8u8SoJT+j/Xi/BW20s6zU55BW8Th+N9y0Ptew
 9oE+bzWNDC9RR7l9xiK/U2g1QQL6EOkv5hWsI0lqVUKfeQrygIxYG2HgPNHQ+ruK8dzOJ75OQXc
 PsjTCWIGJ6/04cDWbzUVKlRy8LOn77plbGgm3Qs01nkm9gw9mu3mB2/njxJ2+mZLc0OhcDVu85I
 9RsRezY+UMunk7eK/ASQv30N32QWyTGEHT6Sgu1mUJ47Q67DPlxUXHulSb8Y2wXgevOyp9lGKWe
 ifjE3kkQ
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c0f4e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=TSbVqHtbAAAA:8 a=W6uVGjgryeCiZygU9GUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=NJcUIoPEKLAEIzHnl83t:22
X-Proofpoint-ORIG-GUID: vXoilTjJPT_0edZ3IQeVRnpI9eMN8BQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

On Mon, Sep 08, 2025 at 11:38:44PM +0200, Christophe JAILLET wrote:
> Le 08/09/2025 à 23:26, Dmitry Baryshkov a écrit :
> > On Mon, Sep 08, 2025 at 11:09:07PM +0200, Christophe JAILLET wrote:
> > > Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
> > > > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > > > drmm_writeback_connector_init() in order to initialize writeback
> > > > connector instance.
> > > > 
> > > > Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
> > > >    1 file changed, 3 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> > > >    static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> > > >    	.reset = drm_atomic_helper_connector_reset,
> > > >    	.fill_modes = drm_helper_probe_single_connector_modes,
> > > > -	.destroy = drm_connector_cleanup,
> > > >    	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > >    	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > >    };
> > > > @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> > > >    	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> > > > -	/* DPU initializes the encoder and sets it up completely for writeback
> > > > -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> > > > -	 * to initialize the writeback connector
> > > > -	 */
> > > > -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> > > > -			&dpu_wb_conn_funcs, format_list, num_formats);
> > > > +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> > > > +					   &dpu_wb_conn_funcs, enc,
> > > > +					   format_list, num_formats);
> > > >    	if (!rc)
> > > >    		dpu_wb_conn->wb_enc = enc;
> > > > 
> > > 
> > > dpu_wb_conn is allocated a few lines above using devm_kzalloc().
> > 
> > That's a valid point, thanks!
> 
> I've not analyzed in details all the patches of the serie, but at least
> patch 2/8 and 6/8 seems to have the same pattern.

Not quite, 2/8 and 6/8 use drmm_kzalloc(), it is fine to be used with
drmm_writeback_connector_init(). This one is indeed incorrect.

> 
> CJ
> 
> > 
> > > 
> > > Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.
> > > 
> > > Is it correct here?
> > > If the explanation at [1] is correct, then &dpu_wb_conn->base would point to
> > > some released memory, IIUC.
> > > 
> > > 
> > > just my 2c.
> > > 
> > > CJ
> > > 
> > > [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
> > 
> 

-- 
With best wishes
Dmitry

