Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C10564080D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 14:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbiLBN4c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 08:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233791AbiLBN4T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 08:56:19 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688FAC2D35;
        Fri,  2 Dec 2022 05:56:15 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id c14so3462630qvq.0;
        Fri, 02 Dec 2022 05:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXuttiq+R35t3Lo1CqjcwEovWJl6+re6p/cH4Ee/PUs=;
        b=UTFz8deE0KCnQIBybQNKkgjblOsY3xo9Thf3OPHe1Ve6xx6o7zi8RE4eY9Zph0fUte
         H+lWz+Md4RDd+tBFWJBPya6ZpScj6Rom+3sp3Yr53plJzfeik6n+uYesI6GN4R/L/47v
         oVfKVJVaOdX4x61vodzWRyIa1oy8lyJXTyMtgi0dH355Ahw4GdggrAmh+0vIAJEaJNjF
         0AoUw9tt1OdTwHtuUVDqp4/JkXK3PvGQEgijHcSurEq0I/3bVetiiWh0pRgPKIXPsHeP
         hfvQ7lIwsSbxgRvecrz7HSZXxN8fkDzlXVm4xrN64Lyry4m1RCF1Qa79jpIs0OgFmHvg
         7YsQ==
X-Gm-Message-State: ANoB5pn4HGwOjynxds3mbFy4NKvJO7/6mordlfssnQRJ2X03xEueYOkl
        yM7cdlYRHuOe2ExN+qNnKU18gH8CAf5aIA==
X-Google-Smtp-Source: AA0mqf7EotnjCRg12TMFv9oNz06TcFiGa3bMoK1j7LQ2msOx+V9O7apwLlVtsVW9EEPKLmrcwpq4dQ==
X-Received: by 2002:a05:6214:5a82:b0:4b8:2644:a050 with SMTP id ln2-20020a0562145a8200b004b82644a050mr48306124qvb.74.1669989374184;
        Fri, 02 Dec 2022 05:56:14 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id o6-20020ac872c6000000b003a68dc901e0sm4135771qtp.47.2022.12.02.05.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 05:56:13 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-381662c78a9so49304897b3.7;
        Fri, 02 Dec 2022 05:56:13 -0800 (PST)
X-Received: by 2002:a81:1486:0:b0:36b:56d3:71b8 with SMTP id
 128-20020a811486000000b0036b56d371b8mr1834074ywu.384.1669989373149; Fri, 02
 Dec 2022 05:56:13 -0800 (PST)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
In-Reply-To: <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 14:56:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
Message-ID: <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To:     Michael Walle <michael@walle.cc>
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Michael,

On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
> Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> > Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> > FLASHes.
> >
> > Merge the new entries with the existing entry for MT25QU02G.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > mt25qu512a is already in active use, causing "make dtbs_check" errors.
> > mt25qu256a is supported by the Linux spi-nor driver, but there are no
> > upstream users yet.
>
> Is it encouraged to use the specific compatible with SPI-NOR flashes?
> As far as I know it isn't. The spi-nor subsys tries hard to identify
> any flashes at runtime and any additional information in the device tree
> is used as a last resort (just for flashes which doesn't support the
> read jedec id command yet). And usually boards have different sources
> for flash chips, so hardcoding a particular part in the device tree
> doesn't make sense.

Thanks, I am aware there have been pushbacks when trying to
document more compatible values.

IMHO either all or none of them should be documented.
If device-specific compatible values are discouraged, the bindings
should be updated to reflect that, and document a single compatible
value ("jedec,spi-nor") only.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
