Return-Path: <linux-renesas-soc+bounces-21589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C7AB49C3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 23:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEFB2161543
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 21:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8012E0930;
	Mon,  8 Sep 2025 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EuL3nvZl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E474A06;
	Mon,  8 Sep 2025 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757367534; cv=none; b=SN37bw6afrJWyVWetrQDX7w8q3YuXRRYlfbk6BjHCdH3qTl+wy4AhM4RMv8mV9rJ5f8wfwd3U5g0kjVo4Xl2H98NQf/sixPWy5MORcGuW5IvgxRMa/gu/P8CDyiLBo24AmmdVebhnTr5GW6Lr0lA5c+wRFmXnWcz8yIX+xNtmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757367534; c=relaxed/simple;
	bh=5wip6Wi608nkTbbnCuqYOKj0JUxtkUxkkDDxAmnQ8co=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=VgPZQ+cxnCkOclYKSXuFFpoFv3NFVBrUT41IfpaUWxVi82MkxvCnSOjLD04pubBa1DeWv3SGtyycOSoMZJBIG3r7z+aeq87rvmJK28ONBOa5bsCdABv9+G1eH3ULTuCtYVFXm6EekLn5PaJw3Nou82DTRSFfU2xYbBPVMPtZSzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=EuL3nvZl; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id vjZUuwZo77bJuvjZUu09ve; Mon, 08 Sep 2025 23:38:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1757367529;
	bh=h4av4AkOPefvQ42cLPAkL558uLSME7KZfPP2jR/Ms9E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=EuL3nvZlaeqSg2q9WrMm2feJpqBtN5wnQ4ut3G1WTfP8xuTbHUfUUz1DCbQ2onYLy
	 tHo+ItPYPAR73AILXsmWUEWoJNO2Wz9qfNeIlkthINnx6oZuj2Gnj3Mf+gcz7pK/ka
	 NEgqYYA4UDwVEaijFi4hZeYmLDBGmTRElWyJ734Q8sgdSFaoszzFvRTcdSuOM0J6/g
	 YndS6bPdiNCgD8Yo8YOrWNlwtveZswrVdjouwNcUvRvjeZxnabaliwbrjbEIafThZq
	 BXqZE7PzvizKqCq6mfoKbzkm/A6Ufd5rBXDdFuN6I7woneXcDpmQpkAwuts+8ik4l9
	 Jad78FPQRzjng==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 08 Sep 2025 23:38:49 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <654e04e3-d80e-4d34-a1a0-21f66d43875b@wanadoo.fr>
Date: Mon, 8 Sep 2025 23:38:44 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
 <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
 <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, geert+renesas@glider.be,
 harry.wentland@amd.com, jani.nikula@linux.intel.com,
 jessica.zhang@oss.qualcomm.com, kernel-list@raspberrypi.com,
 kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 liviu.dudau@arm.com, louis.chauvet@bootlin.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com,
 marijn.suijten@somainline.org, mcanal@igalia.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, suraj.kandpal@intel.com,
 tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de
In-Reply-To: <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/09/2025 à 23:26, Dmitry Baryshkov a écrit :
> On Mon, Sep 08, 2025 at 11:09:07PM +0200, Christophe JAILLET wrote:
>> Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
>>> Use drmm_plain_encoder_alloc() to allocate simple encoder and
>>> drmm_writeback_connector_init() in order to initialize writeback
>>> connector instance.
>>>
>>> Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>> Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>> Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
>>>    1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>>> @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>>>    static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>>>    	.reset = drm_atomic_helper_connector_reset,
>>>    	.fill_modes = drm_helper_probe_single_connector_modes,
>>> -	.destroy = drm_connector_cleanup,
>>>    	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>>>    	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>>    };
>>> @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>>>    	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
>>> -	/* DPU initializes the encoder and sets it up completely for writeback
>>> -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
>>> -	 * to initialize the writeback connector
>>> -	 */
>>> -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
>>> -			&dpu_wb_conn_funcs, format_list, num_formats);
>>> +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
>>> +					   &dpu_wb_conn_funcs, enc,
>>> +					   format_list, num_formats);
>>>    	if (!rc)
>>>    		dpu_wb_conn->wb_enc = enc;
>>>
>>
>> dpu_wb_conn is allocated a few lines above using devm_kzalloc().
> 
> That's a valid point, thanks!

I've not analyzed in details all the patches of the serie, but at least 
patch 2/8 and 6/8 seems to have the same pattern.

CJ

> 
>>
>> Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.
>>
>> Is it correct here?
>> If the explanation at [1] is correct, then &dpu_wb_conn->base would point to
>> some released memory, IIUC.
>>
>>
>> just my 2c.
>>
>> CJ
>>
>> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
> 


