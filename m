Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3349E1D9B3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 17:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgESPaj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 11:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729132AbgESPab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 11:30:31 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E896C08C5C7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 08:30:31 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id f9so41634uaq.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gRtjuUSYT9o98HLxZ4XPAs12lnRhBaPqO3z+DvVbkXQ=;
        b=qL4QXfwKBZ8jPjCgkPdHLsNzO3/idGDrn4woTx+Iaqn6RAptgipyKH04ujRHYZjG88
         6h+bcxiTfIwF/L9qvccSvRM1/GxUjlw/HeyNlEcnxKgpivdoDc42/1LeeqUf5xXLBe0j
         6HqkWM5XX+UIELvR7g8Lwiy37Sng0XHKrYq9WBGrPxdqaFXz+eY2WtwPjjuqh6abGUZj
         cQuChf+5HtiOSA0tlViPvgzEbmQZFVs5v+qES50lIvTBeC3DvKISZpV9x0QAK0xcnTF0
         wOd+ah2kE6iBsTcmFxS+uJOaF6E6DEmDVtdq120xhn/50fbY/t1Rmg8uZ5MPsvr0eACC
         toQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRtjuUSYT9o98HLxZ4XPAs12lnRhBaPqO3z+DvVbkXQ=;
        b=RR5g+dG8xuCFXAmCnEUgfVOFJfGbgOlHxinSu0uDmmA8/4RH8I8LBoiCSwF6KMXL+N
         ijbHePYSPNzdCg9W+MnlwnLxjVbABlqeiHTcu19zYFBLRgFdPkGb+09NGJ0KS16iVVgo
         x4O2Zrn+x3OM5r9kmEGl0pYMi57W7jZ+6oh2flYvSmVOwAHro/0JNG2/nbFfnZ1AAkRO
         SayXc2Sl04VW2dLIUGAR2twDyxzFas0tsLuju895Iu5e4uUZQqVXcOzcgwErvVIONJRM
         14CO1udn66qOzeu5Y+dlTOLlodsxCNMlRnubqdFYNVC3U18fLPdxyRprjQghjkNHtcIc
         5bpw==
X-Gm-Message-State: AOAM533q9vtSh1Mp8xkCzmH6Vzd0cIOwCgnJySRc1yfMLe+GQYSZduRx
        Mdh9tB2DpOEQhqI6qIOtwPmL1dYOCAeQCPIoi+TbGg==
X-Google-Smtp-Source: ABdhPJzPgBQocJHPBpM1TmD4hAcv+eqS/ZghZr75cOL/pxSov9+iNsVjciXOY1ZcKGnnELDE1CIZW7qYNDDgGWRq0RQ=
X-Received: by 2002:ab0:186d:: with SMTP id j45mr575631uag.104.1589902229726;
 Tue, 19 May 2020 08:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <1589555337-5498-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1589555337-5498-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1589555337-5498-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 May 2020 17:29:52 +0200
Message-ID: <CAPDyKFobJkEUvqJpKOtpLLyLBbxBukASbKPapt5-gxh_iP=cdA@mail.gmail.com>
Subject: Re: [PATCH 04/17] dt-bindings: mmc: renesas,sdhi: Document r8a7742 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-ide@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 15 May 2020 at 17:09, Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document SDHI controller for RZ/G1H (R8A7742) SoC, which is compatible
> with R-Car Gen2 SoC family.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> index e6cc478..0ca9a62 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> @@ -7,6 +7,7 @@ Required properties:
>                 "renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
>                 "renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
>                 "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
> +               "renesas,sdhi-r8a7742" - SDHI IP on R8A7742 SoC
>                 "renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
>                 "renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
>                 "renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
> --
> 2.7.4
>
