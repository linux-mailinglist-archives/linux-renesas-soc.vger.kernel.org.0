Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC5A5299FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 08:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238130AbiEQG7d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 02:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbiEQG7F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 02:59:05 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAAE3CFCB;
        Mon, 16 May 2022 23:59:03 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id s22so8028415qta.0;
        Mon, 16 May 2022 23:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7g/R0oDW9fAvwgkkRy9KZG6rWZymEuKVEhzrVDAwow=;
        b=Jy651pmivUttNwdAM6CVcT6jYG8vgosfEy3YxPL1R3qC2XNgrAgcLjonbm2fPkJqrO
         ftK3br8cJztBFe7VMTsFXzJ76wSugWh0RSim2l8IRZbMPj9ZpwbNPSFKoYldXOsT3fyH
         RLq5HIVqONQkpxeNpVmGmv7BFZxyAwzdObK9pgHghtE3VtJ00j9sREsPCanlEYt4EsUn
         /mMvwtuziB4nq+RKCutO3eUBlSagKS1mqvjePZX5wlSEhYns33u/q3GNcygnX+5Odaan
         GDNxNTu0voarrvsTlAOD2oOiFL+PPtFS9aiO0GaTsIxJymezRv5fQLjzDuLzIaG6FDER
         RmoA==
X-Gm-Message-State: AOAM531MThM5aNQ3S9GI1AqoLt8sJ1sknXcPzEJg/WaMHqjBggoIpNpj
        O4PvO4Ff4QeFAt9xz9+PtJOU3H9nIHoWJw==
X-Google-Smtp-Source: ABdhPJwcPznuhdnrXcdoVA/gWUKAMjV3nJywhunA5gAJrrsf1mNVrfNOLgqfMRSRc4rki5gBwnz/rQ==
X-Received: by 2002:ac8:4e4f:0:b0:2f8:f64a:ee94 with SMTP id e15-20020ac84e4f000000b002f8f64aee94mr5210114qtw.97.1652770742373;
        Mon, 16 May 2022 23:59:02 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id a66-20020a37b145000000b0069fc13ce231sm7202222qkf.98.2022.05.16.23.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 23:59:02 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2ec42eae76bso176992577b3.10;
        Mon, 16 May 2022 23:59:02 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr24431985ywg.316.1652770741766; Mon, 16
 May 2022 23:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <8e48edc5e7b65f8dfd8b76c583e0265b9b97e62b.1652099944.git.geert+renesas@glider.be>
 <20220517010408.GA3690472-robh@kernel.org>
In-Reply-To: <20220517010408.GA3690472-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 May 2022 08:58:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnvYx93Xo4XHRi3vv8c1OCvX7zqGswHApRnc7VYM+X4g@mail.gmail.com>
Message-ID: <CAMuHMdWnvYx93Xo4XHRi3vv8c1OCvX7zqGswHApRnc7VYM+X4g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Rob,

On Tue, May 17, 2022 at 3:04 AM Rob Herring <robh@kernel.org> wrote:
> On Mon, May 09, 2022 at 02:41:38PM +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas R-Car Gen2 USB PHY Device Tree binding documentation
> > to json-schema.
> >
> > Add missing properties.
> > Drop the second example, as it doesn't add any value.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Validation gives:
> >
> >     Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.example.dtb: usb
> >     -phy@e6590100: '#phy-cells' is a required property
> >           From schema: dt-schema/dtschema/schemas/phy/phy-provider.yaml
> >
> > The latter considers '#phy-cells' a required property, as the node name
> > matches "usb-phy".  But in this binding the actual PHY providers are the
> > child nodes.
> >
> > Is there a way to fix this? Overriding "#phy-cells" to "false" doesn't
> > work.
> > Should all nodes and child nodes be renamed? The (Linux) driver doesn't
> > care about the names of the children.
>
> There's an open issue in dtschema for this. I don't have an answer other
> than don't use 'phy' in the parent node name.

IC...

> > ---
> > This is the final conversion to json-schema of DT bindings for Renesas
> > ARM SoCs, hurray!
>
> Great, certainly looking better than some! My tracking in linux-next
> gives me this:
>
> For arm:
>
> Processing (r7|r8|r9|emev2|sh73a|gr-|iwg):
> warnings: 283
> undocumented compat: 32
>
> arch/arm/boot/dts/(r7|r8|r9|emev2|sh73a|gr-|iwg):32
> ['ams,as3711']

Board component

> ['arm,coresight-etm3x']

ARM core

> ['dlg,da9063-onkey']
> ['dlg,da9063-rtc']
> ['dlg,da9063-watchdog']
> ['dlg,da9063l']
> ['dlg,da9210']

Board components

> ['i2c-demux-pinctrl']

I2C framework

> ['renesas,pci-r8a7742', 'renesas,pci-rcar-gen2']
> ['renesas,pci-r8a7743', 'renesas,pci-rcar-gen2']
> ['renesas,pci-r8a7744', 'renesas,pci-rcar-gen2']
> ['renesas,pci-r8a7745', 'renesas,pci-rcar-gen2']
> ['renesas,pci-r8a7790', 'renesas,pci-rcar-gen2']
> ['renesas,pci-r8a7791', 'renesas,pci-rcar-gen2']
> ['renesas,pci-r8a7794', 'renesas,pci-rcar-gen2']
> ['renesas,pci-r9a06g032', 'renesas,pci-rzn1']

https://lore.kernel.org/r/20220429134143.628428-3-herve.codina@bootlin.com

> ['renesas,r2a11302ft']

I2C device without bindings or upstream driver.

> ['renesas,r9a06g032-dma', 'renesas,rzn1-dma']

https://lore.kernel.org/r/20220427095653.91804-2-miquel.raynal@bootlin.com

> ['renesas,r9a06g032-rtc', 'renesas,rzn1-rtc']

https://lore.kernel.org/r/20220512143920.238987-2-miquel.raynal@bootlin.com

> ['renesas,r9a06g032-wdt', 'renesas,rzn1-wdt']

https://lore.kernel.org/r/20220413082527.155740-2-jjhiblot@traphandler.com

> ['renesas,rzn1-dmamux']

https://lore.kernel.org/r/20220421085112.78858-2-miquel.raynal@bootlin.com

> ['renesas,usb-phy-r8a7742', 'renesas,rcar-gen2-usb-phy']
> ['renesas,usb-phy-r8a7743', 'renesas,rcar-gen2-usb-phy']
> ['renesas,usb-phy-r8a7744', 'renesas,rcar-gen2-usb-phy']
> ['renesas,usb-phy-r8a7745', 'renesas,rcar-gen2-usb-phy']
> ['renesas,usb-phy-r8a77470', 'renesas,rcar-gen2-usb-phy']
> ['renesas,usb-phy-r8a7790', 'renesas,rcar-gen2-usb-phy']
> ['renesas,usb-phy-r8a7791', 'renesas,rcar-gen2-usb-phy']
> ['renesas,usb-phy-r8a7794', 'renesas,rcar-gen2-usb-phy']

This patch.

> ['sil,sii9022']

https://lore.kernel.org/r/3b2619682694050696e5c85269ccc4f864590e66.1638540704.git.geert+renesas@glider.be

> ['st,stmpe-ts']
> ['st,stmpe811']

Board components

>
> For arm64:
>
> Processing renesas:
> warnings: 312
> undocumented compat: 15
>
> undocumented here means no schema.
>
> arch/arm64/boot/dts/renesas:15
> ['ilitek,ili2117']

https://lore.kernel.org/r/0c5f06c9d262c1720b40d068b6eefe58ca406601.1638539806.git.geert+renesas@glider.be

> ['micron,mt25qu512a', 'jedec,spi-nor']

Board component

> ['nxp,tda998x']

https://lore.kernel.org/r/1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be

> ['ovti,ov5645']

Board component

> ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp']
> ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp']
> ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp']
> ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp']
> ['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp']
> ['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp']

Driver in staging without any bindings

> ['renesas,r9a07g043-ssi', 'renesas,rz-ssi']

https://lore.kernel.org/r/20220423133154.141027-1-biju.das.jz@bp.renesas.com

> ['renesas,r9a07g043-tsu', 'renesas,rzg2l-tsu']

https://lore.kernel.org/r/20220501081930.23743-1-biju.das.jz@bp.renesas.com

> ['renesas,r9a07g043-usbphy-ctrl', 'renesas,rzg2l-usbphy-ctrl']

https://lore.kernel.org/r/20220423134601.141975-1-biju.das.jz@bp.renesas.com

> ['renesas,r9a07g043-wdt', 'renesas,rzg2l-wdt']

https://lore.kernel.org/r/20220424071323.151757-1-biju.das.jz@bp.renesas.com

> ['ti,pcm3168a']

Board component

> I guess board level components don't count and some might be pending.

Some have been pending (or blocked) for a long time...

> All this comes from here: https://gitlab.com/robherring/linux-dt/-/jobs

> Ignoring the node names for now,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
