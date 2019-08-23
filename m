Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3989B1BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 16:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388638AbfHWOSW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 10:18:22 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45068 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388188AbfHWOSW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 10:18:22 -0400
Received: by mail-oi1-f196.google.com with SMTP id v12so7097830oic.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2019 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/aCcqURiq+4wsya9iyN7VmLfWFmua8EIL5cQp1iPMc=;
        b=YFcePtwuIOiZe10TywbnU7L7YU4OYlr0jfQl3bVpJUx5cZukdl2YHjBK0kBNY7Fvdh
         bk+//qLNg9M6hmM4ullB0hysOBP1tqstbwbpFS8b9/u4cXIDk6txh6wLvu4EBlG/UNe4
         UKWtqw9q0wo0UQG1A2Cx23h89NIKESNka+XDVZcuJD2aqteGh7hsBpLnD0YLXoSwBLNx
         khlFxKQ51QhcUxQfbd594OIU7tocj4yNJO12wY7nvx/3N1Vib5hGpxERd1z4SLSjgRko
         rXtGaOaOQn++Xiq34UZOHETedyj7whoCoU6m1XYvkge/wK5VP/VD+iozBgh5ejT/qvKr
         xkPQ==
X-Gm-Message-State: APjAAAWS4lSAaUtW3lX985uTjCp+gEVtf1E4PzVSOMHT9XbIDEfX0o3S
        YfX1BqvY1Rn+4jeDnzUEagKUkiX9dhnd9pwPW0A=
X-Google-Smtp-Source: APXvYqzFtEVyepKsP8Dr76yCNJLg29r3JhCcWzphikxFINAP4o95/qq6iTaJJiteDCxYVhxEqU97G5v8+RhIQWGu+pc=
X-Received: by 2002:aca:b154:: with SMTP id a81mr3166910oif.148.1566569901145;
 Fri, 23 Aug 2019 07:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190821124441.22319-1-erosca@de.adit-jv.com>
In-Reply-To: <20190821124441.22319-1-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Aug 2019 16:18:09 +0200
Message-ID: <CAMuHMdWdObHAesUvF1BLwnEFJ6dsdpwM2yPRdUFW4D1Rp6d-tQ@mail.gmail.com>
Subject: Re: [RFC DO-NOT-MERGE PATCH] arm64: dts: renesas: R8A77961: Add
 Renesas M3-W+ (M3 ES3.0) SoC support
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Michael Dege <michael.dege@renesas.com>,
        Andrew_Gabbasov@mentor.com,
        "George G. Davis" <george_davis@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

Thanks for bringing this up!

On Wed, Aug 21, 2019 at 2:45 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> Similar to the revision update from H3-ES1.x to H3-ES2.0, the update
> from M3-ES1.x to M3-ES3.0, in addition to fixing HW bugs/erratas, drops
> entire silicon IPs [1-2] (for cost efficiency and other reasons).
>
> However, unlike in the H3 ES1.x->ES2.0 revision update, the M3-ES3.0
> came with a new SoC id, i.e. r8a77961 (according to both [2] and

Actually R-Car H3 ES2.0 is r8a77951, while ES1.x is r8a77950.
But we ignored the fifth digit (see below).

> the updated SoC HW manual Rev.2.00 Jul 2019). The choice to allocate a
> new identifier seems to strengthen the HW differences between M3-ES1.x
> and M3-ES3.0 (as it is the case for M3N/r8a77965).

While H3 ES2.0 was an evolutionary step, obsoleting H3 ES1.x, it looks
like M3-W and M3-W+ may exist as two separate products, next to each
other.

> Given the above, there are several ways to differentiate between
> M3-ES1.x and M3-ES3.0:
>
> A. The BSP way [1]. Move/rename r8a7796.dtsi to r8a7796-es1.dtsi and
> keep using r8a7796.dtsi for M3-ES3.x.
>
> Pros:
>  * Resembles commit 291e0c4994d081 ("arm64: dts: r8a7795: Add support
>    for R-Car H3 ES2.0")
>  * Reuses the r8a7796 (e.g. sysc, cpg-mssr) drivers for r8a77961 (i.e.
>    minimizes the bring-up effort)
> Cons:
>  * Deliberately diverges from the vendor documentation [2] by
>    ignoring the new SoC identifier r8a77961, i.e. leading to
>    inconsistencies in the names of the drivers and DTS
>
> B. The approach taken in this patch, i.e. create a brand new
>   r8a77961.dtsi (similar to r8a77965.dtsi).
>
> Pros:
>  * Reflects the reality documented by HW designers [2]
>  * Maintains drivers/DTS naming consistency and avoids mismatch between
>    documentation and code
> Cons:
>  * higher bring-up effort than (A)
>  * more discussion is needed on whether it makes sense to separate:
>    - DTS only
>    - DTS + Kconfig (ARCH_R8A77961)
>    - DTS + Kconfig (ARCH_R8A77961) + drivers (sysc, cpg-mssr, other?)
>
> Comments appreciated!

When we started work on H3 ES2.0, it was considered an evolutionary step
from ES1.x, not a different SoC.  We also were used to 4-digit IDs in
compatible values, as before the 5th digit was typically used to
indicate a minor difference, like a different package, or a different
ROM option.  Hence we ignored the 5th digit, reused the compatible
values for H3 ES1.x, and went with soc_device_match() to differentiate,
where needed.

However, it turned out H3 ES2.0 was more like a different SoC in the
same family: it has more similarities with R-Car M3-W ES1.0 than with
R-Car H3 ES1.x.  In the mean time, with the advent of R-Car D3 and M3-N,
we also got used to 5 digits.  Hence in hindsight, it might have been
better if we had considered H3 ES1.x and ES2.0 to be two different
SoCs.

Given R-Car M3-W and M3-W+ may co-exist as separate SoCs, I think
approach B is the best approach, using separate DTS, compatible values,
Kconfig, and drivers, like we did for e.g. R-Car M3-N.

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
