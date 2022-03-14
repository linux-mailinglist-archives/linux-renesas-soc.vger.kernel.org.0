Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4844D8681
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Mar 2022 15:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242188AbiCNON3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 10:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbiCNON2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 10:13:28 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBCF13F83;
        Mon, 14 Mar 2022 07:12:18 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id s16so12813263qks.4;
        Mon, 14 Mar 2022 07:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ZLdWAWp9Fbm0O3KjBUk+mX1AHuoBlp7BKubFcMPo18=;
        b=G7vZ3ePQVkFT3oOgg/svs8XDR85WP7h10LstzbDqJf2HZt+GggBaiE9PmkHWOsQD/s
         YFCSnHxwPzCYNQU4T0v4hNN3hzf1Y3LcvFwqrMrAo86y555OIXCJCmJQwIb51sSwBRq8
         w83DjPGuMslCArmwurg1h15HEfPfL48ZcSVQ7+an5qXjua7j8wG/2k/iuzsIX8m8u0qk
         dI/W8bM1Xe91UBXDkym3ChQqnNvXwXijK0zKjWm1WnWVGhM+IJqUFfFfdfgKyRALTkTd
         3rqcKzXW0+HJr2mbwEQmjEaTN5uYYPbdatWJUVhIwA42ZBiENxYJ0zUPn+T+vjeqgQtc
         BfqA==
X-Gm-Message-State: AOAM533ncpW+yk4+RtITbgeXpCAmyRQYN0Srf2dgmYsEI0Gl29DAhDZv
        dv5I5O5rcwlSMkshdRhRxdsWoPJc8mr9ww==
X-Google-Smtp-Source: ABdhPJyTyjYE3OEUPlffS1G9RZMI1bifUcMEQLlLitiLFv4U9oL+JVBQLtCQ6LEGnlJ0F9WnoJU9Lg==
X-Received: by 2002:a05:620a:4721:b0:67d:715d:2cdc with SMTP id bs33-20020a05620a472100b0067d715d2cdcmr11672572qkb.134.1647267137344;
        Mon, 14 Mar 2022 07:12:17 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id f34-20020a05622a1a2200b002e1a35ed1desm10673763qtb.94.2022.03.14.07.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 07:12:17 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id g26so30981342ybj.10;
        Mon, 14 Mar 2022 07:12:16 -0700 (PDT)
X-Received: by 2002:a25:d782:0:b0:628:942b:3815 with SMTP id
 o124-20020a25d782000000b00628942b3815mr18996735ybg.393.1647267136696; Mon, 14
 Mar 2022 07:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220311140542.5407-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220311140542.5407-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Mar 2022 15:12:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGgXH3wTEs4tDSqmTKZSkX=9xhdwyfm0Kw91A0jw3L7g@mail.gmail.com>
Message-ID: <CAMuHMdXGgXH3wTEs4tDSqmTKZSkX=9xhdwyfm0Kw91A0jw3L7g@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove outdated members from host struct
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

On Sat, Mar 12, 2022 at 12:23 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The wrappers are gone for two years now but they have still pointers
> reserved in the tmio_mmc_host struct. Remove them.
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: f22084b662e5 ("mmc: tmio: remove superfluous callback wrappers")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
