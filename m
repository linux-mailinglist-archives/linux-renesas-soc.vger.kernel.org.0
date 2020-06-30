Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B08120FE29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 22:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgF3Uu6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 16:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgF3Uu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 16:50:57 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3067CC061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 13:50:57 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id g2so12224741lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=p/Otl91mPpjMSzsKhcaF4uSY/2JX4DNOyaQowX9LZdY=;
        b=ygubjHAPA2xihW55H/lrsfxhJ7YRK+8V2z95+KKu23NmjT3r2C2ytcRIPxJCHV8vIV
         5EXZT2UMg41NZbHmJu/gu9o4UwlZQKtqE+1pr1uqr6XV8Bs9b68R+pCob0T+x+8ooIak
         hQ48b+wmyrx/DWhySyDYw9YqkbcWnwi2ZDehMnLWLyOSPSW1odzw4VHD6LfHytYjYicM
         guYmRaLhxZuEUU2sMI+jZJAprGcdQd0zhCa+2m8ablHEy1e0K9yjaSI1baAWjIjQcNa+
         vGvMjrPDDToArlSE86kxZg7RmxlkFywYtS+46fZ2U2WRuo/YmeIRQpVpDExjxu0ggUJX
         lESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=p/Otl91mPpjMSzsKhcaF4uSY/2JX4DNOyaQowX9LZdY=;
        b=TitlHKwRdx0AOGB44YdaO3G1lw+OSJkgnKkpvvaaRqCbqO6UZW3/mCqo2byRh4UzSc
         lfYyu6cD+rbqtQD4LD4ZVvqoJ37uEPUe/Hd9KP4yGeWvR+JQpCgzwmFJ6ydQWpvWy76L
         r6CAcvqvGZJZ/knLgc97F97dhXAy+u+9jMUt2ViJkywXAHbDvWWmfv5ZsxetZZ9bHkR0
         hmKZvzsw1M5HaP2Ynd+POb/x4oi7A+kVyxpA+ml8R26YZMC8B7iYo/qn4DymnaSNxw28
         /J9tmjVxLeLkZfjg4EdsPvla9byzIXzdODJ2zK+1zYVDK/+qbkiaizClcoZ80b4jy4bf
         x2gg==
X-Gm-Message-State: AOAM533z3Na6IaJ08haiiLYbJ/GJKWFLwoGhb3zsWKBieqOAfGlMtsRs
        3JprpHd7VgRPuzciklKUuGoL/Q==
X-Google-Smtp-Source: ABdhPJzECkfv/Dr04bhv1EGQNZ89O+WfwWATDN2K2b2mRDhSKfE+HFv2STbKXGDJdhAX+HsKGj3nhg==
X-Received: by 2002:a05:6512:10ca:: with SMTP id k10mr2279919lfg.177.1593550254384;
        Tue, 30 Jun 2020 13:50:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id g2sm1222424ljj.90.2020.06.30.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:50:53 -0700 (PDT)
Date:   Tue, 30 Jun 2020 22:50:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: renesas,fcp: Add resets and
 iommus properties
Message-ID: <20200630205053.GC2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2020-06-21 03:47:29 +0300, Laurent Pinchart wrote:
> The resets and iommus properties are used in DT sources in the kernel
> tree. Document them, and make resets mandatory. The iommus property is
> optional as not all platforms wire the FCP to a functional IOMMU.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index eeca7e255420..b6cf2958e6c9 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -31,14 +31,21 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  iommus:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
>  
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - power-domains
> +  - resets
>  
>  additionalProperties: false
>  
> @@ -53,5 +60,7 @@ examples:
>          reg = <0xfea2f000 0x200>;
>          clocks = <&cpg CPG_MOD 602>;
>          power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +        resets = <&cpg 602>;
> +        iommus = <&ipmmu_vi0 9>;
>      };
>  ...
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
