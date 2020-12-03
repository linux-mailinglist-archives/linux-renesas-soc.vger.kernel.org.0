Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5B12CD404
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 11:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388810AbgLCKxT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 05:53:19 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38972 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387738AbgLCKxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 05:53:18 -0500
Received: by mail-oi1-f194.google.com with SMTP id f11so1716080oij.6;
        Thu, 03 Dec 2020 02:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u87Bb9nXMJHw/Gfzxqzm29W8srtApfEdU6ieh4IOwiU=;
        b=aLdu+DjvrhfOzDOt3a7uOO0HeqDQ+kVFsROnoxhX+F2V3a/Nn/fvYGwbSVH/l7REXY
         lUM+Bg0/NHDs9p7gjYMInbi2Z9Acbmrjhb+r8EWrncd8lPrXZWSDMPfyOMSfInfygG3u
         DGniWar2ot+6T0ub/6d0VYN2H1jDjVzny/xPVJZrsyD/8hU33zNl3QGNM+8qSS3Z2kPP
         bFeSqXmtA4Syeu7pWNOIdvJGWcT8cXjxq/Gy8CK69xiP/rQ8e/JBjYSobSQtRltGrufh
         /wOp5J1X1f+ucGd3tY4ABu8507I5cYqR0r5ovKWfCGspvP9XP+Nst7aQFRo5NRdIjD6K
         XJog==
X-Gm-Message-State: AOAM531232LShwfFknQQWRft52UOBHaC0VTc54XINlyPiq81D94e4c9V
        nuwjEXSl9r/eAAjGdin3yZUmff3fWzBeW6zL5bc=
X-Google-Smtp-Source: ABdhPJyUZic5SnTn2IaqKK1W+5aU1SXH6m1g83YEfqbkq5edOir0vqd6gMMWiadrj+J6ahx77gVBlVWtKVqVAtUQBjA=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr1419199oic.54.1606992757842;
 Thu, 03 Dec 2020 02:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8vjTQv7wrdJFe6TS3saUE=Sj6ty0JSz0VZUd=TyDVfp4Q@mail.gmail.com>
In-Reply-To: <CA+V-a8vjTQv7wrdJFe6TS3saUE=Sj6ty0JSz0VZUd=TyDVfp4Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Dec 2020 11:52:26 +0100
Message-ID: <CAMuHMdUHujqMnCKH14GM1SzN+3_E4j9u1R8uDuM3YmVjcd_MTw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Dec 3, 2020 at 11:42 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Nov 26, 2020 at 7:11 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > This patch series fixes trivial issues in RPC-IF driver.
> >
> > Changes for v2:
> > * Balanced PM in rpcif_disable_rpm
> > * Fixed typo in patch 4/5
> > * Dropped C++ style fixes patch
> > * Included RB tags from Sergei
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (5):
> >   memory: renesas-rpc-if: Return correct value to the caller of
> >     rpcif_manual_xfer()
> >   memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in
> >     rpcif_{enable,disable}_rpm
> >   memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()
> >   memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
> >     inline
> >   memory: renesas-rpc-if: Export symbols as GPL
> >
> As these are fixes to the existing driver will these be part of v5.10 release ?

IIUIC, only the first one[*] is a fix for an issue that could happen during
normal operation?

[*] -EPROBE_DEFER would be eaten, causing no reprobe to happen.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
