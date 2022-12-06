Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBBE643EB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Dec 2022 09:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbiLFIdf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Dec 2022 03:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234259AbiLFIdN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2022 03:33:13 -0500
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBF81CB3B;
        Tue,  6 Dec 2022 00:33:06 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id h10so9950534qvq.7;
        Tue, 06 Dec 2022 00:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufiPGRxn+u+eF7V9lbnW/2wOS52DtOLgEOMLvePrXwg=;
        b=Wt2hhv3LvJPd8qbf51nv8eYwjyVH/GFxsEQ9vdRXe9Le+U7XDHPwO4Qvsu20fuXnFE
         22VHuatut7BFF4AgasRRIuoQiKshMTd0ZfLbcgXaM+xEVeNM3cysn7YGX1TUw4bmEhZP
         XB8dBqbk2WMtMajPxufGNwgb1m18AXRLZeBAeKuKQMFsoqyTZzGF+Tyfp3EP4u1x3rxo
         xOWJOtZRyomkw6JeENdZvYel3gHEVKbW+MfwNc8GI1eu+0WJuCv2MDDv8Jq2n+quY59p
         idbx2K8xP2E+Svnuxaz7Y+BmdRf5kJgDCWy1U8uHQjhXqv6z6sNP0a3OBbLgvlxZDSuh
         fAGw==
X-Gm-Message-State: ANoB5plF664tGpL5yc/No2cQISkuqe/SYY4LqoHp6s0Lb+7Y9yX9n3To
        4DfOfPcOQt3RUHaa8nqwc1vwdt5FWJT4YA==
X-Google-Smtp-Source: AA0mqf5RTsfiCI5z9ZjjTnLPPxB4nhROhc+/OVHnIhRA9PJRL5Hi5WniKsPQm9WZ43CtH5o+nNNRjA==
X-Received: by 2002:a0c:fe84:0:b0:4c7:2b85:9bd with SMTP id d4-20020a0cfe84000000b004c72b8509bdmr19837695qvs.107.1670315585276;
        Tue, 06 Dec 2022 00:33:05 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id i22-20020a05620a249600b006f9f714cb6asm14610187qkn.50.2022.12.06.00.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 00:33:04 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3e45d25de97so88149577b3.6;
        Tue, 06 Dec 2022 00:33:04 -0800 (PST)
X-Received: by 2002:a81:1486:0:b0:36b:56d3:71b8 with SMTP id
 128-20020a811486000000b0036b56d371b8mr16028867ywu.384.1670315584377; Tue, 06
 Dec 2022 00:33:04 -0800 (PST)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc> <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org>
In-Reply-To: <20221205163306.GB2012644-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Dec 2022 09:32:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
Message-ID: <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Walle <michael@walle.cc>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Dec 5, 2022 at 5:33 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Dec 02, 2022 at 02:56:01PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Dec 2, 2022 at 2:50 PM Michael Walle <michael@walle.cc> wrote:
> > > Am 2022-12-02 14:37, schrieb Geert Uytterhoeven:
> > > > Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> > > > FLASHes.
> > > >
> > > > Merge the new entries with the existing entry for MT25QU02G.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > mt25qu512a is already in active use, causing "make dtbs_check" errors.
> > > > mt25qu256a is supported by the Linux spi-nor driver, but there are no
> > > > upstream users yet.
> > >
> > > Is it encouraged to use the specific compatible with SPI-NOR flashes?
> > > As far as I know it isn't. The spi-nor subsys tries hard to identify
> > > any flashes at runtime and any additional information in the device tree
> > > is used as a last resort (just for flashes which doesn't support the
> > > read jedec id command yet). And usually boards have different sources
> > > for flash chips, so hardcoding a particular part in the device tree
> > > doesn't make sense.
> >
> > Thanks, I am aware there have been pushbacks when trying to
> > document more compatible values.
> >
> > IMHO either all or none of them should be documented.
> > If device-specific compatible values are discouraged, the bindings
> > should be updated to reflect that, and document a single compatible
> > value ("jedec,spi-nor") only.
>
> That's already allowed, so there's your answer.

It's indeed allowed, but the alternative is documented, too (for some
values).

> The caveat is don't be adding them later to your DT when you find an
> issue and new quirk properties will probably be rejected.

Adding them later to your DT when you find an issue makes no sense,
as that breaks compatibility with older DTBs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
