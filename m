Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0C0401C8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 15:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242757AbhIFNno (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 09:43:44 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:38607 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242225AbhIFNnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 09:43:43 -0400
Received: by mail-vs1-f43.google.com with SMTP id a25so5621309vso.5;
        Mon, 06 Sep 2021 06:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bauJqabPIlLKQVFUM9Ai2t0yCRiyIuJc2MyRVsaNaVQ=;
        b=eLjIbayuSAmiJf144kMXeXev1TvRzyX55aKQpZeYMODDkH4+2qBMyCDKIn15kUhHX1
         2KkP5aSSuFFBAqLnfzANX7P2UPzi2hAyFh4wkiSiXCL45LZeRy1CN0JYRA1aTU4/wz7J
         SA6OHynwsKTn3vbPczsH/21tNHMcD16pYlqaJ3BAGTJ0M8cIFoCfEeMfl0WLisrsOfEi
         PmG7P7DJY6VzD07L8V1YIhtHNgdKjPGThhn1jorTyMzLZOt6iXMqKwe5eRczpjeVKSne
         vivEqA+8E7HC17F0/mC7ZM287+4KW4HJVSIO1NgnXrJRtdVycnMvGiXfqq7ti3c2XUxF
         vLXw==
X-Gm-Message-State: AOAM5311pkL/MEFzf2sl07BdCb6XDFzbAAnvpCBZX7XT2qUM0lJDoOni
        uLtyubVDEot6Q1SBD4KWS2lHKgMPRc1V7IrpRoM=
X-Google-Smtp-Source: ABdhPJxMnvao0WWgG6+Fr7h3yiGGEqxpP+REsXQBvo6rIQsE4nORDkmP2BQNeZqEPmJJLjkIScfYMG7mcdExA8p+93g=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr6033253vsp.50.1630935758742;
 Mon, 06 Sep 2021 06:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210719092535.4474-1-biju.das.jz@bp.renesas.com> <20210719092535.4474-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210719092535.4474-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 15:42:27 +0200
Message-ID: <CAMuHMdW+kzkb5udC33LsBWLVcQVOGX5w4xzhp+zYu2-sw+UO_Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: r9a07g044: Add DMAC support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 19, 2021 at 11:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DMAC support to RZ/G2L SoC DT.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
