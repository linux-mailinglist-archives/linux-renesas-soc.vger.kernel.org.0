Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B25FF88B98
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Aug 2019 15:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfHJNj1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Aug 2019 09:39:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38197 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfHJNj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Aug 2019 09:39:26 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so100682568wrr.5;
        Sat, 10 Aug 2019 06:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5/3FfEJPS8imxnDmySQlXeFmpaLpmd+YEDEVNi+1uS4=;
        b=rvTCHkxgDzNan3ofgDHwmx6BSxM7wtCBd5Wst5AouLKoHjyH5KYRBF7FW8/7FdM+Xz
         6fd6NgtlztJl0Tj/t7w62gdLYG62PwE6Il9mU3zvezzdMzZTbGmv4jXX7kHMIY+UW3xu
         qoSbLSqp6xanYBg5ebEsC07WA+tQGXlmdjUsHZiz5h9joXzM9g/AJYrh9EJc7TiW5yuF
         OKecUmtbw1R9GdHYB+4uT2Oq30NDNWmBPyUY0hGx9M6fdfUysqP/0MjkmwZxUawq4jN3
         BtqidtTnoJnx3Qm1M26fMjAYU8QFdPMdS/Ceu/KR03HoO1zbhSXj89aeaIefM3A3k+ln
         6LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5/3FfEJPS8imxnDmySQlXeFmpaLpmd+YEDEVNi+1uS4=;
        b=oqcmWIXtGdVfPUxFgVUWQTIV0p4eQy+oSmi9A99Krf0GUWG4u/kC+egD0Mux5e8Wyb
         ArtCc90LdirP2nWmQXsvzFDwfEza2Lfdhu0lEBiJDZKSEP1h+06Qji/oj49u/o0+0/cr
         tNOzznir+rGgPYFEfmqhN3tQ9NGQ7VrEDZC/rBZY2IkSyaB45VwKXFxE4+UxBwcdoVY/
         bQbDXws14OVgTAnq3MpFR5+gadJxStAoT5LdDUt2XCwxQffkg7b1M2vkYbZdWWQlk1Ir
         6hc0A38h9sDUXpO6lPmtFFsK6rwrWllH1dN3y+s4clBv3cdy/IH0ZJIh8Q8xZaKbv4wD
         qK1A==
X-Gm-Message-State: APjAAAXelxWlk8N4YzA0bONHCs/uypBQ2m/p/ZpHAol8qufx7VmSGlpK
        ymXiOQIGggE6JsHYbJ6nS4jONZjY
X-Google-Smtp-Source: APXvYqwxykXAH80d8sDSUVEKLOyd7RLhVgZwv8X755hUhNoTupCPwhX7gU8s6RmxkZx26keRJlsAlw==
X-Received: by 2002:a05:6000:12c3:: with SMTP id l3mr26496248wrx.100.1565444363973;
        Sat, 10 Aug 2019 06:39:23 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id e4sm21532075wrh.39.2019.08.10.06.39.22
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2019 06:39:23 -0700 (PDT)
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190809173321.19944-1-marek.vasut@gmail.com>
 <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <10818888-6476-f4b1-1a2e-e10c3159327f@gmail.com>
Date:   Sat, 10 Aug 2019 15:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/10/19 12:34 AM, Rob Herring wrote:
> On Fri, Aug 9, 2019 at 11:33 AM <marek.vasut@gmail.com> wrote:
>>
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
>> types, which cannot work well.
> 
> It never returns a negative. The negative is used as an uninitialized
> flag. Note quirk_state is static.

It's still mixing boolean and signed int types though, which isn't right.

>> Replace that with boolean only and fix
>> usage logic in of_translate_one() -- the check should trigger when the
>> ranges are NULL and the quirk is applicable on the hardware.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Frank Rowand <frowand.list@gmail.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: devicetree@vger.kernel.org
>> ---
>>  drivers/of/address.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index b492176c0572..ae2819e148b8 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
>>         return NULL;
>>  }
>>
>> -static int of_empty_ranges_quirk(struct device_node *np)
>> +static bool of_empty_ranges_quirk(struct device_node *np)
>>  {
>>         if (IS_ENABLED(CONFIG_PPC)) {
>>                 /* To save cycles, we cache the result for global "Mac" setting */
>> @@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
>>                         quirk_state =
>>                                 of_machine_is_compatible("Power Macintosh") ||
>>                                 of_machine_is_compatible("MacRISC");
>> -               return quirk_state;
>> +               if (quirk_state > 0)
>> +                       return true;
>>         }
>>         return false;
>>  }
>> @@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>>          * This code is only enabled on powerpc. --gcl
>>          */
>>         ranges = of_get_property(parent, rprop, &rlen);
>> -       if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
>> -               pr_debug("no ranges; cannot translate\n");
>> +       if (ranges == NULL && of_empty_ranges_quirk(parent)) {
>> +               pr_err("no ranges; cannot translate\n");
> 
> This is wrong. If you have NULL ranges and not the quirk, then no
> ranges is an error. IOW, if you are getting an error here, you have an
> error in your DT (because I assume you are not working on a PASemi or
> Apple system).

The way I understand the code is that
if (you have no ranges in the DT) AND (the quirk is applicable) then
print the message. Which is what this patch does.

Am I missing something ?

-- 
Best regards,
Marek Vasut
