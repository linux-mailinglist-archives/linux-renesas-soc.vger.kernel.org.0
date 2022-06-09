Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE1354474A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 11:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbiFIJYC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 05:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiFIJYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 05:24:02 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3B928998;
        Thu,  9 Jun 2022 02:24:01 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id b17so7674830qvz.0;
        Thu, 09 Jun 2022 02:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hnmd3IRDd62Da3L6ZDV2N5MF/jRn6ZQWlE7WGBHbxwM=;
        b=XKqiqGs5YzC9aXoQhg7I+jD5sgcHd53BkO5xiX2yrTJYqonhfnzqRBDdPo+jGVgyKP
         tM2cwM3AjixDnqAJ5c5LXri+AAJXXNko/oHC5L5BJvnY/e13mbJ51GJXwcdzASk9Z+iL
         icqxmoBPWyxx6nTCAtEm+WUjSMa6XVD0ZXqm0VS22dhP7SSXILk1OUyihD6rX25XaCIb
         zMtLnKD97YQUltGgk8rz6B4LgCK6D2JjXwJb8aqJw68voe8lFyAgcNwL3YSauYMIp2pO
         jIcJx8bbk6jyuU8mzEmAqiNQJZ4wesbhaHe+AFdozWEqtTKOMWz09QBf9/E5V3uC0vH3
         z7xw==
X-Gm-Message-State: AOAM5333NtkryolECRUhYLfpkNjhFcRZ4xzbYjcemGqjol6ldTfPwYii
        HzhYKz+eyIlImdO58aEInXsRiC3xE1bi7A==
X-Google-Smtp-Source: ABdhPJzv3D9+ZSrNb9+1W4D+qFm60OdswW15nt7RK2AlqAVgqUU/6UHHT6MU7nOUCBFjQyPI/w+rng==
X-Received: by 2002:ad4:49ac:0:b0:46a:effd:fbd0 with SMTP id u12-20020ad449ac000000b0046aeffdfbd0mr18866414qvx.13.1654766640364;
        Thu, 09 Jun 2022 02:24:00 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id g16-20020ac85810000000b002f906fc8530sm8066784qtg.46.2022.06.09.02.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 02:24:00 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id g201so12934572ybf.12;
        Thu, 09 Jun 2022 02:23:59 -0700 (PDT)
X-Received: by 2002:a25:7307:0:b0:65c:b98a:f592 with SMTP id
 o7-20020a257307000000b0065cb98af592mr38482388ybc.380.1654766639717; Thu, 09
 Jun 2022 02:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV28kUAZjGUwv=hHOFdwCj+OhJDixN+eY_UvPdtPxRmoQ@mail.gmail.com> <YqGyCtmLM9vl4voC@oden.dyn.berto.se>
In-Reply-To: <YqGyCtmLM9vl4voC@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 11:23:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVr1h1gPAJneJOQ5qPDFeRA_6hRt1ijUNa0nOtYRjLm1w@mail.gmail.com>
Message-ID: <CAMuHMdVr1h1gPAJneJOQ5qPDFeRA_6hRt1ijUNa0nOtYRjLm1w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add missing space after remote-endpoint
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

Hi Niklas,

On Thu, Jun 9, 2022 at 10:40 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2022-06-09 10:13:49 +0200, Geert Uytterhoeven wrote:
> > On Wed, Jun 8, 2022 at 7:58 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Add the missing space after remote-endpoint in r8a774c0.dtsi and
> > > r8a77990.dtsi before the typo spreads to other files.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> > Do you plan to fix the other in-tree offenders, too?
>
> I was plain too, seems like a perfect opportunity to force myself to try
> and learn Coccinelle :-)

Very smart!
I would chicken-out, saying the number of offenders is too small ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
