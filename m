Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 806D319EF35
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 03:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgDFBrt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Apr 2020 21:47:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38522 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgDFBrt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Apr 2020 21:47:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id c21so6792790pfo.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Apr 2020 18:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xlmSsISaJ23hVo68UD8v5B9oxzVS6g7fMxgTyIoWdSg=;
        b=P948txDYB0M6wNGQAtrV86c5MbY2TA1ojXGn7CcGMFQu8Llpzyw0ex5NKhxpl4gvGS
         MhxWofJCDk960t3b/jLJhD4KvnyqUQJBlHN5pwCcVtrlhHGbUrldyxC1ZKm31mpwDOdB
         kgzx9z5UQVSioRqUQ4f5WNRsU42HZjDsZNsXoyZJaZ89P9qLQC8iSYCuAPtvZf8BUtK8
         gl6k6gP0H3sokBFMUJgvY5QwvESaG/HflsWGZxIUsBj/EKETmzWDmEVrvro4qAeOBf2D
         Y/+hs/Z8ntQOBc89/ym2vcr8lkZGqghrfrEe5hbPaiwtFqgFxg5h3/K33ShCI/OC3mkS
         XwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xlmSsISaJ23hVo68UD8v5B9oxzVS6g7fMxgTyIoWdSg=;
        b=Ong5P3TeMVVt5nYDvmXYB2rXes9W1a5cDNYtm48kgbghPUbIy3Zz4KCwpppQC/C0ij
         qS/HmZplY8GLpRpn5Q/Scc8593gUBBnh2DAUmZMixCPV2tXVEnJWkDMCTZ7KMApSKaPC
         1OC0FxugZY3HYeudFicdYX37D740/05WEHh86kfE1DJBSdqqB/HGI4pcuGP5vsPlewez
         7oiEbHyCKpXkDgCRBbjV19Hzw1wvTIY0z8gmzptrCr+szOngNHiY0utzCrAsN8SElM4p
         qTvxMIv31XpMqAiwMXxc5HRSMbR9dW3v37hyAEtmNuquJOc113esgE8j7tFVcTfQ6zQx
         8Fsg==
X-Gm-Message-State: AGi0PubgFJZrqU/LUPrKBDoG238pzttwx76EPc+YQjnNy69RHCSPsYjk
        xIKwAZWzlZAM+xUWWPk0Zq8+ly21tI4=
X-Google-Smtp-Source: APiQypJRM2gEqGWb3WH7DBj42v+Y9hVl7L8deLBYg1Qb+vpsxylSpQS3wcB0ujAX5s4/9bQaG1vkgg==
X-Received: by 2002:a63:1f26:: with SMTP id f38mr12624982pgf.235.1586137667528;
        Sun, 05 Apr 2020 18:47:47 -0700 (PDT)
Received: from [10.16.129.49] (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id c207sm10367401pfb.47.2020.04.05.18.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2020 18:47:46 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: Set primary plane zpos immutably at
 initializing
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200401061100.7379-1-etom@igel.co.jp>
 <20200404182403.GB4875@pendragon.ideasonboard.com>
From:   Esaki Tomohito <etom@igel.co.jp>
Autocrypt: addr=etom@igel.co.jp; prefer-encrypt=mutual; keydata=
 mQENBE2egxoBCADFOCDMNmjOeu61nHemxUBgA17/tWPH28AqcA+uxby9dAcA8q0+7zWjfTPn
 Q89kF05szFTcUtv+6CDIzzbqTVApJnXlbY9rlT5ECMrYGwELQBuVMvkq18RqQ/lKLZJ4RVMz
 rsE8kuBfDoRqKIwXv13iavXIt9HqeHiqhDivKLMPLBZbyjjFpvsTdN15H2qIvba2K4FP00o/
 7HOc0/0pUohp3yGHptZ6kI5iZPQ61+ANavhrNC1/lJMZzAupDG19Ft0abRCwF3HP/sernC1z
 U6xoUSnZgpHXm9uLnZLgc8VI5rbzKGOUK+FIAWIPxV3Cv9W1xSUlwGGbk8nqfkslXFFBABEB
 AAG0IEVzYWtpIFRvbW9oaXRvIDxldG9tQGlnZWwuY28uanA+iQE+BBMBAgAoBQJNnoMaAhsj
 BQkJZgGABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRB6VPTiXWc4oUldCACeEakXrpeA
 o8ncbW6e4V5AA0as+QBYLupQIbp1GpiKT8ChgoIPI+Ik88m5f6x4LEPoNe3JebF/g8pha/Og
 gjVCXTKd1N7cPOKP4zYiJ7SpipcOTHS/z+c0IPfUwi8H3p6j1Ybrmlu3Xj1AIMFrutrMSOHG
 c3mIguY8F4fJZR5fDkiJ7cBZ3HoBb6d3URud3ofhYwsy7ZnWNv2tfLBB/OPFslRVbR3Cgfqr
 1SZeF4MsshPfMhHY94TOdJ9ZetJs53yQheqwMO6VX3tFHL6g1RsZRuBmTD5tzLX26u2SRrh+
 XJcdfAorP2f4q84Whcjn//3QSuKptp/COM2HQCGBycFt
Message-ID: <0a458d1b-90fa-6149-630e-23793ebc20b7@igel.co.jp>
Date:   Mon, 6 Apr 2020 10:47:43 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404182403.GB4875@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Laurent-san

On 2020/04/05 3:24, Laurent Pinchart wrote:
> Hello Esaki-san,
> 
> Thank you for the patch.
> 
> On Wed, Apr 01, 2020 at 03:11:00PM +0900, Tomohito Esaki wrote:
>> According to drm_plane_create_zpos_property() function documentation,
>> all planes zpos range should be set if zpos property is supported.
>> However, the rcar-du driver didn't set primary plane zpos range. Since
>> the primary plane's zpos is fixed, set i immutably.
>>
>> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 5 ++++-
>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 5 ++++-
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> index c6430027169f..9a499be45c45 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> @@ -785,8 +785,11 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>>  
>>  		drm_plane_create_alpha_property(&plane->plane);
>>  
>> -		if (type == DRM_PLANE_TYPE_PRIMARY)
>> +		if (type == DRM_PLANE_TYPE_PRIMARY) {
>> +			drm_plane_create_zpos_immutable_property(&plane->plane,
>> +								 0);
>>  			continue;
>> +		}
> 
> I would prefer an if ... else ... here and below instead of a continue,
> to better handle future differences between primary and overlay planes.
> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I've taken the liberty to resend the patch with this change as a v2,
> with the dri-devel mailing list in CC, and will include it in my next
> pull request.

I agree with, thank you for updating patch.

> Would you mind CC'ing me for future patches to the R-Car DU driver ? You
> can use the scripts/get_maintainer.pl script from the Linux kernel
> sources to get a list of maintainers, reviewers and mailing lists for a
> patch. There's no need to CC everybody on that list, but it can give you
> at least the driver's maintainer and the corresponding mailing list.

Sorry, I understood.
I would like to add maintainer to CC from next time.

>>  
>>  		drm_object_attach_property(&plane->plane.base,
>>  					   rcdu->props.colorkey,
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> index 5e4faf258c31..382b720edc09 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> @@ -392,8 +392,11 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>>  		drm_plane_helper_add(&plane->plane,
>>  				     &rcar_du_vsp_plane_helper_funcs);
>>  
>> -		if (type == DRM_PLANE_TYPE_PRIMARY)
>> +		if (type == DRM_PLANE_TYPE_PRIMARY) {
>> +			drm_plane_create_zpos_immutable_property(&plane->plane,
>> +								 0);
>>  			continue;
>> +		}
>>  
>>  		drm_plane_create_alpha_property(&plane->plane);
>>  		drm_plane_create_zpos_property(&plane->plane, 1, 1,
> 

Thanks,
Esaki
