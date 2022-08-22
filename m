Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 684E659BF6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 14:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbiHVMX5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 08:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiHVMXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 08:23:55 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1024C11A08
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 05:23:53 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id f4so7646102qkl.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 05:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PDuMySLkHO21XyJnVBGiYc90+BQWJAD0WNVsnTdhEm4=;
        b=yQRfnqUdzpdwOmMoD0tzU6fOfhTd60pxrR1eTwOX/D2/HZSlkRVftX2JW66VQxoOHa
         UtdZfD/g7jsP54xlgBtg7VfXdz5s1EXjH73zQ4qKCrC+JnvaQOs/Qtx8j4DDBkAhHPAX
         A+BtHrKBDEOtkKmTRpED/7hZNTltUIJPbIWyTiqDeY2G7oYGK689UbrIWuJvukeq8JbW
         rFSKhcQ82L1vu2WyRP/fKhAxQMN7WbcMVKRQW4fLwF2bshg9ZOEhz2J8pShoWPr2CO7w
         X1u7ePJpevcdNE9MHXOXgLHXE9T23yHfTdTLYsO6a/WlU+P1HPtgHzVPqtRWYH8Jn12S
         bbXw==
X-Gm-Message-State: ACgBeo066/I9p21LoOuyfIs/VYcItSCbWsolY8Q1Gt4LcPxh/PPyIVXa
        X+YNbE96QZkJ+tJ83yNGMoJeNpT+9jrMfQ==
X-Google-Smtp-Source: AA6agR4aQmFQkUuHZkJ3dZD7asR5WkNteerH+X6eqBowihQaVOSZmZmlbKuombSwVq+uCEgs8E2RGg==
X-Received: by 2002:a05:620a:4613:b0:6bb:61c1:819 with SMTP id br19-20020a05620a461300b006bb61c10819mr12430415qkb.736.1661171032019;
        Mon, 22 Aug 2022 05:23:52 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id r1-20020a05620a298100b006bb53282393sm11317761qkp.81.2022.08.22.05.23.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 05:23:51 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-333b049f231so288146307b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 05:23:51 -0700 (PDT)
X-Received: by 2002:a0d:eb87:0:b0:338:d06b:e605 with SMTP id
 u129-20020a0deb87000000b00338d06be605mr13107421ywe.316.1661171031199; Mon, 22
 Aug 2022 05:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <87edx9gg6f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edx9gg6f.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Aug 2022 14:23:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT045t7yOyASaq40JDuRCkMmFAY7GQXS5nb9P+70T7FA@mail.gmail.com>
Message-ID: <CAMuHMdWT045t7yOyASaq40JDuRCkMmFAY7GQXS5nb9P+70T7FA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: Add V3H2 Condor-I boards
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
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

Hi Morimoto-san,

On Mon, Aug 22, 2022 at 4:34 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch adds r8a77980A V3H2 (= r8a77980 ES2) Condor-I board basic
> support. It is using r8a77980 Condor board setting as-is for now,
> but should care ES2.0 specific feature in the future.
>
> Signed-off-by: Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-es2-condor.dts

I think this should be "r8a77980a-condor-i.dts"

> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Condor-I board on r8a77980A (ES2.0)
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + */
> +
> +#include "r8a77980-condor.dts"

R-Car V3H2 is known to differ slightly from R-Car V3H.
Hence I suggest adding "r8a77980a.dtsi", which includes
"r8a77980.dtsi", and adds/removes/overrides what is different.

I have no idea what are the differences between the Condor and Condor-I
boards, but I suggest to move the base or common parts to "condor.dtsi"
or "condor-common.dtsi", like we did before for the Draak/Ebisu and
Salvator-X(S) boards.

Then "r8a77980a-condor-i.dts" can include both "r8a77980a.dtsi" and
"condor.dtsi"/"condor-common.dtsi", and add the pieces that are
different.

> +
> +/ {
> +       model = "Renesas Condor-I board based on r8a77980A (ES2.0)";

I think this needs to override the compatible value, too:
  1. Based on previous discussions about how to handle R-Car V3H2,
     "renesas,r8a77980a" should be added to the top-level compatible
     value, so we can distinguish between R-Car V3H and V3H2.
     All other compatible values can probably stay the same
    (cfr. R-Car Gen3e),
  2. As the board is different, "renesas,condor-i" should be added,
  3. Depending on the differences between Condor and Condor-I, the
     "reneas,condor" value should be dropped (or not).

So I expect the override to become:

    compatible = "renesas,condor-i", "renesas,condor",
"renesas,r8a77980a", "renesas,r8a77980".

or

    compatible = "renesas,condor-i", "renesas,r8a77980a", "renesas,r8a77980".

Obviously, any new compatible values must be documented.

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
