Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB547AA027
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 22:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjIUUdY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 16:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbjIUUdG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 16:33:06 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C54C86E7D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 10:38:33 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6c228c9a98dso735443a34.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 10:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317912; x=1695922712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOsTExKI1Kt1Hvu85c0dJDu31qztEwjh68G+KWjd0JA=;
        b=Mc2Nl2sjmuHRE3NGimKVDhlev7DqsG+3xqVASAq2AgK5c+PBdFyfk9zsFtlni9vmfi
         YYtM7zh/gbykzQeMpDiSgQ6iDeqL8VIFhoEnDTsUHxTPQYswFyrNpi3CczlLwUAGOgJ0
         eNdFVneuZqyA6IQVt0kEiz2m/c/IgyHyPirrWR09jq2+i/+L3clYJLdszi7OoUtDfN/h
         dJk/H9hUkS7vPtN1KoBHXlJByq2Oefl2RtSwOTqP7eg7FHOesua88Z9LNYMffXuaw8Q2
         EaTaT7vyTQoz+x9aRist6aOVkMRfV6OGeCupmi6xnLI05HCm9VmnSSU331jwBbYE8+PL
         gs1w==
X-Gm-Message-State: AOJu0YxRVntHpKscoWILJPbRTwl4yrBp8oH81VjN22Q9JJ9UH33DcHJA
        pxYrY1HM3jljoiJhFXM5733OiVwrhmcDd1J+
X-Google-Smtp-Source: AGHT+IFd+EJLjqFA9z9sMORAwN0SngvKvSUhESm20fEk76W9l6/rl0j7WS+BTDBqR4ffSoEq3YmX6Q==
X-Received: by 2002:a0d:cd43:0:b0:595:2094:f87 with SMTP id p64-20020a0dcd43000000b0059520940f87mr4957994ywd.47.1695282744956;
        Thu, 21 Sep 2023 00:52:24 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id j68-20020a0de047000000b0059b3d594c04sm204345ywe.125.2023.09.21.00.52.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 00:52:24 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59c07cf02ebso7945787b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 00:52:24 -0700 (PDT)
X-Received: by 2002:a0d:eb93:0:b0:57a:9b2c:51f1 with SMTP id
 u141-20020a0deb93000000b0057a9b2c51f1mr4428509ywe.1.1695282744530; Thu, 21
 Sep 2023 00:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com> <ZQtY+NHFzFBWhrZj@shikoro>
In-Reply-To: <ZQtY+NHFzFBWhrZj@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Sep 2023 09:52:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_S7+rgykqtvTVaSSO53zXGHNpiPJ=yzcF1GMf2QXvgg@mail.gmail.com>
Message-ID: <CAMuHMdU_S7+rgykqtvTVaSSO53zXGHNpiPJ=yzcF1GMf2QXvgg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dirk Behme <dirk.behme@de.bosch.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Sep 20, 2023 at 10:41 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > There are Renesas ARM Trusted Firmware version out there which e.g.
> > configure 0x201 (shifted logical right by 2: 0x80) and with this match
> > the added { STPnHCK | 0, 1 }:
>
> IIRC, that means that the ATF uses 200MHz for the data channel but
> disables the 800MHz for the SCC. Because of that, I assume ATF doesn't
> do tuning then? Isn't that risky to operate at 200MHz without tuning?

Perhaps these products don't care about using SDHI for booting (i.e. use
HyperFLASH instead), and thus expect only the application OS (Linux)
to use SDHI?

> >  static const struct clk_div_table cpg_sdh_div_table[] = {
> > -     { 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
> > -     { STPnHCK | 4, 16 }, { 0, 0 },
> > +     { 0, 1 }, { 1, 2 }, { STPnHCK | 0, 1 }, { STPnHCK | 1, 2 },
> > +     { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 }, { 0, 0 },
>
> Anyhow, since such ATF seems to be in the wild then, I assume we should
> at least support reading such configuration values. I'd reorder it like
> this, though:
>
>  +      { 0, 1 }, { STPnHCK | 0, 1 }, { 1, 2 }, { STPnHCK | 1, 2 },
>  +      { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 }, { 0, 0 },
>
> And probably add a comment that the duplicate entries are only for
> reading and are not recommended for use with Linux (which will still use
> the first matching pair i.e. without STPnHCK).
>
> Geert, does this all make sense to you?

I'm sure you remember better than me the relation between and the
impact of the stop bit and the various divider values ;-)

An alternative would be to let cpg_sdh_clk_register() sanitize the
pre-existing contents of the SD-IFn Clock Frequency Control Register,
so there would be no need to extend cpg_sdh_div_table[].  An advantage
of that approach would be that it can handle all invalid combinations,
not just the few that have been seen in the wild.
(following the old networking mantra: "be strict when sinding, be
liberal when receiving').

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
