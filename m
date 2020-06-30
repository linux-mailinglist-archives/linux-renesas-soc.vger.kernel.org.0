Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A8D20FE47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 22:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgF3U6E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 16:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgF3U6D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 16:58:03 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24577C061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 13:58:03 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y18so12210891lfh.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EbyJV6g/uyUJORIQ2AxW8gw0jjjqKQQQTjYvIEfzAoA=;
        b=D6IkqLkWN8VRo8wR1ikHhzGksjBqW388X+LnAW0xTTUkcGSJXnl8fumK7woerGLiU+
         Sl87kPB5WT594MAnDjLJJu+Yt2Lcyl7AYxTOh5/mI0orbTYoHl+B9js8+JfNSObT24e8
         6si1BwpBTKOTnNMWUhHwMYzig23Iil0u0s7Yv1UcB49BEwZau8MleUJAOcOJEFauN8fk
         6HGMKVLlRRsiCI3WfOHo5oskcest2qqu2Z8WhePGGnRc7osQmbEOsi3vZoswmakHOesh
         z2wPsD/dCWrHRc2wMgF8UUrNwBkOlgGRzYuABkZhTy8Ah/iBv1EXqC899RgGH6cU8+Tn
         lx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EbyJV6g/uyUJORIQ2AxW8gw0jjjqKQQQTjYvIEfzAoA=;
        b=fG71D5pBZXMakYCpLaaI55guzvhvwGqd5LTLWzgdcCKHpw/aw9uIDRnuosYohnCJMm
         xPk890bAQpsVbAYTsszhSv8L3jlIa6W1oF3P6OyR2X0V2hFKu+DNumIQREauNEhPmSDi
         EV48PyGQS2WTNF2uS447zEE2YvFbgK8QG2XBrL1CNzon80XVlP15/g/R3APp1Xlezrbs
         0za9c0th0Z56S7xayMzwunlv4N0EMGRPsqQtWycNArMet5dfdDamDhHKytY287RYap1z
         zADtpPH2sJqQvZ5FQJVSCfQI5QLZqxiGWNnWnxkLBLpyZNxvBhD2TUdb3fur2D9diErk
         AOnw==
X-Gm-Message-State: AOAM531REi6A9IggAuwvet228Kh8iNCEhsQA/qNuj6E6plQLiqqQxp3K
        jnEkDU2MBj7/uzxZK9AMRxLlr3UI16w=
X-Google-Smtp-Source: ABdhPJxz5sVEQVwJTYcLKyEeiEsD2Xn4q6UC0a65H+Irn8Oax/2H98ruTejfhWyxU85fQ0Tv6EO4KQ==
X-Received: by 2002:a19:dc08:: with SMTP id t8mr12922233lfg.191.1593550680232;
        Tue, 30 Jun 2020 13:58:00 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id n1sm1090596ljg.131.2020.06.30.13.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:57:59 -0700 (PDT)
Date:   Tue, 30 Jun 2020 22:57:59 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: media: renesas,fdp1: Add resets
 property
Message-ID: <20200630205759.GF2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your work.

On 2020-06-21 03:47:32 +0300, Laurent Pinchart wrote:
> The resets property is used in DT sources in the kernel tree. Document
> it and make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> index 39184bd21a27..2a27a7296fea 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> @@ -32,6 +32,9 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  resets:
> +    maxItems: 1
> +
>    renesas,fcp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -44,6 +47,7 @@ required:
>    - interrupts
>    - clocks
>    - power-domains
> +  - resets
>  
>  additionalProperties: false
>  
> @@ -59,6 +63,7 @@ examples:
>          interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&cpg CPG_MOD 119>;
>          power-domains = <&sysc R8A7795_PD_A3VP>;
> +        resets = <&cpg 119>;
>          renesas,fcp = <&fcpf0>;
>      };
>  ...
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund
