Return-Path: <linux-renesas-soc+bounces-21732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84964B51BAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 17:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E477C164C30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 15:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8405C266B6F;
	Wed, 10 Sep 2025 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2pY150G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C53264A77
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518332; cv=none; b=pmPS+Iilp+gEqKkfq6d+/UTOfOFxrnA61KGk0S3Df0UDuuZ8v+oT3hm+cbWzm9XLDoZwRiOzxJslI4/BFGO9uPaVzaRWavU1iQChtSQS+zFUlx6tLGT1ap6Bqy7CCtlAGHkPlNTm6p/+5T9zEty7LMACVTgF2DoCNSOZsYyc+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518332; c=relaxed/simple;
	bh=zn+FezcoQjEvAuqGoQ0Hu665to340n3YdnAAVV8K+DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBiIRqXfNJnZ9Xrr1bvuBVbIuvm76PmYuKoPSnbLFhU/QU5BsjRJTMC6U+8hLbgEHSqoZiliBcrzVRwm6XgvtLzkRQICdNFTIyKzmx/PUQTVqKBmUZbobsjdnUUGOMpTyS6WXIZaVuk4jPNoJzt+Em6E1Iq5P5KayU95s5BwiDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2pY150G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgVIb022248
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 15:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lQ+oYNt3WeGVVFIvjUy2y179TQJ656VsJ9sQPc6/zk=; b=M2pY150GjX/MSr10
	fpKXKUJ2RfzoEJUzI0bN215ZKEEThP+l6mwDM2zm4KRQmk0tajMRxKFtVQOaFNeq
	E7S8iEMvI4FtNwQiFT+CI4qUA0Qp70FydLHo59IBo9hCSbW7S2G/ZG9No3ZHTexz
	y/e7UlJfecgIM2DI9nHCN+gNW6VlNXVr4DggN8GHi+dk5KxgsoGLS/OAjNpAv5K7
	1MneM6hxiK+mZqJ0qBuJtZD5RMnfTA/aKXNcf+hfB94psLdYHFTOW2iqvZfTuZXv
	4Ty7jAkSyYixwaW+Eayn5GyxoFe350q/obHdJKocIJkKCv1d1i0wfkq1DcIhRKEb
	X0KmtQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t380s9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 15:32:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5448b533d2dso3470328e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 08:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757518329; x=1758123129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lQ+oYNt3WeGVVFIvjUy2y179TQJ656VsJ9sQPc6/zk=;
        b=ch0qKuAEaafI0MqmQt7nLtPLsiGcleZqxMhgA+S/mvatUTe0bo5KcxvlByG35oV8C0
         ibJjxSz4UgK2ptiCFCco2cvv+wwSk0XPZocp6SJNkPk3Tled4lJTr57nweqHOdu4dSmd
         4aj0Bxr6+bGPEU2hiWv8plw9fob7nKXn0RTQP+YDZXjV3Z53iX8nCAnMTqO8vUMhVk0c
         yh8fea//XqtmeNeAx2J04YH9bUseVHpWZjWAiP77fHUhCHyf3cCSqlilJk81pvYi8uBR
         JgfPBHSb62cvbZmqw8ODa4qlbxaR0mXT5BqS1MPCAGUUntO2w9Do6+3uc8uezfentO4b
         daBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe7z39yVwcK15Byln9SN1M8eGFK0HgNKC9tMnip5dStxWnZnFQfKjsEzfoOyDPvN1CZtzvwvOoUuGFOXKpcNP0vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQqk7CaKUItMvzdud5sVdH4wZ7lNoc2xsuBeLkEKl1wfz1Yasi
	lEoYCK3OuVoiddxokj0eZ9GCy3jENkO3jPmChPhp6hFGj1MT4Grtr8GOfm6z81PRJPVHaXNYcBS
	1TBeSWyIpCL/EWNwOMA373QhFffd3fbb3sVTXBikp5x+0Jih4hv70kgP0dXJaSBqBbYDaQgmIJg
	==
X-Gm-Gg: ASbGncsFcevf6DxjMqha8I1nQKgw1SUmfJJeCnzifNID/uNea/Air4tZ5mRsGRDxc6B
	CnZAQByKCg5N8tPSdDv1TbiwDPUCXemJMEBY+FZAStllgZeXWC4Ruv16ZqzCEbxGSbyZS+QXCVp
	f41IQtpKBGjLS0bPyuBtRvrektvaRhgU6ZFCkJOoK0Uk7XAvqb42ZBXEsfjR9HgBJqm8xzd/TZR
	2Ao5tihwdPzc9Ts25Vula6bxRo/ziMw6QV9r5F1OwNLO2eIO7oJj3yVHyWs0oILQY5qVDItV+SG
	MI2UVBVNWnOSx734hEKshs8kv8kxUhm1Etz0FK7NA4JjyuB9pcP4DRUsRJsq6JvSMKVPVZl09VL
	sxrszPUQYHUo/pWZpBr0F063gdsxLgXyBceV6UursODhW6XSslpyj
X-Received: by 2002:a05:6122:250d:b0:543:e955:d5fa with SMTP id 71dfb90a1353d-5471d655e55mr4220440e0c.0.1757518328362;
        Wed, 10 Sep 2025 08:32:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/UH50wdrBGFR5Q3r5dgsOMEP45qmCh9JfN+fdHiiP/fiLQJRmv2nniCeeSVJR551+wmA8jQ==
X-Received: by 2002:a05:6122:250d:b0:543:e955:d5fa with SMTP id 71dfb90a1353d-5471d655e55mr4220207e0c.0.1757518326248;
        Wed, 10 Sep 2025 08:32:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50328fcsm44301751fa.40.2025.09.10.08.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:32:04 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:32:02 +0300
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
Message-ID: <elql7sqecqlik7shmgvpgnghgapzp5oe4mf4vlklx4ml6z5664@f5mw6g4fvjff>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
 <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
 <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
 <654e04e3-d80e-4d34-a1a0-21f66d43875b@wanadoo.fr>
 <75tzn4xg2k2zxdqko4b3xsplbtnolhrxzbowisdqogoo2qhfkl@szr3ar5dg5zd>
 <ae40f623-4cfc-4a49-9eed-affb08efdfd1@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae40f623-4cfc-4a49-9eed-affb08efdfd1@wanadoo.fr>
X-Proofpoint-ORIG-GUID: sAJUIbXSFSH7GrzRPnW2YzBKDjzB9G1z
X-Proofpoint-GUID: sAJUIbXSFSH7GrzRPnW2YzBKDjzB9G1z
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c199fa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=TSbVqHtbAAAA:8
 a=AbdpToo3CINEX3bgUq4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NJcUIoPEKLAEIzHnl83t:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXyDQIZqpi67kg
 962Sflsh8IyenMtGxY9cnP1F2LTkZteK19L2A5oVo9aUqt9acd3dAEah+CgR/85iVQ7uHZPfRty
 ib593p+LHePONiTyReyjvtjmHsFg15OMgxYINj9EavyBZ7fMOqov70hrbhrdFj/g35m8HdsqVdm
 jbDQypWn9sDqYR3MnYV+1qZ3K/HJTBYsE55EQlKUhPalyLQOkHA8u17uVcvJsPWM2MaQuDH6tvL
 oPuMPyAStOPYgGm+R/bK0+4PV1deiKsbbU9c4koBH7KwCNMFcvOVk9b7w5eteCFrs4aCf6M/4/r
 2pCxxVDbjc4zIcnLwKm65Me0SFAqD3T0ZhihC2MYjpdKAi9hWBcZgeEW1roCPIgHcrcMiZlr2Sb
 4XYHV8XH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Wed, Sep 10, 2025 at 07:32:51AM +0200, Christophe JAILLET wrote:
> Le 10/09/2025 à 05:47, Dmitry Baryshkov a écrit :
> > On Mon, Sep 08, 2025 at 11:38:44PM +0200, Christophe JAILLET wrote:
> > > Le 08/09/2025 à 23:26, Dmitry Baryshkov a écrit :
> > > > On Mon, Sep 08, 2025 at 11:09:07PM +0200, Christophe JAILLET wrote:
> > > > > Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
> > > > > > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > > > > > drmm_writeback_connector_init() in order to initialize writeback
> > > > > > connector instance.
> > > > > > 
> > > > > > Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
> > > > > >     1 file changed, 3 insertions(+), 7 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > > > index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > > > @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> > > > > >     static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> > > > > >     	.reset = drm_atomic_helper_connector_reset,
> > > > > >     	.fill_modes = drm_helper_probe_single_connector_modes,
> > > > > > -	.destroy = drm_connector_cleanup,
> > > > > >     	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > > > >     	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > > > >     };
> > > > > > @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> > > > > >     	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> > > > > > -	/* DPU initializes the encoder and sets it up completely for writeback
> > > > > > -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> > > > > > -	 * to initialize the writeback connector
> > > > > > -	 */
> > > > > > -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> > > > > > -			&dpu_wb_conn_funcs, format_list, num_formats);
> > > > > > +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> > > > > > +					   &dpu_wb_conn_funcs, enc,
> > > > > > +					   format_list, num_formats);
> > > > > >     	if (!rc)
> > > > > >     		dpu_wb_conn->wb_enc = enc;
> > > > > > 
> > > > > 
> > > > > dpu_wb_conn is allocated a few lines above using devm_kzalloc().
> > > > 
> > > > That's a valid point, thanks!
> > > 
> > > I've not analyzed in details all the patches of the serie, but at least
> > > patch 2/8 and 6/8 seems to have the same pattern.
> > 
> > Not quite, 2/8 and 6/8 use drmm_kzalloc(), it is fine to be used with
> > drmm_writeback_connector_init(). This one is indeed incorrect.
> > 
> 
> Hmm, for patch 2/8, I looked at the source, not what was changes by your
> patch... Sorry. :(
> 
> For 6/8, I agree with you.
> 
> For patch 1/8, I think there is a issue too, becasue of [1], IIUC.

There is a different issue then. It's a memory leak inside the AMD
driver (since the memory for WB connector will not be kfree()'d by
anything).

> 
> CJ
> 
> 
> [1]: https://elixir.bootlin.com/linux/v6.17-rc5/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L5257
> 
> > > 
> > > CJ
> > > 
> > > > 
> > > > > 
> > > > > Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.
> > > > > 
> > > > > Is it correct here?
> > > > > If the explanation at [1] is correct, then &dpu_wb_conn->base would point to
> > > > > some released memory, IIUC.
> > > > > 
> > > > > 
> > > > > just my 2c.
> > > > > 
> > > > > CJ
> > > > > 
> > > > > [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

