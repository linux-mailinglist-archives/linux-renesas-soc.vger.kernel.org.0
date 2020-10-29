Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB7D29F19B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 17:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgJ2Qft (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 12:35:49 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:47532 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgJ2QeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 12:34:18 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 22C2D3C0588;
        Thu, 29 Oct 2020 17:34:15 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KF1LO2lg9uMQ; Thu, 29 Oct 2020 17:34:09 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D97B93C009C;
        Thu, 29 Oct 2020 17:32:20 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.94.11) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 29 Oct
 2020 17:32:20 +0100
Date:   Thu, 29 Oct 2020 17:32:13 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: ulcb-kf: Initial
 device tree
Message-ID: <20201029163213.GA12422@lxhi-065.adit-jv.com>
References: <20201029133741.25721-1-erosca@de.adit-jv.com>
 <20201029133741.25721-2-erosca@de.adit-jv.com>
 <CAMuHMdX5pCtR-LMbuSJQvDNyVOwcipt7zZOF3c3J-d-Bq98NQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5pCtR-LMbuSJQvDNyVOwcipt7zZOF3c3J-d-Bq98NQg@mail.gmail.com>
X-Originating-IP: [10.72.94.11]
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Oct 29, 2020 at 03:09:10PM +0100, Geert Uytterhoeven wrote:
> On Thu, Oct 29, 2020 at 2:38 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > Create a dedicated DTB for M3-ES3.0 + ULCB + Kingfisher combo.
> > Inspire from the pre-existing ULCB-KF device trees:
> >
> > $ ls -1 arch/arm64/boot/dts/renesas/*ulcb-kf.dts
> > arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
> > arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
> > arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
> > arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> >
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.11.

Thank you for the prompt review!

> > +       compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
> > +                    "renesas,r8a77961";
> 
> Can you please send a patch to add this combo to
> Documentation/devicetree/bindings/arm/renesas.yaml?

I would happily do so if you resolve below concerns.

Since the inception of the Kingfisher extension board description in
v4.15-rc1 commit 5418a900412699 ("arm: shmobile: Document Kingfisher
board DT bindings"), nobody attempted describing the SoC+ULCB+KF
combinations in spite of four of such DT configurations being actively
used and maintained, i.e. r8a779{50,51,60,65}-ulcb-kf.

So, if we start documenting the r8a77961-ulcb-kf combo as a board, this
raises below questions:

  => should the missing 4 SoC+ULCB+KF instances be documented as well?
  => should a new compatible string be created for each such HW combo,
     e.g. "renesas,<soc>-ulcb-kf"?

I feel none of the above is really needed, based on the patterns
established in Documentation/devicetree/bindings/arm/renesas.yaml,
but I might be wrong. Thoughts/suggestions appreciated.

IMHO one thing which is certainly worth clarifying and fixing is the
KF revision currently documented in renesas.yaml, i.e. M03.

Shimafuji released at least M04, M05 and M06 revisions of KF (nicely
compared at https://elinux.org/R-Car/Boards/Kingfisher#Change_point).

The question is, does the community intend to support M03 through M06
(in which case all of them might need an entry in the documentation) or
anything which is earlier than M06 has to be considered deprecated (in
which case renesas.yaml would need a simple s/M03/M06/ update)?

-- 
Best regards,
Eugeniu Rosca
