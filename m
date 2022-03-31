Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D96D4EDAD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 15:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236994AbiCaNtv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 09:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236991AbiCaNtv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 09:49:51 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAE7109A5D;
        Thu, 31 Mar 2022 06:48:00 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id e22so19734921qvf.9;
        Thu, 31 Mar 2022 06:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LFWnah2E6+Fgc5HWCjn6ozahU3n0atGHM+a5Eiiz7BQ=;
        b=7P4vDmGe3JnCl20ac3KPSkv/flJhIQechn8+vOnxDc3lXF0Ard2XYjs1K3QduF8NAb
         5ZRj3FYbcVZELiY7traEFByuabn2cNs9whNOqbgcC9jbp3KYap2/14MA4Ed/XH0TzF5K
         qg/nk5Ukk11a8SFDe3YbvUQ2LgM0l0peikhnlfAxNWiTpUsZmYWbgETIb5ObOf/mXcx3
         vzdnOIVQOVkQkp2Wb8SPQiRh8lxFQmuA4gAfWOcD9RdSIJBNRQzMEXfn7SupkUyAu0RE
         jmN7f6fokrNDkZ20EXPW8DtXiQ8n1LYGLtvzMVESYqfvV9+Zs9RUP8esNncFs2c2e06e
         WTLw==
X-Gm-Message-State: AOAM533RleNWAAlDc0hS2/NbvLyCs6Ty5CVpRmtu1R9jEUbuUHgQ6JLK
        oGNdeLZ5MeZfwVcL9jHZf31knXKbaTVPVA==
X-Google-Smtp-Source: ABdhPJz2XxfMyVh8cXUO0oJV2/OUZk704SW/Q2jNor/xpLkgLzj9aNSY9J0iiRydf/FfsBCz9VIsWw==
X-Received: by 2002:a05:6214:2344:b0:441:8201:7246 with SMTP id hu4-20020a056214234400b0044182017246mr3901845qvb.120.1648734479383;
        Thu, 31 Mar 2022 06:47:59 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id c10-20020ac87dca000000b002e1db1b7b10sm19555901qte.25.2022.03.31.06.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 06:47:59 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id y38so39743355ybi.8;
        Thu, 31 Mar 2022 06:47:58 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr4354169ybf.6.1648734478572; Thu, 31 Mar
 2022 06:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135629.16876-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220321135629.16876-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 15:47:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyMd3Haqbg3wh3o3jty6aqzZ+f_-59tvwyEOzP=6cuew@mail.gmail.com>
Message-ID: <CAMuHMdXyMd3Haqbg3wh3o3jty6aqzZ+f_-59tvwyEOzP=6cuew@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Mar 21, 2022 at 2:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on the
> carrier board.  This patch adds pinmux and spi1 nodes to the carrier
> board dtsi file and drops deleting pinctl* properties from DTS file.
>
> RSPI1 interface is tested by setting the macro SW_RSPI_CAN to 0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Sorted the node alphabetically
>  * Delete/disable pinctrl/spi node, when SW_RSPI_CAN macro is set to 1.
>    This change is done in common file, so that both single core and
>    dual core RZ/G2LC SMARC EVK can reuse the same.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -158,3 +158,17 @@
>         status = "okay";
>  };
>  #endif
> +
> +#if (!SW_RSPI_CAN)
> +&spi1 {
> +       pinctrl-0 = <&spi1_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};

Unless I'm missing something, the above is overriding properties in
the spi1 node in rz-smarc-common.dtsi with the exact same values they
already have?

So I think this branch can be removed, and only the #else below
should be kept.

> +#else
> +&spi1 {
> +       /delete-property/ pinctrl-0;
> +       /delete-property/ pinctrl-names;
> +       status = "disabled";
> +};
> +#endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
