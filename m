Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8364E2C4540
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 17:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730494AbgKYQcF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 11:32:05 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43999 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729690AbgKYQcF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 11:32:05 -0500
Received: by mail-ot1-f65.google.com with SMTP id f12so2731556oto.10;
        Wed, 25 Nov 2020 08:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hbzHvNY24kj4VBuB6mtysQNq+O8m9xisRukqjFDGtlY=;
        b=sAydXgmjyqBl5YJPw/8KnNSBGEdIUNrzYvNOt0YgLLPWvUn9Uv5TMrkerIht/brcG0
         ir3BrQtuZs/hKv439mfwtz/bQ160heLT2lwB/U+GtuzwQtQgHM4gR7wCtfSbbNkO6xE4
         0aZu0zFYabbs5aJyDHHKMGItSuz+UssVnOWqQY+o5hFhLYUOp26Oa8gj03PW2NZU18by
         hz7YG0N6fnT7YzryeoxR/E1vixj0eEb0E/74SwbU95F9qm+daCL8EiDSEs6/rHKiaeK+
         9+x7ZNdohHe5NGcAL5uj9dtjeOpV4QpbZxfNl4BQvo/EfcY7Cau29hqSE93AbaeUuwmz
         1ozw==
X-Gm-Message-State: AOAM530ku1x7qJ8PvHWtDpK28sGuzXULPZrD60zDuCFK7p4nACeYKY+I
        rJ10JDkubtZP91sSLLSLcyCgXtxYc0sCDD3HBXOBSAl2
X-Google-Smtp-Source: ABdhPJyDhAfP2mQWGkkpZNyuU9FwlzneLai4wkO6gRMPTaPnnwpKfirWxdkuQv4/gkY0hogzOJnEZtHL7Hc8qiRCa4A=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr3288973otc.145.1606321923047;
 Wed, 25 Nov 2020 08:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX+FZjAfbWWw53EToHP6c4JFmQX9wogAyW3OcOxHgMd0w@mail.gmail.com> <OSBPR01MB504858A417137ED7AC31F925AAFA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB504858A417137ED7AC31F925AAFA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Nov 2020 17:31:52 +0100
Message-ID: <CAMuHMdXGqv9aKra7Ncg4mRoc2caO5iOw+ydrNmo9UcHeDTgVGw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Wed, Nov 25, 2020 at 5:26 PM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 25 November 2020 16:21
> > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Cc: Magnus Damm <magnus.damm@gmail.com>; Rob Herring <robh+dt@kernel.org>; Linux-Renesas <linux-
> > renesas-soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > <devicetree@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Biju Das
> > <biju.das.jz@bp.renesas.com>; Prabhakar <prabhakar.csengg@gmail.com>
> > Subject: Re: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
> >
> > Hi Prabhakar,
> >
> > On Wed, Nov 25, 2020 at 2:02 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > This patch set enables to connect ov7725 sensors on iWave-RZ/G1H Qseven
> > > board.
> >
> > Thanks for your series!
> >
> > Do you think it's a valid use case to mix and match ov5640 and ov7725
> > cameras? E.g. connect two of each?
> >
> Yes that is valid case to mix and match. Do you want me to make it configurable too ?

If this is a valid use case, then please do so.
Thanks!

> > Or should all four cameras be of the same type?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
