Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB0A2E3180
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 15:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgL0OV2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 09:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgL0OV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 09:21:27 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434A8C061794
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Dec 2020 06:20:47 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b2so7626011edm.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Dec 2020 06:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vaKm2I6LGgY9EwkZycicnOZ6v4vfSBvWiV2uojzRX8Q=;
        b=lzyhD3xosHdsPUbyvFLT1FqD5JCUTSu5kN0+Mmt/xggXtBC+TJmkMxISQDCCPIDtwh
         BHEqIns2jGXDcj2Mv5CfHQSY9N4lK04SlgBZE8kOvZMYd4hL2yyAUFimzrvo4/F2Myj3
         8GYJzwMu7BbWgMSwZp35EvgLDs8hYvbj0pUrbQWxcyI1lRJBjK6vW1scUIpWMS1W5qEX
         UR5kkAmQwcW2YsRYSRNue336kpq8TDOB9YP5NZbO8KKfdsahU6Ipp/Yt+XSap/LH+DUo
         W/EMNHVusok1A5BrkHbuZw3xg23j3iiiCXCmfwM7ZBRq1q7PyVufTBWj0QmL3aSOc6aI
         IvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vaKm2I6LGgY9EwkZycicnOZ6v4vfSBvWiV2uojzRX8Q=;
        b=O0wVjfpAdqeb8bXEv2Wyo2QRmqYjNf3TqhJov81V5io5FL1t/s9/SKsOWPXPXtptLS
         MF+ix9rni+hrf/Gr4NCLWA4dj4Gg4Pw917PD6yjgMqGLrTvmMLHlqnT0igu7RhIIEPL3
         1ujubP29KCZU+jznAeuv1TSy6w+4Jr6ne3oZa3w/rj/QsOVLMw5QZWMHBVcsW8mZcfD5
         DKJyBUVTGNwv082QVOnnSileWJ+uoLkKRj93xGoAkKDrgEzwmNTtLpyGADi2sTrIQqaz
         o0evLaHE9LEBB00ntJ53xkkiMH2OGi5MvIBaCv0EdDk6iIReVK0t+hD0gmHn10Gb1qu4
         fJgA==
X-Gm-Message-State: AOAM533M3qdGhZNOW/F0xJkrBFqe73xKAq3peJi11/9Tdll+cmA1KXLE
        LcPw73XTwgw6GksaXH+zn3umoQ==
X-Google-Smtp-Source: ABdhPJxcO4ZVeyTVgVfiA3YCft1y7RPQJbN7nmcteNnlUOWNdY6Cq1hhpLFT4iyV8mgzU4b15s/eFA==
X-Received: by 2002:a50:8e19:: with SMTP id 25mr36827104edw.263.1609078845927;
        Sun, 27 Dec 2020 06:20:45 -0800 (PST)
Received: from localhost ([192.36.80.8])
        by smtp.gmail.com with ESMTPSA id i13sm25922997edu.22.2020.12.27.06.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 06:20:45 -0800 (PST)
Date:   Sun, 27 Dec 2020 15:20:44 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/4] i2c: rcar: handle Gen2 and Gen3 V3U quirks better
Message-ID: <X+iYPBDTX9e663ee@wyvern>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your series.

On 2020-12-23 18:21:50 +0100, Wolfram Sang wrote:
> The new V3U SoC needs handling of spurious interrupts which is handled
> in patch #4. However, this extra check is bad for Gen2 and earlier SoCs,
> so we need seperate interrupts now. While working on this, further
> improvements to avoid the HW race condition on Gen2 and earlier have
> been found, see patches 1-3.
> 
> My measurements have shown that patches 1+2 really improve the
> situation. Before, I could see doubled messages after adding 2us of
> delay to the interrupt handler. After, they only started to appear after
> 7us. I can't say much about the spurious interrupts on V3U. The BSP team
> experienced them, I did not so far.
> 
> Let me know what you think...

I like it, for the whole series

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> 
> Wolfram Sang (4):
>   i2c: rcar: faster irq code to minimize HW race condition
>   i2c: rcar: optimize cacheline to minimize HW race condition
>   i2c: rcar: make sure irq is not threaded on Gen2 and earlier
>   i2c: rcar: protect against supurious interrupts on V3U
> 
>  drivers/i2c/busses/i2c-rcar.c | 66 +++++++++++++++++++++++++----------
>  1 file changed, 48 insertions(+), 18 deletions(-)
> 
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas S�derlund
