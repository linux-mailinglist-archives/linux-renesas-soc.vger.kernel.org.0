Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFD07A9F17
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 22:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjIUURj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 16:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjIUURZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 16:17:25 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810B4EAAD;
        Thu, 21 Sep 2023 10:12:51 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c0f2addaefso697420a34.2;
        Thu, 21 Sep 2023 10:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316326; x=1695921126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG8p3Ox6WlwM/LHrd1QCAhLEOmdahvYhmsYqP/8b0wc=;
        b=VlSPzDUTLsIuz61ycUst9lS8Fh6a+pbFlR/9BMK4YQhJZN2q9BN9Jio0J79JuSU+h9
         k0qFaVFN734wtLCyInIo4ZifGL/Obgf/1yJe5XpE8uuDzpD/uSlpl28OSNA8mYheAmYa
         R0KlpmPnleS+EjWRN91Gihz+Cn4w2ODCn/4cSTP4bH3fj23BtQQZ4hSv3qBCgj15mww0
         Td0d6FVaxJMTgLCse2v9zJDpkyJFKE0LBqCj0eTDdjMYnyQPJcS+SHLSCFNEN4DkGIjd
         A0pB+syEX25zgHu0gEJ/LJgeSLDPviNasStE1RWZDih/mOwqc+7wAfPTgEIXboQb3W/3
         Htnw==
X-Gm-Message-State: AOJu0YxB9YLXx2b6DHivFCfItGBovY21gXup6ioyKsuyEAwNaruS+a3P
        Yj+5PZk3kcsm1PeA6kK6PAvNLNkhP8EN1/xH
X-Google-Smtp-Source: AGHT+IHHuARKFOd7pddqiWIalhJPsy2DvLr+IambyCW+s67mH+5QSMK+mb3R6rVWvRgZIYebdxqgAw==
X-Received: by 2002:a0d:dec3:0:b0:59b:52bd:4d2a with SMTP id h186-20020a0ddec3000000b0059b52bd4d2amr5184845ywe.23.1695309064435;
        Thu, 21 Sep 2023 08:11:04 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id x2-20020a818702000000b005869ca8da8esm362694ywf.146.2023.09.21.08.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 08:11:04 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d81d09d883dso1342258276.0;
        Thu, 21 Sep 2023 08:11:03 -0700 (PDT)
X-Received: by 2002:a5b:7c8:0:b0:d19:664:7425 with SMTP id t8-20020a5b07c8000000b00d1906647425mr5345303ybq.27.1695309063668;
 Thu, 21 Sep 2023 08:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc> <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org> <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
 <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
In-Reply-To: <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Sep 2023 17:10:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
Message-ID: <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To:     Tudor Ambarus <tudor.ambarus@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Michael Walle <michael@walle.cc>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
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

Hi Tudor,

On Thu, Sep 21, 2023 at 4:45 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> Sorry for the delay, I just noticed this while cleaning the patchwork log.
> On 12/6/22 08:32, Geert Uytterhoeven wrote:
> > On Mon, Dec 5, 2022 at 5:33 PM Rob Herring <robh@kernel.org> wrote:
> >> On Fri, Dec 02, 2022 at 02:56:01PM +0100, Geert Uytterhoeven wrote:
> >>> On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
> >>>> Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> >>>>> Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> >>>>> FLASHes.
> >>>>>
> >>>>> Merge the new entries with the existing entry for MT25QU02G.
> >>>>>
> >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>> ---
> >>>>> mt25qu512a is already in active use, causing "make dtbs_check" errors.
> >>>>> mt25qu256a is supported by the Linux spi-nor driver, but there are no
> >>>>> upstream users yet.
> >>>>
> >>>> Is it encouraged to use the specific compatible with SPI-NOR flashes?
> >>>> As far as I know it isn't. The spi-nor subsys tries hard to identify
> >>>> any flashes at runtime and any additional information in the device tree
> >>>> is used as a last resort (just for flashes which doesn't support the
> >>>> read jedec id command yet). And usually boards have different sources
> >>>> for flash chips, so hardcoding a particular part in the device tree
> >>>> doesn't make sense.
> >>>
> >>> Thanks, I am aware there have been pushbacks when trying to
> >>> document more compatible values.
> >>>
> >>> IMHO either all or none of them should be documented.
> >>> If device-specific compatible values are discouraged, the bindings
> >>> should be updated to reflect that, and document a single compatible
> >>> value ("jedec,spi-nor") only.
> >>
> >> That's already allowed, so there's your answer.
> >
> > It's indeed allowed, but the alternative is documented, too (for some
> > values).
> >
> >> The caveat is don't be adding them later to your DT when you find an
> >> issue and new quirk properties will probably be rejected.
> >
> > Adding them later to your DT when you find an issue makes no sense,
> > as that breaks compatibility with older DTBs.
>
> We won't break compatibility with older DTBs if we use a list of
> compatibles. First the vendor specific one which will use some quirks,
> and if that's not available, have as second the generic jedec,spi-nor to
> fallback to.

Sure, you should use a list.

But the current recommended practice is to not have a list,
but just "jedec,spi-nor" (using a list with a new FLASH part name
causes checkpatch and dtbs_check warnings). Hence if you follow that
recommendation, you will run into compatibility issues with older DTBs
when you discover the quirk later, and decide to add it to the list.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
