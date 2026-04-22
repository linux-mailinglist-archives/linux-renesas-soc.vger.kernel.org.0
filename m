Return-Path: <linux-renesas-soc+bounces-31489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKE0BB2N6Gl/MQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 10:55:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 416EF443AE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 10:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33F6430131E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 08:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30343C0623;
	Wed, 22 Apr 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VXA8eOxG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73063B27EC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848144; cv=none; b=i1PIixpnDkIPF+8Qo7AdvYN7PhzByMUvZvjTjKIwxbCwhYK+Ly13H8uoH0a+P87zV+IJT2bWdku1v7/x0d/ybuj4ak2xf+ObjZFpiXfBoLUTmpKgiHpO4VOD9bS73KXG44p8Fu1onTdYD5zYC1wKXLo3ZDkU5BbT3D0GInm11Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848144; c=relaxed/simple;
	bh=0uvBMUOSwyAYA20cd5mCnPA8P6u+FM5mCCnYDev5/mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYdDMcMYABT+OGcJ52HO6CGbybs2/4PYH6HynbYsQUAijLU/yeHvppJiv5UWtuZ5XhtEf/2biYy9sTa+wo0YroM4Df8HMRN3D2FqSh2KC3GBRVoE38SM+/s32dU9WykNCUBywlQpzDdzWtqP+oAu666hyIvOTgSlQ1o+9AI8qqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VXA8eOxG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so3445061f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 01:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776848140; x=1777452940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uugn1Iy/EUw8QWPEjCkPMfHWiB+g/iglcdvhK7LYU78=;
        b=VXA8eOxG6ewEDz8BKGe3wv938EqC6LamL6FgVXiA1WcckdEvXdn+nEghWJxaxsnkZr
         huurGUfdDyG1scCnnQJdz/Zqik2JhPcPp2xxEvG7pBhfpeavOpVn8rLN9G+HUiYK8Lq5
         PXxXtF0TF7dMZU5WVHcCZFzyHYLtw552F1L/3CtR/CYoO0cz1qJc4dOUA0TT4BT7q5nS
         D1+AZ0cVGSOpgN24QlJMqEzXOOq5FuTvjbgLIQai9UEcB+HIFpUD3fFIJYklnp6iewJv
         etVEG5s6Ot4m5jnPDPMz7EmUS4FrIvJtoJnqRQV1A6ORIiF6Hb60d7Of3VDuROitlTM6
         skJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776848140; x=1777452940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uugn1Iy/EUw8QWPEjCkPMfHWiB+g/iglcdvhK7LYU78=;
        b=HO+gecu9tJ013CJQxPcE4rZZ/+8mfQWZnSaKE5/3KMuqHFf2Lmi2w3MYYKkQGjGsRD
         7+Q7xMogy5e2TVWUyK5IFzeK/oUhnj5Z1CUReSv10sWyUI3vzYD8OqXbiSA/29yaR7ik
         hJjqXLACl5QszQn7w4/Sq0zL6prurT1o2HhSUHG097PUWEzXxELg1qRIFOxcBh8GVrzd
         hLaGdQb5ITxqp2x4S1DPiwEXEfOfsDGViVEI6astWT/HkyLHUt0V7G5F/Pmv+PPlHW4b
         CNyth+oqATQiO0je5KiNlZsAX+hg7ieehYuja9YAEtteLkhfAFQ+CRJmXYb7R8Uo7A8X
         NCGw==
X-Forwarded-Encrypted: i=1; AFNElJ9j3IrRE+q4hjWQX/zO5Imu2I/OGqxlJZT0S5axgEaUnZ6cwJYY3nzX+4v5unrxRcf473llAH473JpuW/Nz5+01Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXyThijllG+FIhecsc1FgS+O+MbUXKM3/Ps+ejWm5wdLULN1h
	DEcdj7V5A4uNS8OJjEy2rTxPiNlPBEcU/Wm+mumdT3KmHWFODl01BFcnRXFKvV1pLDE=
X-Gm-Gg: AeBDievSHaD/KmflCskI8NyVgj1coJ+a+5ylSNUWd0kVMiKzmDr+kWs8qazY1esdbdU
	V7Z7neYVfMPay0KiiVXzA9JJn5VR1/pRD+MS5hL+7w/I8v41O7HKVPUgVQsa6uWIJs9wSyxWN9R
	nlCewCKVlINwTyne9XgrK9I+W5BQeDZsPcvK4XXjyEgva3/Yf951duNQgEtFk8GAT4jL62rU+gS
	o7twddifR/Lf0XcB4ThWZ4r/nYKTaGPdUq50ebt/gmApPE5EX7U0HLq4dd5KZBF8XwBegNam1g8
	gHBVsx9reTobBPJoUlqxtzQUkG00eHDrM8vEesa/gdnE9lckcIVpOtDqYhaUnHal2nY1Du1/jVZ
	HoLZpZQT7UlSAkvXDd5kKdNaWrqPzs1H8ux01TnvBtKy/8ADr2a6yooYdiRpuLHjyYzMm3/+jO0
	Gpn0/tbCrWN95h4XZaZC9n3bJJNJiIjwRO7sWB1CjLpA==
X-Received: by 2002:a05:6000:2510:b0:43d:7508:c9c9 with SMTP id ffacd0b85a97d-43fe3e0984bmr34562736f8f.27.1776848139576;
        Wed, 22 Apr 2026 01:55:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc0d51sm43898728f8f.10.2026.04.22.01.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 01:55:39 -0700 (PDT)
Message-ID: <d087c4f0-024d-480d-8711-5a47610b99b4@tuxon.dev>
Date: Wed, 22 Apr 2026 11:55:37 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Biju <biju.das.au@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
 <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
 <9523bd97-2730-4b99-b3d0-6accc7622478@tuxon.dev>
 <m225f2xw3xkzacscycaifnc4hb3mv3o6ezaxjyhtphnjo5cfw3@6smswij3txnc>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <m225f2xw3xkzacscycaifnc4hb3mv3o6ezaxjyhtphnjo5cfw3@6smswij3txnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31489-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tuxon.dev:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 416EF443AE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/26 14:22, Dmitry Baryshkov wrote:
> On Tue, Apr 21, 2026 at 12:11:28PM +0300, Claudiu Beznea wrote:
>> Hi,
>>
>> On 4/19/26 18:58, Dmitry Baryshkov wrote:
>>> On Fri, Apr 17, 2026 at 06:52:30PM +0100, Biju wrote:
>>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>>
>>>> Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
>>>> mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
>>>> from 25 to 87 MHz. The LVDS module cannot be used at the same time as
>>>> MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
>>>> the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
>>>> MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
>>>> module.
>>>>
>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>> ---
>>
>> [ ...]
>>
>>>> +/* -----------------------------------------------------------------------------
>>>> + * Bridge
>>>> + */
>>>> +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
>>>> +				     struct drm_atomic_state *state)
>>>> +{
>>>> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
>>>> +	const struct drm_bridge_state *bridge_state;
>>>> +	int ret;
>>>> +	u32 fmt;
>>>> +
>>>> +	/* Get the LVDS format from the bridge state. */
>>>> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
>>>> +	if (!bridge_state) {
>>>> +		dev_err(lvds->dev, "failed to get bridge state\n");
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	switch (bridge_state->output_bus_cfg.format) {
>>>> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
>>>> +		fmt = RZG3L_LVDS_MODE_JEIDA;
>>>> +		break;
>>>> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
>>>> +		fmt = RZG3L_LVDS_MODE_VESA;
>>>> +		break;
>>>> +	default:
>>>> +		fmt = RZG3L_LVDS_MODE_VESA;
>>>> +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
>>>> +			 bridge_state->output_bus_cfg.format);
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(lvds->dev);
>>>
>>> If this  fails for any reason, the atomic_disable() would still be
>>> called and it will decrement the counter, potentially undeflowing it.
>>> Consider switching to pm_runtime_get_sync(), which suits better here.
>>
>> AFAIK, the clocks of this HW blocks have MSTOP functionality. HW manual of
>> RZ/G3S [1] (should be the same for RZ/G3L as well) mentions the following in
>> the chapter 41.2.1. "If the master accesses a module that has the clock
>> stopped and the MSTOP bit set, a bus error will occur". [1]
>> MSTOP is set though the clock enable/disable APIs.
>>
>> The clocks on RZ/G3L are part of clock power domains. If the
>> pm_runtime_resume_and_get() fails (or any runtime PM resume calls), the
>> clocks will be off and MSTOP set. In this case, calling atomic_disable() or
>> any API setting HW registers will lead to sync aborts.
> 
> Then you've identified a bug in the code. The atomic_enable() doesn't
> fail, so for each enable there always will be an atomic_disable() call.
> 

Is this something that should be solved by individual drivers providing struct 
drm_bridge_funcs to the upper layers or by the subsystem itself?

Accessing HW w/o its power being on (whatever power means here, e.g. clocks, 
resets, regulators) seems odd and may lead to critical failures.

On some Renesas SoCs this used to work previously but it is not anymore with the 
addition of the so called MSTOP functionality.

Thank you,
Claudiu

