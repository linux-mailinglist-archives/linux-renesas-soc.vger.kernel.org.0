Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1D8837B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Aug 2019 19:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732489AbfHFRMc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Aug 2019 13:12:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45127 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfHFRMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Aug 2019 13:12:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id n1so2358935wrw.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Aug 2019 10:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5pt7GwViJVcu98WqISKhm+O7h6/+k0pCneC7dXHoksE=;
        b=b48QfbMBBEEkiA4WKUMyEMmjBPEJtKoO7DQxyFSbXDtHPa6K6jIsrTdbqfEsj1KuHb
         COmQgiNJvc4ge9/NYXD6HJ4cDnsfCqnRhLkMO88a20TeRXdeyuPG6El3b+PG6sBJrlpl
         2hQ40f+g46+rRC2Be9pr8DoIBJEt/tCwzX6PKJ3ozMv+U4pbfjJNmUw3tviNU5ihxkDd
         FBISp0sSwt6jcfel3uD0UYXO2YrTNCgRUdPaSZ2zHaxW5R3pwLSXqPXNA+5ndRAp4Dsl
         7n4neK7WH8bumcFigIWqPp6LDQMQMe38jQp7nELQEMZW5jHHmQ02c8SLj/fFvPGVD2KT
         8rVw==
X-Gm-Message-State: APjAAAXCx/8Ho2doEvlTNpJE1N90O4axbCEMymZ2TDErHy8ZERybkw0k
        4T2TbXR1H+oUs0fvs4xxyL8zRA==
X-Google-Smtp-Source: APXvYqxOGXgEKNZko/bV9lJddN4v/8LxkkiWU8g3sydYTTg4GPL16jPiAXu91VDfodAuZCHJsk4PfQ==
X-Received: by 2002:a5d:6287:: with SMTP id k7mr5550570wru.108.1565111549697;
        Tue, 06 Aug 2019 10:12:29 -0700 (PDT)
Received: from [192.168.0.24] ([181.120.177.224])
        by smtp.gmail.com with ESMTPSA id h16sm103858378wrv.88.2019.08.06.10.12.24
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 10:12:29 -0700 (PDT)
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
 <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
 <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
Date:   Tue, 6 Aug 2019 19:12:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

On 8/6/19 9:22 AM, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Tue, Aug 6, 2019 at 12:25 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> On 7/31/19 9:44 PM, Wolfram Sang wrote:
>>> Hi Javier,
>>>> The other option is to remove i2c_of_match_device() and don't make OF match
>>>> to fallback to i2c_of_match_device_sysfs(). This is what happens in the ACPI
>>>> case, since i2c_device_match() just calls acpi_driver_match_device() directly
>>>> and doesn't have a wrapper function that fallbacks to sysfs matching.
>>>>
>>>> In this case an I2C device ID table would be required if the devices have to
>>>> be instantiated through sysfs. That way the I2C table would be used both for
>>>> auto-loading and also to match the device when it doesn't have an of_node.
>>>
>>> That would probably mean that only a minority of drivers will not add an I2C
>>> device ID table because it is easy to add an you get the sysfs feature?
>>>
>>
>> I believe so yes.
> 
>> As Masahiro-san mentioned, this approach will still require to add a new macro
>> MODULE_DEVICE_TABLE(i2c_of, bar_of_match) so the OF device table is used twice.
>>
>> One to expose the "of:N*T*Cfoo,bar" and another one to expose it as "i2c:bar".
>>
>> I expect that many developers would miss adding this macro for new drivers that
>> are DT-only and so sysfs instantiation would not work there. So whatever is the
>> approach taken we should clearly document all this so drivers authors are aware.
> 
> You could add a new I2C_MODULE_DEVICE_TABLE() that adds both, right?
> Makes it a little bit easier to check/enforce this.
>

Right, we could add a macro for that. Although it should probably be called
I2C_OF_MODULE_DEVICE_TABLE() or something like that since is specific to OF.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
