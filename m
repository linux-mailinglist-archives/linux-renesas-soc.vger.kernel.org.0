Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258905A4B4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 14:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiH2MOp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 08:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbiH2MOU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 08:14:20 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BC2832F5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 04:58:26 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id z3-20020a17090abd8300b001fd803e34f1so5798646pjr.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 04:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=GquDNqWruyQcdGckYhjztELRgfJVH8E+NBISKPKGqpI=;
        b=WOK0nXQPQi9zRD39Y8/kxFJfgjaWbVlUhZogCesInSZmolaPNTcrgtJYVRcd2FocsR
         zQQS0SdrJ9qAybbKyrVjZorhFbMBfWifN2iFL+X+rUwdSiqWe5dJL4mPNxteeMEgmLOY
         cO42yXdCnBBbwLtSNMLvQX7EBmtZrXZ/pCmf3ExPpIVUwjU1vzJVGgQVHH4gI0bqsdFo
         nRWPIkjhh5o0rxl+7cyPZk4S1k6ogi0HRovmxt7pr72FwA159Ne7uToZgiCQWA0u928i
         eo2Rq+YghHbRUL43UsknomgRNgPl0wi0ONUN86Ht6eyVOLyOgUQSK3e9jWoEYtSSezY2
         i0Gw==
X-Gm-Message-State: ACgBeo27r4DSTJTfnbcH4CvmyQUXUcvCaKApmnY3fsG5ZBoRCHBDv/Lj
        O6kMDFGZT9isNF4Igavc3M0gbEI2UfvGvg==
X-Google-Smtp-Source: AA6agR5Ey9bPf+n55yCwNJ63SBL/D5Iq6V55jnIYSOpQVUCZmwNlLxUiFkX3D+LMdDGwjhmWUk10Nw==
X-Received: by 2002:a05:6214:1cc9:b0:496:aa2c:c927 with SMTP id g9-20020a0562141cc900b00496aa2cc927mr10085136qvd.15.1661773497171;
        Mon, 29 Aug 2022 04:44:57 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id t17-20020ac86a11000000b0031f287f58b4sm4843211qtr.51.2022.08.29.04.44.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:44:56 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-324ec5a9e97so187882097b3.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 04:44:56 -0700 (PDT)
X-Received: by 2002:a81:6d53:0:b0:33d:bbf4:7582 with SMTP id
 i80-20020a816d53000000b0033dbbf47582mr9382614ywc.384.1661773496553; Mon, 29
 Aug 2022 04:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
 <20220824103515.54931-4-wsa+renesas@sang-engineering.com> <CAMuHMdX4q+NNf1Q=eRE3Qb8QvidJ5u_LZT8he+Aw76T45cmYWQ@mail.gmail.com>
 <Ywyezf8tXUXjm8n9@shikoro>
In-Reply-To: <Ywyezf8tXUXjm8n9@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Aug 2022 13:44:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDnTsr28mjmOPtd+SKE+cvCDT=mu2_GvjucoFZzWJhvg@mail.gmail.com>
Message-ID: <CAMuHMdUDnTsr28mjmOPtd+SKE+cvCDT=mu2_GvjucoFZzWJhvg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: spider-cpu: Add MSIOF node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Aug 29, 2022 at 1:11 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +&msiof0 {
> > > +       pinctrl-0 = <&msiof0_pins>;
> > > +       pinctrl-names = "default";
> > > +       status = "okay";
> > > +};
> >
> > I assume you added this becomes Spider has an MSIOF pin header?
>
> Yes, that is one reason. It has it on the extension board. On the CPU
> board, MSIOF0 is also connected to the CPLD.
>
> > > +
> > >  &pfc {
> > >         pinctrl-0 = <&scif_clk_pins>;
> > >         pinctrl-names = "default";
> > > @@ -116,6 +122,12 @@ mmc_pins: mmc {
> > >                 power-source = <1800>;
> > >         };
> > >
> > > +       msiof0_pins: msiof0 {
> > > +               groups = "msiof0_clk", "msiof0_sync", "msiof0_rxd",
> > > +                        "msiof0_txd", "msiof0_ss1", "msiof0_ss2";
> >
> > MSIOF0_SS2 is also used as the VDDQ18_33_SPI voltage selector, which
> > is used as the power source for various components (but not available
> > on the MSIOF0 pin header?), so I'm a but reluctant to add this patch...
>
> Uh, you are right with the voltage selector. I missed that, sorry.
> However, it is present on the MSIOF0 connector at pin 1. My suggestion
> is to remove SS2 from the PFC node and add a comment describing the
> situation?

SS2 is available on the connector, but the power source (VDDQ18_33_SPI)
is not.

So my preference is to leave MSIOF0 alone.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
