Return-Path: <linux-renesas-soc+bounces-8656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B9969EF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 15:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83E8F28522E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 13:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2CB1A7259;
	Tue,  3 Sep 2024 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsP3vGNv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369DC1A0BC6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369844; cv=none; b=H2br7m2y1GR29bAs3lJJyvndBvd/1UizxoRn+4SsefWABjvz+GReOhx4gJj1dvACayfpxHfUolRnMAZLSQdIcVUJSQdU/mEIbv2Pj7qasPGRKwxr5vtsjYJC+rEMdHki89WeEBGFWIBIybtToeJpLQzMpiK5FWxUwlknvUA8ZA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369844; c=relaxed/simple;
	bh=o2FOHPlQv0G4Eoa6xIQnsLSAq0ndSdsAIQ9dChf68uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTBNb7WQVrTEDuvn6NG7we67rZmAy08aYMQu7xVopsOo+AVbEpzb/97OxjlW+LZysXVjgpGdhHDHS4nPrLkRziD8qrRQZINNiPkliQH1zlumjexNwMtU9keQGtaEp1MlMAbIEcokCOn+DOWyw274Ke6l54igbMVgPKtdhp7NoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BsP3vGNv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725369842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwcVi0dsf+2NifIj/3/2dNpYqva1wyq1DCiHGFfnhJU=;
	b=BsP3vGNvSRWfpnUfUZ0xSTC9ZxoGlIEqZixLr0EcJbXtEpaW68VIbVV6SwOAg7sv4yZusX
	nznYCu2LWvpE/CuQByLXr/ZTcfaCsNFzhzkUoTA18uBJtF4xOmmQ/N2SKvsOUKbX6SubAe
	BIfizufM2n1ulTvpNQXno7nXKSv/oyE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-z2WVh2dxMvyt9KztL9bFvw-1; Tue, 03 Sep 2024 09:24:00 -0400
X-MC-Unique: z2WVh2dxMvyt9KztL9bFvw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42bbad819d0so39803595e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 06:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725369839; x=1725974639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwcVi0dsf+2NifIj/3/2dNpYqva1wyq1DCiHGFfnhJU=;
        b=R7l+4sbZ/xfyb5JBaqFr1rcAyCVF1hxse2HWY25Nce/XDw2LZkMbSuTOSlLul/e8MI
         2w8WPUnMuWB9pHJoXcKLMg+9SwSkncz1TU3FH4etxbVpPQai8eFC88b8VjAIq/vinE4a
         mlrdg61dN8DU6wi2aeunNuFOZsr0+tenfbIAKJqQWgNdpCsVFk2f69+4P5yKg//hZC+j
         t/a9szSybX4spY87YOqkCsglpDhqU12dT/KTZVT+zrF1BslOS0Yi3HOylL3hHDqyTT3Q
         khIlzPnKqr1eCMV4jg+IKtbBszCgBIMkOI8ejhUOw0FSPRFVXlCxMu53NAe58W2ZTpRQ
         bpmw==
X-Forwarded-Encrypted: i=1; AJvYcCVkB6+V03Q5QEco3cDPH8dFFOnEyh1DGawOGFQT4OGSP6dr4A/QnKrStH02if/KowpPAhvxrAXHz7qVBpraGJdDSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEL5nuU3ZDWcjEPOF8ol9PnGbp1nYY80zPENPWjz4SvR1kDPMi
	a3Dx7yyNstGqcpxI72q7sb1Zijak5aiQLGXMRGCa2oeTwz4VMOQxIAeF57DAPtZv94rvzbALlL+
	4hRPAnWlOua5bIsYupxeU6kbWK3g9ypcJaV06GvdDW92OZqQVK4tovq0HBcUrsxc5nbd1qzW9pA
	eM
X-Received: by 2002:a05:600c:1d1d:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-42bbb205a6bmr97108175e9.11.1725369839367;
        Tue, 03 Sep 2024 06:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI3sCpKkpdI1X5z3naPCx6kQ6qbg21MF4Ajhry2O5a9Uet75grl/Vs9BZR3kM4tuFUpGq3xg==
X-Received: by 2002:a05:600c:1d1d:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-42bbb205a6bmr97107895e9.11.1725369838804;
        Tue, 03 Sep 2024 06:23:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba3f2875sm151798035e9.41.2024.09.03.06.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 06:23:58 -0700 (PDT)
Message-ID: <180cfd85-8f1d-438a-928f-f13bea28323b@redhat.com>
Date: Tue, 3 Sep 2024 15:23:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com>
 <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
 <20240529133309.GO1436@pendragon.ideasonboard.com>
 <e1cc6c86-d042-400c-b995-a8b78f62dbdd@redhat.com>
 <CAA8EJpoC9SiLr4QyksKLq796vdq7pFywwn9pPyrkj6-uo5zVog@mail.gmail.com>
 <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdV1SQT4Lnah3-H6r19_xUuKO7iLcTw1PApg7v6naEF5Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/08/2024 15:53, Geert Uytterhoeven wrote:
> On Thu, May 30, 2024 at 10:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> On Thu, 30 May 2024 at 11:16, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> On 29/05/2024 15:33, Laurent Pinchart wrote:
>>>> On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
>>>>> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
>>>>>> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
>>>>>>> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
>>>>>>>> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
>>>>>>>>>> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
>>>>>>>>>>> Add support for the drm_panic module, which displays a message on
>>>>>>>>>>> the screen when a kernel panic occurs.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>>>>>>> ---
>>>>>>>>>>> Tested on Armadillo-800-EVA.
>>>>>>>>>>> ---
>>>>>>>>>>>    drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
>>>>>>>>>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>>>>> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>>>>> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
>>>>>>>>>>>         .atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>>>>>    };
>>>>>>>>>>>
>>>>>>>>>>> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
>>>>>>>>>>> +      .atomic_check = shmob_drm_plane_atomic_check,
>>>>>>>>>>> +      .atomic_update = shmob_drm_plane_atomic_update,
>>>>>>>>>>> +      .atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>>>>> +      .get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
>>>>>>>>>>> +};
>>>>>>>>>>> +
>>>>>>>>>>>    static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>>>>>>>>>>>         .update_plane = drm_atomic_helper_update_plane,
>>>>>>>>>>>         .disable_plane = drm_atomic_helper_disable_plane,
>>>>>>>>>>> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>>>>>>>>>>>
>>>>>>>>>>>         splane->index = index;
>>>>>>>>>>>
>>>>>>>>>>> -      drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
>>>>>>>>>>> +      if (type == DRM_PLANE_TYPE_PRIMARY)
>>>>>>>>>>> +              drm_plane_helper_add(&splane->base,
>>>>>>>>>>> +                                   &shmob_drm_primary_plane_helper_funcs);
>>>>>>>>>>> +      else
>>>>>>>>>>> +              drm_plane_helper_add(&splane->base,
>>>>>>>>>>> +                                   &shmob_drm_plane_helper_funcs);
>>>>>>>>>>
>>>>>>>>>> It's not very nice to have to provide different operations for the
>>>>>>>>>> primary and overlay planes. The documentation of
>>>>>>>>>> drm_fb_dma_get_scanout_buffer() states
>>>>>>>>>>
>>>>>>>>>>    * @plane: DRM primary plane
>>>>>>>>>>
>>>>>>>>>> If the intent is that only primary planes will be used to display the
>>>>>>>>>> panic message, shouldn't drm_panic_register() skip overlay planes ? It
>>>>>>>>>> would simplify drivers.
>>>>>>>>>
>>>>>>>>> What about the drivers where all the planes are actually universal?
>>>>>>>>> In such a case the planes registered as primary can easily get replaced
>>>>>>>>> by 'overlay' planes.
>>>>>>>>
>>>>>>>> Good point.
>>>>>>>>
>>>>>>>> Another option, if we wanted to avoid duplicating the drm_plane_funcs,
>>>>>>>> would be to add a field to drm_plane to indicate whether the plane is
>>>>>>>> suitable for drm_panic.
>>>>>>>
>>>>>>> ... or maybe let the driver decide. For the fully-universal-plane
>>>>>>> devices we probably want to select the planes which cover the largest
>>>>>>> part of the CRTC.
>>>>>>
>>>>>> Are there devices where certain planes can only cover a subset of the
>>>>>> CRTC (apart from planes meant for cursors) ?
>>>>>
>>>>> On contemporary MSM devices any plane can cover any part of the screen,
>>>>> including not having a plane that covers the full screen at all.
>>>>
>>>> Ah, you meant picking the plane that is currently covering most of the
>>>> screen. I thought you were talking about devices where some planes were
>>>> restricted by the hardware to a subset of the CRTC.
>>>>
>>>> I agree it would make sense to take both plane position and z-pos, as
>>>> well as visibility and other related parameters, to pick the plane that
>>>> is the most visible. Ideally this should be handled in drm_panic, not
>>>> duplicated in drivers.
>>>
>>> I'm not sure that drm_panic can figure out reliably on which plane it
>>> needs to draw. I think the driver has more information to take the right
>>> decision.
>>
>> I think there should be a default implementation which fits 80% of the
>> cases (single fixed PRIMARY plane per output) but if the driver needs
>> it, it should be able to override the behaviour.
> 
> Did anything like this materialize, or is this patch (and its rcar-du
> counterpart [1]) good to apply as-is?

No I didn't find a better option yet, and I think it is good as-is.

If duplicating the helper funcs is really a problem, I think the less 
intrusive option, would be to add a "bool panic_allow_overlay_plane" to 
struct drm_mode_config, and use that in drm_panic_register(), to 
register only primary planes if it's not set ?

So drivers that want to draw the panic on overlay plane can opt-in.

Best regards,

-- 

Jocelyn


> 
> Thank you!
> 
> [1] https://lore.kernel.org/r/b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be/
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 


