Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD7177B54C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 11:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbjHNJWN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 05:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjHNJVu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 05:21:50 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A90130;
        Mon, 14 Aug 2023 02:21:50 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-589f7855c13so6799937b3.0;
        Mon, 14 Aug 2023 02:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692004909; x=1692609709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WS7Ydd7ku0gFWEOxZZf9XJKjTu/xZ8FJAZyxlP3qhP0=;
        b=iSq5tGdUX8RiizWe4lxw4TfIvZ+lMLkdCVmyoR8Nwwjof5eJC8lWAgppzY9bBAIhz8
         bXMYnuM9GeCdPylu15+k+5p+WfBhabKUyEiJjt/HNNNm1gQuffN7yTmSSCYSXgEDtYzr
         wp+winB3o2hQF5IOodux7Nr7yQMppe3NRR960R0o12ouc0HiSui08/q6TTdP9bnFGu7K
         9VYFANWStyeiPYSLwN+E7my9vs2VjysfymZGxT3juDB1tzKrbu1HqyE1JcMdCknkMe/x
         r8PYG4X/lFV1wU6cTPDVLHiTKEJnuIhWZWkHpOEUeSoGS9dKV9t3OZU93cy1GQIjkumn
         z78g==
X-Gm-Message-State: AOJu0YwsyW0QVL5oCUuAe//1p2OPyhEPUoWKEmvKLRzdbI4xiyniR8GZ
        8i5V10IHdUbAqWJQTZ3oY8VN6JjGhWRDfA==
X-Google-Smtp-Source: AGHT+IFFpih6g0/ZL72Lze3U3Y8SsWHVJ66lQRLGG0tcf9hhv5wyV0rglJs+KRRnj9Po7K+F8V/AvQ==
X-Received: by 2002:a81:5c82:0:b0:584:6d71:f465 with SMTP id q124-20020a815c82000000b005846d71f465mr11873070ywb.12.1692004909070;
        Mon, 14 Aug 2023 02:21:49 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id l8-20020a0de208000000b005837fe8dbe8sm1979129ywe.8.2023.08.14.02.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 02:21:48 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso4201776276.3;
        Mon, 14 Aug 2023 02:21:48 -0700 (PDT)
X-Received: by 2002:a25:da96:0:b0:d0b:fe82:8b99 with SMTP id
 n144-20020a25da96000000b00d0bfe828b99mr11305972ybf.44.1692004908480; Mon, 14
 Aug 2023 02:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690533838.git.geert+renesas@glider.be> <594a6a8934e5569bf96d317a6a3c0a9129a2ae20.1690533838.git.geert+renesas@glider.be>
 <CAL_JsqJhd+t1Am48S+EGEf51Zge=83v8avYbzYTUjinebHm+nw@mail.gmail.com>
In-Reply-To: <CAL_JsqJhd+t1Am48S+EGEf51Zge=83v8avYbzYTUjinebHm+nw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Aug 2023 11:21:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrKzM5B6_=pQmnXb8wWHpkw0yjQnzwOfYwFqw4aCfGEA@mail.gmail.com>
Message-ID: <CAMuHMdXrKzM5B6_=pQmnXb8wWHpkw0yjQnzwOfYwFqw4aCfGEA@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] of: unittest: Cleanup partially-applied overlays
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Aug 1, 2023 at 10:50 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Fri, Jul 28, 2023 at 2:50 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > When of_overlay_fdt_apply() fails, the changeset may be partially
> > applied, and the caller is still expected to call of_overlay_remove() to
> > clean up this partial state.  However, overlay_17 is the only test that
> > takes care of cleaning up after an (expected) failure.
> >
> > Instead of adding cleanup code to each individual test, extend
> > overlay_info with the optional expected return value of
> > of_overlay_remove(), and handle cleanup in the overlay_data_apply()
> > helper.  While at it, simplify the end marker in the overlay_info table.
> >
> > Update the expected error output for errors during the newly cleanup.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - No changes.

> > --- a/drivers/of/unittest.c
> > +++ b/drivers/of/unittest.c

> > @@ -3689,9 +3715,19 @@ static __init void of_unittest_overlay_high_level(void)
> >         unittest(overlay_data_apply("overlay_bad_phandle", NULL),
> >                  "Adding overlay 'overlay_bad_phandle' failed\n");
> >
> > +       EXPECT_BEGIN(KERN_ERR,
> > +                    "OF: changeset: remove_property failed @/testcase-data-2/substation@100/hvac-medium-2/name");
> > +       EXPECT_BEGIN(KERN_ERR,
> > +                    "OF: resolver: overlay phandle fixup failed: -22");
> > +
> >         unittest(overlay_data_apply("overlay_bad_symbol", NULL),
> >                  "Adding overlay 'overlay_bad_symbol' failed\n");
> >
> > +       EXPECT_END(KERN_ERR,
> > +                  "OF: resolver: overlay phandle fixup failed: -22");
>
> I'm seeing "OF: Error reverting changeset (-19)" here instead.
> Cut-n-paste error?

Indeed. Thanks for pointing this out!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
