Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CA9513659
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 16:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbiD1OJJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 10:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348169AbiD1OIv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 10:08:51 -0400
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87F6A6E28;
        Thu, 28 Apr 2022 07:05:18 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id bu29so8901316lfb.0;
        Thu, 28 Apr 2022 07:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bNf9rw2GTPgYpzsW80GmkQGexZVGoKA1BJoGlD8No+Y=;
        b=VogqCRmhxFkRwr8nDBNgvHaCmpyjlhzoZkhjMjt9m1SOvLlH/nQp63XS0gjtm2DnE6
         kIT6xmVk7rhX5iiV0DOzbrrctb9zbFrHCI0QQZnw8M2a4ZpE7zg0Hze9BkDeomGCWB8i
         KrrQZW85YMsNrLDc+wCJ3OB6z708a15uTkJnFj8ewUZQM307laJEhyGYEbVWngcHQnVF
         ka28f0LymsZPa7x+i0RFRIMv7J3PLXxVKgXWa0ykMktvhH5EH9bKdwzYVIWzWyIsSj1r
         kJ6dWaeaoP5hj3NwoK8jPl9VmzVH/GflxjwqIoD6Bbs3A8cOzthM7IUp42YVw9T+D6hd
         3Vuw==
X-Gm-Message-State: AOAM533LjGgvX6/mmKNuB+WtD7ICj9uSUSfu0LLnqFkhBwVrCWsSrXlz
        PYaGANP7p+X18MVboi6q9fSWxccy6zANwiNs
X-Google-Smtp-Source: ABdhPJwYmpDcH9rfbQctdeLxnv3zG9kxNikjMmwg4q5LWi8UcTSv0oOtaILBn2x9YjDiBqykIWy7QA==
X-Received: by 2002:a05:6512:1511:b0:44a:2f74:3c1c with SMTP id bq17-20020a056512151100b0044a2f743c1cmr23760737lfb.114.1651154716976;
        Thu, 28 Apr 2022 07:05:16 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id f22-20020a2e6a16000000b0024f0cf6fdb0sm3139ljc.138.2022.04.28.07.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 07:04:43 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id j4so8811156lfh.8;
        Thu, 28 Apr 2022 07:04:34 -0700 (PDT)
X-Received: by 2002:a05:6512:12c6:b0:44a:650f:3b86 with SMTP id
 p6-20020a05651212c600b0044a650f3b86mr25233083lfg.79.1651154668136; Thu, 28
 Apr 2022 07:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-11-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 16:04:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBczjWQQdeaiE4NvgvZUc+tkK0o8unoD5ngjGaOM1JCg@mail.gmail.com>
Message-ID: <CAMuHMdVBczjWQQdeaiE4NvgvZUc+tkK0o8unoD5ngjGaOM1JCg@mail.gmail.com>
Subject: Re: [PATCH 10/13] arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
> Enable USB2.0 Host/Device support on RZ/G2L SMARC EVK by
> deleting the nodes which disabled it.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
> @@ -20,54 +20,8 @@ &canfd {
>         status = "disabled";
>  };
>
> -&ehci0 {
> -       /delete-property/ pinctrl-0;
> -       /delete-property/ pinctrl-names;
> -       status = "disabled";
> -};
> -
> -&ehci1 {
> -       /delete-property/ pinctrl-0;
> -       /delete-property/ pinctrl-names;
> -       status = "disabled";
> -};
> -
> -&hsusb {
> -       /delete-property/ pinctrl-0;
> -       /delete-property/ pinctrl-names;
> -       status = "disabled";
> -};
> -
> -&ohci0 {
> -       /delete-property/ pinctrl-0;
> -       /delete-property/ pinctrl-names;
> -       status = "disabled";
> -};
> -
> -&ohci1 {
> -       /delete-property/ pinctrl-0;
> -       /delete-property/ pinctrl-names;
> -       status = "disabled";
> -};

Looks like lots of non-existent pinctrl properties were deleted.
Anyway, they'll be gone soon ;-)

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> @@ -77,4 +77,15 @@ ssi1_pins: ssi1 {
>                          <RZG2L_PORT_PINMUX(3, 2, 2)>, /* TXD */
>                          <RZG2L_PORT_PINMUX(3, 3, 2)>; /* RXD */
>         };
> +
> +       usb0_pins: usb0 {
> +               pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>, /* VBUS */
> +                        <RZG2L_PORT_PINMUX(5, 2, 1)>, /* OVC */
> +                        <RZG2L_PORT_PINMUX(5, 3, 1)>; /* OTG_ID */
> +       };
> +
> +       usb1_pins: usb1 {
> +               pinmux = <RZG2L_PORT_PINMUX(5, 4, 5)>, /* VBUS */

/* OVC */?

> +                        <RZG2L_PORT_PINMUX(6, 0, 1)>; /* OVC */

/*VBUS */?

> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
