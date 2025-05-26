Return-Path: <linux-renesas-soc+bounces-17510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E83EAC4023
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 15:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1499C1887AB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 13:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B676143748;
	Mon, 26 May 2025 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fK0u3bzU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE012B2DA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265520; cv=none; b=sNhs3A+m5WiRhaOzwpwDhSHr4jpbvhKKv2XhyxFfn9Lhxj+qu3QbpqHCn9hO7UQTHY6P162+xzXVkMlhtnd2Jmn9ZHd80co3mAMPvozJwMSArSEgz2GFwqyfqbqe7FtyjuVNAQcdq/6YOCjQB0agIHc/HSdASV7yWSNaJed7eww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265520; c=relaxed/simple;
	bh=U2gFH1cjHXMN7FMnD/sxfp2UV4q1Y4u0wJRcj/antT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpCOPDZBqPJZPfazhrQIKvboRHE7fO65gb5p7YJOxA3IeRYeiAEHHIk22OH6rbF6mdSaCeL/B3klIENe2OEx/3IkElXA1Sx2ORSDm/pn9JLrTARYsNwjon1SI2gUBIyY0pzqQHCI9CPsXgpGSp12zyXLDSywXLb3f/Ro77h3kXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fK0u3bzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9bgQb005036
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtBoSI5pkOcGmROG/Wt4XFAAzw62w6oZmZMH++AO5Mw=; b=fK0u3bzUfir4NpTr
	OJpBdrB/blRwpVLOZO2pvBlf5seBmmJy7LR0vl+9ukiZ5QGitcb/lWBH+GrqTtrE
	42ri0uqUovGPmoJ+0AAyZECiLycUt8ItBxuM0a6yUikQD/rPuReyW11vxTKuIawH
	e+xPcB/5x9w6tWbdzkNYIe6yFJ1JDJTHApRlQXMcO35SLLsGP5vZCqoXkMdYKuXG
	CwhC1CUBMYcRoQW+Jo5I9MgQUGdB/CfpR9cfftN7sCKEShm1ESAEKfVKLxk9TfIz
	ELYD7/lSeWZJlj4dv5dIkEF3hhF0l+wBPIzfn/mR4x6ITXKkQny/KKDbPMjlmqDg
	v4CGgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc4aca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 13:18:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so239547585a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 06:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265516; x=1748870316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtBoSI5pkOcGmROG/Wt4XFAAzw62w6oZmZMH++AO5Mw=;
        b=xAzU2WL72MvzYDlfmGD+X9DM3dZCKFcv/1ptH0WmdJXL2AOlg9X+AVQOpaIiD6Nt7H
         25OSRIPXwHd+HZnwPAFCuwLvlePBMoOyow/VFo9Hc9AYBMbP3TPJpMI2Rc5yQSsIIxnR
         Ae4iJJ3gq/lMHH/H8Jv89v7f88Kg3ec5oTSxspyZTWQ/U+mbe7XZdNC8FCq20kuHkro3
         HvZp2K19y06LsyQk221hqRqPJW7HoSCrSn5CG7s5B9TdtFY1QfFtApW346ADO9ohFIDj
         0dmd4Sb00lTMBrDZ2GEWRTOtmwrRxcyKpq5dFjKuaSB3rI9By+CSvaxweGefyMMUcZ6/
         PXpw==
X-Forwarded-Encrypted: i=1; AJvYcCXoztDwYGIUtXvbmCXPQwsCoqSqGhrKcoHnczgaz8SlFW1PtoP6BV+JmQnGtlO/a3rMOQy4F8OpEqo5VHxYvZ3mOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jfGot6eE73K7onbVs8e198eLRodGVRhCwhRCO86lvrw9eMlp
	u8HjL43NUSy7fEK/ctk6k7ym0YLrtc8K6foO2RKfme4uD37Wuj4GySQ5PpMtYILs4j3V2Germ7Z
	io1cbk8UJfkGwlC9Fu2U5e5m28a/bSveGjrbVhtaw4T6+6dgXj0xHFeSiMdj8i2F0MPoAJvNbNg
	==
X-Gm-Gg: ASbGncvfQxMNs6A6izAAx9ReWK5nNq3CpdJQZ7QAMKnIOcoles7ZGaTnp9nB+ptkNHd
	59zFGytDoljTGbTwvxCkBzHjRSNxMt7zHfZ6+KYYplnHUcDPR9YPpaLvPvv23tuWCWO4YdKOPvz
	KZre2d/1sai28DcvFxxfFHDq4Esi/RQHnnl6jsl2sJJuUlvcXY0YqmTzX0yOKQdOATc8s4I+1Db
	P9pe8iaB+J52Xifl16wR1Pi1+xqBhY8cOYKzo8MmlM57aeacinT2V0GPiAHO7Urd+pYj4cHioGL
	Xxjihz0D+uEJfSq4LzBR2koKUDskZEX5wK4GV4kFRaprGLnpLVpa4/giXVw6QO8+9QFn0PKZhDh
	WQ1rRmEAE16eFcfgaT7VCidOvOj642A1e7gXlcqK3mEvRS0KUG9XErltZI9ym
X-Received: by 2002:a05:620a:414b:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7ceecb94895mr1451985285a.25.1748265516037;
        Mon, 26 May 2025 06:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhkpGoxOecW8RkH7bD+ONxhtwTxMfGSExXlOq+Ta+frS4ub+TLyyZANQDA+8PdVAF4xujgBg==
X-Received: by 2002:a05:620a:414b:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7ceecb94895mr1451977285a.25.1748265515362;
        Mon, 26 May 2025 06:18:35 -0700 (PDT)
Received: from ?IPV6:2001:14bb:670:af7:f46f:ffe7:e8d8:2aa? (2001-14bb-670-af7-f46f-ffe7-e8d8-2aa.rev.dnainternet.fi. [2001:14bb:670:af7:f46f:ffe7:e8d8:2aa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f16243sm5114836e87.14.2025.05.26.06.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:18:34 -0700 (PDT)
Message-ID: <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
Date: Mon, 26 May 2025 16:18:31 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Maxime Ripard <mripard@kernel.org>,
        Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
        biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Adam Ford <aford173@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
 <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Wo4VkUvGJrc1dQnWafGBlwKZab1owXh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDExMyBTYWx0ZWRfXyulFliaQUfq/
 ZNNRGeJzbwO/J61IDQ/D8L8GQC1WVvASCg5y180TKzO4M/YrtBJ7gjHEQ435YrQCSOOr9zctizR
 JRH3Qmsj35jMN2cY+SyxWdupJkW0US3gi2kqXyjIprITfh7htLY2pGU0epNJmYLS37YTM+l7P50
 JYSYyNETFT/jPQn2t0t+NNW7YvvoRN4q8kupnpfLjTXnBA81Rr7FXSVkHz/lHwHLCs6xuZy7Gyp
 9msOwA3eNsPnufI/fNQEK3ytnmwFpPn42xuo/XHFS3r77bNR3WazWcvyvYF/cHRmsq4PFvJfq6k
 QVBnLx/d3ZF3tcw3AIcoFi9h8QScuAXoVbdaNZTIn1hkoI3LWT/TJ8973iD3wqKxspFBjblBQTa
 1G5qEbFeMcQ0qwNkDh8z9nQFqfpxvtn3juJvudIVbAelxxuBaSbnk/qxdacsZmirCKethq4J
X-Proofpoint-ORIG-GUID: 3Wo4VkUvGJrc1dQnWafGBlwKZab1owXh
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=68346a2d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=6hqrR-QMLRjKKab7PtcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260113

On 26/05/2025 14:40, Maxime Ripard wrote:
> On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
>> Hi Laurent,
>> Thanks for your comment.
>>
>> On 26/05/25 12:49, Laurent Pinchart wrote:
>>> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
>>>> Hi Maxime,
>>>> Thanks for your comment.
>>>>
>>>> On 26/05/25 11:26, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>>>>>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>>>>>> native resolution is working when using modetest.
>>>>>>
>>>>>> This is caused by incorrect timings: adv7511_mode_set() must not be
>>>>>> merged into .atomic_enable().
>>>>>>
>>>>>> Move adv7511_mode_set() back to the .mode_set() callback in
>>>>>> drm_bridge_funcs to restore correct behavior.
>>>>>>
>>>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
>>>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>
>>>>> Explaining why, both in the commit log and the comments, would be nice.
>>>>> Because I can't think of any good reason it just can't work for that
>>>>> bridge.
>>>>
>>>> Sorry, let me clarify and share with you some details:
>>>>
>>>> adv7511_mode_set:
>>>>     - Is setting up timings registers for the DSI2HDMI bridge in our case
>>>>       we are using ADV7535 bridge.
>>>>
>>>> rzg2l_mipi_dsi_atomic_enable:
>>>>     - Is setting up the vclock for the DSI ip
>>>>
>>>> Testing new/old implementation a bit we found the following:
>>>>
>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
>>>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>
>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>>>>
>>>> Same result but different timing (in function call perspective):
>>>>
>>>>     - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
>>>>     - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()
>>>
>>> What is "old" and "new" here ? Is it before and after Dmitry's patch, or
>>> before and after yours ? Please be precise when describing problems.
>>
>> Sorry, you are completely right:
>>
>>   - old --> before Dmitry's patch
>>   - new --> after Dmitry's patch
>>
>>>
>>>> What do you think? Thanks in advance.
>>>
>>> You're only explaining above what the "old" and "new" behaviours are,
>>> and claiming one of them is causing an issue, but you're not explaining
>>> *why* it causes an issue. That's what your commit message is expected to
>>> detail.
>>>
>>
>> Thanks for the clarification! :)
>> I will send v2 explaining better this.
> 
> In particular, if the driver needs to have mode_set called before
> atomic_enable, you should say why moving the call to mode_set earlier in
> the function wouldn't work.

It might be the same thing as we had on PS8640: it had to be brought up 
before the host starts the DSI link, so that there is no clock input on 
the DSI clock lane.

-- 
With best wishes
Dmitry

