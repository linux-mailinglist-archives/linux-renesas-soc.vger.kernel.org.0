Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F8E52D053
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 12:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236565AbiESKUM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 06:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236768AbiESKUF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 06:20:05 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E075AEE33;
        Thu, 19 May 2022 03:19:59 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id i20so4439761qti.11;
        Thu, 19 May 2022 03:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eL9MIMmXb+DZaq6vr6BbVmUp5SemuWgZsAc5myxClhA=;
        b=y6KtOzwBJdqajm4Dng1KFBHUmVQ3ZqLl++7zx8f/1ry+YgDrbuIJirJgM8kZFou5Ex
         cO6dkp8/dZm9acaYbOjbXhbV2M8jKr2ZCDS5yDk01XZpExgjjxpMQcqR5NcQgGkyqV07
         3vYUvmtuZy4ScQtru3R6y8Ai8/kfq3Rfvtvn4CFA81THGhG4drO2VogkpiQnrpeWCsSq
         PEEiq/AeXEeBOmetemFSq7kXC32BDxMqnwH1IEw7r4UXot2p8qiOyVF0Qz/lYelH6ktL
         efXcDH2PCgCCCn/bIVlnWEwjkAjXhVBNFU52yI4qdqWbkxhXzu0idh3nqP9X5DkGSDW5
         GQYQ==
X-Gm-Message-State: AOAM533hlKTU7/HR1PcTdh2h1EqcMUPiKhubbvgzWsDNtg0kfuarID0J
        L2/Qjy6fEhuE7nPclxTgT+ClxIJhMrv0PA==
X-Google-Smtp-Source: ABdhPJxyBl2YeT2rjvZTwedOhVM3vStCXbLnmD6Ny5qd67o/G+6kSuMDg1Fa6FLdMIo76xHz1Nemug==
X-Received: by 2002:ac8:5b56:0:b0:2f3:eb25:910e with SMTP id n22-20020ac85b56000000b002f3eb25910emr3109341qtw.616.1652955597943;
        Thu, 19 May 2022 03:19:57 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id he17-20020a05622a601100b002f39b99f6c3sm1010634qtb.93.2022.05.19.03.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 03:19:56 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2fee010f509so51625517b3.11;
        Thu, 19 May 2022 03:19:56 -0700 (PDT)
X-Received: by 2002:a81:6588:0:b0:2f8:b75e:1e1a with SMTP id
 z130-20020a816588000000b002f8b75e1e1amr4011497ywb.358.1652955595834; Thu, 19
 May 2022 03:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220517081645.3764-1-phil.edworthy@renesas.com> <20220517081645.3764-3-phil.edworthy@renesas.com>
In-Reply-To: <20220517081645.3764-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 12:19:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEwEwbpTZq2AV+-YiPKXgaTb8t6Nx3zxeUF0JtEfT8BA@mail.gmail.com>
Message-ID: <CAMuHMdUEwEwbpTZq2AV+-YiPKXgaTb8t6Nx3zxeUF0JtEfT8BA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: rzv2m evk: Enable ethernet
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Tue, May 17, 2022 at 10:17 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Enable Ethernet interface on RZ/V2M EVK.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - No change

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
> @@ -42,3 +43,16 @@ &extal_clk {
>  &uart0 {
>         status = "okay";
>  };
> +
> +&avb {
> +       renesas,no-ether-link;
> +       phy-handle = <&phy0>;
> +       phy-mode = "gmii";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               compatible = "ethernet-phy-id0022.1622",

My schematics says RTL8211FG-CG, not Micrel KSZ9031?
I.e. "ethernet-phy-id001c.c916"?

As there is no PHY reset to deassert, you can remove the compatible
property, and check what's read back from the PHY ID registers.

I'd say you can just drop the compatible value completely, but you
would have to readd it anyway when the PHY reset is documented.

> +                            "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;

Once you have GPIO/IRQ support, you can add the interrupts and
resets properties, pointing to P16_12 resp. P17_00.

> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
