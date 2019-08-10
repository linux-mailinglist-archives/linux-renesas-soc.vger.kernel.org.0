Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6949888D13
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Aug 2019 21:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfHJTra (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Aug 2019 15:47:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42544 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfHJTr3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Aug 2019 15:47:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so47758820pff.9;
        Sat, 10 Aug 2019 12:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nZ/7YOyOKU/WfMjnpN3j2xVNlX2pQ0OoVYVLoACqeO0=;
        b=g2iZgi1yw3okZWCmRGIX3x5A8gm5qJ0vEdNucIP0iGAKXyaAv8kPbmJx/E+rWTduvc
         pRfCNL3DmWbHPV9doP1SjaCSrgHdtZZzWPqN/UO7heTIUWEvuUbkw8Ab2DWpsUn/AUFL
         tWVRkDRzNraAy+h0V4Ijpn827RdfYPjepFyMqnpCSlHGJqNCvph9pXVooxc+sdtreW4V
         RpZfKTi9osEDSYfdYdgj08CHlSoUDqaiw4on936Bif3S+XaQFvbTqmHn5tOqvVMlWrs4
         h2P09K0jxbrHmxo76pkIx6STejVcFc2NW+in4e1Vh4VzMO06zwNqRCf9MKb/MMsYE3K8
         HSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nZ/7YOyOKU/WfMjnpN3j2xVNlX2pQ0OoVYVLoACqeO0=;
        b=elMz9QoOvnff9gacNBTBFwdBQICYN36vIqBcZw8tbz5wj5ePWlUG01NV/tU5HRz7EF
         2kgs3v/2a51Ue5Z6bHFr8U13Dq5vEFApp/WpHfNxwqH+da1/JN+sMD+ynGhpayllk4RO
         8+gYfkIDzKhMDEgMDqFpFpe7wl3DSmY+bIj+Sh9Oe0Rt4WzmcdDSj4BtRRE835nhvIld
         PFxAPQSZC6DAgekSG4SWyRbvWCkEWEbZJdXlMFfmcLg0uXwHEiibAYlrTcONvX1+G2rn
         aQKGtdEU6eMeaywNzDHwN3F1hQ+DmRbromqk5HQr4/JVQ4AmLFC3kGJvTl1dWRz4F/rI
         /oBA==
X-Gm-Message-State: APjAAAXHUPEgMktd7A/DLKn8RMHcZGmXGj2gfLSVHvBi5vbTyr8CBiK4
        ib2b71tUv+E1toqzlEdiVEI=
X-Google-Smtp-Source: APXvYqy/7dzUAbycF72ZXo5CCBqwAIip2zseR88VEZXjmMV67whU6RczcZC2js2/9pRDFkvVwpeNVg==
X-Received: by 2002:a62:27c2:: with SMTP id n185mr27257547pfn.79.1565466448957;
        Sat, 10 Aug 2019 12:47:28 -0700 (PDT)
Received: from [192.168.1.70] (c-73-231-235-122.hsd1.ca.comcast.net. [73.231.235.122])
        by smtp.gmail.com with ESMTPSA id r27sm127945726pgn.25.2019.08.10.12.47.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2019 12:47:28 -0700 (PDT)
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
To:     Marek Vasut <marek.vasut@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190809173321.19944-1-marek.vasut@gmail.com>
 <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
 <10818888-6476-f4b1-1a2e-e10c3159327f@gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <5d393d4b-b8dc-39e1-991e-de367649cf58@gmail.com>
Date:   Sat, 10 Aug 2019 12:47:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <10818888-6476-f4b1-1a2e-e10c3159327f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/10/19 6:39 AM, Marek Vasut wrote:
> On 8/10/19 12:34 AM, Rob Herring wrote:
>> On Fri, Aug 9, 2019 at 11:33 AM <marek.vasut@gmail.com> wrote:
>>>
>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>
>>> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
>>> types, which cannot work well.
>>
>> It never returns a negative. The negative is used as an uninitialized
>> flag. Note quirk_state is static.
> 
> It's still mixing boolean and signed int types though, which isn't right.

From a code readability aspect, Marek is correct.

The code author used "stupid (or clever) coding tricks" (tm) to save a
little bit of memory.  A more readable implementation would be:


static bool of_empty_ranges_quirk(struct device_node *np)
{
        /*
         * As far as we know, the missing "ranges" problem only exists on Apple
	 * machines, so only enable the exception on powerpc. --gcl
         */

        if (IS_ENABLED(CONFIG_PPC)) {
                /* Cache the result for global "Mac" setting */
                static int quirk_state_initialized = 0;
                static bool quirk_state;

                /* PA-SEMI sdc DT bug */
                if (of_device_is_compatible(np, "1682m-sdc"))
                        return true;

                if (!quirk_state_initialized)
			quirk_state_initialized = 1;
                        quirk_state =
                                of_machine_is_compatible("Power Macintosh") ||
                                of_machine_is_compatible("MacRISC");
                return quirk_state;
        }
        return false;
}


I would also rename of_empty_ranges_quirk() to something like
of_missing_ranges_is_ok() or of_missing_ranges_allowed().
"quirk" does not convey any useful information while my proposed rename
describes what the function is actually checking for.

The comment that I added is currently in the caller of of_empty_ranges_quirk(),
but instead belongs in of_empty_ranges_quirk().  When I read that comment in
of_translate_one(), my reaction was to look for the check for powerpc in
of_translate_one() and to be puzzled when I could not find it.  I also
modified the comment for the changed context.  Thus the "--gcl" portion
of the comment should also be removed from of_translate_one().

The more readable implementation (IMNSHO) uses slightly more memory and
slightly more code, but it is more direct about what it is doing and thus
more readable.

-Frank


> 
>>> Replace that with boolean only and fix
>>> usage logic in of_translate_one() -- the check should trigger when the
>>> ranges are NULL and the quirk is applicable on the hardware.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Frank Rowand <frowand.list@gmail.com>
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> To: devicetree@vger.kernel.org
>>> ---
>>>  drivers/of/address.c | 9 +++++----
>>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>>> index b492176c0572..ae2819e148b8 100644
>>> --- a/drivers/of/address.c
>>> +++ b/drivers/of/address.c
>>> @@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
>>>         return NULL;
>>>  }
>>>
>>> -static int of_empty_ranges_quirk(struct device_node *np)
>>> +static bool of_empty_ranges_quirk(struct device_node *np)
>>>  {
>>>         if (IS_ENABLED(CONFIG_PPC)) {
>>>                 /* To save cycles, we cache the result for global "Mac" setting */
>>> @@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
>>>                         quirk_state =
>>>                                 of_machine_is_compatible("Power Macintosh") ||
>>>                                 of_machine_is_compatible("MacRISC");
>>> -               return quirk_state;
>>> +               if (quirk_state > 0)
>>> +                       return true;
>>>         }
>>>         return false;
>>>  }
>>> @@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>>>          * This code is only enabled on powerpc. --gcl
>>>          */
>>>         ranges = of_get_property(parent, rprop, &rlen);
>>> -       if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
>>> -               pr_debug("no ranges; cannot translate\n");
>>> +       if (ranges == NULL && of_empty_ranges_quirk(parent)) {
>>> +               pr_err("no ranges; cannot translate\n");
>>
>> This is wrong. If you have NULL ranges and not the quirk, then no
>> ranges is an error. IOW, if you are getting an error here, you have an
>> error in your DT (because I assume you are not working on a PASemi or
>> Apple system).
> 
> The way I understand the code is that
> if (you have no ranges in the DT) AND (the quirk is applicable) then
> print the message. Which is what this patch does.
> 
> Am I missing something ?
> 

