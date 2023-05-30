Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC067157BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 09:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjE3H4q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 03:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjE3H4l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 03:56:41 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B92618E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 00:56:22 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-565a022ef06so58131757b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 00:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433381; x=1688025381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6mNBWTnhwOlvY83mMvstfrzzooiFAd7uquWu7nVUeI=;
        b=BXKP60a2XB07y1dB2StJnWJZE2tGfpTgUyxOSf+KOMF9Y/F0ArALJUoNVoTGzObtUf
         xSHUOjdKwVVC8KaiyAfLkLCZH0SZ4q0Y7AKLVCYN6d9VPIEZru9I3TcsjzeqHIBWNK9T
         4pILksBMYfTnw77OZjA/8SZniuyak++G4wmRomzLva4DvTZB8P5oHVPYAWQkxAQUi3QF
         MSu6WIZC1VSt5gIraO+eynb7hShfWmfqAJVKUXqRgkHqqVRmnBPrIMsARFRZ/Or6u0ni
         14fXettlkT/m2ZlDgaRa1kbyIyQQ6xy8Oyqd1o7Nh9RtD3rAbKRj++n0gbTaGm938acH
         QlcA==
X-Gm-Message-State: AC+VfDyRp+Rcl0TTxoXZZ4RZTmXaq7WQSeDMbYd9dMk5wGSiT/33fXDo
        c2TQlSlkNtKsR8C8OV8LrV8oIqhp6CQULg==
X-Google-Smtp-Source: ACHHUZ4h+hN6mb5pmdnv8J/kuw8BcTNPAJt/Iop99yrSMm5E1rUbFfKZ2186jkYPtQFug1qchTmfsQ==
X-Received: by 2002:a81:4993:0:b0:561:e7bb:1b27 with SMTP id w141-20020a814993000000b00561e7bb1b27mr1231494ywa.52.1685433381377;
        Tue, 30 May 2023 00:56:21 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id t12-20020a0dea0c000000b0055a373a7e5asm1568858ywe.131.2023.05.30.00.56.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:56:20 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-565a3cdba71so58392587b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 00:56:20 -0700 (PDT)
X-Received: by 2002:a0d:d684:0:b0:566:386b:75fc with SMTP id
 y126-20020a0dd684000000b00566386b75fcmr1606627ywd.18.1685433380203; Tue, 30
 May 2023 00:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230417100607.309068-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230417100607.309068-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 09:55:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP=9DV=uAP9WXufgaxqpkXOmnd-sfS1c72u5u-uGbC6A@mail.gmail.com>
Message-ID: <CAMuHMdWP=9DV=uAP9WXufgaxqpkXOmnd-sfS1c72u5u-uGbC6A@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas MTU3a counter config
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-arm-kernel@lists.infradead.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
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

On Mon, Apr 17, 2023 at 12:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable MFD & counter related configs for Renesas MTU3a Counter as
> it is populated on RZ/{G2L, LC, UL} and RZ/V2L SMARC EVKs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is based on linux-next.

Thanks for your patch!

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -690,6 +690,7 @@ CONFIG_MFD_SPMI_PMIC=y
>  CONFIG_MFD_RK808=y
>  CONFIG_MFD_SEC_CORE=y
>  CONFIG_MFD_SL28CPLD=y
> +CONFIG_RZ_MTU3=y

It's a pity this can't be modular. Care to fix that?

>  CONFIG_MFD_TPS65219=y
>  CONFIG_MFD_ROHM_BD718XX=y
>  CONFIG_MFD_WCD934X=m
> @@ -1421,6 +1422,8 @@ CONFIG_INTERCONNECT_QCOM_SM8250=m
>  CONFIG_INTERCONNECT_QCOM_SM8350=m
>  CONFIG_INTERCONNECT_QCOM_SM8450=y
>  CONFIG_INTERCONNECT_QCOM_SM8550=y
> +CONFIG_COUNTER=m
> +CONFIG_RZ_MTU3_CNT=m
>  CONFIG_HTE=y
>  CONFIG_HTE_TEGRA194=y
>  CONFIG_HTE_TEGRA194_TEST=m

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
