Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D6677BDE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 18:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjHNQ2D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 12:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbjHNQ1r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 12:27:47 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF69E65
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 09:27:38 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a751d2e6ecso3889260b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1692030458; x=1692635258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qnJ0ZfY7u/gXkrzwVapX3Ay2G8CLjKdQBzM1RBGM0BQ=;
        b=UQQDzxaHGhsKMiWZPPE8BPDYp67wsSvrpMGTflKv3HEGQOle7nl7ezFKqMj6hQmX+c
         vADQRxxlUq1EZuqpG4Mi5jzuiApsa8mTqj5czjVShtf3eVEK0tI5n52Uakl5F5QIV5lK
         k4XZfc+ztqoL5kzoxI7FXX0o/rNsElVrtRCYjod1gV3eqr7u36eMiQVrezmqWD6Ayloj
         jIc7jiZMfgYeVAOz8Ef1vz4N1XNXkCYAgjw/l0XtqFqmWzKTfwpyVELnIJS38Og7neq9
         xkW9m7yFWTwxkTQbgGpcqLtHnD2EPSVn2SLd4ZPzHHE2JrGyooNz77XA23D15Ttlr1Jz
         D1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030458; x=1692635258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnJ0ZfY7u/gXkrzwVapX3Ay2G8CLjKdQBzM1RBGM0BQ=;
        b=DiXDiwanTffSIh/j2Sl/Y7RQdwLJ3+oxbKII+Ur0Uou2hhOQGPranhuVxYQSLi9ibB
         tVyd1xTN7dF/U8RT/nzd/WWCk0oD2Z0gLBQrZ5q6BfGRKnwXMw0QS+rIBdBXxI04g8Qq
         lAjfr16mjQ9T0nmY/i56tLK/wZMp4yrY1IvSI2GoJGIglOpWXP13+jCOSkZlj2/jcjGu
         mZ5t7ir3FvpT/xqQ51uy/NHChMh4QNl0C6EXdk/Y78sQM2WcM0Qv2yOZAbu3UjvqnA76
         nRcfGYZ6uhR7luctIGxtvPd3lvsJ+L9gjEBVfg+lMxXRe7ugV+SpJdAaxXkfKSwLqbH0
         sIZw==
X-Gm-Message-State: AOJu0Yx7cMnViUxFBKTnytCsO66ePLuCtWw2UxWHjXz5BAQiMcOAP5aX
        AOmnnDAmk24t13+BbCDQ9yz0ww==
X-Google-Smtp-Source: AGHT+IGN+ncCNSUGt4HpvzhXjUkm63Eh7Se1W+uHEqnDbW3D5dUgLyYrM4FddwdZOSP1etM7pSbv7w==
X-Received: by 2002:a05:6358:9188:b0:133:4ce:4e8c with SMTP id j8-20020a056358918800b0013304ce4e8cmr5843777rwa.29.1692030457876;
        Mon, 14 Aug 2023 09:27:37 -0700 (PDT)
Received: from [192.168.68.66] (69-165-247-94.cable.teksavvy.com. [69.165.247.94])
        by smtp.gmail.com with ESMTPSA id g2-20020ac84b62000000b00403c1a19a2bsm3173601qts.92.2023.08.14.09.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 09:27:37 -0700 (PDT)
Message-ID: <25a7fd96-d0a4-2d7f-dcc5-50abd048c6f4@igel.co.jp>
Date:   Mon, 14 Aug 2023 12:27:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kieran.bingham+renesas@ideasonboard.com, taki@igel.co.jp,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
 <20230803234703.GJ9722@pendragon.ideasonboard.com>
 <20230803235315.GL9722@pendragon.ideasonboard.com>
 <20230804000615.GN9722@pendragon.ideasonboard.com>
 <bf2001af-00f2-3a1e-8b79-5747e6607a12@igel.co.jp>
 <20230804155249.GJ12951@pendragon.ideasonboard.com>
 <20230814104655.GB5723@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Damian Hobson-Garcia <dhobsong@igel.co.jp>
In-Reply-To: <20230814104655.GB5723@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,


On 2023/08/14 6:46, Laurent Pinchart wrote:
> On Fri, Aug 04, 2023 at 06:52:51PM +0300, Laurent Pinchart wrote:
>> On Fri, Aug 04, 2023 at 11:49:32AM -0400, Damian Hobson-Garcia wrote:
>>> On 2023/08/03 20:06, Laurent Pinchart wrote:
>>>> On Fri, Aug 04, 2023 at 02:53:17AM +0300, Laurent Pinchart wrote:
>>>>> On Fri, Aug 04, 2023 at 02:47:04AM +0300, Laurent Pinchart wrote:
>>>>>> On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
>>>>>>> Add additional pixel formats for which blending is disabling when
>>>>>> Did you mean "disabled" instead of "disabling" ?
>>> Oops.  Yes, that's exactly what I meant.
> I'll fix this locally.


Thank you very much.


>
>>>>>>> DRM_MODE_BLEND_PIXEL_NONE is set.
>>>>>>>
>>>>>>> Refactor the fourcc selection into a separate function to handle the
>>>>>>> increased number of formats.
>>>>>>>
>>>>>>> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
>>>>>>>    1 file changed, 32 insertions(+), 17 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>>>>> index 45c05d0ffc70..96241c03b60f 100644
>>>>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>>>>> @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
>>>>>>>    	DRM_FORMAT_Y212,
>>>>>>>    };
>>>>>>>    
>>>>>>> +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
>>>>>>> +{
>>>>>>> +	u32 fourcc = state->format->fourcc;
>>>>>>> +
>>>>>>> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
>>>>>>> +		switch (fourcc) {
>>>>>>> +		case DRM_FORMAT_ARGB1555:
>>>>>>> +			fourcc = DRM_FORMAT_XRGB1555;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_ARGB4444:
>>>>>>> +			fourcc = DRM_FORMAT_XRGB4444;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_ARGB8888:
>>>>>>> +			fourcc = DRM_FORMAT_XRGB8888;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_BGRA8888:
>>>>>>> +			fourcc = DRM_FORMAT_BGRX8888;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_RGBA1010102:
>>>>>>> +			fourcc = DRM_FORMAT_RGBX1010102;
>>>>>>> +			break;
>>>>>> Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
>>>>>> intentionally ?
>>> Yes, it was intentionally left out for the time being for the
>>> reason that you noted (i.e. DRM_FORMAT_XRGB2101010 not
>>> being handled by the DU driver).
>>>
>>>>> It looks like DRM_FORMAT_ARGB2101010 will require a bit more work, as
>>>>> DRM_FORMAT_XRGB2101010 is not handled by the DU driver at the moment.
>>>>> Let's do so with a patch on top of this series.
>>> Yes, I was thinking the same thing.
>>>
>>>> Replying to myself again, the datasheet doesn't explicitly list
>>>> DRM_FORMAT_XRGB2101010 as supported, but the generic mechanism to
>>>> specify the location of the components should work fine for that format.
>>>> Is this something you would be able to test ?
>>> Unfortunately I don't have a Gen 4 system on hand to test the 2-10-10-10
>>> formats with.
>>> I will double-check with the office in Japan, but I don't think that
>>> they have one either.
>> Tomi, is this something you could test ?
> Replying to myself, this is something we could test, but let's not delay
> this series, new formats can always be added on top.

Ok, great.  Thanks very much.


Damian

>>>>> There's no need to send
>>>>> a v2, I can handle the simple change in the commit message if you let me
>>>>> know whether my comment is right or wrong.
