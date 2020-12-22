Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2BD2E0E55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 19:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgLVSpX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 13:45:23 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:35207 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLVSpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 13:45:22 -0500
Received: by mail-oi1-f177.google.com with SMTP id s2so15765090oij.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 10:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jDv3MPHxxqEavxvavk/PDVS22Wm6HGaeBw86ilNx5ms=;
        b=LarHwqrvYW3eB3ZIvXQgxo6534UJuuFjDy+KvxpA3T2wfKCL0SEyU4jxXqAeUaDH38
         0KMdsifYNGMwjldRXU+VQOA7MBcFbwTO8kmPzJEjI1TTJOAZJR2N8OelPz5MyEuTCFvU
         FuaRVhyn4rYBfbSwUyJyDOpcKWdfkg6E7rC7IjrqwOA4lusH80BNlfB6ZX3utK3DbHcI
         j4Z6oicArMAeOJlfZw+beuWRF0Qv1wLI5sLJ+dpfQSqvZpCxqvfxoDXJx9Deb6H0MUc9
         s+F0SBVqlN+S5FK7m47EtOBh0Kit7omvAB+o+BT0fj9iNxGl6G3D410CNlP+FQ8WHDvN
         gXmw==
X-Gm-Message-State: AOAM533nfqQNAXD5hmNBPYBQQj/lS82RtI9Q5tdOoEBOnFFD3yqZw3AB
        p+/LYf8dGttudTIuTCXwzEXT+c0CJ/rcCFrejxP50jy2
X-Google-Smtp-Source: ABdhPJxi6yxkg1E2UCbg2yiarVaHeBiHwBQa4w0YXZenfNd/DZpTSP5wkGcUU/JqsOlp2rClR9op9L5OkQ5DvHJeyik=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr15234433oia.148.1608662681394;
 Tue, 22 Dec 2020 10:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20201221165448.27312-1-uli+renesas@fpond.eu> <20201221165448.27312-3-uli+renesas@fpond.eu>
 <CAMuHMdVH_Cb28M5RPjS6pDiguq_q23ri0KXNxGky4tA6xm0mGw@mail.gmail.com> <1392786155.217714.1608655668850@webmail.strato.com>
In-Reply-To: <1392786155.217714.1608655668850@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 19:44:30 +0100
Message-ID: <CAMuHMdVhcn=-KhX=dc+bRzgfJMP7kzSt9rt6gpGArJouQFGbEw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: add I/O voltage level flag
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Tue, Dec 22, 2020 at 5:51 PM Ulrich Hecht <uli@fpond.eu> wrote:
> > On 12/22/2020 11:45 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > --- a/drivers/pinctrl/renesas/pinctrl.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl.c
> > > +               const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
> > > +               int lower_voltage;
> >
> > unsigned int
>
> Fair enough...
>
> > mV_low?
>
> That, though, seems ambiguous to me because it could refer to the logical-zero voltage.

True.

> (Are internal capital letters even permitted in identifiers?)

We already have "mV".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
