Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541B73DD5AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 14:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbhHBMcy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 08:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbhHBMcy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 08:32:54 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C74C06175F;
        Mon,  2 Aug 2021 05:32:44 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id a93so10040034ybi.1;
        Mon, 02 Aug 2021 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9r/J0qDitRnnnvyc1YlEihczgpfr2U6tS1pQrgSWycE=;
        b=I37Cg2Jt0CLI8eUjCuZ9N2sFNuW39exMcGy0vxhSSxUQ3itPbiVK4lDs1L8d/+2nUp
         jrODwFFGBE0dGsxLKhq9CicKERyOXWP4ysFX+qzhjrs88QQcloryjdTZjga37EBeuq3b
         5OSagep4P6qil+aViBB7mhiNlUOIpwHBuCWAn/Pu+HrLafgzblRQVNufikKNf1ZJES3A
         eaK9c8St2kkjKKkyQdCn48XqJTUKPRbpjxHi7Z0sgk9rJ3bviXKcJf+rvBX4w87dXSBG
         6uoIu5BgpHcUQsbtWDYq6a7M6a41GBJLyxqtk663nke3qmPG6fuBhRrs5sRFMfSuneyB
         q17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9r/J0qDitRnnnvyc1YlEihczgpfr2U6tS1pQrgSWycE=;
        b=dbqieFoTqdx4JbMYLJZsY2m8Qpb1dOi64HRWcol981rQLznL98YggavBqazknZdUn0
         Aw2uN/Vavp8hh6xkcR/jj+LSgwlebhnSP7+y1bsGnm11L1QklD5n4rlDDKJaA8WA07xh
         uLKv+6Rl7TiHyGBsKQH/S10zyCOnJYexhsK07GEMKD7D6hHBOIIqOpNPy73lfKu2VNvS
         gk8FR2sCGWEsnFteLLn/qUjkd2LbdcFmjVYibkzN24oANlsyx+17HteMx+kW6haZWdaI
         wmyXJ9br+NSR8exjx4cKVZxNRuJsOSucfDAXbjnbPXkdRpWqAj262pBrY37iM0CUZm9/
         7mMA==
X-Gm-Message-State: AOAM531/EzaEYZJVisMQl3stB2E92z0kIC59zKPt3wZEtBLCH0lWj/dj
        eQywU4va2KYe5gkMhe3WvYkzrmJAKLjkHUzmY5A=
X-Google-Smtp-Source: ABdhPJwAeCFwF0NIFfLC1lv4Ut4jLybCd3m63a7aSX4vUiWBZ5QMeBapCkD8T25TM2eY/Eo3X+tIvCybyMfHAZIIgmE=
X-Received: by 2002:a25:ba44:: with SMTP id z4mr20100744ybj.476.1627907564218;
 Mon, 02 Aug 2021 05:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <162767143674.56427.1812897829636885311.b4-ty@kernel.org> <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <20210802121639.GE4668@sirena.org.uk>
In-Reply-To: <20210802121639.GE4668@sirena.org.uk>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 2 Aug 2021 13:32:18 +0100
Message-ID: <CA+V-a8trGqzB6eFvsub=f-e3cM-1469kqvaOw76yfS2E97GY6A@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
To:     Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

On Mon, Aug 2, 2021 at 1:17 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jul 30, 2021 at 07:13:24PM +0000, Prabhakar Mahadev Lad wrote:
>
> > There is a updated version of the patch [1] which was posted yesterday
> > due to change in handling DMA slave channel configuration [2]. Both
> > the queued patches need to dropped.
>
> Can you send a revert or incremental patch for this explaining the issue
> please?
>
Sure, Biju will send an incremental patch explaining the issue.

> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.
>
Sorry for the inconvenience, I have fixed it now.

Cheers,
Prabhakar
