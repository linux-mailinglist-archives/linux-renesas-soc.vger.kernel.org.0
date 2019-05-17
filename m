Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE907214BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 09:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbfEQHpW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 03:45:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34628 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbfEQHpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 03:45:21 -0400
Received: by mail-pl1-f194.google.com with SMTP id w7so2975912plz.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2019 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3jRBW77nbG2IMFiEp/E/F3VNVSErBVLZkOAbzSuJ7Rs=;
        b=q/Fyk2ulhkFFaGMdGrvWd1X1EpbSdSq78rVdKRN6vsxQAfeM6/Xuowfy99++/r85oU
         S7U2WAtgO3gAPC46oDEaHg4boufn39QiRwMyvEO6LyvB30cRBUxLu96bOXfhn+PPcwYD
         G/tbuuhPhOg2ms2AzDelAtsd/leX9XWdkp+9jEBU0ZXbOM5a3U5sJEhjlxnUBxAlW7Qk
         vB2desIb/NcHz0oSgxyYoAcCN+BuIcJyNdTqdQsJ7/XXCOzoLomH9QgXlHdN/QTD+plx
         eUDqfwZol1W7JLxsq4a6lAcDIdBC1FMzDusHYoVEmSSDtzYY4MDFSaPQH/S5WQbH+F/i
         eong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3jRBW77nbG2IMFiEp/E/F3VNVSErBVLZkOAbzSuJ7Rs=;
        b=r3YHLhRxP6wVKudcuEWG8PGg2aDNAq5sC0dbsrK9HqfYjvoGXKQBXsZikfjvUA7gP5
         opgQMCmIq708xf0GXKgRfzCnT32YUs+P3nK/Fh18lUaKb2yWAdH9ID0EgOFhInTTYJUk
         k9prj3ppyc9ghNE8pcbEvjrwUCO32OXa7tJzGn/r3gGY2h6FAc/ASU1HTNFvDFL/CFdH
         JGjlro7b3QqznpKuyo2FIi/FE5He+6Rp2RfrQS9WiTh+5lxSjks5yY/nB7US6ajdpnkP
         mYi7Rqy1OJNyDAvTbYPpPgq0yGuxJ4qPVlSt3yHIGZzbTKOLLoVf78Q304HXiAYd+pJd
         FLvA==
X-Gm-Message-State: APjAAAX4NS00DYeNq0635LlqQMfaZRyLVFaqPmNFtL6aoh5iYtGPEsdL
        d4iNhYE5sjTd9EVReT2TD2djkHM79Yk=
X-Google-Smtp-Source: APXvYqw7TdJVQMuay8du/tJeotIkua0plL6jzoL+RdLSr2SVDyUC9wHEbLMxB+u8KuTmFdQUwH1QSA==
X-Received: by 2002:a17:902:c01:: with SMTP id 1mr17530980pls.142.1558079120772;
        Fri, 17 May 2019 00:45:20 -0700 (PDT)
Received: from [10.16.129.49] (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id 132sm8295256pga.79.2019.05.17.00.45.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 00:45:20 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
 <20190511181027.GC13043@pendragon.ideasonboard.com>
From:   Esaki Tomohito <etom@igel.co.jp>
Openpgp: preference=signencrypt
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
Message-ID: <69672977-dc6a-6878-1f4b-4407c4ce9723@igel.co.jp>
Date:   Fri, 17 May 2019 16:45:19 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190511181027.GC13043@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Laurent-san,

On 2019/05/12 3:10, Laurent Pinchart wrote:
> Hello Esaki-san,
> 
> On Thu, May 09, 2019 at 06:25:19PM +0900, Esaki Tomohito wrote:
>> Hi Laurent-san
>>
>>> What's the purpose of this, as it adds no new functionality to the
>>> driver ? Why is this change needed ?
>>
>> Weston compositor (v5.0.0 or later) uses the DRM API to get the
>> supported modifiers and determines if the sprite plane can be used by
>> comparing the modifiers with the client specified modifier.
>> In currently driver, since the weston doesn't know supported modifiers,
>> that cannot determine if the received dmabuf can be passed through to
>> sprite plane.
>> Since there are R-Car GPU which support linear modifier, the sprite
>> plane cannot be used in a compositor similar to the weston if client
>> specify linear modifier.
> 
> I don't think the right solution is to expose the linear modifier from
> all drivers that don't otherwise support modifiers. We should instead
> fix it either in Weston, and treat drivers that don't support the
> modifiers API as supporting the linear modifier only, or in the DRM/KMS
> core by reporting the linear modifier for drivers that don't explicitly
> support modifiers.

I would like to ask for an opinion to wayland community.
I will add you to Cc in that mail.

Thanks!

>> On 2019/05/09 16:14, Laurent Pinchart wrote:
>>> On Thu, May 09, 2019 at 02:45:18PM +0900, Tomohito Esaki wrote:
>>>> Add support for the linear modifier. Since the rcar-du device supports
>>>> only linear modifier, this driver doesn't support other modifiers.
>>>
>>> What's the purpose of this, as it adds no new functionality to the
>>> driver ? Why is this change needed ?
>>>
>>>> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
>>>> ---
>>>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 11 +++++++++++
>>>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 15 ++++++++++++++-
>>>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 15 ++++++++++++++-
>>>>  3 files changed, 39 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> index 3b7d50a8fb9b..9c5e15a5ab1c 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> @@ -214,6 +214,16 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>>>>  		return ERR_PTR(-EINVAL);
>>>>  	}
>>>>  
>>>> +	/*
>>>> +	 * Support only LINEAR modifier.
>>>> +	 */
>>>> +	if ((mode_cmd->flags & DRM_MODE_FB_MODIFIERS) &&
>>>> +	    mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR) {
>>>> +		dev_dbg(dev->dev, "unsupported fb modifier 0x%llx\n",
>>>> +			mode_cmd->modifier[0]);
>>>> +		return ERR_PTR(-EINVAL);
>>>> +	}
>>>> +
>>>>  	if (rcdu->info->gen < 3) {
>>>>  		/*
>>>>  		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
>>>> @@ -529,6 +539,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>>>>  	dev->mode_config.min_width = 0;
>>>>  	dev->mode_config.min_height = 0;
>>>>  	dev->mode_config.normalize_zpos = true;
>>>> +	dev->mode_config.allow_fb_modifiers = true;
>>>>  	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
>>>>  	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
>>>>  
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>>>> index c6430027169f..32135ad387fa 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>>>> @@ -726,6 +726,13 @@ static int rcar_du_plane_atomic_get_property(struct drm_plane *plane,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static bool rcar_du_plane_format_mod_supported(struct drm_plane *plane,
>>>> +					       uint32_t format,
>>>> +					       uint64_t modifier)
>>>> +{
>>>> +	return modifier == DRM_FORMAT_MOD_LINEAR;
>>>> +}
>>>> +
>>>>  static const struct drm_plane_funcs rcar_du_plane_funcs = {
>>>>  	.update_plane = drm_atomic_helper_update_plane,
>>>>  	.disable_plane = drm_atomic_helper_disable_plane,
>>>> @@ -735,6 +742,7 @@ static const struct drm_plane_funcs rcar_du_plane_funcs = {
>>>>  	.atomic_destroy_state = rcar_du_plane_atomic_destroy_state,
>>>>  	.atomic_set_property = rcar_du_plane_atomic_set_property,
>>>>  	.atomic_get_property = rcar_du_plane_atomic_get_property,
>>>> +	.format_mod_supported = rcar_du_plane_format_mod_supported,
>>>>  };
>>>>  
>>>>  static const uint32_t formats[] = {
>>>> @@ -750,6 +758,11 @@ static const uint32_t formats[] = {
>>>>  	DRM_FORMAT_NV16,
>>>>  };
>>>>  
>>>> +static const uint64_t modifiers[] = {
>>>> +	DRM_FORMAT_MOD_LINEAR,
>>>> +	DRM_FORMAT_MOD_INVALID,
>>>> +};
>>>> +
>>>>  int rcar_du_planes_init(struct rcar_du_group *rgrp)
>>>>  {
>>>>  	struct rcar_du_device *rcdu = rgrp->dev;
>>>> @@ -776,7 +789,7 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>>>>  		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
>>>>  					       &rcar_du_plane_funcs, formats,
>>>>  					       ARRAY_SIZE(formats),
>>>> -					       NULL, type, NULL);
>>>> +					       modifiers, type, NULL);
>>>>  		if (ret < 0)
>>>>  			return ret;
>>>>  
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>>>> index 0878accbd134..9d1382b02717 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>>>> @@ -139,6 +139,11 @@ static const u32 formats_kms[] = {
>>>>  	DRM_FORMAT_YVU444,
>>>>  };
>>>>  
>>>> +static const uint64_t modifiers_kms[] = {
>>>> +	DRM_FORMAT_MOD_LINEAR,
>>>> +	DRM_FORMAT_MOD_INVALID,
>>>> +};
>>>> +
>>>>  static const u32 formats_v4l2[] = {
>>>>  	V4L2_PIX_FMT_RGB332,
>>>>  	V4L2_PIX_FMT_ARGB444,
>>>> @@ -344,6 +349,13 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
>>>>  	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
>>>>  }
>>>>  
>>>> +static bool rcar_du_vsp_plane_format_mod_supported(struct drm_plane *plane,
>>>> +						   uint32_t format,
>>>> +						   uint64_t modifier)
>>>> +{
>>>> +	return modifier == DRM_FORMAT_MOD_LINEAR;
>>>> +}
>>>> +
>>>>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
>>>>  	.update_plane = drm_atomic_helper_update_plane,
>>>>  	.disable_plane = drm_atomic_helper_disable_plane,
>>>> @@ -351,6 +363,7 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
>>>>  	.destroy = drm_plane_cleanup,
>>>>  	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
>>>>  	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
>>>> +	.format_mod_supported = rcar_du_vsp_plane_format_mod_supported,
>>>>  };
>>>>  
>>>>  int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>>>> @@ -397,7 +410,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>>>>  					       &rcar_du_vsp_plane_funcs,
>>>>  					       formats_kms,
>>>>  					       ARRAY_SIZE(formats_kms),
>>>> -					       NULL, type, NULL);
>>>> +					       modifiers_kms, type, NULL);
>>>>  		if (ret < 0)
>>>>  			return ret;
>>>>  
> 

-- 
--------------------------
Tomohito Esaki
etom@igel.co.jp
