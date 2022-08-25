Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43565A0912
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 08:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiHYGqu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 02:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiHYGqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 02:46:49 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1A56E888;
        Wed, 24 Aug 2022 23:46:48 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id s1so264016qvn.11;
        Wed, 24 Aug 2022 23:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=43pvZDEQJXRSfKZfubT69fa51qDaLqvq+73XhQCzP4o=;
        b=an2fe+azkRK/nwHRRPVrZ54loFd7MuuZGzqpI02HiQTe0EgcttzVKo0+zZhmj0bgzg
         dw5Py670buSeWVtCXZUmvOsgt72p5fM3GJXnZq0Z8/PBRXjrlXzmPpG0eC3reD0MXjK1
         KrsCjPhrTmv4dUgW98SDE7dVcv8Y9CWJut5JC5zroVsSqHvbgWmYe/6GIcnCGWNufVp6
         HYD7r0lddNoxBkykvHYr6SRcnzxdcLINOtgr0FHr+n+jmYhxq4nzk7BUbFDB5ayvHKho
         eKpRT1GCm4JPPbx/J//fNOQtc8R2SeFeDOKNu8NhFlwBQvwrVPlC80DDM7qsGMzfqTGi
         lLTA==
X-Gm-Message-State: ACgBeo3991kJVdGm7K0ucLp1TGGCGdwPCktA3KlOeVqRYnPbScqP0Ll8
        DbFkxhHpl5tQTs4gTgILnka3i7fFBjxASw==
X-Google-Smtp-Source: AA6agR4LEVq69RQXS4NnoLH/U+ex9XlHaVsD9NqHK47uPmHTU5KFjaOGxlXzikVNA72YRmQfmYvs1A==
X-Received: by 2002:a05:6214:544a:b0:486:ccc8:be5a with SMTP id kz10-20020a056214544a00b00486ccc8be5amr2320766qvb.91.1661410007419;
        Wed, 24 Aug 2022 23:46:47 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id u4-20020a05620a454400b006bbe7ded98csm13753046qkp.112.2022.08.24.23.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:46:47 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-31f445bd486so516683057b3.13;
        Wed, 24 Aug 2022 23:46:46 -0700 (PDT)
X-Received: by 2002:a25:ec03:0:b0:695:faae:ab9c with SMTP id
 j3-20020a25ec03000000b00695faaeab9cmr2192118ybh.89.1661410006572; Wed, 24 Aug
 2022 23:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWW0kPATT4zGcjcEPw6XO+18MWJAn_HESe3rrtoEoF=FA@mail.gmail.com> <YwcYqbIuwtImOQ7/@shikoro>
In-Reply-To: <YwcYqbIuwtImOQ7/@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Aug 2022 08:46:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4rfOe-58rG4b31VT9QXnGL0rLnanv4z+fvhwxsGOGdw@mail.gmail.com>
Message-ID: <CAMuHMdU4rfOe-58rG4b31VT9QXnGL0rLnanv4z+fvhwxsGOGdw@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: dts: renesas: move I2C aliases to board files
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

Hi Wolfram,

On Thu, Aug 25, 2022 at 8:37 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I have never been a fan of the i2c aliases in the SoC-specific .dtsi files,
> > as aliases are typically board-specific.
> > We also don't have physical connectors labeled "i2c<N>" on any of
> > the affected boards.  But people like the i2c aliases, because i2c
>
> The reasoning here was that the busses were named like this in the
> schematics. Debugging was confusing if these numbers were mixed.

OK.

> > exposes the full buses to userspace, and the aliases fix the userspace
> > naming of /dev/i2c-<N> (I believe there is no better way to identify
> > i2c buses from userspace?).
>
> The proper way is udev rules.

Great!

> > So moving the i2c aliases to the board files is definitely a step in
> > the good direction.
> >
> > BTW, you missed r8a774a1.dtsi in your update.
>
> Okay, so I will send v2 with the above SoC converted as well?

Yes, please. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
