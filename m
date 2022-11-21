Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D7A631D16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 10:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiKUJoK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 04:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiKUJoJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 04:44:09 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C87C76B;
        Mon, 21 Nov 2022 01:44:08 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id l15so6922061qtv.4;
        Mon, 21 Nov 2022 01:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieZjlpZ3qak0sadfZHGHEvvE6+oSvPeWOGhOtNL2sHo=;
        b=YEMsFss3MSVYlivAOZxbhRt+JQgMIdd/oYTUJWWa48UeS3gqJ6iFf4+WzprnoKkk1s
         ei/BfY1i0Bxa9WV19IMcFy1whDafgCmZrARGGtdEdtgzfDQB4zRi6/fONSDLJczC3wm8
         1x+CVYUOFvADH9RJ/EfWbNGky45DJd5qKfBKG0vd0KqjEelYGhKNARtj6NmMkipXFwmC
         pERkbQIu0EduvP/khTAhH4sY7d9GVgcMxMs+ES2Rv6K0EyP1Ex4cnms+k6jrsbvOUVRM
         3P9XwpiiN29nG3je7NZmqDLwXQjdamFVps05B0SBt88KtsgmNAoXFqxdebs1JfSk05Z6
         X2tA==
X-Gm-Message-State: ANoB5pkRHStf9jWVIvMbxwslxCU5clX7IgDt21fIbQI85t04ENwLE/cp
        xUhUdIysJGP9PCoFz3igczMZJSkq3Q+CGQ==
X-Google-Smtp-Source: AA0mqf4advnKH/QJjO2O3IzRBFqMA26HO9FO2ysdtDIh/MVCMXs8jmyj0JH9Yi0YLPEkH4zmTGHuUg==
X-Received: by 2002:ac8:65d0:0:b0:3a5:4859:8176 with SMTP id t16-20020ac865d0000000b003a548598176mr16778692qto.478.1669023846954;
        Mon, 21 Nov 2022 01:44:06 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id x13-20020a05620a448d00b006fa4ac86bfbsm7829086qkp.55.2022.11.21.01.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:44:05 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id z192so12965836yba.0;
        Mon, 21 Nov 2022 01:44:05 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr16342904ybp.202.1669023844963; Mon, 21
 Nov 2022 01:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20221118211103.GA1334449-robh@kernel.org>
In-Reply-To: <20221118211103.GA1334449-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Nov 2022 10:43:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM9e3mvfRV2jTBgPH7Xp=wW-k_JrAr5vuZ=PJ-JmjSqw@mail.gmail.com>
Message-ID: <CAMuHMdUM9e3mvfRV2jTBgPH7Xp=wW-k_JrAr5vuZ=PJ-JmjSqw@mail.gmail.com>
Subject: Re: [GIT PULL] Stable branch for .dts to .dtso rename
To:     Rob Herring <robh@kernel.org>, soc@kernel.org
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Andrew Davis <afd@ti.com>, Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Frank Rowand <frowand.list@gmail.com>,
        Frank Wunderlich <linux@fw-web.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob, soc-people,

On Fri, Nov 18, 2022 at 10:11 PM Rob Herring <robh@kernel.org> wrote:
> .dts files for overlays are getting renamed to .dtso. The kbuild support
> for that in in this stable branch. The .dts patches that depend on this
> are here[1]. There's also some new .dts overlay files posted[2].
>
> I'll leave it to the SoC and sub-arch maintainers to decide how you all
> want to handle it from here. Either SoC maintainers can take this branch
> and dependent rename patches or each sub-arch can. In any case, I would
> like it converted over in 6.2 so we can remove .dts -> .dtbo build
> support ASAP and not be carrying both.
>
> Rob
>
> [1] https://lore.kernel.org/all/20221024173434.32518-1-afd@ti.com/
> [2] https://lore.kernel.org/all/20221118190126.100895-12-linux@fw-web.de/
>
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
>
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/dtbo-rename
>
> for you to fetch changes up to dcad240c15c10bebdccd1f29f1a44787528f2d76:
>
>   kbuild: Cleanup DT Overlay intermediate files as appropriate (2022-11-18 14:45:30 -0600)
>
> ----------------------------------------------------------------
> Andrew Davis (4):
>       kbuild: Allow DTB overlays to built from .dtso named source files
>       kbuild: Allow DTB overlays to built into .dtbo.S files
>       staging: pi433: overlay: Rename overlay source file from .dts to .dtso
>       kbuild: Cleanup DT Overlay intermediate files as appropriate
>
> Frank Rowand (1):
>       of: overlay: rename overlay source files from .dts to .dtso

Thanks, pulled into renesas-devel for v6.2, with the "renesas"
patch[1] applied on top, for a special late pull request for soc.

Alternatively, the soc people could just apply [1] directly, if they prefer
doing it that way.

Thanks!

[1] https://lore.kernel.org/all/20221024173434.32518-6-afd@ti.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
