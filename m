Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC5025C0EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 14:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgICMZg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 08:25:36 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32929 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbgICMZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 08:25:16 -0400
Received: by mail-oi1-f196.google.com with SMTP id 3so2953484oih.0;
        Thu, 03 Sep 2020 05:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fdiDQ044x0vFJq3djzG9dmCS4th8L19ANmzylfbIFg=;
        b=QohUmFPbxpD6VSaZA/7xFPJUY1xwdCMpiKS8CRu6kD/hfyQl2FEhWuLMB3h8dyvGwK
         Y1c7pPb0PkdXCPfKn3Z/y6BbnKRs5Ehlxbteipm0W/c8NAXit0HaMOZEXqpSE3FNkyNK
         iP7ce93s+TFjDGGNBEhF5Aoj8KbawBtKlyvr1p/JLhJQWVzR+Tjw+GTbiF1GFDw0jZCm
         KFiroafgymdn5B2kAaq1BhW5iNSGDSTxe/jtYraluasBs+0u0zPgAmLBl1lUOCIh2Alr
         zgJomu5mTtSoHNQDvDxKUTrHbFAKK1gBq4xTLZEaRK4C97hUuWjzFZa3iRrO3+LZwN9x
         29yQ==
X-Gm-Message-State: AOAM532fXvt/Xq6e9UOb/HwfFf0N+zuuNqZa4Y5YRNcI4qD4oWiqahRL
        8vg9AxvjqIpIjFmq9rhHNUu4SgLhs221OIsA56s=
X-Google-Smtp-Source: ABdhPJxz33wMGk9Uweyb02G5HCp+d5T+GZaH717OptZV2P94WaqTxkGbbHY5A0ZqsFEaJnttExTdw3uQxmt0cPDXy/Y=
X-Received: by 2002:aca:3402:: with SMTP id b2mr1757404oia.153.1599135915254;
 Thu, 03 Sep 2020 05:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200827181918.30130-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200827181918.30130-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 14:25:03 +0200
Message-ID: <CAMuHMdUkKGA+=zkke3RtV5pwCYEiB8i8ujwtKr2QQrSSezxNtA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add HiHope RZ/G2H board with
 idk-1110wr display
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 27, 2020 at 8:20 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The HiHope RZ/G2H is advertised as compatible with panel idk-1110wr from
> Advantech, however the panel isn't sold alongside the board. New dts,
> enabling the lvds node to get the panel to work with HiHope RZ/G2H.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
