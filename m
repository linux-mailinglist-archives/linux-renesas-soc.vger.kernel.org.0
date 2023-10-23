Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23DC77D3AA3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 17:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjJWPYn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 11:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjJWPYm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 11:24:42 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224F7DB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 08:24:40 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso49170161fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698074678; x=1698679478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wn+/cuIsAm1M8WgrztuEIP/JufWrXE9je0kNSVLLQhw=;
        b=ey1ipz+7YjvG9QsfNaXmTWANhv0n5IVb9DRSxgkFVzhrQdfh/XmOKEYa2ePdEm3lBy
         M2YKifqBbB9z0mClsSWevzWaN/sjBSS7qD2j4PmIdVEchNOqbkfEOxRe/yhgh3qr7u41
         RcDdCcITDiHJJ1QpoGkugwmAPP1MPAVqLYI23peVwjkKL5cLHXiS37Rf6RWfy507dUqZ
         zSCzDCFHrCo6jfIb8FYWK+JRBlux1ncrTWN7QQdb03rZ5KxkgDIyW8Nn5KlMB1fzzsM9
         T7EDQCtZGCYxB9WhliImgawdx0S22xvYVlEBur6znKEfgbPfw8o+935d0x9PPhN8txZR
         4NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698074678; x=1698679478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wn+/cuIsAm1M8WgrztuEIP/JufWrXE9je0kNSVLLQhw=;
        b=nYJWqM7NZo4pS886uj0IgGREbOLB6bJp8ApP+gFpMGqm0w3sOsmOVAICADMyTIrx+7
         7QOs7Mg+N4UEbONQ50bA97PAITMAJ4dvhKOA+aXAbgoMtOBvNRJ1Ac7VP1TB3p5N4C3s
         VPQc/ygEOcQZ01CiqCg8jC/340mWM3yhpv8oPc6kjMZUMYO/f87zp5sn1suBcAHWbZhr
         iSd6qs4EGi3GMG+OnNEZFrkwM338Vdrg7QloTOnzgqnIw/zq3wEy2SYhKeNtaAvMxt8f
         fSIvVdazYoFc3PvYOYyhlxfkm6kuHlqsDnFv0crgrJXFta2B/V3IkWgv/9gyDWtQHD5i
         Mvdg==
X-Gm-Message-State: AOJu0Yz7OUqIDM4h0UijIofqKSfGRWg5f604I2AhNEhUVH7IBmxvGJKn
        movpmHSM80WZ8rS3Dp4M34WNdQ==
X-Google-Smtp-Source: AGHT+IEn9DezJLQOP+TApb1JLeDNLiRu23ST/BmgqHwWEvtC8BvNsG4o3xtvL8cQYSaBpK9goB9MyA==
X-Received: by 2002:a2e:8656:0:b0:2c5:1c9d:7f81 with SMTP id i22-20020a2e8656000000b002c51c9d7f81mr7233131ljj.32.1698074678308;
        Mon, 23 Oct 2023 08:24:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id w11-20020a5d608b000000b0032008f99216sm7960428wrt.96.2023.10.23.08.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 08:24:37 -0700 (PDT)
Message-ID: <4e2928a0-b2e6-4651-8cab-7f1c4d8f697d@linaro.org>
Date:   Mon, 23 Oct 2023 17:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dt-schema] schemas: gpio: gpio-consumer: Fix false
 positives on nodes named gpio
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20231023144134.1881973-1-geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231023144134.1881973-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/10/2023 16:41, Geert Uytterhoeven wrote:
> Just like for "gpio", nodes can be named "gpios" or
> "<something>-gpio(s)", causing false positive failures.
>=20
> See also commit 80120fccde170902 ("schemas: gpio: fix false positive
> failures on nodes named 'gpio'").
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Seen on Linux, e.g.:
>=20
>     arch/arm/boot/dts/renesas/r8a7779-marzen.dtb: /: keyboard-gpio: {'c=
ompatible': ['gpio-keys-polled'], 'poll-interval': [[50]], 'pinctrl-0': [=
[29]], 'pinctrl-names': ['default'], 'key-3': {'gpios': [[28, 19, 1]], 'l=
inux,code': [[4]], 'label': ['SW1-3'], 'debounce-interval': [[20]]}, 'key=
-4': {'gpios': [[28, 20, 1]], 'linux,code': [[5]], 'label': ['SW1-4'], 'd=
ebounce-interval': [[20]]}} is not of type 'array'
> 	    from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.=
yaml#
>     arch/arm/boot/dts/renesas/r8a7779-marzen.dtb: pinctrl@fffc0000: key=
board-gpio: {'pins': ['GP_0_19', 'GP_0_20'], 'bias-pull-up': True, 'phand=
le': [[29]]} is not of type 'array'
> 	    from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.=
yaml#

keyboard-gpio is not commonly used names. Most (almost all) boards just
call it "gpio-keys".

>=20
>     arch/arm/boot/dts/microchip/at91-kizbox3-hs.dtb: /: gpios: {'compat=
ible': ['gpio'], 'status': ['okay'], 'rf_on': {'label': ['rf on'], 'gpio'=
: [[38, 83, 0]], 'output': True, 'init-low': True}, 'wifi_on': {'label': =
['wifi on'], 'gpio': [[38, 84, 0]], 'output': True, 'init-low': True}, 'z=
be_test_radio': {'label': ['zbe test radio'], 'gpio': [[38, 53, 0]], 'out=
put': True, 'init-low': True}, 'zbe_rst': {'label': ['zbe rst'], 'gpio': =
[[38, 57, 0]], 'output': True, 'init-low': True}, 'io_reset': {'label': [=
'io reset'], 'gpio': [[38, 62, 0]], 'output': True, 'init-low': True}, 'i=
o_test_radio': {'label': ['io test radio'], 'gpio': [[38, 73, 0]], 'outpu=
t': True, 'init-low': True}, 'io_boot_0': {'label': ['io boot 0'], 'gpio'=
: [[38, 75, 0]], 'output': True, 'init-low': True}, 'io_boot_1': {'label'=
: ['io boot 1'], 'gpio': [[38, 81, 0]], 'output': True, 'init-low': True}=
, 'verbose_bootloader': {'label': ['verbose bootloader'], 'gpio': [[38, 4=
3, 0]], 'input': True}, 'nail_bed_detection': {'label': ['nail bed detect=
ion'], 'gpio': [[38, 44, 0]], 'input': True}, 'id_usba': {'label': ['id u=
sba'], 'gpio': [[38, 64, 1]], 'input': True}} is not of type 'array'
> 	    from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.=
yaml#

compatible =3D "gpio"? Is there such binding?

I think we should not allow "gpios" as a node, at least above examples
do not justify it.

>=20
> For marzen, the alternative fix would be to
> s/keyboard-gpio/keyboard-polled/g.
> ---



Best regards,
Krzysztof

