Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7B62DD0A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgLQLnt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:43:49 -0500
Received: from mail-oo1-f41.google.com ([209.85.161.41]:35335 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgLQLns (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:43:48 -0500
Received: by mail-oo1-f41.google.com with SMTP id s19so2510136oos.2;
        Thu, 17 Dec 2020 03:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3LVeT4qXUDGlvykc4aDiNv+DTsK+IdiMu2eUTpYt2k=;
        b=jLoHTeN8EHr+Y5M0EFho9gezj74vMdxgw/t+knRrRo6KPCrjwhzcwSudmPl454WrPi
         KqQkCjK3gXOOTTYzNv0cc7r5p/cmH3nghuMVEErEqQGAK6RtcadQSMvoTP8DTfw4yhLD
         ihCE8+6+mTDK/Nhc6e0cUcnZlT1CiWqVd5FWbCIDDP75oJu2qLVjt09QUOfuuKal/j7x
         A1ciPDQ8LkmxkAz1BP5CjuIJxyOv2ql/9A5GmovBJ4PAHksvLB9vpEMfHbFSU8U6Mtwp
         jzzhrbo5K+3iT6+Mx9QMVLuvAke6IX5R2KSZ7CeONmcEZ8apUrcfdX3BSOLiDAw6jKk5
         D3kA==
X-Gm-Message-State: AOAM5325W9eyU3jGJp7DOR4hpFJp6beOdogSbkLqk2i2vLTQKp9g+zdv
        lMOOkv3WjxjLQfUrh3SJP7wmSMMnhtf+chGdgj0=
X-Google-Smtp-Source: ABdhPJycuzkSL/V24fp0B+pOMBgDWFkUQzGYEvRF6dHGpHJKzyQm6liPmEi31aiPmZI3L6pKIcLyZyJeR09S4XRaJoI=
X-Received: by 2002:a4a:dc1:: with SMTP id 184mr28156718oob.40.1608205387845;
 Thu, 17 Dec 2020 03:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-17-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-17-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:42:56 +0100
Message-ID: <CAMuHMdUbUwfXEEsbeBo-AkcfFXzvsSxXXu4VYFSqtnOcAYq0pQ@mail.gmail.com>
Subject: Re: [PATCH 16/18] dt-bindings: arm: renesas: Add Beacon RZ/G2N and
 RZ/G2H boards
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> Add beacon,beacon-rzg2n and beacon,beacon-rzg2h to the bindings
> list.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
