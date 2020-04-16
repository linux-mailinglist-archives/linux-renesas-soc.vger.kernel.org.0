Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F73B1ABD54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 11:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504312AbgDPJw2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 05:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504301AbgDPJwW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 05:52:22 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C725C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2020 02:52:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so7107708ljn.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2020 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GNdPjagFmKxMgRfeH1VQvH6JQzOlcu1FpAxIz+rDOmU=;
        b=iy0Sm9ux4YeJsoVuh2C0RDoE7WCEsixfv64uA8TAnqqaCjzzYSe3dyw9QbQg5KccdE
         gdfoTihlxW1Pp+DgcWSXtqiozJdfBF5RHSIvpovQ1Zf7gXOyqInMl7qYCwSyCo+uTA8+
         BNdnqAE9xqsMA2cm9HxgLREUO30UFv6+YyaXhRvQurAUvg+xCVRh7f29e/a6BRUENU0+
         C3htj1zEI0qfwuYNhdRBwya/wvdqa9E8pu+FHAU+R1JVsXbvz8/F/EAsmKLUe/GBcM2w
         ul/eeXhAf6CZ4Y/zzw+fMcz2EKARL11ZnqdKQifriyeayrjM1Qxist/WG9XzDyn7B3W4
         5QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GNdPjagFmKxMgRfeH1VQvH6JQzOlcu1FpAxIz+rDOmU=;
        b=ecTlSO/wL0pe3xsDp0KmBYvGDOWRJAZaancA0EpSNe9MaSv91mc7Qg5EN+QuuE0S91
         Et2u0I8wU6LgdbPwwCMcOmPnSWmuX5Vc5ozPlsT3evQZTM7rQwRWeS/9J2ro7+4s3t9f
         qVwwWF2gvnuYYp3vb/X5mK6tj5NRh/iTHGUyhyMkHg8F2z1d3EvwipRiPEqJceXQsUSr
         gCJT3cZtI8k5ZNmMFRZXrPon4dh7rlh/1ciauVaZZexg9IuBipM6igri+rHYTo3LiFOu
         WQb2TmbWT0+/grlsD/K5KaG2jcgiGLTmcNLS0aUjPs57xSGq8z8OgyR0KAaN94YbGgNU
         5WMA==
X-Gm-Message-State: AGi0PuZhUfQbesBNJk8XaWfer2QSCdDLNYGMrWnIgqSnqK/jlW4TNk9N
        vJTlHeE0hD3tjaFnoyzfxtkDJlGSPEh84Q==
X-Google-Smtp-Source: APiQypKoy003KfGHTrlQOeX4iZnIOdl6jIy6K2GFo+/k62ZwoeqtoRlRgYZwOpZbvMCzFgyBptcIbQ==
X-Received: by 2002:a2e:8112:: with SMTP id d18mr5886816ljg.239.1587030739796;
        Thu, 16 Apr 2020 02:52:19 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4832:17d6:f588:52ab:5d6a:f5f3? ([2a00:1fa0:4832:17d6:f588:52ab:5d6a:f5f3])
        by smtp.gmail.com with ESMTPSA id i18sm9468928lfo.57.2020.04.16.02.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 02:52:19 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] ravb: Fix RAVB_RXTSTAMP_TYPE_ALL value
To:     Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, Julia Lawall <julia.lawall@inria.fr>
References: <20200409094851.22142-1-dirk.behme@de.bosch.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <efdd6b5b-b239-2147-ba7f-bbcbb192aeba@cogentembedded.com>
Date:   Thu, 16 Apr 2020 12:52:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409094851.22142-1-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 09.04.2020 12:48, Dirk Behme wrote:

> In the function ravb_hwtstamp_get() in ravb_main.c with the existing
> values for RAVB_RXTSTAMP_TYPE_V2_L2_EVENT (0x2) and RAVB_RXTSTAMP_TYPE_ALL
> (0x6)
> 
> if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT)
>          config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> else if (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE_ALL)
>          config.rx_filter = HWTSTAMP_FILTER_ALL;
> 
> if the test on RAVB_RXTSTAMP_TYPE_ALL should be true, it will never
> be reached. Correct this by changing RAVB_RXTSTAMP_TYPE_ALL to 0x4.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

    Almost forgot about these patches... :-/

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
