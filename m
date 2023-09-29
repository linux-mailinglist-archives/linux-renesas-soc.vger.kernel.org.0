Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61327B32BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 14:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjI2MnT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 08:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjI2MnS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 08:43:18 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F15B7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:43:17 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a1f00b75aaso61562737b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991396; x=1696596196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNxELcT+iHYHYP6th/LGVVioeIHpA7FqP73DsKUjJlo=;
        b=eIBoboNIGoTBS7AuP55t/o6E8BKwqdUxaXM8XseXGM+zerXuX2j2bYlaoe0ry8e0Rx
         gVp8yiudE9h5yLow3NdUuJy+I0Qg+xc3+O5kXlVoH6HpIVVAmL3HUkE6tqnssr86Z2bw
         jCw4EzgdbXnE9eLjK3V+tyxlfD8rVohenQ0+2jqHgJYfrKkBptd/OmLlouFYPkR0hA6C
         NzymXl3isEiTGYchZ/F36i47kVxRUPMVMGAamJP/1Ap7Sb9J86+fojBLSZagLDhp7oem
         sj25QyXigTfKIsrfOQTHlIQbrtIpItWxMbwuqbmvMxwAdnEqyEkbJIw5ai4P5UzrdoT0
         1MdA==
X-Gm-Message-State: AOJu0YwUIAEFjlgbJJKPJ8KhTD7Zj104sJ84DdCnWmb5IZtZTwwf3b0H
        aOtMcCaiXUDgnwXN52/ytkIHXF6G3LQS4Q==
X-Google-Smtp-Source: AGHT+IHk6h6P+jg48HYGZAWZ/C4DJszAg3Je18mJOrIO97/2HH0DSxg0qqMq8E2BBkJOHa/39ya79Q==
X-Received: by 2002:a0d:c983:0:b0:59b:f736:4948 with SMTP id l125-20020a0dc983000000b0059bf7364948mr4187172ywd.33.1695991396235;
        Fri, 29 Sep 2023 05:43:16 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id g203-20020a0dddd4000000b00592548b2c47sm5432634ywe.80.2023.09.29.05.43.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:43:15 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a22f9e2f40so16297467b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:43:15 -0700 (PDT)
X-Received: by 2002:a0d:e294:0:b0:573:bb84:737c with SMTP id
 l142-20020a0de294000000b00573bb84737cmr4412590ywe.26.1695991395684; Fri, 29
 Sep 2023 05:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com> <87msx9im83.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87msx9im83.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Sep 2023 14:43:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7wzyXUf-zZ5q5_iv9n2=ShW1hYXSvk767gvKP3DM11w@mail.gmail.com>
Message-ID: <CAMuHMdW7wzyXUf-zZ5q5_iv9n2=ShW1hYXSvk767gvKP3DM11w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: renesas: renesas.yaml: Add
 renesas,s4sk compatible
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Sep 26, 2023 at 6:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch adds "renesas,s4sk" which target the R-Car S4 Starter Kit
> board.

Thanks for your patch!

> Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

If this patch was developed by Goda-san, and you took it, and submitted
it, there should be a "From: Yusuke Goda ..." line at the top.
On the other hand, if you co-developed the patch with Goda-san, you
can keep your From: line, being the first author, and there should be
Co-developed-by tags, too:
https://elixir.bootlin.com/linux/v6.6-rc1/source/Documentation/process/submitting-patches.rst#L489

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -327,6 +327,7 @@ properties:
>          items:
>            - enum:
>                - renesas,spider-cpu # Spider CPU board (RTP8A779F0ASKB0SC2S)
> +              - renesas,s4sk       # R-Car S4 Starter Kit board (Y-ASK-RCAR-S4-1000BASE-T#WS12)
>            - const: renesas,r8a779f0

The above would be fine if the S4SK board would have had an R8A779F0
SoC. Instead, it has an R8A779F4 SoC.  So please add a section for
R8A779F4, and document the new "renesas,s4sk" and "renesas,r8a779f4"
compatible values, and the fallback to "renesas,r8a779f0".
You can have a look at the R-Car V3H2 section for an example.

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
