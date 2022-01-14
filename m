Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11F148EBDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jan 2022 15:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241671AbiANOky (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jan 2022 09:40:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239084AbiANOky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 09:40:54 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16EC1C06161C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jan 2022 06:40:54 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id t20so8511019wrb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jan 2022 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZpQd5MgDxQh1cJDEk6y932cMOfAplIWP9ns8kVsGTvs=;
        b=YsIluXYEpVcxQh6OaELyrcbxtZCROmSMFkzH/03hqq0b+mLWiNouFMiMH8ZmNu+bA0
         IMTEZuxu28ot8m0NocPDWlvJ7VPTG5p2Y4yD2MDDQUWKxJZYb+O0AfmZedVdRfluXosU
         GxucULMfeP8o1RnWf07vmYYXtwOYoa7YzOB4ZYg5tgaTJtP7vNn4zSo34brNxnvXdD8X
         bNGErBH6bGrZgAg/wy5H0yEZQ3XmLJ2K8IOrdedgPsH6wmgi6gAXfr9QuPy1YtKpMKWl
         8+loWj4uJSBc6Eshji3KuK9P6ILvzC756b/HbbxVflFO4KuUQqqOk6RItgGmsJxilnN0
         ec3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZpQd5MgDxQh1cJDEk6y932cMOfAplIWP9ns8kVsGTvs=;
        b=DFnBaC8x5XfWHpAuCKoVmS+CSmYpo94Fy7l8xP2/KPE0E4TkdmfV/5iK12PLkzwpw0
         53JGz7Y61w6s2LgouaedOZHc0M23bArr2jzp4aGwxvKGqeIo7Xr/z4Vmr/kaSQV5p6Zd
         2qyKjajjbC5zg4g6Yd5nXopViCQxDET0InR0mZfU4aEgQ4eejZt9VG6/hMctJt3f3gxF
         pRI+65rY70zIyqGnjxTz8g0h+Fl+rti17fStAvNXyNlwlb1YIJd5wXQMuF9ayvd6oa1A
         jt9dAc5/j/KTNfeT1RweZKZrwfYt021Ipi9YJdUuEFgwAfJfUR6G51yQwpCreSUFRQ09
         Reqw==
X-Gm-Message-State: AOAM53006XK2ftn3UEPVSkE6pZrYkLeCzxyKSa9OZ1jWsx/5hu0L04N5
        T89QJhrkUPfDmCw+e08ZUJAahfqDXnQ0aw==
X-Google-Smtp-Source: ABdhPJwCbmzEUVXgyefpTYa4YZvvCy2ezHWIBO8RdMvytTJAmoVdM2Tu6kocdxqS7P11hUge+KYfVA==
X-Received: by 2002:a05:6000:1543:: with SMTP id 3mr4515819wry.683.1642171252217;
        Fri, 14 Jan 2022 06:40:52 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee? ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
        by smtp.gmail.com with ESMTPSA id h10sm6784315wmh.0.2022.01.14.06.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 06:40:51 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "Laurent.pinchart@ideasonboard.com" 
        <Laurent.pinchart@ideasonboard.com>,
        "robert.foss@linaro.org" <robert.foss@linaro.org>,
        "jonas@kwiboo.se" <jonas@kwiboo.se>,
        "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
        "martin.blumenstingl@googlemail.com" 
        <martin.blumenstingl@googlemail.com>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
 <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
 <OS0PR01MB592224EC8F50F41B7FF1DEE286549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <19dd6013-8a31-b2ed-29d5-93fc44193ce4@baylibre.com>
 <OS0PR01MB5922F442759BE6F228EE0B4486549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <538b8da4-1201-5f45-2abf-ecd22c867358@baylibre.com>
 <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ebaff694-a2d7-7eb8-5850-980e9d4e1e68@baylibre.com>
Date:   Fri, 14 Jan 2022 15:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922BC31FBCF85F99F17737B86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 14/01/2022 15:23, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Neil Armstrong <narmstrong@baylibre.com>
>> Sent: 14 January 2022 13:56
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Fabio Estevam
>> <festevam@gmail.com>
>> Cc: daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com;
>> robert.foss@linaro.org; jonas@kwiboo.se; jernej.skrabec@gmail.com;
>> martin.blumenstingl@googlemail.com; linux-amlogic@lists.infradead.org;
>> linux-arm-kernel@lists.infradead.org; dri-devel@lists.freedesktop.org;
>> linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org
>> Subject: Re: dw_hdmi is showing wrong colour after commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>> callbacks")
>>
>> Hi,
>>
>> On 14/01/2022 12:08, Biju Das wrote:
>>> Hi Neil,
>>>
>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>> callbacks")
>>>>
>>>> On 14/01/2022 09:29, Biju Das wrote:
>>>>> Hi Neil,
>>>>>
>>>>> + renesas-soc
>>>>>
>>>>>> Subject: Re: dw_hdmi is showing wrong colour after commit
>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
>>>>>> callbacks")
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 13/01/2022 21:01, Fabio Estevam wrote:
>>>>>>> Hi Biju,
>>>>>>>
>>>>>>> On Thu, Jan 13, 2022 at 2:45 PM Biju Das
>>>>>>> <biju.das.jz@bp.renesas.com>
>>>>>> wrote:
>>>>>>>>
>>>>>>>> Hi All,
>>>>>>>>
>>>>>>>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour)
>>>>>>>> till the commit
>>>>>>>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus
>>>>>>>> fmts
>>>>>> callbacks").
>>>>>>>>
>>>>>>>> After this patch, the screen becomes greenish(may be it is
>>>>>>>> setting it
>>>>>> into YUV format??).
>>>>>>>>
>>>>>>>> By checking the code, previously it used to call get_input_fmt
>>>>>>>> callback
>>>>>> and set colour as RGB24.
>>>>>>>>
>>>>>>>> After this commit, it calls get_output_fmt_callbck and returns 3
>>>>>>>> outputformats(YUV16, YUV24 and RGB24) And get_input_fmt callback,
>>>>>>>> I see
>>>>>> the outputformat as YUV16 instead of RGB24.
>>>>>>>>
>>>>>>>> Not sure, I am the only one seeing this issue with dw_HDMI driver.
>>>>>>
>>>>>> This patch was introduced to maintain the bridge color format
>>>>>> negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR, but it
>>>>>> seems it behaves incorrectly if the first bridge doesn't implement
>>>>>> the negotiation callbacks.
>>>>>>
>>>>>> Let me check the code to see how to fix that.
>>>>>
>>>>> Thanks for the information, I am happy to test the patch/fix.
>>>>>
>>>>> Cheers,
>>>>> Biju
>>>>>
>>>>>>
>>>>>>>
>>>>>>> I have tested linux-next 20220112 on a imx6q-sabresd board, which
>>>> shows:
>>>>>>>
>>>>>>> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with
>>>>>>> HDCP (DWC HDMI 3D TX PHY)
>>>>>>>
>>>>>>> The colors are shown correctly here.
>>>>>>>
>>>>>>
>>>>>> The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the
>>>>>> negotiation fails and use the RGB fallback input & output format.
>>>>>>
>>>>>> Anyway thanks for testing
>>>>>>
>>>>>> Neil
>>>>
>>>> Can you test :
>>>>
>>>> ==><===============================
>>>> diff --git a/drivers/gpu/drm/drm_bridge.c
>>>> b/drivers/gpu/drm/drm_bridge.c index c96847fc0ebc..7019acd37716
>>>> 100644
>>>> --- a/drivers/gpu/drm/drm_bridge.c
>>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>>> @@ -955,7 +955,14 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>>>> drm_bridge *bridge,
>>>>         last_bridge_state =
>>>> drm_atomic_get_new_bridge_state(crtc_state-
>>>>> state,
>>>>
>>>> last_bridge);
>>>>
>>>> -       if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>> +       /*
>>>> +        * Only negociate with real values if both end of the bridge
>> chain
>>>> +        * support negociation callbacks, otherwise you can end in a
>>>> situation
>>>> +        * where the selected output format doesn't match with the
>>>> + first
>>>> bridge
>>>> +        * output format.
>>>> +        */
>>>> +       if (bridge->funcs->atomic_get_input_bus_fmts &&
>>>> +           last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>>                 const struct drm_bridge_funcs *funcs =
>>>> last_bridge->funcs;
>>>>
>>>>                 /*
>>>> @@ -980,7 +987,12 @@ drm_atomic_bridge_chain_select_bus_fmts(struct
>>>> drm_bridge *bridge,
>>>>                 if (!out_bus_fmts)
>>>>                         return -ENOMEM;
>>>>
>>>> -               if (conn->display_info.num_bus_formats &&
>>>> +               /*
>>>> +                * If first bridge doesn't support negociation, use
>>>> MEDIA_BUS_FMT_FIXED
>>>> +                * as a safe value for the whole bridge chain
>>>> +                */
>>>> +               if (bridge->funcs->atomic_get_input_bus_fmts &&
>>>> +                   conn->display_info.num_bus_formats &&
>>>>                     conn->display_info.bus_formats)
>>>>                         out_bus_fmts[0] = conn-
>>>>> display_info.bus_formats[0];
>>>>                 else
>>>> ==><===============================
>>>>
>>>> This should exclude your situation where the first bridge doesn't
>>>> support negociation.
>>>
>>> I have tested this fix with Linux next-20220114. Still I see colour
>> issue.
>>>
>>> It is still negotiating and it is calling get_output_fmt_callbck
>>>
>>> [    3.460155] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>> MEDIA_BUS_FMT_UYVY8_1X16=0#########
>>> [    3.460180] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>> MEDIA_BUS_FMT_YUV8_1X24=1#########
>>> [    3.460202] ########dw_hdmi_bridge_atomic_get_output_bus_fmts
>> MEDIA_BUS_FMT_RGB888_1X24=2#########
>>>
>>> And In get_input_fmt callback, I See the outputformat as YUV16 instead
>> of RGB24.
>>>
>>> [    3.460319] ########dw_hdmi_bridge_atomic_get_input_bus_fmts
>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>> [    3.473644] ########hdmi_video_sample
>> MEDIA_BUS_FMT_UYVY8_1X16#########
>>
>> OK, looking at rcar-du, the dw-hdmi bridge is directly connected to the
>> encoder.
> 
> Yep.
> 
>>
>> Let me figure that out, no sure I can find a clean solution except putting
>> back RGB24 before YUV.
>>
>> Anyway please test that:
> 
> It works now after reordering.
> 
> [    3.493302] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_RGB888_1X24=0#########
> [    3.493326] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_YUV8_1X24=1#########
> [    3.493348] ########dw_hdmi_bridge_atomic_get_output_bus_fmts MEDIA_BUS_FMT_UYVY8_1X16=2#########
> 
> [    3.493463] ########dw_hdmi_bridge_atomic_get_input_bus_fmts MEDIA_BUS_FMT_RGB888_1X24#########
> [    3.506797] ########hdmi_video_sample MEDIA_BUS_FMT_RGB888_1X24#########
> 
> Is it acceptable solution to the users of dw_hdmi driver? May be it is worth to post a patch.
> at least it is fixing the colour issue??

Yes, it gets back to default behavior before negociation, nevertheless we need to think
how to handle your use-case correctly at some point.

I'll post this as a patch ASAP so it gets applied before landing in linus master.

Neil

> 
> Regards,
> Biju
> 
>>
>> ==><===============================
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..68f79094f648 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2589,45 +2589,44 @@ static u32
>> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>  	}
>>
>>  	/*
>> -	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
>> +	 * Order bus formats from 16bit to 8bit and from RGB to YUV422
>>  	 * if supported. In any case the default RGB888 format is added
>>  	 */
>>
>>  	if (max_bpc >= 16 && info->bpc == 16) {
>> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
>> +
>>  		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>>  			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>> -
>> -		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
>>  	}
>>
>>  	if (max_bpc >= 12 && info->bpc >= 12) {
>> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> -			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
>>
>>  		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>>  			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
>>
>> -		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>>  	}
>>
>>  	if (max_bpc >= 10 && info->bpc >= 10) {
>> -		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> -			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>>
>>  		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>>  			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
>>
>> -		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>>  	}
>>
>> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> -		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>> +	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>>
>>  	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>>  		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>>
>> -	/* Default 8bit RGB fallback */
>> -	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>> +	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>>
>>  	*num_output_fmts = i;
>>
>> ==><===============================
>>
>> Neil
>>
>>>
>>> Regards,
>>> Biju
>>>
> 

