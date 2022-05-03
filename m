Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB39517FDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 10:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbiECIkp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 04:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiECIkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 04:40:43 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1419340ED;
        Tue,  3 May 2022 01:37:11 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id ke5so11753486qvb.5;
        Tue, 03 May 2022 01:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=alwXS08dphdQsmDJaH0F4/NYOvmO5ktHnBJ79OKPYuU=;
        b=jWfHpm6RBWlx0jYNy/wI2SLp1UBUhyKLddASpSnMZ3T38GcnMgii+o1Svfs4f00BtG
         Al7QiCYyEJX4+rjLf3amz+fmFk/vnK2JNhOytP52cg5/SMlaB+Ar4z13GBQUhkyi3XbJ
         ZSnWNjkqLNvpsAuEHat7ThjQhEml4eDsRU9HQfAL1ABKTzRySouEAxvCpY8UU4HZn3vu
         7KRjsC3RlDDybEfwLNqqWSRwtlwSXG6T573IVL5cLtv46/S257rY+m+ZUWKGd0i3etSf
         K/T9mNoXasXHDSDbbkc9CKbTVhPrcYsUhfaxBQvB4zhXxYNwtDDXkAooOOPTENbAk5DV
         j+mA==
X-Gm-Message-State: AOAM531ZZoNz8sYTgRnBOwRx/7X3WXDTRDIDkKc8ZnmPJyLIVGVQq1/g
        JTNCJ5EdK8bFtcF2y7UUuhOiy525sREZ2A==
X-Google-Smtp-Source: ABdhPJyMGB1rIBWaFXvIx1ERWg/JsVcFJCMUEZOf9jcQjdhZEy4Ev31ZseUaQjstBcvi3zFkVVYxOA==
X-Received: by 2002:a05:6214:4101:b0:441:47e5:c718 with SMTP id kc1-20020a056214410100b0044147e5c718mr12752889qvb.12.1651567030897;
        Tue, 03 May 2022 01:37:10 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id o26-20020a05620a111a00b0069fc13ce242sm5597473qkk.115.2022.05.03.01.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 01:37:10 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2f7b815ac06so172471177b3.3;
        Tue, 03 May 2022 01:37:10 -0700 (PDT)
X-Received: by 2002:a81:6588:0:b0:2f8:b75e:1e1a with SMTP id
 z130-20020a816588000000b002f8b75e1e1amr14685393ywb.358.1651567030030; Tue, 03
 May 2022 01:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
 <20220421095323.101811-11-miquel.raynal@bootlin.com> <CAMuHMdW_oqwbDR4HMm-Kz7jmg8FyJg-Dzi-xyBekZEdcdzBZDg@mail.gmail.com>
In-Reply-To: <CAMuHMdW_oqwbDR4HMm-Kz7jmg8FyJg-Dzi-xyBekZEdcdzBZDg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 May 2022 10:36:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUnkDoQdYdoAwcjAOyvJ_zM5308o6K6Spx0+Ohuzf__w@mail.gmail.com>
Message-ID: <CAMuHMdXUnkDoQdYdoAwcjAOyvJ_zM5308o6K6Spx0+Ohuzf__w@mail.gmail.com>
Subject: Re: [PATCH v6 10/12] ARM: dts: r9a06g032: Fill the UART DMA properties
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 28, 2022 at 11:09 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Apr 21, 2022 at 11:53 AM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > UART 0 to 2 do not have DMA support, while UART 3 to 7 do.
> >
> > Fill the "dmas" and "dma-names" properties for each of these nodes.
> >
> > Please mind that these nodes go through the dmamux node which will
> > redirect the requests to the right DMA controller. The first 4 cells of
> > the "dmas" properties will be transferred as-is to the DMA
> > controllers. The last 2 cells are consumed by the dmamux. Which means
> > cell 0 and 4 are almost redundant, one giving the controller request ID
> > and the other the dmamux channel which is a 1:1 translation of the
> > request IDs, shifted by 16 when pointing to the second DMA controller.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queuing in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
