Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0D8569B98
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 09:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbiGGHak (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 03:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbiGGHai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 03:30:38 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303412A719;
        Thu,  7 Jul 2022 00:30:37 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id z12so12765084qki.3;
        Thu, 07 Jul 2022 00:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JplrbVebgFPii06YqftrBSRlrrDSQoyq4BqrLGpK9P4=;
        b=r9aPMX1fIMXcEimy+O5JDZ8Hi3RgkZVTDXXNy4Sm3vwHZu+k2elsLSutjuCj1XLwwP
         rHhChRVkCMAOnkHFIdM38Rsnxr2cHu5G42uiX5Y5iTJ7bJfDM15g0TnTFHgC4ANeq6SE
         4dpgsTOy8hgF6uPQz2PRRb2vo6+uriq+Lzn1RfrxnA+WfCgYTyVkglcpwVp8aDufQIYE
         Rsv4H2yyrgfvkS6gwZ2gHFMxF1tzp63U71+4jAxFKOPn+qLIsrUzCr/HvRK5pcq1CDYR
         dNlrZxuobTQwjlqoXKW+1uIidymXg1JdayIG1yHNv2EBez3Ht1DI4e1aX6dDy7B7PBV+
         DtbQ==
X-Gm-Message-State: AJIora/kskZHfSUUnTtf4QrYfwp4Y94o3Fl2AJb3519Rm/1RPRjtQKDV
        w26sB1of7IlfA7ngNMHxXyRgMODKU3dj9X/x
X-Google-Smtp-Source: AGRyM1seTh8gLk7Q7Ahw3wzs/xrjf0Swb1WDHbblB+NkwwYVZXwr8ZeoxgKu3drf+Hvuv6IaBEWQSA==
X-Received: by 2002:a05:620a:46aa:b0:6af:225e:5c7d with SMTP id bq42-20020a05620a46aa00b006af225e5c7dmr30542642qkb.621.1657179035971;
        Thu, 07 Jul 2022 00:30:35 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id b3-20020ac812c3000000b0031bf647b115sm17031065qtj.35.2022.07.07.00.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 00:30:35 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id l144so18595049ybl.5;
        Thu, 07 Jul 2022 00:30:35 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr49905625ybh.36.1657179035303; Thu, 07
 Jul 2022 00:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
 <YfGZx9qHQdF8TzcT@pendragon.ideasonboard.com> <CAMuHMdW1DwsMTVog4oBa_=ozH=aEeAdK+wS1SbwbZYz22JAL=w@mail.gmail.com>
 <YfHf0ZNt8GV0gHaF@pendragon.ideasonboard.com> <YsZEEHbLxQgszvyq@pendragon.ideasonboard.com>
In-Reply-To: <YsZEEHbLxQgszvyq@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Jul 2022 09:30:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWE5eQF7FB52gWQhtMOsMSyK9wwS0O3xSWzD+GLKO93w@mail.gmail.com>
Message-ID: <CAMuHMdXWE5eQF7FB52gWQhtMOsMSyK9wwS0O3xSWzD+GLKO93w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel
 .dtsi for overlay support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
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

Hi Laurent,

On Thu, Jul 7, 2022 at 4:25 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jan 27, 2022 at 01:57:05AM +0200, Laurent Pinchart wrote:
> > On Wed, Jan 26, 2022 at 08:15:26PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Jan 26, 2022 at 7:58 PM Laurent Pinchart wrote:
> > > > On Wed, Jan 26, 2022 at 01:18:56PM +0100, Geert Uytterhoeven wrote:
> > > > > On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart wrote:
> > > > > > The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> > > > > > boards as an optional external panel. It is described in the
> > > > > > arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> > > > > > DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> > > > > > board device trees, with other minor modifications, to enable the panel.
> > > > > >
> > > > > > This is however not how external components should be modelled. Instead
> > > > > > of modifying the board device tree to enable the panel, it should be
> > > > > > compiled as a DT overlay, to be loaded by the boot loader.
> > > > > >
> > > > > > Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> > > > > > declaring a panel node only, without hardcoding its path. Overlay
> > > > > > sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
> > > > > >
> > > > > > This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> > > > > > is currently unused. As overlay support for this panel has only been
> > > > > > tested with Gen3 hardware, and Gen2 support will require more
> > > > > > development, move the file to arch/arm64/boot/dts/renesas/.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > > I see you've reviewed the whole series. Can you pick it up ?
> > >
> > > I believe it depends on the removal of the empty endpoints, for which
> > > we're waiting for feedback from Rob, IIRC?
> >
> > You're right. Let's wait some more time then.
>
> How should we proceed with this ?

That dependency is commit 747bbcd3aacd95fe ("arm64: dts: renesas:
Remove empty rgb output endpoints") in v5.19-rc1, right?
So I can take this for v5.20, or are any other changes needed?

Please confirm.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
