Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D13617DB71
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 09:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgCIIpW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 04:45:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34266 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgCIIpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 04:45:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id i19so1027315lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2020 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=LKgz6vBUbOf6+tdN1bpwnhXiJ5LVdXsBh8Q3ypc0WL4=;
        b=vJ2atbNRmoGnbN+ShhmQWt6vCss6/samAvHm40WMc+zoVpC0ZQKjZEyb7ByNtS7QQU
         IemnCnbHLcxW0PgC7oPmWyr3d1vPezu9gBMhYlI5JpSDhWs6knyCqILili7CS3MJO3nb
         cVnAWMs/wwMCi4Y4aJtEqYu/gLci8NjOXNObUwGtLF70fXsAOoWGEPWGb2sR4uTaztGd
         KD1WwkQ44/bauCqgUnaPubio/tiyu3Zw0GUdRvCn2w1nEp0+UiQYUL5S6hIsCb8rXmZv
         53r3kgVfMJoQauGc6x9LyMFSqKGbEOjZbey/l5p4zQpGIXoP2rQLt6eNpWIqS1FH3Sx5
         xlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LKgz6vBUbOf6+tdN1bpwnhXiJ5LVdXsBh8Q3ypc0WL4=;
        b=BSw3pXj7JerhMT9aM+VW8kPghlERwIXtqeJCJEAR5h2en9aoxCJZ9b7uQqItvMFxLX
         OITjwJXuJpBAPLvrbLOhcsdksiGlAYOHaY07UNEtIG2wO09z76bHxyOoIdb4sqivNiLG
         XGb1bpXUg13UkqcbZb8g6Ota7Jjb7h7S+df0WvtIuTeItIlpRBJ5WZQORiPzs83APO52
         X+5xMed0JV1H5RVmls6b0qqMW3KjBfMYLTsWLYKhfdX5K+2fRKNcZzyotnYq9DR0o/6u
         d13MMJKN2ZyJiKjLzhPsr4UwzE8PYWfou8HwCgUg5psmGIiOOImbzvkd7T/OFD0vPu1w
         m83g==
X-Gm-Message-State: ANhLgQ2I3QA9YNm9eL4l4EeX/ukrgWScUT1fZWa8Xfbrex3Y9+TZsVuD
        9R6r7hA9II5lI8qID7csyQqBv6zEaJX77A==
X-Google-Smtp-Source: ADFU+vsZ82O9IOvkixH2dLfyTZNEiqn+C8Arcosc1er48ImioOFPymEJWYtEfvVl85giQ/wUCkMqzg==
X-Received: by 2002:ac2:53b8:: with SMTP id j24mr2623687lfh.79.1583743519273;
        Mon, 09 Mar 2020 01:45:19 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48f9:29e2:e893:c531:93fb:39fe? ([2a00:1fa0:48f9:29e2:e893:c531:93fb:39fe])
        by smtp.gmail.com with ESMTPSA id a28sm1838648lfg.56.2020.03.09.01.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 01:45:18 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add support for M3ULCB with
 R-Car M3-W+
To:     Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com>
 <20200309064425.25437-3-yuya.hamamachi.sx@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2dacb129-a429-f6df-f43c-1b4977023c0c@cogentembedded.com>
Date:   Mon, 9 Mar 2020 11:45:03 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309064425.25437-3-yuya.hamamachi.sx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 09.03.2020 9:44, Yuya Hamamachi wrote:

> Add initial support for the Renesas M3ULCB board equipped with an R-Car
> M3-W+ SiP with 8 (2 x 4) GiB of RAM.
> To avoid build error on 'ulcb.dtsi', ssi2 is added into 'r8a77961.dtsi'.
> 
> Based on commit 92980759c1699a3c10beb00f411270197ac89544
> ("arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+").
> 
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
[...]
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
> new file mode 100644
> index 000000000000..7db5c53dc8fc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car M3-W+
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a77961.dtsi"
> +#include "ulcb.dtsi"
> +
> +/ {
> +	model = "Renesas M3ULCB board based on r8a77961";
> +	compatible = "renesas,m3ulcb", "renesas,r8a77961";
> +
> +	memory@48000000 {
> +		device_type = "memory";
> +		/* first 128MB is reserved for secure area. */
> +		reg = <0x0 0x48000000 0x0 0x78000000>;
> +	};
> +
> +	memory@400000000 {
> +		device_type = "memory";
> +		reg = <0x4 0x80000000 0x0 0x80000000>;

   The "reg" property doesn't match the <unit-address> part of the node name 
above.

[...]

MBR, Sergei
