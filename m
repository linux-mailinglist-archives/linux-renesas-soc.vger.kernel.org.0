Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B98C28DE56
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 12:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgJNKL4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 06:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbgJNKL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 06:11:56 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA4EC0613D2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 03:11:55 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id a7so3036129lfk.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=D9gEsuKCqY5ac7Bsj84oLcUjfey4ei4xQdjhdzjkOSE=;
        b=nvcLzqFy+/hxA1Pw1QucXdkoo5krViAR74k1syfntvZjJrKSOzyInK5lkbaIHqJoyR
         LJeJ4M9TW4P5OQ+EYDyhRbMFooUQhx4toDUOdTGAftO9o2SM1y0f2CwGpxGmmN1agbLJ
         U2G8kd5llQ0jUV5IyKjbW2KWm2Tmaz0VtT6Qw+6vp619RZSdxhTxxYHjKLyHfk+DJS1q
         z/1sIh1HUPtbjHZGu44tO6hzbe2R+A0eT0DLN4g8UBTs5y9KJBProQcDiv/ArNUyMlxK
         kh+QvJRK+SQkzPdLAlhpFl98vhGzSO1xvDPURjPnk+frxgSHClhUTxzU6TJZV1YHn2zN
         vjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=D9gEsuKCqY5ac7Bsj84oLcUjfey4ei4xQdjhdzjkOSE=;
        b=MoKn4Wkx62e5EQ5pQP0Mf3V7TDJJi/XwShIqH1qB9SdZP2KuyOk4kxV8f6KI7hJ/dD
         LpmHoCKDec5cYkJCkQTgrrV4Db7RbAn5fDwIAI/uWFzesd6kdF6SjjIZFais7j6U3BUb
         jnfDMpfd2hKVALMaptx0b1SaJvuhouzf6FLYRn+FuUTqFg9FflBwUIpS0MhByfdbLGB1
         qF0kHw3+GmL2C+1daz8VVXpkR5hbhSnD6NvdtiyWG+1di1rmRG8HZsmXJEqKisV4QwxD
         vV3zMPTYl9LCDtvPqDLVp8/UA1TXiD13fP6nzY2tLb0KayCE5zOEIaaL618SrDJpU4h5
         jcIw==
X-Gm-Message-State: AOAM5326OreCu95r2EMlPlPUCayg1bl6ifg4nLKs/hKJIdj/v9zLX6Qz
        XXext/hcC+EkSspgTiKAGoF5dQ==
X-Google-Smtp-Source: ABdhPJzyMrzpeDZ4LfCDAueIHnsskeqRxsVCSXw9df6G4ICj30Qq1EywTW97Y/fPEEnApfVlfu1XnA==
X-Received: by 2002:a05:6512:1dd:: with SMTP id f29mr1256228lfp.379.1602670313884;
        Wed, 14 Oct 2020 03:11:53 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id f9sm956972lfc.164.2020.10.14.03.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 03:11:52 -0700 (PDT)
Date:   Wed, 14 Oct 2020 12:11:52 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: media: renesas,vin: Add V3U support
Message-ID: <20201014101152.mqmv2klq2mwsjlpf@oden.dyn.berto.se>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201014094443.11070-6-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2020-10-14 11:44:42 +0200, Jacopo Mondi wrote:
> Add compatible string definition for R-Car V3U.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index ad2fe660364b..7b629a6ea035 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -51,6 +51,7 @@ properties:
>                - renesas,vin-r8a77980 # R-Car V3H
>                - renesas,vin-r8a77990 # R-Car E3
>                - renesas,vin-r8a77995 # R-Car D3
> +              - renesas,vin-r8a779a0 # R-Car V3U

Documenting the compat string here might give the wrong impression the 
IP is supported. Which it's not as the V3U is quiet different then the 
it's siblings. Whit a new pipeline and small but important changes in in 
the register set. I'm primarily thinking about that the IFMD register is 
gone and dealing with that will be quiet significant work in the driver.

I'm not yet 100% sure the best idea is to support V3U with this driver, 
maybe it's finally time to make it more modular, with more distinct 
support for Gen2, Gen3 and a new module for V3U?

> 
>    reg:
>      maxItems: 1
> --
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
