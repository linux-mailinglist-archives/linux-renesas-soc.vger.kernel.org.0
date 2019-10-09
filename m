Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEF2D0E2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730659AbfJIMEG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:04:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35860 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730110AbfJIMEG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:04:06 -0400
Received: by mail-ot1-f68.google.com with SMTP id 67so1483302oto.3;
        Wed, 09 Oct 2019 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXoBZAgNzk9dMk0zZsU2RF/GITwghS1YERrh4cWdOC8=;
        b=GDskh3kYLQtD5gRblV1Gh3b5uQqzejfy/yJ7P9er+uMSD7SDa0k6pZq2TFOGfiPvau
         6k7wYbv97pvSHteeqcAwMdTDk6AtDFAPMulwRPgWsP8/+M5rkVE+RL4FFx7XadouHNLm
         mUEx/ppCB5oJKWkoD4VVY768GT+F8YSQt+i554aP8hd+wdrxr+wZMyeWFhGymJ3KEXNT
         vtXQ33M1rs/RULgF6aUjzIyafM3HWqDon3mbzgDrz7HOZGYtyWDCCNIsQo0L4OLQwa9H
         hcHGDTY/BNHftffdUbQ2IkPeRr1oz1jMexuY3ZXeQNRQysA2kWJk/GMZXAG8CuEyNFC6
         tvCw==
X-Gm-Message-State: APjAAAUKYYtFdjwVW1RzNaRVZA5VZfkgPwfqHqg8oCn4kh61cNT9JDgX
        Vpc5CJkykdrxiqHW413up3SCiCYZlfhhhUpvTAs=
X-Google-Smtp-Source: APXvYqwAr+6a2aiLeUfEO7o+UCNO8Ftc2fmS0CmrtAt8YTPq10+RnRyJWr9k8fs71Oj30qpogsLagAks/RUAfW2L/6E=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr2526951otr.250.1570622645649;
 Wed, 09 Oct 2019 05:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <1569831527-1250-1-git-send-email-biju.das@bp.renesas.com> <1569831527-1250-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569831527-1250-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:03:54 +0200
Message-ID: <CAMuHMdXytj51svKY0in3ddYsb4cSZ=Y0xuzOZiUJp3mn9BxLjQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r8a774b1: Add GPIO device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 30, 2019 at 10:19 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add GPIO device nodes to the DT of the r8a774b1 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
