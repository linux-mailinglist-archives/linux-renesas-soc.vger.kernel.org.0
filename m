Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECDB2A00B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 10:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgJ3JHl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 05:07:41 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56878 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgJ3JHl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 05:07:41 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 128063C0579;
        Fri, 30 Oct 2020 10:07:39 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vUlCa8jIhWC8; Fri, 30 Oct 2020 10:07:32 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D3DA73C009C;
        Fri, 30 Oct 2020 10:07:32 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.94.31) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 10:07:32 +0100
Date:   Fri, 30 Oct 2020 10:07:28 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: ulcb-kf: Initial
 device tree
Message-ID: <20201030090728.GA19340@lxhi-065.adit-jv.com>
References: <20201029133741.25721-1-erosca@de.adit-jv.com>
 <20201029133741.25721-2-erosca@de.adit-jv.com>
 <CAMuHMdX5pCtR-LMbuSJQvDNyVOwcipt7zZOF3c3J-d-Bq98NQg@mail.gmail.com>
 <20201029163213.GA12422@lxhi-065.adit-jv.com>
 <CAMuHMdXbwfPk5_dZEzjLuUZx6ysxdmu6hKbd54Ev6jTQUObTCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXbwfPk5_dZEzjLuUZx6ysxdmu6hKbd54Ev6jTQUObTCA@mail.gmail.com>
X-Originating-IP: [10.72.94.31]
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Oct 29, 2020 at 07:23:53PM +0100, Geert Uytterhoeven wrote:
> On Thu, Oct 29, 2020 at 5:34 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:

[..]

> I don't think we want to add new compatible string to describe each
> combo. Just add "renesas,r8a77961" to the last enum?

I'm afraid I misinterpreted your request. I've pushed your proposal to
https://lore.kernel.org/linux-renesas-soc/20201030083051.18752-4-erosca@de.adit-jv.com/

> > IMHO one thing which is certainly worth clarifying and fixing is the
> > KF revision currently documented in renesas.yaml, i.e. M03.
> >
> > Shimafuji released at least M04, M05 and M06 revisions of KF (nicely
> > compared at https://elinux.org/R-Car/Boards/Kingfisher#Change_point).
> >
> > The question is, does the community intend to support M03 through M06
> > (in which case all of them might need an entry in the documentation) or
> > anything which is earlier than M06 has to be considered deprecated (in
> > which case renesas.yaml would need a simple s/M03/M06/ update)?
> 
> I'm not that familiar with KingFisher and the various revisions.
> Do these differences have an impact on the software side?
> The diodes and filters probably don't.

I personally no longer use KF M03, since its major limitation is not
being able to update the contents of Hyperflash using Lauterbach if
ULCB is stacked on the expansion board (unplugging ULCB each time
it is flashed is absolutely not practical).

I've heard from audio engineers that recent revisions are more suitable
for audio use-cases, but I don't know the full details.

> The I2C repeaters are PCA9548ADB on M03, hence they use a Linux
> driver. By what have they been replaced?
> What's the nature of the MOST ↔ GPS Function select register change?

I will try to collect more information and, if I succeed, I will come
back with feedback. Thank you for your patience.

-- 
Best regards,
Eugeniu Rosca
