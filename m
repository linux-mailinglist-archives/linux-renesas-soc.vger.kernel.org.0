Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06DD65C393
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 17:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbjACQIy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 11:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjACQIw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 11:08:52 -0500
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD38B497;
        Tue,  3 Jan 2023 08:08:50 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-43ea87d0797so442469587b3.5;
        Tue, 03 Jan 2023 08:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIKG5C+ANaI4L3mVlD3FS2d+S7EwT1ECAi/QAg1B1QA=;
        b=Lb0sNbmQcYzUH0/1wy0gh4iu9y++Ez2FU1haHJC252vF1VDTF1Wp0B2GF4Yd0YfZPB
         EPGOizyF+m2HwGoeMdWKniIy+SkxG6WEWAIvTBAAM8Rx9RAvu4XpKQmur1Ou3Wvd70N8
         buLUMsn/zivUrh5Mrp/7sC2++zVLGSjxK1wHOip2pkILKGKryBPQc3mQN2c4s7cH3jBf
         nYz5AvJOp06bZvUXFYHPTYzyMvdfJ91Y3R8QOrzPkQCtRXjtLjK6pYk4oLc/UQR1G9jV
         8U+geNPTeGP0f5zWqS5kxji4YX4+bZazItV4+ORXdlAmdwqU27AT6MlFFZwqCRs4thrH
         eoJg==
X-Gm-Message-State: AFqh2kpCq5puadh2b7LcZc+/hFDLxh+AuFFG1JWTYqGG7Tg6HnL1FgRL
        WnwSgMLcaojO1qL4doHw7bARPgtDqxTozQ==
X-Google-Smtp-Source: AMrXdXu8c3qU5Pl8menG+Ice4eodg6lzpjSQBEe3ia126WCBgNT8XIjc5Nh+fV3sCZ4tClot2PwOXQ==
X-Received: by 2002:a05:7500:3e8a:b0:ef:f78f:12f5 with SMTP id li10-20020a0575003e8a00b000eff78f12f5mr268061gab.47.1672762129122;
        Tue, 03 Jan 2023 08:08:49 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id f1-20020a05620a280100b006fa43e139b5sm22360974qkp.59.2023.01.03.08.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 08:08:48 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-47fc4e98550so300300727b3.13;
        Tue, 03 Jan 2023 08:08:48 -0800 (PST)
X-Received: by 2002:a81:7309:0:b0:475:f3f5:c6c with SMTP id
 o9-20020a817309000000b00475f3f50c6cmr4638123ywc.358.1672762128402; Tue, 03
 Jan 2023 08:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com> <2ba4e002-9f27-2e36-2bd2-8753c455b21f@denx.de>
In-Reply-To: <2ba4e002-9f27-2e36-2bd2-8753c455b21f@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Jan 2023 17:08:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmypkjeowpsQ0-7z7Kfa5NjPeGYr0vujrfdVia5qjevw@mail.gmail.com>
Message-ID: <CAMuHMdWmypkjeowpsQ0-7z7Kfa5NjPeGYr0vujrfdVia5qjevw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: rs9: Check for vendor/device ID
To:     Marek Vasut <marex@denx.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
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

Hi Marek,

On Tue, Jan 3, 2023 at 4:45 PM Marek Vasut <marex@denx.de> wrote:
> On 1/3/23 13:31, Alexander Stein wrote:
> > This is in preparation to support additional devices which have different
> > IDs as well as a slightly different register layout.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >   drivers/clk/clk-renesas-pcie.c | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> > index e6247141d0c0..0076ed8f11b0 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -45,6 +45,13 @@
> >   #define RS9_REG_DID                         0x6
> >   #define RS9_REG_BCP                         0x7
> >
> > +#define RS9_REG_VID_IDT                              0x01
> > +
> > +#define RS9_REG_DID_TYPE_FGV                 (0x0 << RS9_REG_DID_TYPE_SHIFT)
> > +#define RS9_REG_DID_TYPE_DBV                 (0x1 << RS9_REG_DID_TYPE_SHIFT)
> > +#define RS9_REG_DID_TYPE_DMV                 (0x2 << RS9_REG_DID_TYPE_SHIFT)
>
> I'm not entirely sure whether this shouldn't be using the BIT() macro,
> what do you think ?

They're not one-bit values (which bit does RS9_REG_DID_TYPE_FGV set? ;-),
but values in a bitfield.

So using FIELD_PREP() and friends would make more sense to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
