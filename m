Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741C81EA4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfEOIj3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:39:29 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39282 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfEOIj2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:39:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id f1so1327801lfl.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2019 01:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gXgJ2NRdCHpt3L7731q8B8+lovu36p2J096s+Bj8HBk=;
        b=PdfrWUiwX3+tHhJ2QUOshH8iSM/ncGp6WT+i7VEFJ/frJ/D+PNGnwLF5lCknMAWXNu
         4/3K8xqKbVaa6FH7HkM8eGFXRo0i0MklFQyJFZgJNxC62/XcoWR90QEyTWYbQJj+NGmu
         wvDWWG5g19etfnpQTkDfGKSQ+rMqyVC4hUbkst1gCwYltMdRVOMEHnYKODwvFwQXkOzl
         Yajhx5hO+OAnRSGzmHMY0ItPDgk+RwbR+2ZdfgJrhViS7GdZQip+Voy3kudsJdNmZjpK
         I5wHg3U+GS7yByun8eCCJqGSLsJR2GdRYlRY1KLE9e/hzAZSyDytcmqyL2HWGD2jn3xk
         SCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gXgJ2NRdCHpt3L7731q8B8+lovu36p2J096s+Bj8HBk=;
        b=EHWKo1fH6/isuF/GsBeO2uBga4lwYhjY2+qXmN3QOuUoxKeShVxD0VvbvMW+76e4V4
         PhyKdpYK9NfXa8HwRLuMUNu+9sOkVzI3CT6oVfp0q/UAoDpOk7PI1dIudnEIVKialJjE
         chIWqoUiiK0PA12/AiWTy7XlZoFNdcMCLevdkQTvWTQNHLATPdoefmmaSLKoOXQxCoIP
         QxRdrlbg5Mgo49PE6A0gW/YeA6EbfwE04irpSBrU8i/hTMBg8VDh+XMnh1RhJcgh797y
         C5fVMv0vo7UWmfVV0zjI/1SNdtSC6WDffWptguv0+X8MaB4Vq+dBNXer0xuM0sH75N6a
         0eKw==
X-Gm-Message-State: APjAAAWvPtDDNeyAxCiQPkIY8jndJ2zqHT2x7UVu8mPC2ExYfC0blLIb
        29M7KYRoe2XrAyzIdWIQgX1ZWVFdaug=
X-Google-Smtp-Source: APXvYqxEGYNtWpwEh+ZoMBb0iSPv7qGxCbS7X1yKS+hc7NcFIxoAoSdbv7vpmQpd8g21NAf5bSNHDg==
X-Received: by 2002:ac2:4989:: with SMTP id f9mr20486878lfl.12.1557909566620;
        Wed, 15 May 2019 01:39:26 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.86.98])
        by smtp.gmail.com with ESMTPSA id l16sm267921ljg.90.2019.05.15.01.39.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 01:39:25 -0700 (PDT)
Subject: Re: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of
 usb_x1
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-5-chris.brandt@renesas.com>
 <CAMuHMdVVu23_8=8CLwM46QAJsxUbYyN1TYQaAzoE+d2uM3YshQ@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f4ceaadb-62e1-9880-e8e3-4f5bf54ce91e@cogentembedded.com>
Date:   Wed, 15 May 2019 11:39:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVVu23_8=8CLwM46QAJsxUbYyN1TYQaAzoE+d2uM3YshQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 15.05.2019 10:35, Geert Uytterhoeven wrote:

>> Document the USB_X1 input and add clock-names to identify
>> functional and USB_X1 clocks.
>>
>> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>> @@ -28,7 +28,11 @@ Required properties:
>>                followed by the generic version.
>>
>>   - reg: offset and length of the partial USB 2.0 Host register block.
>> -- clocks: clock phandle and specifier pair(s).
>> +- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
>> +          dedicated USB_X1 input for the PLL, that is also listed.
>> +- clock-names: Name of the clocks. The functional clock shall be called "fclk"
> 
> Names?

    And I think the module clock name was "fck", not "fclk"...

[...]
> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
