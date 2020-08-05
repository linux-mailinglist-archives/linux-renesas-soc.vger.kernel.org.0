Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F3F23C5E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 08:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgHEGdA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 02:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgHEGc4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 02:32:56 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF83C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2020 23:32:56 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j23so15882341vsq.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2020 23:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3i8XFESZihDO6mc3/4tfcR56mY/Nrg7Lzf+GDZhYM0g=;
        b=u+hjsVhIDKbvRcozTis1DkPn0ESZP+Sd8wJOYW7WIDQKDcD7a4CcJkAWutLduFx1Ac
         2jOZERHr/wrMd0HMCF3FNsxtJxv3fiLLKPX4kzcT9AOdYmXNV68G2Qzcjxj1YffFf50R
         2xg3/w5dyp8w+Dbj3V1/VawrbYwILC569f3qDEjI0SFAak1NcLF9cMesEXGrZ+XP3Xry
         WBn4lK7J2UIPYRV2SZtBvzCcdSQlRsWQo2/DuhaLoKYe/JQ7SM30i00eYs12UP0YBniE
         yl0hpANKnYMyu9U8yCOpAbgs+p5G3lAxsa2PEMhfyT2+RVpnQL4tDH5uxTswkKlYq0ky
         IcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3i8XFESZihDO6mc3/4tfcR56mY/Nrg7Lzf+GDZhYM0g=;
        b=sHzV1t3YJp6nNZB8GlzmAETcKOu0me5jQSgQeX4ljChgu2veeODqxkShNbN5WAUsQY
         O130t47JXlHw+j25SmlBf/4p4tk8p3eCfdfziE1jzI1qpIxUZLjLPI4OlubzXWwvwguY
         4tpGMRAxMrA0bd1gnEG3/B1QEsz8M18CGp5+CsRfzUOAjLplSpPwSDFTI8lK4Oad38He
         PM7fcahwfbf/ZEm+4JUfmJ96PRw5jHyFGMklckZm13ouw1WmjxGb6JgTTPSjfLbF7/ve
         yPGdCeD98/r6bVhLViAIKoRDqFjEgERnQLlhVcDnSfY/HCi2RZZOQZe9FMseNCbYrcZC
         GqNw==
X-Gm-Message-State: AOAM532EWePLii0Zeh+YBiMPlc0rowceVnh8az+mmOGoqF1F/qgnKdBX
        L9kblw2jekmU5NjshMyWwH/tqoJAPSC0ise22fHR/w==
X-Google-Smtp-Source: ABdhPJwRtcGnWnSrfLNC1GRoMPhliXQgGipO4zbcYB0cTmrrdPOh4Q7PwFb5o1O0BAF8kY6G3DlVTaO3sR41MJVFDyg=
X-Received: by 2002:a05:6102:382:: with SMTP id m2mr883411vsq.34.1596609175004;
 Tue, 04 Aug 2020 23:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 5 Aug 2020 08:32:18 +0200
Message-ID: <CAPDyKFqeiEUeajprG=Bx3Nion8bGpVrDOuM7q6-kLDpOMY-QbQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: mmc: renesas,sdhi: Add r8a774e1 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 8 Jul 2020 at 19:48, Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document SDHI controller for RZ/G2H (R8A774E1) SoC, which is compatible
> with R-Car Gen3 SoC family.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Sorry, but this doesn't apply as the DT doc has been converted to
YAML. Can you please rebase and respin.

Kind regards
Uffe



> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> index 0ca9a622cce0..779e484fa3ef 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> @@ -14,6 +14,7 @@ Required properties:
>                 "renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
>                 "renesas,sdhi-r8a774b1" - SDHI IP on R8A774B1 SoC
>                 "renesas,sdhi-r8a774c0" - SDHI IP on R8A774C0 SoC
> +               "renesas,sdhi-r8a774e1" - SDHI IP on R8A774E1 SoC
>                 "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
>                 "renesas,sdhi-mmc-r8a77470" - SDHI/MMC IP on R8A77470 SoC
>                 "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
> --
> 2.17.1
>
