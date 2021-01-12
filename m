Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518572F367C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391730AbhALRCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:55 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:27664 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391729AbhALRCz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470744;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:From:
        Subject:Sender;
        bh=m14IsCtAslBc9rv+b0TjI56mJvkvnWhVfFXBLhQziVc=;
        b=VAhQ6JytjMbdbfQm0CMJQHgn+z3Af/eopprHEVfXFRm511TZ6JhY80aZZQnI0JXjgu
        JyfGxQCuukqMNvs2Bn5Wd2teJMRkocAAR5HYxPmr9iIqDGPyCB8zwDC1MponTlb0kHIa
        Xn+K2sHGn6rJvHtuY/5YGGWuG11/FN2vPrOHVUUZl2hpIlEH8zqMyBWZ+/Q3xtvwUNZM
        oO9Nq5ipZrGT9L31tahjz8QXcXWdFGF6STLCYjIkAlzIj/wyhYf6V7z70jl71i6TpGWI
        DLZsJo7Uh0/igx9qBFv9lFKQFltCqEdUAmb+QsO5zSz9nobblEwWglmTkUJuI6REwSzC
        Sapw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/wuMlg=="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 47.12.1 AUTH)
        with ESMTPSA id z08ea3x0CGwwNTy
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:58:58 +0100 (CET)
Date:   Tue, 12 Jan 2021 17:58:58 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Message-ID: <466563365.401585.1610470738787@webmail.strato.com>
In-Reply-To: <CAMuHMdWVC-E-=r2yGDNpXRbothAML6jvMozm9k=4PgDrDrcFqg@mail.gmail.com>
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
 <20201221165448.27312-5-uli+renesas@fpond.eu>
 <CAMuHMdWVC-E-=r2yGDNpXRbothAML6jvMozm9k=4PgDrDrcFqg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: renesas: Initial R8A779A0 (V3U) PFC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev29
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 12/22/2020 12:42 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > --- /dev/null
> > +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> > @@ -0,0 +1,2527 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * R8A779A0 processor support - PFC hardware block.
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corp.
> > + *
> > + * This file is based on the drivers/pinctrl/renesas/pfc-r8a7795.c
> 
> based on drivers/pinctrl/renesas/pfc-r8a77951.c?

I'm inclined to leave that as it is because that's what the file was called when the original patch was created.

CU
Uli
