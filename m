Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39635B9785
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Sep 2022 11:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiIOJfp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Sep 2022 05:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiIOJfn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2022 05:35:43 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E27532AAE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2022 02:35:41 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 9-20020a1c0209000000b003b494ffc00bso216325wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2022 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=zAQhEoqs9m6tH0S1Pwi/N64OzurKgUWPJ1fRej5gFrw=;
        b=Vjxh0C/hmbpUVZ/3/fYlTE1tcmtpwzvvwDGawLMSy2FaTgqKyMGNDna02fmkZer0uG
         2F+KT5uttz3K/VNbEMKfP2YSLKGCPDcr4o7mo1gjFXINnajbx9vHG+vNUu6ATNkeO2K6
         /oAQ2KuQj2Ai+xTS0VdfkhPPGdD0EfSkjIJ/ljj0hLQAj2VqRjX6e++3iMXqkKIrs1U9
         O6VfGv5tNCb9QcSgo7XHrYDVq+cEdaGjIManrO8mm3MOzzDmlBCgUKqi2ysu7+go8jOh
         wRCl2IWp4OcBBJSP+pKlxKnZz9xqWDNz+oc1/S0/kWkXEOU7yb2jya+pPZ10zliRB/PS
         HkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zAQhEoqs9m6tH0S1Pwi/N64OzurKgUWPJ1fRej5gFrw=;
        b=u77XPCMJ61LEkaaUKC4+yo9X+HFFwLGA4ux5uQ6cMOMxNf1PLZS+ZjwqkINaGWRMrv
         H7rpQhRbc1g7ifiTYM/91KVqMnA0IR5WHEEqLI9hsaxUPmZ81yceiVrHgImP4zWIXHRr
         iZIG4DL0My+Xk4MkG1xdHCl2KGApDU0BSL+3WssH8oD2qqDj0zwzYXBD7t9B0pCDJgxE
         xBp2DPXJbmP7xbGbYx7s0i+z9noASDdWgg0XPpYR41jV19iTU1FPx5FlsL6Svy79USXh
         SMpJPxx3pHUFHI3UyOBX2rNea7Aaa29kHJOZ6HvqWxxBIGkPzUSttvhfAHJJXfmEdPLd
         sfiQ==
X-Gm-Message-State: ACgBeo33v4//S26gULg3zYaGk277S+RJR502kJoyyBq7kSxX5LbSUmEx
        LTIUHopNU2u8IHvFQHeAj+yseA==
X-Google-Smtp-Source: AA6agR7x+cQFPHQpAzgOrdY5Dr+3kqXzw6uVPUGUgZRe4xBrQsDIXWw5+TeXlLrt3hz4d2so4EFEBA==
X-Received: by 2002:a05:600c:3ba0:b0:3b4:8ad0:6c with SMTP id n32-20020a05600c3ba000b003b48ad0006cmr5919992wms.186.1663234540088;
        Thu, 15 Sep 2022 02:35:40 -0700 (PDT)
Received: from krzk-bin ([89.101.193.73])
        by smtp.gmail.com with ESMTPSA id y17-20020adff6d1000000b00228d6edade0sm1995265wrp.46.2022.09.15.02.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:35:39 -0700 (PDT)
Date:   Thu, 15 Sep 2022 10:35:37 +0100
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert
 to json-schema
Message-ID: <20220915093537.qqddtqx2lr5ttuck@krzk-bin>
References: <dbdcffd009302734fe2fb895ce04b72fa1ea4355.1663165000.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dbdcffd009302734fe2fb895ce04b72fa1ea4355.1663165000.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 14 Sep 2022 16:17:37 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Gen2 USB PHY Device Tree binding documentation
> to json-schema.
> 
> Add missing properties.
> Rename the device node from "usb-phy" to "usb-phy-controller", as it
> does not represent a USB PHY itself, and thus does not have a
> "#phy-cells" property.
> Rename the child nodes from "usb-channel" to "usb-phy", as these do
> represent USB PHYs.
> Drop the second example, as it doesn't add any value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Rename nodes to fix "'#phy-cells' is a required property".
> 
> This is the final conversion to json-schema of DT bindings for Renesas
> ARM SoCs, hurray!
> 
> Note that there are still a few plain text bindings left for Renesas IP
> cores that are present on non-Renesas SoCs (nbpfaxi and usdhi6rol0).
> ---
>  .../devicetree/bindings/phy/rcar-gen2-phy.txt | 112 ----------------
>  .../phy/renesas,rcar-gen2-usb-phy.yaml        | 123 ++++++++++++++++++
>  2 files changed, 123 insertions(+), 112 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


usb-phy@e6590100: 'usb-channel@0' does not match any of the regexes: '^usb-phy@[02]$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb

usb-phy@e6590100: 'usb-channel@0', 'usb-channel@2' do not match any of the regexes: '^usb-phy@[02]$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7742-iwg21d-q7.dtb
	arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7743-iwg20d-q7.dtb
	arch/arm/boot/dts/r8a7743-sk-rzg1m.dtb
	arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7744-iwg20d-q7.dtb
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dtb
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dtb
	arch/arm/boot/dts/r8a7745-sk-rzg1e.dtb
	arch/arm/boot/dts/r8a7790-lager.dtb
	arch/arm/boot/dts/r8a7790-stout.dtb
	arch/arm/boot/dts/r8a7791-koelsch.dtb
	arch/arm/boot/dts/r8a7791-porter.dtb
	arch/arm/boot/dts/r8a7794-alt.dtb
	arch/arm/boot/dts/r8a7794-silk.dtb

usb-phy@e6590100: 'usb-phy@0' is a required property
	arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7742-iwg21d-q7.dtb
	arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7743-iwg20d-q7.dtb
	arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7744-iwg20d-q7.dtb
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dtb
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dtb
	arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb
	arch/arm/boot/dts/r8a7790-lager.dtb
	arch/arm/boot/dts/r8a7790-stout.dtb
	arch/arm/boot/dts/r8a7791-koelsch.dtb
	arch/arm/boot/dts/r8a7791-porter.dtb
	arch/arm/boot/dts/r8a7794-alt.dtb
	arch/arm/boot/dts/r8a7794-silk.dtb

usb-phy@e6590100: 'usb-phy@2' is a required property
	arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7742-iwg21d-q7.dtb
	arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7743-iwg20d-q7.dtb
	arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dtb
	arch/arm/boot/dts/r8a7744-iwg20d-q7.dtb
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dtb
	arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dtb
	arch/arm/boot/dts/r8a7790-lager.dtb
	arch/arm/boot/dts/r8a7790-stout.dtb
	arch/arm/boot/dts/r8a7791-koelsch.dtb
	arch/arm/boot/dts/r8a7791-porter.dtb
	arch/arm/boot/dts/r8a7794-alt.dtb
	arch/arm/boot/dts/r8a7794-silk.dtb

usb-phy@e6598100: 'usb-channel@0' does not match any of the regexes: '^usb-phy@[02]$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb

usb-phy@e6598100: 'usb-phy@0' is a required property
	arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb
