Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C833E2C80B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 10:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgK3JQd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 04:16:33 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36352 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgK3JQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 04:16:32 -0500
Received: by mail-ot1-f68.google.com with SMTP id y24so10637538otk.3;
        Mon, 30 Nov 2020 01:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KCPjQPFEP3zFc28ZNSOHmiRDcwr8Q6yeGNzRYo76leo=;
        b=AY0zbvE4L94uz6GWsMPvy3ov83ZAVIUKA1yZ4vlnDJfJigSAdqZldbxJwKJbCuXNX2
         XZX72rGAIwmGiZ+g4/BxHn9K+vc0vs/Eto1cMA5DUzb8tUurhlOsQS3nMGNTERvVXyG+
         Z+pBRr3QhFx/rJ3gcfXOifUMlzOfJj9LsZxxYzLnVmLksPxW9Ba29jKkFi0F1vwxmk8S
         2PIKTJlL8FI9ka5tghA7bc2Xk4gJVqxC6sQbTv4JutpG4zkspg/Gmm4f87XXsm29pf0d
         NKmYVePpKhxeUAeSyKLhE1gvnSvgYmXkpXTx7iC16Kbd+mcJN81g8zXPZX0Igg6MfPru
         KxIw==
X-Gm-Message-State: AOAM532Bv/xgbyyZuoZsE24Sff+lnfxRHe4BQUfFM40QTXGRe2LMEmlw
        Ei9i/Zt52u0IkNLZyEVTqUB+1zpOhseipiJ7NwMS9z1DqNc=
X-Google-Smtp-Source: ABdhPJzAat4CYXO7bXgzcYjmukGQXobwUa6veqWhCvzcUsbtVpGJS3tCs31yGWpeDfqdKJwGZAMIuGhbrKLA2/2kpz4=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr7584573oth.250.1606727751425;
 Mon, 30 Nov 2020 01:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20201126134031.4115211-1-geert@linux-m68k.org> <20201126134031.4115211-2-geert@linux-m68k.org>
In-Reply-To: <20201126134031.4115211-2-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 10:15:40 +0100
Message-ID: <CAMuHMdV4whDb6r8nU+cNRzGAM=Lt-k83r72mEvfpRUuuquQxEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out
 ov5640 nodes
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 3:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The camera daughter board can also be connected to 8-bit ov7725 sensors,
> so in preparation for configurable option to choose depending on the
> camera's connected separate out the ov5640 nodes in a dtsi file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> [geert: describe a single camera in the .dtsi, include multiple times]
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Oops, obviously this should have been geert+renesas@glider.be.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
