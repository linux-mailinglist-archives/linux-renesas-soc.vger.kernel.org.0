Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AE53C7FD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 10:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238462AbhGNIPC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 04:15:02 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:36715 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238398AbhGNIPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 04:15:02 -0400
Received: by mail-vs1-f54.google.com with SMTP id w13so484939vsa.3;
        Wed, 14 Jul 2021 01:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1aZJc79uDo0FoJQ8yHLx9MCJBUZ6NlsRJWe1NYDE3Lw=;
        b=tiXnEoQ5P4Txy3eY5JrbBF+AmLzQE7jfbBh9HKLcdldF9VpV/Btci5bR5DVj7feHwK
         n1s4/TLZTmUilLbZUM3f3aQ1tQNnzDDgEYKGWd2muRtuP8yIPXw6asRYZxTnSQc91F8I
         nHbtM1RiwCGZN0ORY74sSlPdA17vvVQyxA11quRzd5inrzK5KpfOI7paeojKsGCDANOr
         o3c+jZouqclJcwE/cslXIdVzbAYsJYKIk+KwMntsQ7YqF0JcVEQHBUpnTagO2JdFGxYh
         uaElO5FbalGsVV22Fcnfvi8SzOjV1xaMpOFfuLv8baqntuLYzJALXHpBLvVhLb0DdhQ9
         b0pw==
X-Gm-Message-State: AOAM533qiB95ZAU96LB/oS3s+uzG6cAa4tMsqIl5Bj2YuViK/IamDcO7
        NiWaR1SOpearq3IpYqigLgcEmh4tBo3szjp+Xlw=
X-Google-Smtp-Source: ABdhPJyJWAE9ws0cFUY4uE+Gin0EDULHfOTk5q4nslYIFDWBcscjFxKfZukbq3ry8S3PvOiM3js1vb4ltPgCog83lsc=
X-Received: by 2002:a67:8702:: with SMTP id j2mr12606977vsd.3.1626250330408;
 Wed, 14 Jul 2021 01:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
 <20210626081344.5783-6-biju.das.jz@bp.renesas.com> <20210714024256.GA1351069@robh.at.kernel.org>
In-Reply-To: <20210714024256.GA1351069@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Jul 2021 10:11:59 +0200
Message-ID: <CAMuHMdX3yOaLsyFjtsicxqQEGa4BVoarhgnNbx72rhixEQWi=g@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] dt-bindings: clk: r9a07g044-cpg: Update
 clock/reset definitions
To:     Rob Herring <robh@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Wed, Jul 14, 2021 at 4:43 AM Rob Herring <robh@kernel.org> wrote:
> On Sat, Jun 26, 2021 at 09:13:39AM +0100, Biju Das wrote:
> > Update clock and reset definitions as per RZ/G2L_clock_list_r02_02.xlsx
> > and RZ/G2L HW(Rev.0.50) manual.
>
> Changing the numbering is fine because ???

Because this is not part of a released kernel yet.

> This change is also not bisectable, right?

Exactly.  Hence I've squashed this and the two succeeding patches
into a single commit, for a pull request to be sent later today.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
