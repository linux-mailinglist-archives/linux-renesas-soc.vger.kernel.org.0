Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A535E59842E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 15:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243265AbiHRN10 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 09:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244768AbiHRN1Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 09:27:24 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7ADBB3B3D;
        Thu, 18 Aug 2022 06:27:20 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id f14so1093993qkm.0;
        Thu, 18 Aug 2022 06:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MdJl78NxEosOuxjMJCio10tAlOhsC8bxFB2iOZBCOUg=;
        b=hfCfT312Pqrziib5nNWrgZQqwYNDbE5Nvb7lsJSZUBK/L1Y2B/DDPV5+dzxtKltwZP
         wa2TaR3Y5Wh8EL+m3371fteiSK2gKNfj6Ouy5ZSOm1gqWTtq51/OZb33TO8Vl5M72rmi
         PbwagWhM0AruenadQDEaPtWWoQqjGDqNCF9n4W+h+2770LfDgizheRmFvG6KbhiI+9a3
         pX3a5WNhCCxDcwbib+YjtDvU/1+Nox01IzXFBRs5PSj9jqyUx40EmjyCGm+3/qFf8vx6
         QzEfjF/+q/skdz8E/3y1KbvBnao/sI2AWjq/0whP2abcEUz3UjwqmJdFkakv9AAf/vmL
         Uv5A==
X-Gm-Message-State: ACgBeo3ZsV2jHSUq/WhXJ3+Vepb6D+smXNj33dYcWHQPAHQ5Dl9jfiEw
        bpA63ugyOqVfDvU9GdahPSJ5tWyojNFR/g==
X-Google-Smtp-Source: AA6agR4fOlHC/7FkRk2snr9z20tCUnKyqNnoenln1YFyezCc8zaRUMaRwR6G2HVOnHGvQOx3tAPiJQ==
X-Received: by 2002:a05:620a:290a:b0:6bb:6c8a:b9fd with SMTP id m10-20020a05620a290a00b006bb6c8ab9fdmr2087779qkp.72.1660829239850;
        Thu, 18 Aug 2022 06:27:19 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id t39-20020a05622a182700b00342f7beccd0sm1041521qtc.45.2022.08.18.06.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 06:27:19 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3321c2a8d4cso40796287b3.5;
        Thu, 18 Aug 2022 06:27:19 -0700 (PDT)
X-Received: by 2002:a81:1204:0:b0:322:7000:4ecb with SMTP id
 4-20020a811204000000b0032270004ecbmr2793715yws.47.1660829239204; Thu, 18 Aug
 2022 06:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 15:27:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWW0kPATT4zGcjcEPw6XO+18MWJAn_HESe3rrtoEoF=FA@mail.gmail.com>
Message-ID: <CAMuHMdWW0kPATT4zGcjcEPw6XO+18MWJAn_HESe3rrtoEoF=FA@mail.gmail.com>
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

CC devicetree

On Fri, Jul 29, 2022 at 6:50 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For R-Car Gen3 and Gen4, we had I2C aliases in per-SoC DTS include
> files. That doesn't really fit as bus naming is a board property. This
> series moves the aliases to the board files. The following procedure has
> been applied to avoid regressions:
>
> 1) move the aliases from SoC files to board files. Keep the empty
>    alias-nodes in the SoC file and add the new aliases before existing
>    ones. This ensured that identical binaries[1] were created.
>
> 2) Once all aliases were moved and all binaries[1] stayed identical,
>    then the empty alias nodes from the SoC files were removed.
>
> The result is this series based on the renesas-drivers tag
> 'renesas-drivers-2022-07-19-v5.19-rc7'.
>
> It could be discussed if the aliases should be sorted alphabetically,
> but I'd think this is a seperate series then.
>
> I also leave it to Geert, if the commits should be squashed. At least
> for reviewing, I think this separation makes sense, though.
>
> Looking forward to comments,

Thanks for your series!

I have never been a fan of the i2c aliases in the SoC-specific .dtsi files,
as aliases are typically board-specific.
We also don't have physical connectors labeled "i2c<N>" on any of
the affected boards.  But people like the i2c aliases, because i2c
exposes the full buses to userspace, and the aliases fix the userspace
naming of /dev/i2c-<N> (I believe there is no better way to identify
i2c buses from userspace?).

So moving the i2c aliases to the board files is definitely a step in
the good direction.

BTW, you missed r8a774a1.dtsi in your update.

> [1] For desired binaries, of course. For r8a77961 boards, the binaries
> did change. This was intended, though, because I wanted to add I2C
> aliases there which were not present before. Also, the r8a779m* boards
> now have I2C aliases, too.
>
>
> Wolfram Sang (5):
>   arm64: dts: renesas: r8a779{51|60|65}: put I2C aliases to board files
>   arm64: dts: renesas: r8a77970: put I2C aliases to board files
>   arm64: dts: renesas: r8a77980: put I2C aliases to board files
>   arm64: dts: renesas: r8a77990: put I2C aliases to board files
>   arm64: dts: renesas: r8a779a0: put I2C aliases to board files
>
>  arch/arm64/boot/dts/renesas/ebisu.dtsi               |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi            | 11 -----------
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi            | 11 -----------
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi            | 11 -----------
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts       |  5 +++++
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts       |  5 +++++
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi            |  8 --------
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts      |  6 ++++++
>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts       |  6 ++++++
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi            |  9 ---------
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi            | 11 -----------
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi |  7 +++++++
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi            | 10 ----------
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi     |  8 ++++++++
>  arch/arm64/boot/dts/renesas/ulcb.dtsi                |  8 ++++++++
>  15 files changed, 53 insertions(+), 71 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
