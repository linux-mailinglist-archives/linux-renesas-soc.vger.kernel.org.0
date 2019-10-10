Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C16D2B1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 15:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388203AbfJJNTN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Oct 2019 09:19:13 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39101 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388172AbfJJNTN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 09:19:13 -0400
Received: by mail-oi1-f193.google.com with SMTP id w144so4846030oia.6;
        Thu, 10 Oct 2019 06:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7NZJhJN6HdWwCEUMeQlJdoAhMdqTEF44sskKDjfanc=;
        b=dzn4Jbz5u35/F+VgX4lzB6CSa/Wh8gdstMAYYcX4HlpIl2D8bKbKZwU5Pdoge2I2Vz
         QLF9TtTUpHNlBm8m3ZevEZ+Nr6g76/3Qcqs/bmVlfiMDAaVSxNXGRxSFoKBTk+ntkhF9
         mdEw+QyKOIZBJcN3ZPq896KOai/hzLyY33+dwm0rrUP68yDibH65vQ1VM4AeK7BMOihM
         O9EIrzu7NfZLWozZf975+2Tq3yMCihnOLeg2VFaT4z+W4YCnJElk4NRq6RIlGi+cqjDz
         H7o9bv2hF1Ce3OKO7xcR4GVr/RGhRVB6TZ/xe2L3binl7sdrQaKfLxtsHxTwUgFLcllT
         cjdA==
X-Gm-Message-State: APjAAAVF+vQkvl414B9RHPar7eYznRKO/iymmkZXU6c2q/TXyBZfC/IZ
        9FFrb+uwL1cMo3xHUqOLkbXbDdgdFNbFNmEy33o=
X-Google-Smtp-Source: APXvYqzerbZNQDCGPcEhinDBYeswI2sWM62cykcHA35Eo9fX7xr7u1GxkK/D4cFmP9Ufqwl78lt9RO1LhowQ0ugUzsY=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr6999208oiy.148.1570713551912;
 Thu, 10 Oct 2019 06:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWCu14DOci-EUuSZ_JTeZaoq90qr035WFsLY2c3UqgkeA@mail.gmail.com>
 <TYAPR01MB21111CD187E5EF5CB6FB01BAB89A0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
 <CAMuHMdXYSK3U3wr7by0wBd+yQ7HkjDf5s5XMV7BmXyh7j5B9vQ@mail.gmail.com> <OSBPR01MB2103921B22CD1A794B8FCB4FB8940@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103921B22CD1A794B8FCB4FB8940@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Oct 2019 15:19:00 +0200
Message-ID: <CAMuHMdVx6XNaBZ4itZeu5P23bq0VMGsfYssNJGfAdMyf6KKphA@mail.gmail.com>
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

On Thu, Oct 10, 2019 at 3:04 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio
> > port node

> > On Tue, Oct 8, 2019 at 3:43 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove
> > > > audio port node On Fri, Oct 4, 2019 at 4:53 PM Biju Das
> > > > <biju.das@bp.renesas.com> wrote:
> > > > > This patch removes audio port node from SoC device tree.
> > > >
> > > > Standard review comment: "Why?"
> >
> > Bcause it fixes a dtb warning?
> >
> >    Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0:
> > node has
> >    a unit name, but no reg property
>
> I also noticed this warning.
>
> We will get this warning, if we  apply the patch  "[v3,2/2] arm64: dts: renesas: r8a774b1: Add Sound and Audio DMAC
>  device nodes" first and then this one.
>
> If it is other way around, then there won't be any warning. That is the reason I didn't mention it in the commit message.

I even see the warning with current renesas-devel ("make dtbs W=1"),
which does not have "[v3,2/2] arm64: dts: renesas: r8a774b1: Add Sound
and Audio DMAC device nodes" yet.

So I'll apply this patch with the warning message in the commit log, unless
I'm missing something?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
