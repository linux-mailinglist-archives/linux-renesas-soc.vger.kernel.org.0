Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087CE42374
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406124AbfFLLGY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:06:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43490 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405430AbfFLLGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:06:24 -0400
Received: by mail-lf1-f67.google.com with SMTP id j29so11735624lfk.10;
        Wed, 12 Jun 2019 04:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NeWXALqJk58DM+qnk0HfjTOx6GceWnVeg7ZqC2Eswqc=;
        b=P0mofOjg/9/bhdLW4Yt5DmVtIPVu2ITx3XrPEdw5L9Il5GElAvgMxRaQkZtUXXQRJM
         lct7L84L/bwsiB6sir6YwKj+tM4WydZgWvrE0TenpMgSx8imia2Iux68TYpdihMiSQWO
         922Ij5MavjfQiolyaMvdFOln2NRP4zhiU7lcXX/vmfC3cYIiI5nmizdD8q6DutLl6bGW
         iTjBMYYP/uaCfo7lfZtkjRu1FyKaCKIZkLBPUKwJYp49ZrRp3sEb4tdoaeDMTYHNwneG
         gcSIRsQJrnRKUbziDcz0aXm2DPQANSzePheJVIeOOmtKypDcN34c6uxo4IInJpfLDdqx
         XlSQ==
X-Gm-Message-State: APjAAAXTFZB+NI1aFGfWO7xUVGOEj0XedF00AlD62hQUgm/bPc9F/bkP
        BKImqRkbyKvkvORRbRH4HlzqBXgTK0+9qMn1Hk4=
X-Google-Smtp-Source: APXvYqxGtNxsWj0loHsqm0Qsf/isL1dO9nIJjjDlOSH4rUCzHzx7G61oW5ph/chKn5Usb77L1fPdzp/PGpNZIHJpGEY=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr33348360lfk.20.1560337581833;
 Wed, 12 Jun 2019 04:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
In-Reply-To: <20190612094524.GA2153@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 13:06:09 +0200
Message-ID: <CAMuHMdVFvL4wRuHD64-N0KK-YQDvjZXm+HKf2mBQ=Jz8N=-A_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Jun 12, 2019 at 11:45 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > I was thinking about sending a follow-up patch to list hs400 here
> > after Wolfram's patch appears in a RC, would that be okay with you?
>
> Do we need that? The *board* does not handle HS400, so why add the
> property?
>
> Similar setting would be an I2C device which can do 400kHz but the board
> layout doesn't allow for such speeds, so we are limited to 100kHz.

Do we know the HiHope board layout does not support HS400?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
