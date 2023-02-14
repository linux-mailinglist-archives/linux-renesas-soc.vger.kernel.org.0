Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694ED6960A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 11:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbjBNKZl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 05:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjBNKZk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 05:25:40 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE4623643;
        Tue, 14 Feb 2023 02:25:39 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id t8so402545qvr.5;
        Tue, 14 Feb 2023 02:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjJ9MvwYAGnuo/aKwD0dp7qQ9csWfaUS/BKK0n8Vq2I=;
        b=hAj2jJFnMB05V2VRv7x0CRlWR+fwTxTe+lpx08Z/QAhaOzrWmiKauDIo8Ofqh7//7+
         B9HxTjiHsPHGfz+AfZL81MWwkRTaYZ2NTPzdp2nP/nhxGGI2jRlu8wX2vwF/94lRMOCZ
         HbMrRYbyN86drDtdVJoOOnNdExUf9wxvbiuUpwlzob8tufDTtiohhrTMDS+hA2S3uYRq
         PKobbLU4RIBvHRyRFUo3nhSRskrTrj/1zDPepfsl9O9YlWUw6NVg7WBlkSusR0UbLRcf
         cF2qt6BzdpYb5/yJVmF7Z8yxn/BHR6T1kvrlr8YuJqhw7r/dd7UCyXsZM+iEMLrEgkDz
         Ne6w==
X-Gm-Message-State: AO0yUKXcqL57C98S0OUKCgKrPmJ+lyk0sVqH2La6UjLH84f5tOniIe4x
        jlj06BqoIO/9IzRJdtuaXX6GSGdbkSIQrlcG
X-Google-Smtp-Source: AK7set/SmcJYQ26sAWeUVyj4ZPt1BkMHfDODRav9wEvvrwgikSaVMRltgcPzY4rD7+tbEdY+wfKSew==
X-Received: by 2002:a05:6214:2b06:b0:56a:b623:9b09 with SMTP id jx6-20020a0562142b0600b0056ab6239b09mr4130665qvb.14.1676370338724;
        Tue, 14 Feb 2023 02:25:38 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id t3-20020a379103000000b0070617deb4b7sm11484044qkd.134.2023.02.14.02.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 02:25:38 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id b1so6533258ybn.2;
        Tue, 14 Feb 2023 02:25:38 -0800 (PST)
X-Received: by 2002:a5b:691:0:b0:86e:1225:b335 with SMTP id
 j17-20020a5b0691000000b0086e1225b335mr270933ybq.455.1676370338088; Tue, 14
 Feb 2023 02:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20230209125656.191905-1-biju.das.jz@bp.renesas.com> <20230209125656.191905-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230209125656.191905-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 11:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWd8Fi1T15KU3PzThuGRFCoS=5Ge-gs8SXzGJMNmhz_EQ@mail.gmail.com>
Message-ID: <CAMuHMdWd8Fi1T15KU3PzThuGRFCoS=5Ge-gs8SXzGJMNmhz_EQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: rzv2m evk: Enable pwm
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Thu, Feb 9, 2023 at 1:57 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable pwm{8..14} on RZ/V2M EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
>  * No change

Not entirely correct...

> --- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts

> +&pwm14 {
> +       pinctrl-0 = <&pwm14_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
>  };
>
>  &pwc {

Rebased on top of the addition of "pwc", and now breaking sort order...
I can handle that, though (once the bindings are accepted).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
