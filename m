Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5C12D2A23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 14:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387624AbfJJM5L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Oct 2019 08:57:11 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45562 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387512AbfJJM5K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 08:57:10 -0400
Received: by mail-ot1-f65.google.com with SMTP id 41so4739108oti.12;
        Thu, 10 Oct 2019 05:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iskpQZpdK+MEZ5LUiXK4OHRXKfudboVrt3/aMUlkeMs=;
        b=h4vqDNcPa5+MtujzOFU2WsOUNZf+ELImMnnRrKW8nqhICuYHlqb7teyiF2qoml+/Ir
         67HHEzZiakdCkuNq1YgkdZOODfK/I+V4w204kYJftSz5Jnh2T5mmyQeNRN8I2puQ+Dur
         U7sJeGFNKQ2oadGebQw4vRLvPhvM+6UAixujrJcwygbB+WjMvcHMtmUSx4Aao8hDF6f8
         54hqhuXIk2h8m9VdSe40sD0OWv6IF5jS2dUTwmZGnMm2qCxkk41+QdvUH8bdr8TkSGR5
         Y4qBpMgpKBB6Rd2/uCOWMa1oUyZ+RMnQpbqB4g73Ip0tsDDUU5BwbqMJLgSFjLeyGX72
         9Fgg==
X-Gm-Message-State: APjAAAV42FcOtaEFMJKfW9Rbd/Htx8FsrqZfPCUvsMuNL+PJwiXaJTaV
        yDKA7oYUWhUcVU75CrYot63aZTh5ltYPU0EGFGv3iiM4
X-Google-Smtp-Source: APXvYqx2KOkRkrpy8nk9RzyhbDs7oSPc969vD3dreaz7jZVAFoPZZ0qd+cYeM2rEnd9WTVpolVxOZ7LCx/1Wt2XKSqE=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr7717190otr.250.1570712227470;
 Thu, 10 Oct 2019 05:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWCu14DOci-EUuSZ_JTeZaoq90qr035WFsLY2c3UqgkeA@mail.gmail.com> <TYAPR01MB21111CD187E5EF5CB6FB01BAB89A0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB21111CD187E5EF5CB6FB01BAB89A0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Oct 2019 14:56:56 +0200
Message-ID: <CAMuHMdXYSK3U3wr7by0wBd+yQ7HkjDf5s5XMV7BmXyh7j5B9vQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio port node
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Oct 8, 2019 at 3:43 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio
> > port node
> > On Fri, Oct 4, 2019 at 4:53 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > This patch removes audio port node from SoC device tree.
> >
> > Standard review comment: "Why?"

Bcause it fixes a dtb warning?

   Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has
   a unit name, but no reg property

> >
> > > Fixes: e2f04248fcd4 ("arm64: dts: renesas: r8a774a1: Add audio
> > > support")
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > > V1-->V2
> > >  * New patch.
> > > V2-->V3
> > >  * Fixed the commit message. Thanks to Fabrizio.
> > >
> > > This patch depend upon
> > > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=18
> > > 2581
> >
> > Why the dependency?
> > This looks like a fix for r8a774a1, too?
>
> Sorry, the above dependency is for the second patch.
> "[v3,2/2] arm64: dts: renesas: r8a774b1: Add Sound and Audio DMAC device nodes"

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
