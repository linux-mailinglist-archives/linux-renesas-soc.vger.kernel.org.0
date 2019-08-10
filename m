Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F3388AB0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Aug 2019 12:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfHJKUO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Aug 2019 06:20:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33651 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfHJKUN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Aug 2019 06:20:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id z17so5851666ljz.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Aug 2019 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sq+6WqpBLaoDnZr39PsY/fQut7RglmH69G4syGYdWNo=;
        b=tLw/xrN3nkWKecpxzW5sPTVkFFTaLhsramlyCkj7eaSKZz6a1uRzw28+4LJIhGB+24
         A3T+bct9hlfM8sXFDk8nbnaLGanH5XFzB6HG3iPWQZi/Uxdsi6GVUukvJexdakztwtOw
         p59/ZKZS69yXzHJMAeoo5EvNcbT3pSFH/5Q+adgVZxbptJz9pCXW8TBAAMyXOCjYsSvN
         WiQeuX10bfqMISv3uS4WBGfy0/n3Szneb86uASIYs6QP5zTs7kyfiP7YnqpZQTu47Mrp
         dtcSsfFy9ibFh5U7uB3O7DtjFJSYegzxqqG4gbvdh204/NbyTS+soFEeoKIFSBQSzd3Z
         x2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sq+6WqpBLaoDnZr39PsY/fQut7RglmH69G4syGYdWNo=;
        b=fWAHuu4xueJQ9JQWtv+yHXzsafaipY10lC9vyzRVG073p4hVAh+FGIoNCIb3aXXh6q
         v8WSmcBnm8RcdmMxlXtoPPA7+TXMZrT9XaAuI76i33MoH0Y3ClYSIyQJHhj1ep1XXABB
         rvCBU+dUgEQxURjL2776B2I4hhFct00upITUV32C82c7qcxmGR84a7wkFloTehyDTDga
         gDSWaS/i0xo/FlAA4tsYl6ifDNbeiSXRx5wNGfeXNNyUzfPf8wHUiCQmWSE8gzOSed05
         R1I58bMeUqQj91EQoc+z+W3DOEdrLYCD9+bqTKVSeX4eb54+alpulP9J4pgNMeHSN/3x
         M81Q==
X-Gm-Message-State: APjAAAVmPJB9OKDmWO1A8bMihO+Dupii9ES6yqasFMjPBfhjEOtxy8ri
        tamW5vOu2fqCMFPBxWxDH7kZuGbJpzxO+w==
X-Google-Smtp-Source: APXvYqx5avYfGx2MFNcpS82xmwm1Oq3cm6YBNaGbYQ/4WYUkHtj/CNLg89ZluEVcn3ib2fDTh+rKPA==
X-Received: by 2002:a2e:a415:: with SMTP id p21mr13856843ljn.111.1565432410967;
        Sat, 10 Aug 2019 03:20:10 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4d5:6a53:c586:c2b6:b7e6:3b26? ([2a00:1fa0:4d5:6a53:c586:c2b6:b7e6:3b26])
        by smtp.gmail.com with ESMTPSA id t21sm339759ljd.91.2019.08.10.03.20.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2019 03:20:10 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
To:     Simon Horman <horms+renesas@verge.net.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0be0a8f4-881d-d959-fd71-70670a6a86db@cogentembedded.com>
Date:   Sat, 10 Aug 2019 13:19:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809213710.31783-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 10.08.2019 0:37, Simon Horman wrote:

> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
> 
> This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.

    To renesas,usb3.txt, perhaps? That's what I'm seeing as the original file
in this patch...

> The motivation is to more accurately reflect the IP block documented in
> this file.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Based on v5.3-rc1
> 
> v2
> * Add review tag
> * Correct changelog
> ---
>   .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename Documentation/devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/usb/renesas,usb3.txt
> rename to Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt

MBR, Sergei
