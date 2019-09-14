Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F220B2C22
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2019 18:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfINQGS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Sep 2019 12:06:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51253 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfINQGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Sep 2019 12:06:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id 7so5673207wme.1;
        Sat, 14 Sep 2019 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qq+vpuWI//ej0VPnjjkQfA9irYY7dGskojmrB9XGnOk=;
        b=lNaBVHZf829G3b5kp5lpEwXb9B8sR/z7fcDRKbOliOSxuCkwMy/7Z/dgIzz2ivWeKz
         skd9ykAGHtVvThi+eM6Snzh00i6ThJtwdaqFymPJYggGh/w+iRwMnh+EkkUvzXn3WLUu
         mlMONtH+iF+uM0Lfp30Hl0NDrT1aCMzXtv3xXKxpJH6NOcRFew6kPA+wPaZc2isZFjI6
         XiJ87r1GljdsXs0acRpbxOM9O0o8CrIoAJlYoJWOxxnW5KD+DQyHuwRToJfQ7i7LDRxs
         8Czsj5Qexg+rq3cR9vDf8c4hOWHvoNCQhf3W0EEAQx/s0SkLP+zpuNcJyeoLYwYs25tt
         1ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qq+vpuWI//ej0VPnjjkQfA9irYY7dGskojmrB9XGnOk=;
        b=CsIRqeBAfLNtc6IX+FSNXgWSnKD8WPu/QqQxCTvOMOpNvNiOvcfjQM5sbGWy6PIY/w
         2fekPqxsScqJ82qUq8cwZgmP8hFrPw/H+566YHLggylHr3ys+ciIadBdqzYljo2uiIz3
         tnszJcm+Bq1T7ukxD7LWgILiedpzjtNoNyYxefQGBACYjP9ZRbrd+U+8I0o/gYfwDMzf
         TmV3x2VmJNNP9/4AgQG+NHVVMRVYuHYzFgqkspPxbW1cX1VNgN7M2E7l0FUCqgke4ngn
         O4DILwa6BgwL+TtbpuxZPsbq+hinzfTSaoCQAFV01E3+8PekGW9B6+C83wVX69iDf+9r
         JA6g==
X-Gm-Message-State: APjAAAXFp8MkT0vrWtQt+n4Vqd0SOMTIe/S0WoWilFM2yx8R9y7kyf7o
        EcLwmnaIFT0NVSW7Yxy29bhw4d8K
X-Google-Smtp-Source: APXvYqwjx27R2a2FpKkgO9ybZ5/1Ew4lWTq+CR46V4bfMKOuLtDaTex4S8Mw3rV6e22ViM8j/y/kqg==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr8284388wmb.113.1568477175800;
        Sat, 14 Sep 2019 09:06:15 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id a205sm13119130wmd.44.2019.09.14.09.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2019 09:06:15 -0700 (PDT)
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190907161537.27258-1-marek.vasut@gmail.com>
 <CAL_JsqJk40bRhvrtjtpCzhm_jTX=D5pEgWHd8csrVDn77nwWvQ@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d490a735-32f2-5aa4-4782-81c8c2522337@gmail.com>
Date:   Sat, 14 Sep 2019 18:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJk40bRhvrtjtpCzhm_jTX=D5pEgWHd8csrVDn77nwWvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/9/19 7:37 PM, Rob Herring wrote:
[...]
>>  drivers/of/address.c | 47 ++++++++++++++++++++++++--------------------
>>  1 file changed, 26 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 978427a9d5e6..df82ef88823f 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -473,21 +473,42 @@ static struct of_bus *of_match_bus(struct device_node *np)
>>         return NULL;
>>  }
>>
>> -static int of_empty_ranges_quirk(struct device_node *np)
>> +static bool of_missing_ranges_is_ok(struct device_node *np)
>>  {
>> +       /*
>> +        * Normally, an absence of a "ranges" property means we are
>> +        * crossing a non-translatable boundary, and thus the addresses
>> +        * below the current cannot be converted to CPU physical ones.
>> +        * Unfortunately, while this is very clear in the spec, it's not
>> +        * what Apple understood, and they do have things like /uni-n or
>> +        * /ht nodes with no "ranges" property and a lot of perfectly
>> +        * useable mapped devices below them. Thus we treat the absence of
>> +        * "ranges" as equivalent to an empty "ranges" property which means
>> +        * a 1:1 translation at that level. It's up to the caller not to try
>> +        * to translate addresses that aren't supposed to be translated in
>> +        * the first place. --BenH.
>> +        *
>> +        * As far as we know, this damage only exists on Apple machines, so
>> +        * This code is only enabled on powerpc.
> 
> You dropped Grant's name on this. Wouldn't matter too much as we can
> run 'git blame', but now we have another level to trace back thru.

I think that's what Frank suggested, since he reworded this message before.

>> +        */
>> +
>>         if (IS_ENABLED(CONFIG_PPC)) {
>>                 /* To save cycles, we cache the result for global "Mac" setting */
>> -               static int quirk_state = -1;
>> +               static int quirk_state_initialized;
> 
> This can be bool too.

Fine

[...]

-- 
Best regards,
Marek Vasut
