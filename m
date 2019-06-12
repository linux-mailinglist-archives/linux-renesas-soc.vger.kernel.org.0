Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E5C4237C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408364AbfFLLIF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:08:05 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34848 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408452AbfFLLIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:08:05 -0400
Received: by mail-oi1-f193.google.com with SMTP id y6so11375076oix.2;
        Wed, 12 Jun 2019 04:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ukfH5dcM0xAZep8ioXTnwfEYhr7LsPvJH440oIYlwoI=;
        b=pwJX8JVgc50nnmbzL8p82Ea28gdm+rZRZ/UanVF5cCKrK7JcJdmbS+wkpP4YShpfDo
         moKw5SLSeQoBRFn7SvaolR7XYtwnHU3Yz9SSkUXF5UrRdtbIl/0vJdz6MOsQ7KFpO6Yx
         OIW8mut8/knJVDzmCWm9ne7oFBpWj4W1YihS2RaecM4Ldf0QjGraSvwsbo2g7wEWjVWZ
         Wv0CfGCbArw3AthsJxmZMzUvaf/kWZ6oQFpRLeGZP99oNFAJ1JN1hs7XjjvBJXiP54O9
         0Bfl9W8mt8tcPhMR2Xu94C1uw5k+AbQOuxIyQmePyL6isN4AKzhJa7v+2KvUmvmf/P2T
         jyeQ==
X-Gm-Message-State: APjAAAWK93/1XMED12XLLwys8fZSHOEgA7q2tefJ8ziw+MOMMwpAHy8L
        0LgtRm/A5OF1P+Gevf3ImgrhDBn50osXj95x1Vo=
X-Google-Smtp-Source: APXvYqydtIVlC9FBOAUGrt9f+nWsCrcYJXYMCuQbDl7RcauvlqPwuK2CPs863h5t6L7u7x9d8CuWHPD5zxp8GpW46Xo=
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr18311247oif.131.1560337684671;
 Wed, 12 Jun 2019 04:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai> <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
In-Reply-To: <20190612101516.xrlvqw7cls7eiv4u@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 13:07:48 +0200
Message-ID: <CAMuHMdWPe8CgsJrNjt+6DqES6AB5o1FpTXdVsUJiDi9MDFE6dA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Jun 12, 2019 at 12:15 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > File arch/arm64/boot/dts/renesas/hihope-common.dtsi contains common
> > definitions for the mother boards for both flavours (including the
> > eMMC). My understanding is that R-Car M3-N does support HS400, hence
> > the need for the property here.
>
> I won't be super strict here, yet I think it is more elegant to add the
> HS400 properties to the board DTS files, not the dtsi. I mean we could
> add them to the SoC dtsi otherwise.

This _is_ the (shared) board DTS, cfr. salvator-common.dtsi and
ulcb.dtsi, which do have mmc-hs400-1_8v properties.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
