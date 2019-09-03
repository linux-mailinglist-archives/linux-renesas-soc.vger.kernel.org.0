Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C54DA684F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 14:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbfICMKy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 08:10:54 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34400 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfICMKy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 08:10:54 -0400
Received: by mail-oi1-f195.google.com with SMTP id g128so12581264oib.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 05:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+xIjaAJUd1GaonkzJJosr23Uf/8WYjOGEAgyMrCgFo8=;
        b=bvLr9TSSQB9kfDCCXvBC0JZ3liMReOVfTouDQZhr6M2jQPEEmdf0kmioyBitgLq4Mt
         ZaAjC29dKqcjGus3t/XWftFyrOOaoXlli54rY3Sx2VreyVFq2NZBhNOL1fYL1ONiWXf2
         h8r0koWi7+FaFWPjiRzM/UHCmqPx/uHqViumUMC+z9dQDcTUgfVxhnOOwTNudaA4HHV8
         yM6OFuLwTrMFh1eF+HQ328xK9WPVuuXPp8VzflAgj7sEzuyBkVcPOTxeTCNDldStMf85
         pDFL13dVgDsvIsZ2Yo1HIOPeEdmytUYUw87UN/hFUsl8vewp6PB/ZrR5bSi4VmGz9VZZ
         95dw==
X-Gm-Message-State: APjAAAWMy1HHL2IBSqlN2gSYimKHydxLOMth9U81VBSw3+7Pyiv6akJK
        K+hQAE6kcudlrwrS9humxZc5gIlBAihMT1+WWsg=
X-Google-Smtp-Source: APXvYqw3dbLaAk8lG3cvVJtzb7nnwDcpsyyBK7lRsQJ/qXJS1f/gFMp4Lbsj49Py5g4STxcx9I3j1ZpHB0l2i2wWFGE=
X-Received: by 2002:aca:b154:: with SMTP id a81mr21347044oif.148.1567512653543;
 Tue, 03 Sep 2019 05:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190828113618.6672-1-geert+renesas@glider.be> <TYAPR01MB45445637B824C0464A1CD5ADD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB45445637B824C0464A1CD5ADD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Sep 2019 14:10:42 +0200
Message-ID: <CAMuHMdW6WhNYHL-3vWj82uRUuxxuYfk3BRnqu8SWnh3i6zkXjw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] soc: renesas: rcar-gen3-sysc: Fix power request conflicts
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 29, 2019 at 6:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, August 28, 2019 8:36 PM
> > Recent R-Car Gen3 SoCs added an External Request Mask Register to the
> > System Controller (SYSC).  This register allows to mask external power
> > requests for CPU or 3DG domains, to prevent conflicts between powering
> > off CPU cores or the 3D Graphics Engine, and changing the state of
> > another power domain through SYSC, which could lead to CPG state machine
> > lock-ups.
> >
> > This patch series starts making use of this register.  Note that the
> > register is optional, and that its location and contents are
> > SoC-specific.
> >
> > This was inspired by a patch in the BSP by Dien Pham
> > <dien.pham.ry@renesas.com>.
> >
> > Note that the issue fixed cannot happen in the upstream kernel, as
> > upstream has no support for graphics acceleration yet.  SoCs lacking the
> > External Request Mask Register may need a different mitigation in the
> > future.
> >
> > Changes compared to v1[1]:
> >   - Improve description of cover letter and first patch.
> >
> > Changes compared to RFC[2]:
> >   - Rebased.
> >
> > This has been boot-tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0, M3-N,
> > V3M, and E3 (only the last 3 have this register!), and regression-tested
> > on R-Car Gen2.
> >
> > This has not been tested on R-Car H3 ES3.0, M3-W ES2.0, and V3H.
>
> I also boot-tested on R-Car H3 ES3.0 and M3-W ES3.0.
> And I reviewed all patches, so:
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, queued in renesas-devel for v5.5.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
