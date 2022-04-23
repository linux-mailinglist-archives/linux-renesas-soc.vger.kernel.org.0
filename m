Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE0D50CD1C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 20:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbiDWTCN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Apr 2022 15:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiDWTCM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Apr 2022 15:02:12 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F53634B8E
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:59:14 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id m20so1528654ejj.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=L6t8JeuVXI3n4juNtXY29Za/xtEr4GlGI8DFxS7vBcE=;
        b=hVD6aGMaYfMcEo4/UbcVxUdsgilug2t9xBSa90TE8LCKMF97qvOt1Uo5ln8EfC6sgV
         z12zoYN8hiZ6rsr4mAZv3FXmrLao+zpE276FI+VaZRFz7s88GEwdDFj1h4ikeJLBAB2Y
         f0hTyNpfZ02D9ci55T3lhgEu+NbPKJlsSEPzq1QbacbRXEXyS/P0V+uPP6w3Y1c2mTAZ
         4eFlc+ZiWT4q0VD+8mbkjRIVmvqJU415JMkeAujruv/RA6hokQaOG2U/ZB6oMLw8dGGM
         AxdW7IuoDI2zTfn32V6ze+7TMH3878fjUkiMK9+G5ZRxJ7DNszTDi1U0/gfRRPA6pkM5
         VfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L6t8JeuVXI3n4juNtXY29Za/xtEr4GlGI8DFxS7vBcE=;
        b=KtYcWaq9sfGcEmOfaIBW5fN3HQnwgTsTT1j+kMdcaH4FahkRwVC//AmPHkDPPHNVUr
         jXd6EOYyXBeGlZUbU8NTC2HDtdEX5em8L4urWKmjLpt20SCKm7ay2SxVDjKuIANGd1/t
         nNFCI9NMRmtthMIzQWaLcf1AGjivYEiBF8EYdl8zo0PzLPEpd/I7s3xeOn9/HyebCrzj
         6ghPbcxgrecdXHtiOc6fEnNgeQVOchiVrj8nPaiijYvHR9gsFGTnVquRYkoNSMyQC9oL
         KFWZszuVNhQhaVa72c5kSlnOrHSeHkI6wSmyre8t61OuF/GPM7OUHxJo1/ieqw6ZJyt2
         uCQQ==
X-Gm-Message-State: AOAM531Dorfvi2q3aqyZ4v1BiyOfLwraoAMEVCEfZoYGRt4BCBbxd0ch
        kH/TAKxisSTh6pn1EjQUdD0z9g==
X-Google-Smtp-Source: ABdhPJwSRzN2j63ixNgSZmzH7E6RSpXPO1gb6ysERnQWB55lobpeA/mfkYS4mX3z+u2QF00Zo3UJGA==
X-Received: by 2002:a17:907:3d89:b0:6ef:eebf:1708 with SMTP id he9-20020a1709073d8900b006efeebf1708mr9727881ejc.620.1650740353278;
        Sat, 23 Apr 2022 11:59:13 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k22-20020a508ad6000000b00425b0825265sm2516267edk.38.2022.04.23.11.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 11:59:12 -0700 (PDT)
Message-ID: <b2c1d855-73a2-b264-15a0-e50e9fe1dec3@linaro.org>
Date:   Sat, 23 Apr 2022 20:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: usb: renesas,usbhs: Document RZ/G2UL
 bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220423134920.144068-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423134920.144068-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/04/2022 15:49, Biju Das wrote:
> Document RZ/G2ULSoC bindings. USBHS block is identical to one
> found on RZ/A2 SoC. No driver changes are required as generic compatible
> string "renesas,rza2-usbhs" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
