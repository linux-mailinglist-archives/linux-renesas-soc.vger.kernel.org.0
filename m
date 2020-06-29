Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212E020E633
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 00:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgF2VpR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 17:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgF2Sho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:44 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE2BC02A544
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2020 05:51:33 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id h190so3694479vkh.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2020 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xHEvnwaXIaI22DXPizYpJcrsTL4/AwhMEQ6IhYTQKlQ=;
        b=OQH0L9cBVHLRgTVZhw1jd+9UWSypZQN30gG3yvEpHJvc2VXIoNz+hyJGcfUcBU+7e4
         oCc7XEKBqBQPleKnUVnLbIp6WsDfC+WCcVQhpW8dNcfHdlE37M0unZrcRr+0gg3/aEvf
         PMdPFYwgtQ+R9ZtNcXAgyQyPNtpr4cbByuURBHAnjcHM+1N71I+sWI1yfCbGzQcEdiAN
         yY4uALwvM8jRmBCwqjPgXEIl4AGsHRadzBeA2q8DcqrH+lwiFBEB3A6DNV046uaF3RHg
         gXgPPRlYEZ8ZU+Sn3QHjIt7k5b5qK/HGOI6FP26Yjc3r+mq7qoc4ZOwpVuG+VUgxyPPT
         2jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHEvnwaXIaI22DXPizYpJcrsTL4/AwhMEQ6IhYTQKlQ=;
        b=PBF0s7FHdVlQxtYQ4/HnnChbSEZ7/k+K8+EQyWejLm4GefAtJXIc07Pd12eGYb1jD6
         Jp7EeUM8/pL2vI+Z5mEkeVktN39NYhtYVbLMDkVEMDEd051InbnjlmceY3B5DXn94RB3
         r16qGqnnBiC6Apr1tFw/wqMUTdLZ9a8KCo/MvsRlWoIvF/zs7nqJFy4ukI4pMpZssU8B
         h2NXg281pTs1IedBWL1ROHW1W+dt5STCeDjRXxmgxSeM4q+pd/y7wkIf0yaszaQ6UtyK
         hSJOgfBf7LBAQFkNn8IDfkLGe+2b3r+hukzthqVyn/ljMonJFfb0Q7MzaafX+hPbQX0X
         TtEA==
X-Gm-Message-State: AOAM5316/Rw2dvphbIsbw/rNt0GsrdelsOzJxDlf+Albl9xy+AS4EiQ/
        jf+eSNeaanHTZcBgzGBe4QbbNTmNguSioe5yOLAeLKgvFOGGxw==
X-Google-Smtp-Source: ABdhPJxV2IA2m9d5l16yBy3n1SZ0g7UHEZV6/cJ+b6V/XLPjujs0azTgjgMwltUJn2YBO0p0U04OWasRwsCDgvXmOEE=
X-Received: by 2002:ac5:c189:: with SMTP id z9mr9880244vkb.79.1593435092807;
 Mon, 29 Jun 2020 05:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200619151541.15069-1-geert+renesas@glider.be>
In-Reply-To: <20200619151541.15069-1-geert+renesas@glider.be>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Mon, 29 Jun 2020 18:21:21 +0530
Message-ID: <CAHLCerMfp42VHDxhCfnFmxphic0OVD55ZzmzwnrEvfF6WUARgg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-thermal: Improve schema validation
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 19, 2020 at 8:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>   - Document missing "#thermal-sensor-cells",
>   - Factor out common required properties,
>   - "interrupts", "clocks", and "power-domains" are required on R-Mobile
>     APE6, too,
>   - Invert logic to simplify descriptions,
>   - Add "additionalProperties: false".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  .../bindings/thermal/rcar-thermal.yaml        | 53 ++++++++++++-------
>  1 file changed, 34 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
> index 0994693d240f9ff4..88787b98992fe7c9 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
> @@ -59,25 +59,40 @@ properties:
>    resets:
>      maxItems: 1
>
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - renesas,thermal-r8a73a4 # R-Mobile APE6
> -          - renesas,thermal-r8a7779 # R-Car H1
> -then:
> -  required:
> -    - compatible
> -    - reg
> -else:
> -  required:
> -    - compatible
> -    - reg
> -    - interrupts
> -    - clocks
> -    - power-domains
> -    - resets
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,thermal-r8a73a4 # R-Mobile APE6
> +                - renesas,thermal-r8a7779 # R-Car H1
> +    then:
> +      required:
> +        - resets
> +        - '#thermal-sensor-cells'
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: renesas,thermal-r8a7779 # R-Car H1
> +    then:
> +      required:
> +        - interrupts
> +        - clocks
> +        - power-domains
> +
> +additionalProperties: false
>
>  examples:
>    # Example (non interrupt support)
> --
> 2.17.1
>
