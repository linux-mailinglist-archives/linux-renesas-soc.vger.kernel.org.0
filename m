Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B401B2B32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 17:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgDUPbe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 11:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725870AbgDUPbd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 11:31:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D2DC061A10;
        Tue, 21 Apr 2020 08:31:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w20so8153238ljj.0;
        Tue, 21 Apr 2020 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wtUCUiYZffBnrc+hszmiZBVbrcWDpLsAMtA40Limz8k=;
        b=cnEk74tXOooz70SpqP7DT3KV7T9QZmQbO4RFs8pWicqYrphIYWhuRBA1JeQDVa8iAj
         tCuG7RzMweHretX84CxyA53xPl0w1WqVpa4zSF67dXQ0IHa8gYb24N/QNkMeIJGm66wG
         wrWroxjqbaDcpMybh9TJnAzRGaBqj4LaiSK3owx+xke2lDCit/D7XWzy8fLFHnxjVfRh
         TvWrl9W476OczqA56ben2Zk7X6C7sq/RDZggBAiMWsmbziYUmy8JlYMq/i14gMm5nP29
         6W62YGfkY/PGWUQsVLEvm4N+s2xpN02ocYEL/av1G/YIF8pNrJaLaQ8tvpVx0mWrQNCg
         rm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wtUCUiYZffBnrc+hszmiZBVbrcWDpLsAMtA40Limz8k=;
        b=LiXjrM6mBY+0TRGcWwp2DWioJNnm9Ql9agcfuAbhZMjAWC8ltTLDqlLDJeOKfLYiAy
         dzw7H6swze4zBvAdF8Ci6wwCCY1HO5gIFLtTHXfi3jspqWtG+L/PFi/SWKhEvDtH3sux
         6fp+PrFsUkDbG3mXmwlJPEiYDjaPFv1ChsOwrG3dirjKlYNZAdNdjw/oi6GknOeiv14E
         WmoONHHtSRkOf/v1z0lyJPsLwv//1DhRb8kqfL05IHaJO6OSXIobVWZD+O3wSnagpdFP
         SmxafHMugNWiKV1LUA3e8QPcWFj2Mhv0hvXoBQ6mZzGXDCP3DLEaOYm1kUYkPQZ14sas
         SPHw==
X-Gm-Message-State: AGi0PuaI4NKEAjjznYyA8ga205iOvYxWWQWOWAAAXuMOF7n69G1ooxtd
        CC0IcluytDGyl5PeRTVeGGtu3XN5
X-Google-Smtp-Source: APiQypIv0yCfzacWSwYjpZnJL0NsfUjoXNHzP9kQruZGSH1JvuatBTBYOvzzT7arz2q0DKwR7Uzx0w==
X-Received: by 2002:a2e:910e:: with SMTP id m14mr5092458ljg.141.1587483090376;
        Tue, 21 Apr 2020 08:31:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z15sm2342483ljk.99.2020.04.21.08.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 08:31:29 -0700 (PDT)
Subject: Re: [PATCH v5] ARM: boot: Obtain start of physical memory from DTB
To:     Ard Biesheuvel <ardb@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200415153409.30112-1-geert+renesas@glider.be>
 <CAMj1kXHm=xA4gafwAaBn8=YcAsQCYDNmZ=4REsfvEUgZShm3Ww@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5419f6b6-2d75-763f-abe1-4c6a2c67dc3d@gmail.com>
Date:   Tue, 21 Apr 2020 18:31:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXHm=xA4gafwAaBn8=YcAsQCYDNmZ=4REsfvEUgZShm3Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

21.04.2020 18:19, Ard Biesheuvel пишет:
> On Wed, 15 Apr 2020 at 17:34, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>>
>> Currently, the start address of physical memory is obtained by masking
>> the program counter with a fixed mask of 0xf8000000.  This mask value
>> was chosen as a balance between the requirements of different platforms.
>> However, this does require that the start address of physical memory is
>> a multiple of 128 MiB, precluding booting Linux on platforms where this
>> requirement is not fulfilled.
>>
>> Fix this limitation by obtaining the start address from the DTB instead,
>> if available (either explicitly passed, or appended to the kernel).
>> Fall back to the traditional method when needed.
>>
>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
>> i.e. not at a multiple of 128 MiB.
>>
>> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
>> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> 
> This is ready to go into the patch system, no?
> 
> The sooner Russell picks it up, the sooner I can respin my patches
> that go on top.
> 
> Thanks,

The v5 works for me on NVIDIA Tegra, just in case.

