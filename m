Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8172C55F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 14:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390488AbgKZNkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 08:40:01 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44235 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390022AbgKZNkA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 08:40:00 -0500
Received: by mail-ot1-f66.google.com with SMTP id f16so1869133otl.11;
        Thu, 26 Nov 2020 05:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OlAdx9Rt6+mn/zk0WSoIGgVl8CTxRmkVr/YvGJNstU=;
        b=j4t1+xrs26iGu0wOKwTnYe1CZ2OpWRFNm1gkYdDo7Jpaaeze+XS/as7ebATlwQ0MhM
         fvT63cbFMX4Zh3bD0xDmJ+g/S40kcYGbQmZznf9BuVlB35FLA32QmPWX2LEMulrW8NFr
         N0ahFmBPl/yd+bgt+RgDnxcXelL4izsnIdMcZPai/5Md77Ti9dsYaZoaqVP5dDYFNxk0
         vK2QRC1NKZ2mjFLyHVPiUOc7J++T0B5/nzveCe7mQNTYOeMVaG5OCH8ebIQPPyrpWRvw
         edmntlWoM+Cx+flSpp+MDCcwS6L990OHrgNG5hLZMIxck4R6sU+W/YkS7Myjr37b2wXQ
         NpXw==
X-Gm-Message-State: AOAM531Mmxy7PsNN+6pS5I8Fp6GR5NwzbWb4wBnXjri7c4obDyypY3l+
        qrrBvNMbAxDZiQSGZRY8JkJ79s0Xbx8mPWb5nKc=
X-Google-Smtp-Source: ABdhPJwNETSfqAyCdIUe4k54K76c140v7K2yoFDKFTeoubpUNvU99YsrpBxv/Hw5TNyQlNc9DnBeAXwvbx0JvDdeEAQ=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2248038otc.145.1606398000341;
 Thu, 26 Nov 2020 05:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201126103053.29881-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201126103053.29881-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Nov 2020 14:39:49 +0100
Message-ID: <CAMuHMdXF82Or_bew1aNfpZ9ZtWF6BwXhZwU79fajexXZRT3Y-Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support
 for 8-bit ov7725 sensors
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Nov 26, 2020 at 11:31 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The 8-bit ov7725 sensors can also be connected to the camera daughter
> board.
>
> This patch creates a separate dtsi file for ov7725 sensors and is included
> in r8a7742-iwg21d-q7-dbcm-ca.dts. The user can set VINx_SENSOR depending
> on the cameras connected.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I think this can still be improved upon.  As it's a bit difficult
to explain, I'll send an updated version of your series with my
suggestions applied.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
