Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA5C52967F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 03:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243074AbiEQBE3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 21:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343509AbiEQBET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 21:04:19 -0400
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E217546B2F;
        Mon, 16 May 2022 18:04:10 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id e189so20684192oia.8;
        Mon, 16 May 2022 18:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KY+QPIdpY9AYCIk1QlFa7rVHWIHqF8P4GNI2gsYC8vE=;
        b=w+JySK5+e9q1fU6BXzgzHmPfu4YkQSEN05s5ceyQpLK7kZQ68Se/uHb1i5EMDJyy4h
         8X3qwd46BjegSQV3QS1j/O8jF7SrqU6P1QvwhKMgnIbB0JKoRO1tGwKHKBXR431clBpW
         plipEnqDXXqN9ymdKYVkOl5KsXBs2Vmo4C4JQGZa4zWLO7Z/ygpOTtOyFOGW1OAHU08y
         H4L5CGkc2fW7FWDsj3yo/VYo3BB1LDGYQUzMnCI4zRVTgNgOXs3t/ks1XO1eUky7V2XL
         t1aQpzyn/JiRYgfMut/re/ecG+PS8QeIZ+LMw4GU2IlfGnhyqsaJFrynjJwkAHqwXRUz
         4GSw==
X-Gm-Message-State: AOAM531c0Bm0zY8kJxlu3yZcVjYn/5uc55dM3Ay/Tks5I8d2KBdmlP5+
        OUi0r0O2gvHmy93pjew2rQ==
X-Google-Smtp-Source: ABdhPJw/iV8lYByMOe+HPVx71PPh6yhbeRQslmXszUH81CIxDaZRhTLo7U7V3vLLE/kPr/t/N3vkWw==
X-Received: by 2002:a05:6808:d52:b0:328:acfc:d265 with SMTP id w18-20020a0568080d5200b00328acfcd265mr14773980oik.290.1652749449949;
        Mon, 16 May 2022 18:04:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d12-20020a056871040c00b000ee2bb503d0sm5914393oag.50.2022.05.16.18.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 18:04:09 -0700 (PDT)
Received: (nullmailer pid 3712320 invoked by uid 1000);
        Tue, 17 May 2022 01:04:08 -0000
Date:   Mon, 16 May 2022 20:04:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert to
 json-schema
Message-ID: <20220517010408.GA3690472-robh@kernel.org>
References: <8e48edc5e7b65f8dfd8b76c583e0265b9b97e62b.1652099944.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e48edc5e7b65f8dfd8b76c583e0265b9b97e62b.1652099944.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 09, 2022 at 02:41:38PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Gen2 USB PHY Device Tree binding documentation
> to json-schema.
> 
> Add missing properties.
> Drop the second example, as it doesn't add any value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Validation gives:
> 
>     Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.example.dtb: usb
>     -phy@e6590100: '#phy-cells' is a required property
> 	    From schema: dt-schema/dtschema/schemas/phy/phy-provider.yaml
> 
> The latter considers '#phy-cells' a required property, as the node name
> matches "usb-phy".  But in this binding the actual PHY providers are the
> child nodes.
> 
> Is there a way to fix this? Overriding "#phy-cells" to "false" doesn't
> work.
> Should all nodes and child nodes be renamed? The (Linux) driver doesn't
> care about the names of the children.

There's an open issue in dtschema for this. I don't have an answer other 
than don't use 'phy' in the parent node name.

> 
> ---
> This is the final conversion to json-schema of DT bindings for Renesas
> ARM SoCs, hurray!

Great, certainly looking better than some! My tracking in linux-next 
gives me this:

For arm:

Processing (r7|r8|r9|emev2|sh73a|gr-|iwg): 
warnings: 283
undocumented compat: 32

arch/arm/boot/dts/(r7|r8|r9|emev2|sh73a|gr-|iwg):32
['ams,as3711']
['arm,coresight-etm3x']
['dlg,da9063-onkey']
['dlg,da9063-rtc']
['dlg,da9063-watchdog']
['dlg,da9063l']
['dlg,da9210']
['i2c-demux-pinctrl']
['renesas,pci-r8a7742', 'renesas,pci-rcar-gen2']
['renesas,pci-r8a7743', 'renesas,pci-rcar-gen2']
['renesas,pci-r8a7744', 'renesas,pci-rcar-gen2']
['renesas,pci-r8a7745', 'renesas,pci-rcar-gen2']
['renesas,pci-r8a7790', 'renesas,pci-rcar-gen2']
['renesas,pci-r8a7791', 'renesas,pci-rcar-gen2']
['renesas,pci-r8a7794', 'renesas,pci-rcar-gen2']
['renesas,pci-r9a06g032', 'renesas,pci-rzn1']
['renesas,r2a11302ft']
['renesas,r9a06g032-dma', 'renesas,rzn1-dma']
['renesas,r9a06g032-rtc', 'renesas,rzn1-rtc']
['renesas,r9a06g032-wdt', 'renesas,rzn1-wdt']
['renesas,rzn1-dmamux']
['renesas,usb-phy-r8a7742', 'renesas,rcar-gen2-usb-phy']
['renesas,usb-phy-r8a7743', 'renesas,rcar-gen2-usb-phy']
['renesas,usb-phy-r8a7744', 'renesas,rcar-gen2-usb-phy']
['renesas,usb-phy-r8a7745', 'renesas,rcar-gen2-usb-phy']
['renesas,usb-phy-r8a77470', 'renesas,rcar-gen2-usb-phy']
['renesas,usb-phy-r8a7790', 'renesas,rcar-gen2-usb-phy']
['renesas,usb-phy-r8a7791', 'renesas,rcar-gen2-usb-phy']
['renesas,usb-phy-r8a7794', 'renesas,rcar-gen2-usb-phy']
['sil,sii9022']
['st,stmpe-ts']
['st,stmpe811']

For arm64:

Processing renesas: 
warnings: 312
undocumented compat: 15

undocumented here means no schema.

arch/arm64/boot/dts/renesas:15
['ilitek,ili2117']
['micron,mt25qu512a', 'jedec,spi-nor']
['nxp,tda998x']
['ovti,ov5645']
['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp']
['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp']
['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp']
['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp']
['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp']
['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp']
['renesas,r9a07g043-ssi', 'renesas,rz-ssi']
['renesas,r9a07g043-tsu', 'renesas,rzg2l-tsu']
['renesas,r9a07g043-usbphy-ctrl', 'renesas,rzg2l-usbphy-ctrl']
['renesas,r9a07g043-wdt', 'renesas,rzg2l-wdt']
['ti,pcm3168a']

I guess board level components don't count and some might be pending.

All this comes from here: https://gitlab.com/robherring/linux-dt/-/jobs

> 
> Note that there are still a few plain text bindings left for Renesas IP
> cores that are present on non-Renesas SoCs (nbpfaxi and usdhi6rol0).
> And H8/300 is being removed.
> ---
>  .../devicetree/bindings/phy/rcar-gen2-phy.txt | 112 ----------------
>  .../phy/renesas,rcar-gen2-usb-phy.yaml        | 123 ++++++++++++++++++
>  2 files changed, 123 insertions(+), 112 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml

Ignoring the node names for now,

Reviewed-by: Rob Herring <robh@kernel.org>
