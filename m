Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7932E5B8B35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 17:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiINPES (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 11:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiINPES (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 11:04:18 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0283773937
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 08:04:14 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id j8so1025917qvt.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XSErsq1oVxsZiNaDbKGbjDodYp2Fcn0pUHmT6W4JbdY=;
        b=jSad55cW7yWsVisOywosZ2Dz3uRvxpxML/Hgb0JhNv7lba998+QcRvUiVZshrZ5MnL
         +7UIb1TXhC2sVmFuMM1fPfUWXkgPPxjqntfTCTsRwyvs0NCUa7TEoUiy11VjxcUeYb5/
         VuGbb+Yqo4amsZliWgc+kEfUxzbVT4WgftUpu495jZ2kp6zURSsl4i3P6tiks3w5wqUn
         FTbABe49r1wpxTnYB67bztM0tSOtv7FfnlMCCnJR+jQwS+0dDjY4voC89J9ZcJqnCIpi
         MZrZndqPoUaS+FJIJeic9IzjnNWXT2zCleukDANFziU3ju5kwglrgD4ByrrBvh/B8QIa
         93sQ==
X-Gm-Message-State: ACgBeo1lNBT0Z6m9BI0z2XTD0typS93Lbvm4aNAhpkuJ9JZijjxRJOO0
        lqPlx82tKistiijnOaJwpsLazCxnQtwde+wF
X-Google-Smtp-Source: AA6agR4MyokHVbBT5ChJc3S+uvJRKTBRMEgigifnETjqMyhzAiqpt3lvLBtw/WJZ5RI+uwJ9tEQ3cw==
X-Received: by 2002:ad4:5dee:0:b0:4ac:b74f:a03a with SMTP id jn14-20020ad45dee000000b004acb74fa03amr13142441qvb.42.1663167846818;
        Wed, 14 Sep 2022 08:04:06 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id a7-20020ac86107000000b0035ba3cae6basm1775365qtm.34.2022.09.14.08.04.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 08:04:06 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-346cd4c3d7aso183655787b3.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 08:04:06 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr13074872ywe.283.1663167846161; Wed, 14
 Sep 2022 08:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <87leqo58ox.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87leqo58ox.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Sep 2022 16:03:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUK27ust58Pz=oJBOELEKTGs5Cn0crhrakn-3QiaavtPw@mail.gmail.com>
Message-ID: <CAMuHMdUK27ust58Pz=oJBOELEKTGs5Cn0crhrakn-3QiaavtPw@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: renesas: spider: add missing bootargs
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Sep 13, 2022 at 3:06 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch adds missing bootargs for S4 Spider board.
>
> One note is that current Spider board doesn't have Ethernet
> support yet, but this patch adds standard settings for it, too.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts

Just like on White Hawk, I would like to apply this patch to
r8a779f0-spider-cpu.dtsi instead. No need to resend.

> @@ -19,6 +19,7 @@ aliases {
>         };
>
>         chosen {
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
>                 stdout-path = "serial0:115200n8";
>         };
>  };

Reviewed-by: by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
