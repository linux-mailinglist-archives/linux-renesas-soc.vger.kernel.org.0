Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6876525168
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 May 2022 17:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356016AbiELPiJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 May 2022 11:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349137AbiELPiI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 May 2022 11:38:08 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386032608EB;
        Thu, 12 May 2022 08:38:07 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id l1so4631323qvh.1;
        Thu, 12 May 2022 08:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XxkHE2Hs+zmilqS56DmMY1l1eFU9eDN7Sp7hefByF2g=;
        b=n8NgM9QJQSttj3H1DLo3USP9EEFKK4qJGix1oKAqkPFTG1HHyH7PQFtLwEZTDx0ISs
         B3HK7OUMo+nxzdpNnTwmCmWE3Uw+hRSYfBxYbGXXZCh3TuehtAPGUdYN58fh1woxpD6U
         tc2UjQ0Xefl2ZNpE3iBg8KD6TbhgKsHmm/cOg/FbwXLnNwbcKMx3LcFA7tiGFrzpVROh
         o0ldGahiM53yyVLHfJLEoesxYX59bZtk7gEUxrX3bAe84WQQWtrdij8NymJiZ8F5c+n4
         dRBXvXrxZncV2P1ImZZdi97OuETBFenHdFRQM/s/wE8oUT+ZIDGM8DCsddRH+C84ZNhf
         mYtg==
X-Gm-Message-State: AOAM532pUQMdqoZxg4z4pErf769QjzxdUffnLlfk/prYstCl3IISVHVo
        pQy06vbmuys5cdm/NPYoXpAc9EYo4W2c6A==
X-Google-Smtp-Source: ABdhPJyC9TkP8kpfNta3wsRSotiHYKe8tqPkpgQn1Q3qs/rwZ2zb6wssMJ5shb1oJOmgGoyWCPFBcg==
X-Received: by 2002:a05:6214:5284:b0:444:10c8:ee59 with SMTP id kj4-20020a056214528400b0044410c8ee59mr311790qvb.68.1652369885850;
        Thu, 12 May 2022 08:38:05 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id n4-20020a05620a222400b0069fc347ef5dsm3013609qkh.74.2022.05.12.08.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 08:38:05 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2f83983782fso61235407b3.6;
        Thu, 12 May 2022 08:38:04 -0700 (PDT)
X-Received: by 2002:a81:913:0:b0:2f7:c833:f304 with SMTP id
 19-20020a810913000000b002f7c833f304mr642854ywj.283.1652369884406; Thu, 12 May
 2022 08:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220509154943.25422-3-miquel.raynal@bootlin.com> <20220512152729.244940-1-miquel.raynal@bootlin.com>
In-Reply-To: <20220512152729.244940-1-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 May 2022 17:37:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
Message-ID: <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
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

Hi Miquel,

On Thu, May 12, 2022 at 5:27 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> On Mon, 2022-05-09 at 15:49:43 UTC, Miquel Raynal wrote:
> > This NAND controller is part of a well defined power domain handled by
> > the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> > and exclusively use the runtime PM API to enable/disable the clocks.
> >
> > We still need to retrieve the external clock rate in order to derive the
> > NAND timings, but that is not a big deal, we can still do that in the
> > probe and just save this value to reuse it later.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Without moving the pm_runtime_get_sync() call
(better: pm_runtime_resume_and_get()) before the first hardware register
access?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
