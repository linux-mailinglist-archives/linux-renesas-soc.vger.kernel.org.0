Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4F550BA0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 16:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448661AbiDVO3O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 10:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbiDVO3N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 10:29:13 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DB35BD08;
        Fri, 22 Apr 2022 07:26:18 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id c1so6139555qvl.3;
        Fri, 22 Apr 2022 07:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=McKo/Deytjy605uVjMsyIih6yGv8qgj4o5wz0FFbkTU=;
        b=0/Dtb/3cyzTmAzCsy7iQmFt7+xJd0ecjwlJLO606wMGtYfAHXTQiknINVoKUTy7H0S
         /JhuQAbRaO7bCl/JRCwUh9IqkoGbTUCxe9zit2FCXP1BZliBjUmZTFvzyKFmhGjn063S
         mosimSOwiYgK7cWxGscaF61oQ4fknuNDPtikEieIyyRe+oFdMBd59bV20U//7KNoRmoA
         xPYMk9tF+t601ANsP/+Ts7DeHm0lTn+EapG72PIWM9wgewlOqGp8IYZY3s4eQevzUZwX
         M1MzQwK5/nLn2EyeQ2H2hpT9WGmYFqvP5GHc0/LkbAZcn6+zexeKFk/6GzZA09EBND7F
         PSAg==
X-Gm-Message-State: AOAM532nUt2YxGNjtBGGHrdnfZbn09ODoFqMSKxvLSW3sCe17NOc6VGA
        riD76PVgGGFKiv/J9aa6T5zGjxDvOY5pDg==
X-Google-Smtp-Source: ABdhPJxyKIkbDFeGUKY4NSuJjmUCqNrtFaekEDOyVIHtRFiHWzzOwdgdaalAUw+AgboNe/7cpaOoag==
X-Received: by 2002:ad4:5de6:0:b0:446:3e43:a226 with SMTP id jn6-20020ad45de6000000b004463e43a226mr3640750qvb.78.1650637577393;
        Fri, 22 Apr 2022 07:26:17 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id c131-20020a379a89000000b0069c903625absm984426qke.102.2022.04.22.07.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 07:26:17 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7b90e8b37so9503377b3.6;
        Fri, 22 Apr 2022 07:26:16 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr4692153ywa.479.1650637576717; Fri, 22
 Apr 2022 07:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
 <20220421095323.101811-12-miquel.raynal@bootlin.com> <20220421122143.7526d676@xps13>
 <YmK19DPzjJxBZHHm@kroah.com>
In-Reply-To: <YmK19DPzjJxBZHHm@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 16:26:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZ+X2y8sid736nwOoSshJXp7C3Oc5AuObyhHdnU7uGFg@mail.gmail.com>
Message-ID: <CAMuHMdVZ+X2y8sid736nwOoSshJXp7C3Oc5AuObyhHdnU7uGFg@mail.gmail.com>
Subject: Re: [PATCH v6 11/12] bestla: Enable DMA, UART3 and UART4
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Fri, Apr 22, 2022 at 4:04 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Apr 21, 2022 at 12:21:43PM +0200, Miquel Raynal wrote:
> > miquel.raynal@bootlin.com wrote on Thu, 21 Apr 2022 11:53:22 +0200:
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > Please ignore these two dts patches, they were meant for testing
> > purposes only, sorry for the noise.
>
> I can't do that, please resend a new version of the series as our tools
> take all of the patches in a series.

While at it, please drop patch 10/12 from the reposted series, too,
as it should go in through the renesas-arm-dt and soc trees.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
