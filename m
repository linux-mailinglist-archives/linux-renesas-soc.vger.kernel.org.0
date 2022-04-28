Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7669B5135CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbiD1N5o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbiD1N5o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:57:44 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B03B53C2;
        Thu, 28 Apr 2022 06:54:29 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id f186so3590494qke.8;
        Thu, 28 Apr 2022 06:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4wOoKdyRe9+2JC+t4n9LJkHjakWvFtD3qMudsoGOQrs=;
        b=nhm9KIIYXWree4nNxSCDVQUMhhFOiQxgvY608rxXB8bbryZ4wArTwfwJPfjgQPIlLA
         GayskvPezqeeEV7pAIYkrdTJlwfflJGCLFAJcPF/mg03cgNq883hJ8iSLpnX4LrGJCly
         ReFLZbUfoErN4X6OUu7SdJsHJnIKZbyNrrUVYNmRVznUpDTerrq5WcGCHB5kJDP2FOeN
         O8ozCK1oAtw3Yv9RAi9iVZKcF8XtRgoOw5XAr4X9FPGFVOwD9saecqO4M9oaBvofFORu
         VTfB1LRtY1WV40aFStcgfR6euBqaYkq/YLebWzekueETzkOFYLw/UwmUjcEnbUVdwzIX
         6wzw==
X-Gm-Message-State: AOAM530JM921HGNUtQqwv9P6gAzpCpPwbRGDMS3VEOmh6BRszAtw6aW9
        frEP+zOi4rDISoynLctYt8AW+9ZxmZ5yOA==
X-Google-Smtp-Source: ABdhPJzOWPSydeGvtyCvYFzWWaKqH6MBXxlO05Qob28vQ6n/y08MA+uuL9Y5x5dthsv/b+bB/QrJmw==
X-Received: by 2002:a37:a689:0:b0:69f:9e41:1381 with SMTP id p131-20020a37a689000000b0069f9e411381mr2650671qke.21.1651154068683;
        Thu, 28 Apr 2022 06:54:28 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id v3-20020a05622a014300b002e1dcd4cfa9sm32603qtw.64.2022.04.28.06.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:54:28 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f7c57ee6feso53922457b3.2;
        Thu, 28 Apr 2022 06:54:28 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr30966882ywa.479.1651154068071; Thu, 28
 Apr 2022 06:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-10-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:54:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKw9fEEN-DpmMbQGwrHEx2s5d2yPTDUtKyB5rvtur48Q@mail.gmail.com>
Message-ID: <CAMuHMdWKw9fEEN-DpmMbQGwrHEx2s5d2yPTDUtKyB5rvtur48Q@mail.gmail.com>
Subject: Re: [PATCH 09/13] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Apr 25, 2022 at 7:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Audio on RZ/G2LC SMARC EVK by adding ssi1 pincontrol entries
> to the soc-pinctrl dtsi and ssi1 and cpu_dai nodes to the board dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> @@ -27,6 +27,31 @@ wm8978: codec@1a {
>         };
>  };
>
> +#if (SW_ET0_EN_N)
> +&snd_rzg2l {
> +       cpu_dai: simple-audio-card,cpu {

You can just refer to &cpu_dai instead?

> +               sound-dai = <&ssi1>;
> +       };
> +};

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
