Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2D4BF523
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 16:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfIZOgd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 10:36:33 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36425 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfIZOgd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 10:36:33 -0400
Received: by mail-ot1-f67.google.com with SMTP id 67so2212274oto.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2019 07:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6BGhU4EXVK5n3VD4pcG+aWyPXN6jJubAx4zLWxZOJY=;
        b=GCkKb8txPu5dILMdBnrw+tiWO/oSad73pL1GVTnar97ISlBruRBs0hgOajNHpLQUfJ
         DbFHNaeeb9Xe8zoPf5j6kpxWVGlfWk6U9TZlfpJun7KZlbTG6eawSlrxkh03RXLRA4rG
         zEQE3GTrv11s8o7kTSDtsp83JzLrwDxdKJ7/gt8O1RFav6cpRI8HnwRqtdsD4SGdhLoL
         bpAPyYlg5I7u7XF9SZpyA0wYDG2rYEeWJ8md4f1K2nACqyaAhO2Knp0MxMPz1snHrKvx
         i8Emx+0NeK7uIIma/8GKtmwXUW3pGWVOmwBuIGviNLCeqnoPAb9825U16BUsoLbne0R1
         3ULw==
X-Gm-Message-State: APjAAAXT7VfyesrAau0wserT5m42R9bwCZaVFbl/R6Qv98GF5UTLBQnq
        bEteDsWKIiVVIZEcKTvxa0JDEou0/wnVBSR4Btm2IGGZhgY=
X-Google-Smtp-Source: APXvYqztl4LGorHGu4rFc+y0XehitI6BHSIs7nO6sAk/FpfHnYArgqll2ABw8lmuQN4vUIE81uEujiR7PeHHq8WAQ/c=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2728162ote.107.1569508592688;
 Thu, 26 Sep 2019 07:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <1569310988-40746-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569310988-40746-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 16:36:21 +0200
Message-ID: <CAMuHMdWw=hkgXe_79s_zhxSQP2crtUNTpMjFeGDBbULwrDPpVg@mail.gmail.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Hook up r8a774b1 DT matching code
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Sep 24, 2019 at 9:43 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Support RZ/G2N (R8A774B1) IPMMU.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c

>  static const struct soc_device_attribute soc_rcar_gen3_whitelist[] = {
>         { .soc_id = "r8a774c0", },
> +       { .soc_id = "r8a774b1", },

Please preserve alphabetical sort order.

>         { .soc_id = "r8a7795", .revision = "ES3.*" },
>         { .soc_id = "r8a77965", },
>         { .soc_id = "r8a77990", },

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
