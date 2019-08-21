Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6815697827
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 13:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfHULlz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 07:41:55 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44259 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbfHULly (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 07:41:54 -0400
Received: by mail-oi1-f194.google.com with SMTP id k22so1299778oiw.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 04:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0la14S+sB2br4KqzqvYq9pvVyH/RyG4yaq6z7fmvXdI=;
        b=MNDETX6wHeUctSEVSgML9PC5KJLMZ7xQcM9exsebiAJU+HVKKML1u/k4rgTfs9Uo4p
         oS02dsNNBGDa5kQq8lqQFchpvLDAwdloo61MWf+IMbhRDRjqy0ixW96it2zEIPVlO1xj
         fZzfrurr069Gcgz+3HphHFfx8XUKseE/AxLfPzz/dJTBFNnJnHedZiyOuVDACXxiiT0e
         zXHm1wDMKqzMlwPB5fXhQVC/JXOnD1KKWtOqi773Wr8rxUqBsAClwQDlyixLXJQhx+Wi
         Z/Myj8JpROs0K/t6cE6xPo2xS8ZmoZR1lb31Ut72BcdATUnEX0m7U8xdKu2GeRYTfcgY
         1QPA==
X-Gm-Message-State: APjAAAUWqKrsnX94wYr6eMfjELFX5OqrYGlWBHxJ2BskqfBqixUPMxkG
        HMjTxPF3CwlqnQWv852gmFnWDL37DnIlAzZZYik=
X-Google-Smtp-Source: APXvYqzJMDzTp9uIrIqRCWPNsYjNZDOaHECx+1gXr0c3etteIL1wILrryxCgSxSHRegbWsz3eDulKF4JDvATNRyDZL0=
X-Received: by 2002:a54:478d:: with SMTP id o13mr3375364oic.54.1566387714227;
 Wed, 21 Aug 2019 04:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190821095732.19001-1-geert+renesas@glider.be> <TY1PR01MB17704454A598425494F18426C0AA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17704454A598425494F18426C0AA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 13:41:43 +0200
Message-ID: <CAMuHMdU1hRKm=pWxS6rhsCCUFA=YkNLH5idgtsGcxjTrS9zkOA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Fix register range of
 display node
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 12:22 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 21 August 2019 10:58
> > Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix register range of display node
> >
> > Since the R8A774C0 SoC uses DU{0,1} only, the register block length
> > should be 0x40000.
> >
> > Based on commit 06585ed38b6698bc ("arm64: dts: renesas: r8a77990: Fix
> > register range of display node") for R-Car E3.
> >
> > Fixes: 8ed3a6b223159df3 ("arm64: dts: renesas: r8a774c0: Add display output support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
