Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4AB24ED8A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 13:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbiCaLn0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 07:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbiCaLnZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 07:43:25 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700C0167F82;
        Thu, 31 Mar 2022 04:41:38 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id ke15so19467259qvb.11;
        Thu, 31 Mar 2022 04:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/G207LTE+nMelkxeI2rxRe1CN11WdJGAjqieWl2niK8=;
        b=6aTD0OnZSsFzFTUgN8M9p9lkcNr3V2Ch7iT4cllRgY9lOgThhdGwSUNgIChkqkFdPp
         3CUoy/nXmx7hwAa0ZJczYdC6katjiYRKdlqWj5iVnXs4CVFM1Xx5DhqZXrWynKpFagMI
         IVEpWrvVX3loSdHRNySKo69HGyNeEXiJ4I5omkN6gUoJN+wpddflGjeQuW8Q+PEdF8JX
         Y7FJKIuP5m3i6O0EoMwqk8rYBj9Cl+DEuF2qXppXT20RU6QR1S6NrruE/h1r48VmLxd8
         VTS1Hw9FKTF1ETrfNcT8KRw5H5pJvolNgFzRKsvH4m0bmM7dytMUjZzY29BV2unAFEE7
         Xlmg==
X-Gm-Message-State: AOAM530VLkPsubDI/HZUe9CJpc90ewn6X2TuBIQtbT9nMSy2ZUFZXEyD
        6d2ZdYkAvU+JUDiZ1779KI0tKSVO0YIegA==
X-Google-Smtp-Source: ABdhPJyadOivv0nwuejiqR4rAhMuobi4ZSlAw8B/jqsY+HpwkTVa9uZujPVZ1Q4pxPxIqRDUKKU1pw==
X-Received: by 2002:a05:6214:29ee:b0:440:f693:d082 with SMTP id jv14-20020a05621429ee00b00440f693d082mr3378262qvb.109.1648726896912;
        Thu, 31 Mar 2022 04:41:36 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id e15-20020a05622a110f00b002e1ed105652sm20257551qty.2.2022.03.31.04.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 04:41:36 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2e6ceb45174so211243427b3.8;
        Thu, 31 Mar 2022 04:41:35 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr4266145ywi.449.1648726895676; Thu, 31
 Mar 2022 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220315154649.22343-1-biju.das.jz@bp.renesas.com> <20220315154649.22343-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315154649.22343-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 13:41:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt7e=OLhg3wvCC_bJXgHsZ8jm+GmEXwiL0-ELgP_JVhA@mail.gmail.com>
Message-ID: <CAMuHMdVt7e=OLhg3wvCC_bJXgHsZ8jm+GmEXwiL0-ELgP_JVhA@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r9a07g043: Add GbEthernet clock/reset
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, Mar 15, 2022 at 4:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add ETH{0,1} clock/reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
