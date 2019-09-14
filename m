Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049D8B2C24
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2019 18:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfINQGU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Sep 2019 12:06:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44204 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfINQGU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Sep 2019 12:06:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id i18so4129093wru.11;
        Sat, 14 Sep 2019 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dgJaXd1ntk6raJTraT5wOQbnTtMTym+q5Hy8S8j+5ow=;
        b=B96vRjdpj3ajMmqSxrCvg/vr6XGIak245LDWzhDhasR471vrmoRgCGVdQtHVT+Sztl
         aYD3z43ZDqORHf8OR+vUxWKtcVDu6l21/mNxDXQiknT4MdzSzA36+33+Ft4IT4cy4qi5
         De+Om+PvSsvTCSwPFdj5rpvY7N+c3SEFgyqzSq3GMuTu9qfddOQC7WtdK/g9EP53JpGh
         kSOmENWX5VZXUo44VjbzezpW+kB6T0vpTTXu03hGht73yA58PYLukOQFZ8OuBHH9eqL8
         0H0Wcc3txLFIGeU/yKaIEC4y4UfF1SaBIOdNhxs6y3cMolig2UzDTwVbq02kkSco1T7v
         qbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dgJaXd1ntk6raJTraT5wOQbnTtMTym+q5Hy8S8j+5ow=;
        b=sFwGXoq6kO1Mn2uvGCfNLxLUYHMR2cakYt/P2qYHcsCjlWrYwxPekgp212I+UhwRR2
         DXKRo5FEcUl3YewgJxESc9K0s8XzkyFDsEqPcURFjAyGtV43VIx30cd/ODAvxod2vjWI
         J70YeNeSVrqKsg9UqykNggWf3zoRAE8EB609UgIT+nIYT1S4kF5nSnk9NBKz3lz7EHxZ
         CsMLMll/J+pp/Y5kJus/410HyoEgDXvGcmAGPI5fqEHrBCwXdsoUYrO6Aysmd8E2gpEA
         VriXiZkGIVL3BR+SruiXdWCD9Yege0GQEfhLGQS6hiJ18MmBfG66COa+EXPJVAwvaUoJ
         Rl+Q==
X-Gm-Message-State: APjAAAVMFiXSxB7UkmS59PFP0ELLdTAQPQaJnsz/3OUt7gGEP7tC+TV/
        r6Bn35YLUUvVXh0BmByYtx1pPakm
X-Google-Smtp-Source: APXvYqwWSwYxPfBmLFe1Wjj59ahwkHF+dLs1Nmw89z0rkZ3vZ2oeGJySNgHdulkk4LBeiplN9d5qrw==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr20786488wrw.258.1568477177323;
        Sat, 14 Sep 2019 09:06:17 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id u68sm12804396wmu.12.2019.09.14.09.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2019 09:06:16 -0700 (PDT)
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190907161537.27258-1-marek.vasut@gmail.com>
 <CAL_JsqKSWD5EOGdvGS7Z8pd6OALRsqxv2GmVLd+9ZoOyPgbr-w@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8496c1b5-e4fe-ad92-942d-3e0788ee91fb@gmail.com>
Date:   Sat, 14 Sep 2019 18:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKSWD5EOGdvGS7Z8pd6OALRsqxv2GmVLd+9ZoOyPgbr-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/13/19 5:29 PM, Rob Herring wrote:
>> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
>> types, which cannot work well. Replace that with boolean only and fix
>> usage logic in of_translate_one() -- the check should trigger when the
>> ranges are NULL and the quirk is applicable on the hardware.
> 
> Just moving to boolean has seemed like weak justification for this
> churn, but now that I've seen your work on PCI dma-ranges it makes a
> bit more sense.
> 
> We do have a problem that unlike 'ranges', 'dma-ranges' being missing
> probably needs to be treated as 1:1 translation. I can't really
> picture a case where dma-ranges would be used with a non-translatable
> address. Perhaps a module with optional DMA and the DMA is not hooked
> up. That could be expressed with dma-ranges with a 0 size or a
> different compatible. So your v1 patch was perhaps correct change in
> behavior, but only for dma-ranges. (I've written one that works in
> both cases).

Is that posted somewhere ?

The controller node /soc/pcie@fe000000/ already has dma-ranges [1]
though, so I wonder if it's the PCIe translation patches which need to
be updated then ?

[1]
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm64/boot/dts/renesas/r8a7795.dtsi#L2653

-- 
Best regards,
Marek Vasut
