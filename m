Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6433118CED3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 14:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgCTN1P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 09:27:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42506 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCTN1O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 09:27:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id q19so6347621ljp.9;
        Fri, 20 Mar 2020 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wc4bfjrR+uREaIIZaXwsklhD3AeNPjVXLEgTl+fkFC8=;
        b=D5pq5EEfn55+AsWz/yn9b30LsZ4b40DJoub3Vv9dg1p0+ouxIPliu6inR7N0AIY0CS
         L+6oHD+IoJFVQCLsrcfJ32s+nVNe54KTCw3jq2PRP1dBF0Dkx7snD/fzFZGfFdPTo5Jc
         8iBYW1H+xkGs/aBwWC/EFdFk1F8qtnjDYxVvZDlqqysJ+PhloDoo1uuxJFnvVByEO/4z
         zD1afdj5LQSrUvfcKujfGHdZr3Zt1iDh4ERUknHtMpfM22Mw0veoS3ffn+cSUVsUAcMs
         addb/FGOVI4BpFv4fRA7PAdCe1Buyqc8XVUCgkg56RbOBI/pHJ2tJncDj3eCjRXDfNL7
         dHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wc4bfjrR+uREaIIZaXwsklhD3AeNPjVXLEgTl+fkFC8=;
        b=ZRATtNNCD0grREFl+LtMlJ9VJhVTo5xozPs4oJxTuH26ljCdGGzTJDCFBT2K1FmhPY
         eSkMS7NT5BnrY8QgELEWv9acfaMOMWo8Jau2JzVMddZUndhxcY2LAX/lvGRfP4uyYeFq
         0bHXG7dEXgL5kFjZYDyo+1IEaogTeOr/sQC/i8dduGobyCq8tw0j75YulQIVyl/K2sEQ
         n/qxVKofHFBkLhZE/jYXGxUu/DfOZxFapVltQkQltxVyRfi5Bb6LM3/jUJ0cXGj/p/MC
         bSJSDD/ZyiGy+PJTavsNK9D6GkkR6I9s5dMZ2nj1N+7i9YqMQJdlW7yMwlvwGdhnoA93
         36TA==
X-Gm-Message-State: ANhLgQ2Jrq+eiR8syiWG9fi0QKFWF8aGK8dmvsXNRfSkxBSY5bBPtJ5/
        53DZgVVa3TGzppUZJl2sktqGbK6x
X-Google-Smtp-Source: ADFU+vs9X33ooryzjZDTx+xNfE4vhyGx9fcHpid/WypfKXilGP2kWn2XGuDr4xWIPUYqj1dEeoo3kw==
X-Received: by 2002:a2e:8095:: with SMTP id i21mr5526453ljg.193.1584710829378;
        Fri, 20 Mar 2020 06:27:09 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id c2sm3315589lja.84.2020.03.20.06.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 06:27:08 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Eric Miao <eric.miao@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be>
 <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
 <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
 <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com>
 <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0c70b161-64e8-7765-cc4f-112c2cec9a29@gmail.com>
Date:   Fri, 20 Mar 2020 16:27:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

20.03.2020 12:18, Geert Uytterhoeven пишет:
...
> Thanks for the info!
> 
>> I recalled that CONFIG_THUMB2_KERNEL=y is set in my kernel's config and
>> disabling thumb2 build fixes the problem. Please correct it in the next
>> version of the patch, thanks in advance.
> 
> Interesting.  I enabled CONFIG_THUMB2_KERNEL=y, and it doesn't make
> a difference for the few board combos I've tried (with/without appended DTB).
> So it must be related to ATAGS.  Will dive deeper...
> 
> P.S. I never realized CONFIG_THUMB2_KERNEL=y had such a big size
> impact: my kernel shrunk by ca. 1 MiB.

A quick observation tells that fdt_get_mem_start() returns a wrong
address with CONFIG_THUMB2_KERNEL=y, I haven't tried to look further yet.

Disabling all ATAGS options in kernel's config doesn't help.

Kernel config:
https://gist.github.com/digetx/b7c4e1d2d4dae0c5566748c0d7f1e884
