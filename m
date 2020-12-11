Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0613F2D7605
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405963AbgLKMtl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:49:41 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37431 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405906AbgLKMtK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:49:10 -0500
Received: by mail-oi1-f194.google.com with SMTP id l207so9688029oib.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 04:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3edo3wYvo1elTS9VIuefEp8wqi9aXedoG1JbKWXMpHg=;
        b=tI3fDJKYVy4CwVheNyvlKfklGeHGU9HPgZd0Vs9q1Wwcc31evBJoc3ND2vpGgziqF/
         X0JDgRlA7QXYSslKhzFA/Ld7bzTa0M5jOECuKGA1mD4prRiVSJwbg2ZpwNfNADW3o2j/
         0VEa+cH9kaVRTevU1Dm9T1bfhusgH7N3GTUH/KsltubqFfMCNG3Ob9kNl429uNRYo3m4
         Oy2wZkyebU7h70TlAb8mcgvsOpSC02pGmZRsJl6Jz3/YPKwplyURL6SGZJPGIJlkdNdf
         cwMnTJ1cUWtGjoLxKp8tUAvrxCACgljOdT6/qjkMNkv496/1XYQNmDJGzF89edcUQGav
         wEAQ==
X-Gm-Message-State: AOAM5321AKK4K8kN0ZrU6bX4JBcTpZfINI5o3iJXa2fPUEjdAq6zcClH
        v0ZQ8BlH1PazHOToJaUmM0v89ptA/GLG2FO2lOH7zXeO
X-Google-Smtp-Source: ABdhPJzO//IdVV4UTFTUYIXXppZB3ZCnKdtVETR6EuRLZf43Jxs5m+Eqcu0kLh3PiiIxuSsz9/zRWLuQ8O/JUiV/RtI=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr9032297oih.153.1607690909525;
 Fri, 11 Dec 2020 04:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh>
 <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh> <TYBPR01MB53090FC98C72A3DA466C064786CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB53090FC98C72A3DA466C064786CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:48:18 +0100
Message-ID: <CAMuHMdUZOv=Or5JJZmAVwn2fjA=fP_texF9ZttKaHVY-YLjRCg@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: renesas: Add MFIS clock
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Julien Massot <julien.massot@iot.bzh>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Dec 10, 2020 at 4:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 0/5] clk: renesas: Add MFIS clock
> > On 12/10/20 3:57 PM, Biju Das wrote:
> > >> Subject: [PATCH 0/5] clk: renesas: Add MFIS clock
> > >>
> > >> This series adds the missing MFIS clocks for most Reneas R-Car Gen3
> > SoCs.
> > >> I have tested this series on E3, M3, and H3 based boards, I don't
> > >> have access to D3 nor V3 boards.
> > >
> > > Just a question, Can you explain what test have you done with MFIS
> > module?
> > A basic usage I did is to store and read a byte into one of the
> > communication register MFISARIICR / MFISAREMBR, a more complex usage is to
> > trigger interrupts between Linux and the realtime processor, using a
> > mailbox driver, that I didn't post yet.
>
> Thanks for the explanation.
>
> FYI, As per R-Car Gen3 HW manual RCar-D3 doesn't have RT Core.

But R-Car D3 still has (a subset of) the MFIS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
