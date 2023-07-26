Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9428763BA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 17:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbjGZPwr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 11:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjGZPwq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 11:52:46 -0400
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FF310F6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:52:45 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d08658c7713so5068183276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690386764; x=1690991564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM51E9cOF0enLycJ8ZoWjHQMAWW6y3WXy7HXekYDgjw=;
        b=Jhqqg/A3IVghbLHWK3eszOw1Y2ivtNvGvKNkWiScngtkEsma+JqKnSsESlLyRwatr6
         +SQ1nnyhmujKVTFB4iZ0W1ZpNMtkkhI6dFrEd36qZi9GTQmNg3O/oFEVI/TFSLBSpeXH
         MrndUktGAtyuDiLnVtU4Axaa1lxi8OfZl6hoi6Kc7F2xvlZuk3SW33EltwLrhiRSNnwx
         FLF1hOfh512aKQnnguHY26ZvI61AJGfRcWNtS+piq4E4gwxiI/4BPQQEZuRcchqgxi4L
         eC/xsiHh5cdvrOG60/rFV++EVwrlS2YdueuG51yceGncTleJPRBynGZT3EwHgnL4GeT3
         6KIQ==
X-Gm-Message-State: ABy/qLaQNF8wivap0zknre6ak0hLUUCgd4Rk7t2nbJ+CeRuJMsA3Tyw2
        +rJRuCXvLw9jwMfLIPv20SJecaY8W/ax3A==
X-Google-Smtp-Source: APBJJlGYENqGcBDlQ0NW2qSEFsgYqmaFgeMHdJIGNR86Hf8Dt8eoSLWvIsGHauiroopNS0rOJGAaHA==
X-Received: by 2002:a5b:208:0:b0:d07:7001:495a with SMTP id z8-20020a5b0208000000b00d077001495amr1998418ybl.56.1690386764100;
        Wed, 26 Jul 2023 08:52:44 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1963891ybj.61.2023.07.26.08.52.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 08:52:42 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d08658c7713so5068149276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:52:42 -0700 (PDT)
X-Received: by 2002:a25:8241:0:b0:d15:62fd:9c09 with SMTP id
 d1-20020a258241000000b00d1562fd9c09mr1874116ybn.46.1690386762586; Wed, 26 Jul
 2023 08:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
 <169038633210.137962.3548138584643048570@Monstersaurus>
In-Reply-To: <169038633210.137962.3548138584643048570@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jul 2023 17:52:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsc9V7_G1Q3mdriAz1zirqTFSCZ=ouVvmGsDLBKZ03LQ@mail.gmail.com>
Message-ID: <CAMuHMdVsc9V7_G1Q3mdriAz1zirqTFSCZ=ouVvmGsDLBKZ03LQ@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: spider-cpu: Add GP LEDs
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jul 26, 2023 at 5:45 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Quoting Geert Uytterhoeven (2023-07-26 15:45:57)
> > Describe the two General Purpose LEDs LED7 and LED8 on the Spider CPU
> > board, so they can be used as indicator LEDs.
> >
> > Note that General Purpose LEDs LED9 to LED11 are not added, as they are
> > connected to GPIO block 4, which can only be accessed from the Control
> > Domain.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > I do not have physical access to a Spider development board.
> > Thanks for testing!
>
> In collaboration with Geert,
>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> > ---
> >  .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> > index dd8e0e1595260b3d..76a94812875ef261 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> > @@ -6,6 +6,8 @@
> >   */
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> >  #include "r8a779f0.dtsi"
> >
> >  / {
> > @@ -22,6 +24,24 @@ chosen {
> >                 stdout-path = "serial0:1843200n8";
> >         };
> >
> > +       leds {
> > +               compatible = "gpio-leds";
> > +
> > +               led-7 {
>
> I presume there is a reason to start the sequence at 7?
> But that's fine with me anyway...

They're called LED7 and LED8 in the schematics...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
