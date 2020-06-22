Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055292034EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 12:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgFVKep (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 06:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgFVKeo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 06:34:44 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F018C061794
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 03:34:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x18so18668032lji.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EUetM1OwvvKS/l+9zOBnaOQe8AqONoc8Aw8G3NO2Kos=;
        b=CsvrxQKEpyExUCmuP8aAD3NSZIoHgA0uym4x7uW7G4w5yWzYCKuJF69dqI3uS+er4c
         nJ8xJPsBrVVeMVjvQ3QEBYnegxEAe3Dnr9Fithexz/IIHKSEuzq9+CGvK8RQcEn7CBnW
         Pz5BmVhqNvLz29Vb9VziCB76eG30QPjbQHdJypb5NvUFGgoBkPIrfTNqIjUt1m0C2ugd
         CtG/K6UiR3aCbA9ensF0W4zzmS9uZnnaCuJF+DGinfAjwRcne2cGfm6H1594YaBA1rWj
         pmH1FBOCNH/F6qNK7nqWpds5GDhE3ociUlJSwGr6fwDr6fxhgVnSmzraumh+czq+Qt3L
         +IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EUetM1OwvvKS/l+9zOBnaOQe8AqONoc8Aw8G3NO2Kos=;
        b=J8YgQFkGiAeYHkkKpObeDSBL5xHoR52O8bd9lrIvUOE06uxkh3x99GdQJCiIiLhwTY
         xQ01up5UK+dEnuvJAOjg7+6wRTF8S1Rn6xFejDEOywtcSTxZCbdhOe9wEOWVJKMiZbOS
         QhXLccN0n1Goo96ujKKoREy4FXS4R2A9XTT9uv6lecpk79bMR0jS3ZMvr1Ob1m+fp40s
         WG1JGfHruxiSTP3W/eTdPa1DfuyMWBxX4Z0lLddNMc4tl2dA8PFnBGn5nCl5hKX0nnNz
         S7JQwjfoPg88sESFGItTgdVT9hEpzKr/X2/YIhAdnl2ThfJPulh2MRB3iEyIkOP3w8wy
         9naA==
X-Gm-Message-State: AOAM530rNqMyJXF/XeJrorYK2HCoFLLbvKAUWxW99DOD32luAJceo69d
        6bLmFFYyOZADmaS+M2aMIijrcg==
X-Google-Smtp-Source: ABdhPJwEh/Art1He8FxU4JttOpzChtBbltnbVvXo6H6W+h4L+XYWMjQqLEZc2VxCojGbmY2k52tIxg==
X-Received: by 2002:a05:651c:30e:: with SMTP id a14mr8532270ljp.311.1592822082960;
        Mon, 22 Jun 2020 03:34:42 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y2sm1930046lfh.1.2020.06.22.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:34:42 -0700 (PDT)
Date:   Mon, 22 Jun 2020 12:34:41 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] scripts/boards.sh: Fix M3-W identifier
Message-ID: <20200622103441.GA3448812@oden.dyn.berto.se>
References: <20200615121935.108142-1-jacopo@jmondi.org>
 <20200615121935.108142-2-jacopo@jmondi.org>
 <21e37cce-f1f2-bb8f-111c-1592f73d01d6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21e37cce-f1f2-bb8f-111c-1592f73d01d6@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On 2020-06-22 10:53:12 +0100, Kieran Bingham wrote:
> Hi Jacopo,
> 
> On 15/06/2020 13:19, Jacopo Mondi wrote:
> > The M3-W SoC has been renamed to r8a77960, adjust the board.sh script to
> > identify it correctly.
> > 
> 
> We probably don't need to keep backwards compatibility indeed ...

If the cost is low, as in this case I think backwards compatibility is 
nice. More often then not do I bisect over large ranges and then it's 
nice that things like this "just work" ;-)

> 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  scripts/boards.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/boards.sh b/scripts/boards.sh
> > index 0ec2981..2069494 100644
> > --- a/scripts/boards.sh
> > +++ b/scripts/boards.sh
> > @@ -13,7 +13,7 @@ case $info in
> >          vins="0 1 2 3 4 5 6 7"
> >          csis="20 40 41"
> >          ;;
> > -    "Renesas Salvator-X board based on r8a7796" | \
> > +    "Renesas Salvator-X board based on r8a77960" | \
> >          "Renesas Salvator-X 2nd version board based on r8a77965")
> 
> But I wonder if this script should use more 'wildcard' matching.
> It does seem awkward to match generically in some cases though, so
> nothing wrong with keeping things explicit for now.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> But now I've written that I see these patches are already integrated ...
> never mind.
> --
> Kieran
> 
> 
> >          gen="gen3"
> >          vins="0 1 2 3 4 5 6 7"
> > 
> 

-- 
Regards,
Niklas Söderlund
