Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1C752CF72
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 11:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236154AbiESJba (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 05:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235409AbiESJba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 05:31:30 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE455C859;
        Thu, 19 May 2022 02:31:28 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id g3so4395100qtb.7;
        Thu, 19 May 2022 02:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xII9yaFPDK0XwkjyjiNHQR8bGishEv/HiDQVpOIOKm8=;
        b=uulVfbdz42QQg34oBd6txr+kpXxc6g90f9rp4ml2yiKzRzH5XPzXNrx0+dGDL4er2L
         WH4uDU1CJXJB3UMGnBPd+pqBHHcC+e+YktslrUimSBdoJSa/DOpnLEZ55VvSNT3ZkMXm
         g7DJLo56qepKQlznmcvjbxSfWOjKP7jM3awHxID+mk3QKzwc42sEgodmNjJeCyET1G87
         XvomjiBtDUjQzJcQPP0rDI0HBcQOwU0FeAf92tfm+p/HCU+JxvTk7x2F+3Ydh3M8V0Lu
         wk63Lbitd2z0qDuS160sbrNldsTpZE2vcFApYmy07jcPvMDqQej3xbMQbsl28B8wLIRW
         +9Tw==
X-Gm-Message-State: AOAM531QEUY2YxoeP2Cj8xGw6kGF1YJSJCGjht+7H6N0uAhYtylzw2fv
        MNHGfKrkmWn6ojuZcy4aK2hKgkIMxH1UJg==
X-Google-Smtp-Source: ABdhPJwmIOt/LEG1lewF2IQTn5Fu+j0RjHtd3p67vA2zyqq2jlhk1gb3ZPo683cx7RINKUH0vTS5NQ==
X-Received: by 2002:ac8:5a83:0:b0:2f3:bafa:3bcc with SMTP id c3-20020ac85a83000000b002f3bafa3bccmr3044974qtc.366.1652952687752;
        Thu, 19 May 2022 02:31:27 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id ew5-20020a05622a514500b002f39b99f687sm980467qtb.33.2022.05.19.02.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:31:27 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ff155c239bso51106877b3.2;
        Thu, 19 May 2022 02:31:27 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr3699428ywh.384.1652952686695; Thu, 19
 May 2022 02:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
 <20220518182527.1693156-1-ralph.siemsen@linaro.org> <TYYPR01MB7086A76AE1742DD0F9FE3681F5D19@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086A76AE1742DD0F9FE3681F5D19@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 11:31:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPa4Wxvhfb8tfzRSx20y8OFLDpq6BJWsYWAyXqxvz=yA@mail.gmail.com>
Message-ID: <CAMuHMdUPa4Wxvhfb8tfzRSx20y8OFLDpq6BJWsYWAyXqxvz=yA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Ralph Siemsen <ralph.siemsen@linaro.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 18, 2022 at 8:32 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 18 May 2022 19:25 Ralph Siemsen wrote:
> > There are two UART clock groups, each having a mux to select its
> > upstream clock source. The register/bit definitions for accessing these
> > two muxes appear to have been reversed since introduction. Correct them
> > so as to match the hardware manual.
> >
> > Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")
> >
> > Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> > ---
> > v2 changes:
> > - reverse the comments as well
>
> Reviewed-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks, will queue in renesas-clk-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
