Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36A7AD504
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 10:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfIIImw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 04:42:52 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53094 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIIImv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 04:42:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id t17so12772557wmi.2;
        Mon, 09 Sep 2019 01:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VRJyS7lUCXas8WAE658lk9X9sHjdPlVwIBMgs+wdqWI=;
        b=QZfGunqBjejLiGnNAxL/fPG1ckyIjU+rD3juRxpa2g4ni1iEHvKAgTpq7F2wp0DESC
         NsjRU4d7+kheApD7wdnMg5VShbozYS4+gq14PcUoTSb2UC+7XY/Tgrktw60ghtoYyKKv
         jSFIg9wXvU//K9X08jH0DUxiBejNu0n1h7Jd9iU0JVFIYfZujPU/36FU+E+lFKAvuV//
         tm18hs03Hl6EeVaOUZ5C054OiHN2UAw1q6D3Lh7DxCiBFTyKOKCRBwF7O+MpEoN0m8of
         odRouRg7RdoB/E4IN93u4i8baIcjCSqiyiHgHN2L+j2nDnUqMvXdRJ899taCfpPppcnF
         ZniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VRJyS7lUCXas8WAE658lk9X9sHjdPlVwIBMgs+wdqWI=;
        b=kjKyKS8CnwzcTO0sazPQllas7EOraISDOZimXOVc/nn4IWb0V6E/p+phvzetbAPQ9C
         CCXaDq2EDmPr+drxFUr9NE8i+OLu0w4uh72zoj72otTy4fp6xvoKctBaS3GtKW3g/bvn
         bBVO5TKKWhJa8zU4DNlrvKQT2tG2HAcThuqEjgWSk+7qlmT1NujG2lz3YeX7qEZEt4dO
         B53ykFVglRf9Io1lhAjayy+4CnDPDbmdJpMEcZIb0tNO42wCDQrlgRjZwH3gkudDdmQG
         hyUNDTEOWlKcjL75yhTZJ+9rmQrqNCK0MV2wAfL9EMSZ6R18qKPTworXno1hTj0AwITK
         +CQg==
X-Gm-Message-State: APjAAAXWs2bQbh819fN+EwV45T1I+1W6rM27AnVYej0T6PI6jupQ3lg3
        0fFlLhyJ00nxxNFj/gVTQGbWWgbyJjo=
X-Google-Smtp-Source: APXvYqyNPG78C9VVatLsGWpEXNrqd7ULWSAW5snh5OGScKgXrUtJNXyuYtwzdWdI6mN+/5JVu2Q80w==
X-Received: by 2002:a1c:a90b:: with SMTP id s11mr19030554wme.92.1568018569510;
        Mon, 09 Sep 2019 01:42:49 -0700 (PDT)
Received: from [192.168.42.85] (p578adb1c.dip0.t-ipconnect.de. [87.138.219.28])
        by smtp.gmail.com with ESMTPSA id h125sm17930614wmf.31.2019.09.09.01.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2019 01:42:48 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAMuHMdXkExZXeXnxuKkMC0J4m56cZUmJpcq2JCXuMv3PBzA0Dg@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b77e6a66-be14-4f94-c116-788b8fa18b31@gmail.com>
Date:   Mon, 9 Sep 2019 10:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXkExZXeXnxuKkMC0J4m56cZUmJpcq2JCXuMv3PBzA0Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/9/19 10:19 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Sep 7, 2019 at 6:16 PM <marek.vasut@gmail.com> wrote:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Add dma-ranges property into /soc node to describe the DMA capabilities
>> of the bus. This is currently needed to translate PCI DMA ranges, which
>> are limited to 32bit addresses.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your patch!
> 
>> NOTE: This is needed for the following patches to work correctly:
>>       https://patchwork.ozlabs.org/patch/1144870/
>>       https://patchwork.ozlabs.org/patch/1144871/
> 
> What happens with the above patches applied, and without this one?

It triggers https://patchwork.kernel.org/patch/11087391/#22811745

> As PCI/OF driver patches go in through different trees, is it safe to apply
> this patch now?
> Should they go in together?

I didn't get any feedback on the other two patches, but this one here is
safe to go in either way.

>>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
> 
> Do we need similar patches for the other R-Car Gen3 and RZ/G2 DTS files?
> What about R-Car Gen2 and RZ/G1?
I suspect we need such patches for any ARM64 machine with PCIe with this
32bit limitation.

-- 
Best regards,
Marek Vasut
