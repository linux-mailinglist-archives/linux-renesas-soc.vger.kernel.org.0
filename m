Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3762693E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 19:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgINRoa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 13:44:30 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46923 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgINMFl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 08:05:41 -0400
Received: by mail-ot1-f67.google.com with SMTP id c10so14573063otm.13;
        Mon, 14 Sep 2020 05:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFSNwAt8vw67SqucurrM8cIwIER7qJrNx3d803RzlV0=;
        b=WIXeuDOZI+SrLuJAF1dlm4Qwb0N4HIUt2OH47NRIIk3BpHuPRdqspCJnetuLYZmA/V
         hKpOIR2e4neUuc+L5DOLMCdiv8vQpVs8kGgsIuCyMgmh8+Wp4NGoB7TDUKzEOtVc7hz0
         ct6fDQl0VmbI/lKp5PrQJucYVvta7bd1OSt0o4/mDjJlJYxeHBJbjYWDUFFRxG8oaLOr
         QoyMkSkG8QIgxLGDx73U4PgHOsVmPBnKZovWgsP728goyNWciGFstg2MZDkN5GjrOBb0
         R3M+agOF6fwAPz5cihjBlvtrRpUMcZcW5HpmcVkloIxk4DKAunaoqt1iQASOeUUYMoVp
         DMdw==
X-Gm-Message-State: AOAM533h94V4TIlF/NtcNYSQJ41o8P7tRsvqIaK/IarF3ufN5BlI9E8J
        DX/WBt29ZSw8Do+tIXLoo+QYWIFfUDZLS78+vsQ=
X-Google-Smtp-Source: ABdhPJwM0U9wiqpZgDid64wOV7+lNEIkEupgnDJwiN0yXVVZrRe2KmzFCbAzqZUaLY67TLKtX1zA9DDWAD8lQnvEJtE=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr9275354otb.250.1600085095705;
 Mon, 14 Sep 2020 05:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200911083615.17377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200911083615.17377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Sep 2020 14:04:44 +0200
Message-ID: <CAMuHMdWNsGBaDYdzC4eojt3xJb18Y=6PUDwBh7D8eYKz5W0-+g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add can0 support to
 camera DB
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 10:36 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch enables CAN0 interface exposed through connector J4 on the
> camera DB.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
