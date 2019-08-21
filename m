Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA0097502
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfHUIaZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:30:25 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46724 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfHUIaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:30:24 -0400
Received: by mail-ot1-f68.google.com with SMTP id z17so1255303otk.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2019 01:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgYs9e4wCs4QwsypAPfRwEpysUfhDfcgiGf4UveOX+w=;
        b=PAhAklHKINSLtPKhDZlT+van0+bClRiKDVm1QL1qmgGa7rLbKuMHm8INXIIPw0Haej
         Ji095ZPNtiixggfiASaaIgMAV9tQmxSiawQvaBSFkfUJ9klq/dNYrDoJOkmmfyinR2lg
         o37Eud6maSLZjvk8HZ/9X5Qtdwv0Q2VBq0AovmhrLGgTJq65zKJWXPLo13jzQTziczpS
         wg3Do/HYs/8r1be2quNFnI3DK63/H6I1yWdGQfGmnalpsHgzZZUb0SQcgQRIvaWZCsJc
         0DK2cFCg6K0CCFBj1zZ3veZeEykXI3JmAbqdIezsv07KuPdyK5tbpTaBTJ/XatZ5R0Zj
         lrDA==
X-Gm-Message-State: APjAAAXYL9J80yZxNpAQeIqFFos2AKV0Gdk1JfpZySNmkAMFH1qrwZqo
        zNaEkfdhdFwkdz3Xd3xFdmdujuzrQvpO0SYxCdMXbuDH
X-Google-Smtp-Source: APXvYqxeSyGE8gfPfPBeEtoKulvp2nDU/Vj1w20M51+0GR2qGf3xnsXwBQ17uDNv2PWo2YH/qNMKHysIja9zaUze7hw=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr25780505otk.145.1566376223987;
 Wed, 21 Aug 2019 01:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190819124529.23745-1-geert+renesas@glider.be> <TY1PR01MB1770E06C284134AF69D24631C0AB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770E06C284134AF69D24631C0AB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:30:12 +0200
Message-ID: <CAMuHMdVMCdoDP1nZi_xPg_swMKfcm-YRKis_Farb+cx0Xd8cXg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a77470: Add PMU device node
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 20, 2019 at 3:52 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 19 August 2019 13:45
> > Subject: [PATCH] ARM: dts: r8a77470: Add PMU device node
> >
> > Enable support for the ARM Performance Monitor Units in the Cortex-A7
> > CPU cores on RZ/G1C by adding a device node for the PMU.
> >
> > New Linux output:
> >
> >     hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters available
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
