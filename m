Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3043F6113
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 16:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237998AbhHXO5v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Aug 2021 10:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237931AbhHXO5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Aug 2021 10:57:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40292C061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Aug 2021 07:57:06 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q21so38135856ljj.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Aug 2021 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q47KpM04JtXbjrX4Th8KJJ2WJfmQTigKdxRxjyOEcFo=;
        b=irzcDqLfZcL8M9bY1pfhENXo7KmRfT4Wa6liQxiru7DlQIPrr1a1jcv+sdlnVTnfNF
         kTz3nq4Terj5e/D8wMuUpLch/sXpwIiGVaq/EdRAeC7Xgc2CuBuDMHzM5AJFzczgmdbP
         kK7r68SgojvNOSfuRDLqBqnDF/bg+ugza3KEjo6vIH50Eb9gFaSWJIgIhUwGtgtTwIoh
         C3nNBskl60FUC8rW3xPt7l7xfXwFnzHL2r+nJvVQhdav3DmrDGvkOqQgLLTDWOPBM67c
         cYhCheaEK39sFD1rWMqyYpBsWve18iBR7JNHv2FHSYV37DsIH86p5FEl5d21EtJAxhuN
         moRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q47KpM04JtXbjrX4Th8KJJ2WJfmQTigKdxRxjyOEcFo=;
        b=IJIb8BemMD7l8oUXYHhZcUB1IHgYGmxTJmIjvWI++k5F8ZcETdE1cmqP21nvAhdkag
         ViOigJJ4uIvRRinP2XA0xLvi4aGGQMrM69XRijctGa9XcXmBFf7aB67oS5uKmm5zBUxM
         0GXRnljU4wfkn5agizTPG3JPO2LMxd3Nvqcw8ylqo8y2w++t/m9Mm+5O7X/wmPfOZhY4
         POD2O+b4wpW8v+bPeEUTT/X9PDebl3fUr54t/KEbtMSC/W9PzXf1CmztX1zXmFrUosqM
         44zIq0P/VDdKISuuFdXx6xymRyLUx7ZH2nZc/Q8w3Jal+HhdHhJtdoGbctib9Nzt0tmN
         oeDQ==
X-Gm-Message-State: AOAM531VhXoA10WK6mE6G5r4zY2ADOud6zTHFEpNhjE76JFY+d4qNyMt
        Yi/z9hIFPgND+MsyMWFbraYdtal8JFV6SlZtVnEBSg==
X-Google-Smtp-Source: ABdhPJwfFJKHpnxXv8/1gum9S+upuN8rQP4xRwN2p75hcpwjG5NXTI3vyGKYLQMErsI6Eqom9XZxt10tCGCE/VjFsV0=
X-Received: by 2002:a2e:84ca:: with SMTP id q10mr18815903ljh.182.1629817024632;
 Tue, 24 Aug 2021 07:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com> <20210817090313.31858-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210817090313.31858-2-biju.das.jz@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 24 Aug 2021 16:56:27 +0200
Message-ID: <CAPDyKFrTKSLS8+Wsgj1m_2FtidQJ629ZJXswtxn3JbahozSHOg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: renesas,sdhi: Fix dtbs-check warning
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 17 Aug 2021 at 11:03, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Fix dtbs-check warning pinctrl-names:0:'default' was expected
> for r8a77470-iwg23s-sbc.dts file.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v3->v4:
>  * Removed duplicate clock-names for sdhi-r7sxxxx SoC's
>  Ref:- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210804161325.26996-2-biju.das.jz@bp.renesas.com/
> v3:
>  * New patch to fix the dtbs-check warnings
>  Ref:- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210804091940.23983-1-biju.das.jz@bp.renesas.com/
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 60 ++++++++++++-------
>  1 file changed, 37 insertions(+), 23 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 677989bc5924..43584f4f4c7e 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -9,9 +9,6 @@ title: Renesas SDHI SD/MMC controller
>  maintainers:
>    - Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> -allOf:
> -  - $ref: "mmc-controller.yaml"
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -104,14 +101,46 @@ properties:
>    pinctrl-1:
>      maxItems: 1
>
> -  pinctrl-names:
> -    minItems: 1
> -    items:
> -      - const: default
> -      - const: state_uhs
> +  pinctrl-names: true
>
>    max-frequency: true
>
> +allOf:
> +  - $ref: "mmc-controller.yaml"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-mmc-r8a77470
> +    then:
> +      properties:
> +        pinctrl-names:
> +          items:
> +            - const: state_uhs
> +    else:
> +      properties:
> +        pinctrl-names:
> +          minItems: 1
> +          items:
> +            - const: default
> +            - const: state_uhs
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,sdhi-r7s72100
> +              - renesas,sdhi-r7s9210
> +    then:
> +      required:
> +        - clock-names
> +      description:
> +        The internal card detection logic that exists in these controllers is
> +        sectioned off to be run by a separate second clock source to allow
> +        the main core clock to be turned off to save power.
> +
>  required:
>    - compatible
>    - reg
> @@ -119,21 +148,6 @@ required:
>    - clocks
>    - power-domains
>
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - renesas,sdhi-r7s72100
> -          - renesas,sdhi-r7s9210
> -then:
> -  required:
> -    - clock-names
> -  description:
> -    The internal card detection logic that exists in these controllers is
> -    sectioned off to be run by a separate second clock source to allow
> -    the main core clock to be turned off to save power.
> -
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.17.1
>
