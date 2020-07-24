Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C77322CEC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jul 2020 21:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgGXTh7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jul 2020 15:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgGXTh4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jul 2020 15:37:56 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3107C0619E6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2020 12:37:55 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id s9so5797035lfs.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2020 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=anre9lcJof6187CbKzrw5qizyC3m4lA555ZA9TP3qEc=;
        b=NiuKrFL+hCZQ/5s3aFc1IxO3Tv/X/oM2SW3jpsF9kw7dKCcB+SPFaqr1FCwR9Nrt2x
         Z3TeScoiar4gyVLvb1t5LSenXDbiZ0PEQOpqTgsMEC/TZZo5QOxr+hYTlZNrD7uJU5X2
         ePDkfVd9bDSZICuMGZGa4WSbaBsP6xgzEVErw13brTNkFqx0wes5JsyGiAwv5f4xyZFs
         8yTKeCpXRA1ZfUgs+6y/UkdCvpDErfmD3a3sig2rJEBXRHSSOmhKIwUrCOwRqCdqnz1L
         vVn58JWoy5IyfS5vGKVKC68qD0Xhpsl/NkMt0GZmQJupvKF91X3IGP3REzBP3Xn0z7PW
         8iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=anre9lcJof6187CbKzrw5qizyC3m4lA555ZA9TP3qEc=;
        b=jdbw2GiCvBpR99Cf4a4B+YPpdlYTJxlV1cq3ovd4CQZA1stQd15+Ai5zx2vBBDogG7
         gOFFj1esbns3x/Rg1oZ82pHeYPNH1URjWvdjr3WzTTxwXzZR/MMeRDJoUIoSoYvju2eV
         3P/zzlTxj8HhHp/pUDWiO5aVNlj2FheolQqmnZoM1yL05oDnn+Scae9ywhm3cvvp67UP
         bsU7yRMscuxA9VdVaeIqvAYQV9A793qPvOvVd+aBIUQ1df83m5Jc6rhN14W7shijjqEt
         aPWQexHddZ6H29UDBuQjYfBu8QE8q7wfvWkVmeZ4dY1AnCbZS63mrmJ3J9G1C18d2QfP
         8olw==
X-Gm-Message-State: AOAM530wQkJJj/ivy1/nwya+h/J9Bnj2wkkV9HF/MvSOBjZa2H62ylG3
        aVxXWF1NyB8m6X4wjYG4r4q2Gw==
X-Google-Smtp-Source: ABdhPJwBtPnJGVYlPrGHrR5aqgZMiuVvpx8x3z+sVh22q8qvDyRybL2id/F9lVjZNk7hnl7OHeIE2w==
X-Received: by 2002:a19:c3d0:: with SMTP id t199mr5811130lff.56.1595619474080;
        Fri, 24 Jul 2020 12:37:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y24sm443386ljy.91.2020.07.24.12.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 12:37:53 -0700 (PDT)
Date:   Fri, 24 Jul 2020 21:37:52 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Document
 renesas-vin-ycbcr-8b-g property
Message-ID: <20200724193752.GE2729799@oden.dyn.berto.se>
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

Thanks for your patch.

On 2020-07-24 15:58:51 +0100, Lad Prabhakar wrote:
> Add a DT property "renesas-vin-ycbcr-8b-g" to select YCbCr422 8-bit data
> input pins.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 53c0a72..7dfb781 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -106,6 +106,12 @@ properties:
>  
>            remote-endpoint: true
>  
> +          renesas-vin-ycbcr-8b-g:

I think the preferred format for vendor specific properties are 
"<vendor>,<property>".

This nit apart I'm not sure a property is the right way here. Could it 
not be possible on some designs to have two different sensors one wired 
to DATA[7:0] and the other to DATA[15:8] and by controlling the 
VNDRM2_YDS register at runtime switch between the two? If so adding a DT 
property to hard-code one of the two options would prevent this. I fear 
we need to think of a runtime way to deal with this.

The best way to do that I think is to extend the port@0 node to allow 
for two endpoints, one for each of the two possible parallel sensors.  
This would then have to be expressed in the media graph and selection if 
YDS should be set or not depend on which media links are enabled.

> +            type: boolean
> +            description:
> +              If present this property specifies to selects VIN_G[7:0] as data pins for YCbCr422 8-bit data.
> +            default: false
> +
>          required:
>            - remote-endpoint
>  
> @@ -168,6 +174,13 @@ properties:
>  
>                remote-endpoint: true
>  
> +              renesas-vin-ycbcr-8b-g:
> +                type: boolean
> +                description:
> +                  If present this property specifies to selects VIN_G[7:0] as data pins for
> +                  YCbCr422 8-bit data.
> +                default: false
> +
>              required:
>                - remote-endpoint
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
