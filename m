Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331AE78F063
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 17:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346620AbjHaPc7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 11:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345989AbjHaPc7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 11:32:59 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C40AE53;
        Thu, 31 Aug 2023 08:32:56 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1ccb58b0099so538338fac.0;
        Thu, 31 Aug 2023 08:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693495975; x=1694100775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hcrnB2F8lyWwzX7mYsHECAXPLOtvdjL4oOKYMjzocU=;
        b=MRqM9Iee4AC9EJyRR8INNPgfUBbNBa7L/DUnGrPoNn7CfVSKk+dIh67hoCZueTIOkD
         JG6Gq5O3SXjglN/h7r0xunzhRUndm1LXU/78xWK62txNfKO3f8pQV2+twTE+11KSaEAI
         IpEzq+kTJoFoOkRmZUk2CClft8tI6SYzn61cdF02T2QpcZt6RfqBACxDP9mJUapog53f
         FHct4POLGgbdoiSMOXG/u+3jOt7cfFc0GwvALifbUPJC1003Xi9pU7uq/brrWiG+ddOU
         /BuWX2VWsSFQKmM/kGuFdz4v7Pe2p56Ntt2iBDHxj1ifq0SOB2oWv1itIL40qjNknTvk
         izNg==
X-Gm-Message-State: AOJu0Yz05b+cP9JpAvWNJd5rjIkg0BRAfUW8vW1oZcq3cEG1qC6h3x14
        o9ha+5tNeVgXPXJ8wj0HtKYtqlugVdr8QQ==
X-Google-Smtp-Source: AGHT+IFG8t8vslsXXzOxK4XZnMgpYmNNFSDISZkI96uF+tHXZ932RZ6N/kxPKYkv+dxy0j3XEfRnMg==
X-Received: by 2002:a05:6870:1606:b0:1bf:a95:7a3f with SMTP id b6-20020a056870160600b001bf0a957a3fmr7354077oae.54.1693495975059;
        Thu, 31 Aug 2023 08:32:55 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id s3-20020a4a5103000000b0056d361ca33fsm822979ooa.16.2023.08.31.08.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 08:32:54 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5738cb00eebso580399eaf.2;
        Thu, 31 Aug 2023 08:32:54 -0700 (PDT)
X-Received: by 2002:a05:6358:61c5:b0:139:c7cb:77b8 with SMTP id
 x5-20020a05635861c500b00139c7cb77b8mr6505385rwx.20.1693495974703; Thu, 31 Aug
 2023 08:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230825090518.87394-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230825090518.87394-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 17:32:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEBREj_Y-wQ=fRQu9mnYyCF6Ut7ZhvRkM0N6eWFXp0Qw@mail.gmail.com>
Message-ID: <CAMuHMdVEBREj_Y-wQ=fRQu9mnYyCF6Ut7ZhvRkM0N6eWFXp0Qw@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: renesas: rz-smarc-common: Use versa3 clk
 for audio mclk
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Aug 25, 2023 at 11:05 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Currently audio mclk uses a fixed clk of 11.2896MHz (multiple of 44.1kHz).
> Replace this fixed clk with the programmable versa3 clk that can provide
> the clocking to support both 44.1kHz (with a clock of 11.2896MHz) and
> 48kHz (with a clock of 12.2880MHz), based on audio sampling rate for
> playback and record.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped clock-output-names from dtsi files.
>  * Updated example with dropping clock-output-names.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -105,6 +105,26 @@ &i2c3 {
>
>         status = "okay";
>
> +       versa3: versa3@68 {

clock-generator@ (everywhere)

> +               compatible = "renesas,5p35023";
> +               reg = <0x68>;
> +               #clock-cells = <1>;
> +               clocks = <&x1>;
> +
> +               renesas,settings = [
> +                       80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
> +                       00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
> +                       80 b0 45 c4 95
> +               ];
> +
> +               assigned-clocks = <&versa3 0>, <&versa3 1>,
> +                                 <&versa3 2>, <&versa3 3>,
> +                                 <&versa3 4>, <&versa3 5>;
> +               assigned-clock-rates = <24000000>, <11289600>,
> +                                      <11289600>, <12000000>,
> +                                      <25000000>, <12288000>;
> +       };

Please move this node down, to preserve sort order (by unit-address).

Same comments arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi

Unless we're gonna need a new iteration for some other reason (the
corresponding fixes for the clock index order are not yet in linux-next),
I can fix the above while applying...


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
