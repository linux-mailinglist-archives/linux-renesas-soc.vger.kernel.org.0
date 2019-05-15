Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD7431EA13
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfEOIZP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:25:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34060 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfEOIZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:25:14 -0400
Received: by mail-wr1-f66.google.com with SMTP id f8so1627358wrt.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2019 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1RJ4wJraO0JKEEKi7q0XAZAfeNAA5nMmUuCn84Wyo+M=;
        b=FQcA4CgwUYbJJKI4XTcXfFC8PdZW9xysNz0dCBghlkQVjZyYgj2ux99SundzoibPt9
         +9dx6lcIUSPlegcuL+YZoEhhFO9JqT20RmdSC0+NmG/ni1M4OTZCl30n8eLkqcT5+IBg
         K2U+7kLWBI9oo4EBBdvatpF8221D/RSxfgCql3lg7CzERLJpccy8gy8g+eSBbtnGaPd1
         90kiWobbMBL+Zwz2gOSGY2TpsQXlbexLoQ5cIvFPytfBTPMxC69eZX1aY+Q09DzvDKac
         43c9qxVhcjg21LJzQEw2Vf6VfJ0J+vdTRoGhya9fEc6eV6YILbj3wMb8vI3J01HRmf3Y
         UZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1RJ4wJraO0JKEEKi7q0XAZAfeNAA5nMmUuCn84Wyo+M=;
        b=GZgfdKs+tQIxeExuF+wWAc2Eq1RpCY5+LRV8CWZT1fuBA/FosCHyqnPqUXPKftG2HR
         c/ZTM4GYNSj5FTXnsH6+AqrPfc1g1AapgxMNFoEaxSJtrkq+1xJWj8K/6ZrM3ZEW49xX
         9ZtOQpt9D9foBD2vvDMEbHZOf/0YArHK7+Vh6RsVIp9Kmys13RuQP3UdcDjMCkOGJX5W
         sSaW4OE8fMPXtokTAMqDbVBCi4e6Wney6Hs8uzI1GEPt9OWLZxvmWAikn2UVmeU0G3NE
         E+9OsrEyMFedojcxb+xPZun8r4yg0wgL51+a5BRW2QA3NijBhn+VPxVohywiHXGH7ny+
         a4Bg==
X-Gm-Message-State: APjAAAULbTin6Jq19jdqV8D5RReKqTuYpgF0LlY8yP4ozoERl3wtLo6l
        9YRmsLXxseZ0edTXTVV+8CyD0hCh
X-Google-Smtp-Source: APXvYqxbfmImKl0PFsy8mOvTN8YOoICMxG0cTOqHUJtK7C18xUApX0Xl5Bw9RVCz3xS1U9v2fpsG/A==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr21494130wrn.201.1557908712873;
        Wed, 15 May 2019 01:25:12 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v184sm1849944wma.6.2019.05.15.01.25.11
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 01:25:11 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190502140634.4529-1-marek.vasut@gmail.com>
 <CAMuHMdVGAq1XgSohBjc8i4c_o-N-yWGedS_LLS_Apr4Bx10xGQ@mail.gmail.com>
 <fa79e656-d71a-6f3d-21a5-8acac72e20f0@gmail.com>
 <CAMuHMdXrK7CMhBjFXAYX4wUPK=4Q2LpBCu+65-t5Y7-VjEBsog@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <b0dd348d-2a14-96d4-da19-3984dfe1bbeb@gmail.com>
Date:   Wed, 15 May 2019 10:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXrK7CMhBjFXAYX4wUPK=4Q2LpBCu+65-t5Y7-VjEBsog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/3/19 8:13 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Fri, May 3, 2019 at 5:18 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 5/3/19 2:36 PM, Geert Uytterhoeven wrote:
>>>>  &rwdt {
>>>> @@ -309,6 +314,8 @@
>>>>  };
>>>>
>>>>  &iic3 {
>>>> +       pinctrl-names = "default";
>>>> +       pinctrl-0 = <&pmic_irq_pins>;
>>>
>>> Given Blanche has a single device connected to irq2, I think it makes
>>> sense to move the pinctrl properties to the pmic node below.
>>
>> It makes blanche somehow inconsistent with the other boards, but if you
>> insist ... ?
> 
> Typically the pinctrl properties are part of the device node that uses them.
> For the other boards, that's not possible, as they are shared by all PMIC
> nodes. Hence the other boards are the exceptions, actually ;-)
> 
> Note that for multi-PMIC boards, adding the pinctrl properties to a single
> PMIC node won't work, as that would break:
>   1. The case where the driver for that PMIC is not compiled in,
>   2. The R-Car Gen2 regulator quirk.

Well it wouldn't work because it's shared by two PMICs and thus two
driver instances in the first place.

-- 
Best regards,
Marek Vasut
