Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55D04A684B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 14:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfICMKi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 08:10:38 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42282 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfICMKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 08:10:38 -0400
Received: by mail-oi1-f194.google.com with SMTP id o6so12522107oic.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 05:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nKHLFYaTr7fAPzEgB8vSMqQttdbwAiT9LuwPv5k2p6A=;
        b=lSo7bplRDREm4nDBKd5yN/V0cJh3cRSWtOH6QocKRc4us7vE7xth3xcdsI0eunrcca
         L2CRgUKdX3d5Yir+uEHWWRnKPg+srBWmvYeVPkf21WQIuAFQlSwmrxE+AqEFYQKuwYhr
         9Taao4xe47w3CMS856j7YYHuhCz+h9WWIC+mA5xRdcBRgQ83B1q9741GRVGF3raQ/08K
         Hv95QSLP1ImpeZunDKotU5rom7nGCBmCHemTgOEHFnjtyrYsSZMUWPTj+0u1iY2jzqqR
         o4a9GPwixgtjkBYv55oqucAdWnske/stKNvi66yrPrg+cLWMqe6oIQqRZae5tCNbAV7P
         8VWw==
X-Gm-Message-State: APjAAAUeA33RmsxlsVevY0iz9KGXb4TUykUZ1MvOHn2kZdb6WtQy3TJB
        9uJoUTWtSZTKmRq/D+NqW+aq1VJxnTB6/YqRCG0=
X-Google-Smtp-Source: APXvYqzJ5V4kjboXrtsXCS7LmI4Qt9vgg1KX3faZWW17j6avE6HvivLGpetOLvrSASdNbSMoyn+Ys9HpxfFwkSaGAOQ=
X-Received: by 2002:a54:478d:: with SMTP id o13mr22643100oic.54.1567512637328;
 Tue, 03 Sep 2019 05:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu> <CAMuHMdVLcjujQR+QOtH0C8uZJxKC_gWZ3zupDyb=LHKc+RrhLw@mail.gmail.com>
In-Reply-To: <CAMuHMdVLcjujQR+QOtH0C8uZJxKC_gWZ3zupDyb=LHKc+RrhLw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Sep 2019 14:10:26 +0200
Message-ID: <CAMuHMdUz_U-L8PDrW2Oxha41CZjx+grQuwqeNcnhgpLL3JGnAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] H3/M3-W cpuidle support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        dien.pham.ry@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 28, 2019 at 2:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> (Replying to an old series, now we have received more background
>  information)
>
> On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > This series adds CPU idle support for H3 and M3-W. It's a straight up-port
> > from the BSP.  This revision removes the superfluous status properties from
> > the idle states and fixes Khiem's e-mail address.
>
> > Dien Pham (2):
> >   arm64: dts: r8a7795: Add cpuidle support for CA53 cores
> >   arm64: dts: r8a7796: Add cpuidle support for CA53 cores
> >
> > Khiem Nguyen (2):
> >   arm64: dts: r8a7795: Add cpuidle support for CA57 cores
> >   arm64: dts: r8a7796: Add cpuidle support for CA57 cores

> > Takeshi Kihara (1):
> >   arm64: dts: r8a7796-m3ulcb: Disable cpuidle support for CA53 cores

> Hence I think this series (modulo the last patch) is ready to be queued
> in renesas-devel for v5.5.

First 4 patches queued.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
