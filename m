Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4450F4DDA50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbiCRNQs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235209AbiCRNQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:16:47 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551612DCBDE;
        Fri, 18 Mar 2022 06:15:29 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id j21so6828404qta.0;
        Fri, 18 Mar 2022 06:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nZF4iwCtwfc/U06tprwUwQy8+UX3PD5BLkZFh8vnPLc=;
        b=x0qfXFGuKkWiMvGfD4VrsoC+hvzCDXgMfv1ySJEUKz30nLVjlQ1jTb5YMdbYUxCfbJ
         gYtp0NRa5gZArOR2jsyJDbOJGHG7MmukdPApF9It2ULaryb/JqQ6p7rkU5z0rwiUZz+m
         RsOH45OjBrpXYga1MXZnzlZBjJATt2bmnayP2/gZGFQhS1wVRcIZsjDZmpLdDzMbq2En
         IsAhj6DAlT+3VVpXyzQTzJ/0DNeHy6BAIr8B+qzzxYgAijgLo186FzMl4waBxmj7yiCG
         nAbhJeu3b+c/AwnqC/tH7NOOLop9Xrm9rwFHUg2iKHMGDVYt6ZqHr12ebBVog57IF3L7
         PUQQ==
X-Gm-Message-State: AOAM530C71KgZ+DUf8qPg4mcccFTwbIn0zZ+UILBCGfyJZpdn8JkOFI/
        v4umfUqV2AOVO0wAUAXTrF5sgDy/zAlb0i2E
X-Google-Smtp-Source: ABdhPJxZqs1zk8UcANFQfIukNosytXmlgSp1JCAZLbTUOkkN2dkDl/mIU4loiWfG+YYvn/xyzK2gHQ==
X-Received: by 2002:a05:622a:1894:b0:2e1:cbdb:8b74 with SMTP id v20-20020a05622a189400b002e1cbdb8b74mr7105907qtc.643.1647609327646;
        Fri, 18 Mar 2022 06:15:27 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id p13-20020a05622a048d00b002e1ce0c627csm5977035qtx.58.2022.03.18.06.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:15:27 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2e5e176e1b6so13061287b3.13;
        Fri, 18 Mar 2022 06:15:27 -0700 (PDT)
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr11364700ywb.256.1647609326781; Fri, 18
 Mar 2022 06:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220307192436.13237-1-biju.das.jz@bp.renesas.com> <20220307192436.13237-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220307192436.13237-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:15:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa2vZBrX7C9e9ZMHGHVNxWbaPT3zuTE7TUhr2Ts8Pj1w@mail.gmail.com>
Message-ID: <CAMuHMdWa2vZBrX7C9e9ZMHGHVNxWbaPT3zuTE7TUhr2Ts8Pj1w@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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

On Mon, Mar 7, 2022 at 8:24 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on the
> carrier board.  This patch adds pinmux and spi1 nodes to the carrier
> board dtsi file and drops deleting pinctl* properties from DTS file.
>
> RSPI1 interface is tested by setting the macro SW_RSPI_CAN to 0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> @@ -13,9 +13,3 @@
>         model = "Renesas SMARC EVK based on r9a07g044c2";
>         compatible = "renesas,smarc-evk", "renesas,r9a07g044c2", "renesas,r9a07g044";
>  };
> -
> -&spi1 {
> -       /delete-property/ pinctrl-0;
> -       /delete-property/ pinctrl-names;
> -       status = "disabled";
> -};

The common properties in rz-smarc-common.dtsi are indeed no
longer removed...

> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -74,6 +74,14 @@
>         };
>  };
>
> +#if (!SW_RSPI_CAN)
> +&spi1 {

Spi1 should be inserted after scif1 below.

> +       pinctrl-0 = <&spi1_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +#endif

... so regardless of the value of SW_RSPI_CAN, spi1 will be enabled?

I think you want to protect the disable block in r9a07g044c2-smarc.dts
by #if SW_RSPI_CAN/#endif instead?

  + #if SW_RSPI_CAN
    &spi1 {
           /delete-property/ pinctrl-0;
           /delete-property/ pinctrl-names;
           status = "disabled";
    };
  + #endif

> +
>  /*
>   * To enable SCIF1 (SER0) on PMOD1 (CN7), On connector board
>   * SW1 should be at position 2->3 so that SER0_CTS# line is activated

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
