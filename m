Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B7D318832
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 11:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhBKKbA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 05:31:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhBKK2t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 05:28:49 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EB6C061786
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Feb 2021 02:28:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id w36so7366161lfu.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Feb 2021 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NejqUWWPykk4TdZwl10ZMEDVjk+PJ3gF84rrbPz61dE=;
        b=uKDuBFvNOqEnjK3CCxfyyKE+NlOJKgeZCN9CU8fxDAZq/by8jVZybrXrU4+7z9E2SN
         No9l4XRrMgHdcm13491HTAXcw/YCb/OO9QBFDgnDwkRWiFYHSdMTRMYrWOFMyrK4kuev
         oqtVUvgFO4olLL95ac9PmUbxG79Vd2sv3zIGEJq0JiVBD2Yev/IoJglVXc99nCfLYyXi
         yozLfWwKrwsCsXuLjfyII5SLMHojUw99W6Kv5l3Bm9/ax+qPQ9O7V7qN8oD11WxQmW4Y
         oq4HSQWTOgGQaHJSilXM/ffv84ljwqBvQ+Eve/y3b07kKa8/9ovVVQyF9STiOFwRmVC/
         8fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NejqUWWPykk4TdZwl10ZMEDVjk+PJ3gF84rrbPz61dE=;
        b=FB8jcIslOC7YRPJFgb3Qy16Qxk+bpHb68D3h6kh0jt6IRaOndI3hDUK2A71JQwo7kz
         b8mYkyG9b6Kkhw8gZH/7reKZwK80FVbTLElt15L2GKF9qHdivpX4noZ5D2tpSLttdZfB
         pzfWVddugz7ikltg4qV6An7y+N2VgIekCbzkLBp3Z4BJonrfWerKf5qAkq+q5o/XGB8N
         OxWpox+xK278JlsX0/w4CU/I4UztC+f+/DizOkaya/MfVt6jo8sRC5VWR+tPnJ+oKRCH
         hePE6dCqfwXua5ynC4ThnDawg1dAp9yUEnKsWf3sqHVumY8Ed9v2HOIOtnsuWS1P6z2D
         1jqA==
X-Gm-Message-State: AOAM532F3Aq4e6oBYadsTemxiRQhbNlrn39b1zwmD9Kma4oqUj5tVVtG
        OBP2xNVXpGV/8WoLhV5ZIxtfvMTI5yS++g==
X-Google-Smtp-Source: ABdhPJwMxQMTOvKuVFnGx2jlLjLNlOdHexN0Ec7ndcAY4GqORL98DQwYs0BDDB88G/7GyBeaqi4qNw==
X-Received: by 2002:ac2:5b1e:: with SMTP id v30mr4290774lfn.230.1613039287156;
        Thu, 11 Feb 2021 02:28:07 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a23sm119694lfl.6.2021.02.11.02.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 02:28:06 -0800 (PST)
Date:   Thu, 11 Feb 2021 11:28:05 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: timer: renesas,cmt: Document R8A77961
Message-ID: <YCUGtbGl2ld0Tc5/@oden.dyn.berto.se>
References: <20201209195701.805254-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201209195701.805254-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

I'm unsure if I should ping Daniel or Rob about picking up this patch as 
you both have picked patches for this in the past. Sorry for pinging 
both of you.

On 2020-12-09 20:57:01 +0100, Niklas Söderlund wrote:
> Add missing bindings for M3-W+.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> index 428db3a21bb9c384..d16b5a243ed48eef 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
> @@ -74,6 +74,7 @@ properties:
>                - renesas,r8a774e1-cmt0     # 32-bit CMT0 on RZ/G2H
>                - renesas,r8a7795-cmt0      # 32-bit CMT0 on R-Car H3
>                - renesas,r8a7796-cmt0      # 32-bit CMT0 on R-Car M3-W
> +              - renesas,r8a77961-cmt0     # 32-bit CMT0 on R-Car M3-W+
>                - renesas,r8a77965-cmt0     # 32-bit CMT0 on R-Car M3-N
>                - renesas,r8a77970-cmt0     # 32-bit CMT0 on R-Car V3M
>                - renesas,r8a77980-cmt0     # 32-bit CMT0 on R-Car V3H
> @@ -89,6 +90,7 @@ properties:
>                - renesas,r8a774e1-cmt1     # 48-bit CMT on RZ/G2H
>                - renesas,r8a7795-cmt1      # 48-bit CMT on R-Car H3
>                - renesas,r8a7796-cmt1      # 48-bit CMT on R-Car M3-W
> +              - renesas,r8a77961-cmt1     # 48-bit CMT on R-Car M3-W+
>                - renesas,r8a77965-cmt1     # 48-bit CMT on R-Car M3-N
>                - renesas,r8a77970-cmt1     # 48-bit CMT on R-Car V3M
>                - renesas,r8a77980-cmt1     # 48-bit CMT on R-Car V3H
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
