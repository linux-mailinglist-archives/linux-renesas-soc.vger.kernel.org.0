Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F3132FDFC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Mar 2021 00:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhCFX0w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Mar 2021 18:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhCFX0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Mar 2021 18:26:32 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94CDC06174A
        for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Mar 2021 15:26:31 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p21so12975043lfu.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 06 Mar 2021 15:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fT53pegBDZ9h7XK5TtL9cSGaNAFj8EVg+AYu7I2L8/s=;
        b=YPI9zj3Qc4C80sGFwQ7aT+pnnSstTvmSyuYKSVcVvL2WyOp9kd8VPVCNnTnbOpczhg
         YjxFvR2xhITzOGhVnA+kvITxDvD7tOiNp9jGynJ335tsFMWVaBddZ33GPnipUZCZ4dng
         85XwT4Ok6DwTN2bBG9HZvWjHpZCURjqtdh7mgvm0lKJ+m9MZXX9AKNW8x11CN/VRsTwP
         wGQ4AcSeWK46xyKNwoCWeOBZPHtysos+Qj63o0eXCPZD9j2/i3RhZ4/jwCLDJ9ecGyC2
         1ikaS8Dh6v468mst5K0++izzGonhtFYIxLobeWSUtA0Xxdm2xo9jsFh/SF+aLlccGb75
         ++Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fT53pegBDZ9h7XK5TtL9cSGaNAFj8EVg+AYu7I2L8/s=;
        b=aS5vN41ISE1NcvvsSBlSn6mJh5XZb3mtwbqv+uBa3NH+RmHA8saHvAWFlsLo6O2AEu
         gkcI7HnY7G2uGst+yZihQoKju16Ah4UYcUdeo9eWk7iv3r4weW3A9PGffBWgZVPRt+Td
         UA6e0nYVTXZqCmPDtXkA56lamvmmpgq2/uJZJHBYJs04g9jczs8nQjYUS8Ih4gnIFuZR
         k3ULmD4Wr6dPKpPO9uhBSiqEDV8d95ryGni60MDj5w+Qc2IIkJnQKEIsAWTHhwQSCLva
         ivHVZwV/VayUK+2PIH90Mz6RDaHtsWlND7Bj1Mv1/zas0VUFSST8BLZGYl8W4yXHAK2k
         T/hA==
X-Gm-Message-State: AOAM5332Q5PoHEpYdlVIxPoxGh7mGJmfpF+MREcg2lYB41g38ghZfKQa
        IGAF325jiwLO5q7jK4CrraREMA==
X-Google-Smtp-Source: ABdhPJysUxfGtWnsu38ZpdLlNtdNzxEJCAUuv+EZSxXHoBoR6FHfsLCnBqPr9SDw8ecD+FJEL2y0Ww==
X-Received: by 2002:a19:488d:: with SMTP id v135mr9836937lfa.202.1615073190357;
        Sat, 06 Mar 2021 15:26:30 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id b25sm802612lfo.72.2021.03.06.15.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 15:26:29 -0800 (PST)
Date:   Sun, 7 Mar 2021 00:26:29 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: add r8a779a0 TMU support
Message-ID: <YEQPpY2HnMFptwzU@oden.dyn.berto.se>
References: <20210305142359.11992-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305142359.11992-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2021-03-05 15:23:59 +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> This is the correct one. TMU passed the testsuite, CMT needs a second
> look.
> 
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> index c54188731a1b..20af9ce05ae5 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -30,6 +30,7 @@ properties:
>            - renesas,tmu-r8a7779  # R-Car H1
>            - renesas,tmu-r8a77970 # R-Car V3M
>            - renesas,tmu-r8a77980 # R-Car V3H
> +          - renesas,tmu-r8a779a0 # R-Car V3U
>        - const: renesas,tmu
>  
>    reg:
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
