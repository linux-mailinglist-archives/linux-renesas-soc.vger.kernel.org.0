Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43EE1E3ADA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 09:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbgE0Hoh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 03:44:37 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:39725 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387597AbgE0Hof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 03:44:35 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id B90CC3C0579;
        Wed, 27 May 2020 09:44:33 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NIkAPByA2Jjy; Wed, 27 May 2020 09:44:28 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CA7B43C0022;
        Wed, 27 May 2020 09:44:28 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.38) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 27 May
 2020 09:44:28 +0200
Date:   Wed, 27 May 2020 09:44:22 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        <VenkataRajesh.Kalakodima@in.bosch.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        <muroya@ksk.co.jp>, <Harsha.ManjulaMallikarjun@in.bosch.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sean Paul <seanpaul@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        <gotthard.voellmeke@renesas.com>, <efriedrich@de.adit-jv.com>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        <ChaitanyaKumar.Borah@in.bosch.com>, <hien.dang.eb@renesas.com>,
        <michael.klein@renesas.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200527074422.GA27239@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
X-Originating-IP: [10.72.94.38]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, May 27, 2020 at 09:34:30AM +0200, Geert Uytterhoeven wrote:
> On Wed, May 27, 2020 at 9:16 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
> > > CMM functionalities are retained between suspend/resume cycles (tested with
> > > suspend-to-idle) without requiring a re-programming of the LUT tables.
> >
> > Hmm. Is this backed up by any statement in the HW User's manual?
> > This comes in contrast with the original Renesas CMM implementation [**]
> > which does make use of suspend (where the freeze actually happens).
> >
> > Can we infer, based on your statement, that we could also get rid of
> > the suspend callback in [**]?
> 
> While the CMM state will be retained across suspend-to-idle, I'm quite
> sure it will be lost by suspend-to-RAM, at least on the Salvator-X(S),
> ULCB, and Ebisu development boards, as PSCI will ask the BD9571WMV
> regulator to power down the R-Car SoC.
> 
> So IMHO we do need suspend/resume handling.

That makes sense. I should be more careful about suspend-to-idle
vs suspend-to-ram and not alias the two.

-- 
Best regards,
Eugeniu Rosca
