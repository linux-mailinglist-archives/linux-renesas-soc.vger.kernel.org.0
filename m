Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5157F4499BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbhKHQcb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:32:31 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:38701 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbhKHQcb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:32:31 -0500
Received: by mail-ua1-f48.google.com with SMTP id o26so32629488uab.5;
        Mon, 08 Nov 2021 08:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woZgaj6Mu44Tryh18+xnuY1/GMuhYHx753N+bB1veGY=;
        b=n6pIS/9NTEG06oBdZ7vif1tjFt8xFQugM9QbjFgirdzfcGRmDC6Lc5vpEXXyckB6Hq
         e53ke5mn6i5ve8WyueU14VBHoYV3bDEq6W4hEWF7b8TXP0PYvXn2/tP0G6CUIQkV2U5+
         laIMRxMLTCnS5kWEujGQCf538y6DEfW5UlRFy2YkFmiQ5fPfgfgEBjhkSLe6osLj77+g
         rdohj4VlF0wnYIJzA5sUOIoMPpu1Yo7mkGNwinbwKANnr0OYLAuK7RutcpavktZ8bcSx
         KP51SwTg/UwSWL4io1idMzziYlYbNF8iRkPBwmLuipej0NRhuE6S1Apy6E9qJ5Tc4Hho
         Aimg==
X-Gm-Message-State: AOAM530xnSEJHK19Cr9JEfbq1p8uuUuZhABPIAqzH8Em7boe8k0a3E9L
        CyTEWQ7iw6KeTHxXbc8uSOfpTrSt6GR6pt5n
X-Google-Smtp-Source: ABdhPJzKVOZYGibPHG+h892i7OUGjYuFesWp37cMNDki40TQiZRr4hfUhCDQ/tcAqjanivAlJUtsgA==
X-Received: by 2002:a05:6102:3f02:: with SMTP id k2mr437155vsv.26.1636388985966;
        Mon, 08 Nov 2021 08:29:45 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id r20sm1417594vkq.15.2021.11.08.08.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:29:45 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id t13so17309483uad.9;
        Mon, 08 Nov 2021 08:29:45 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id b7mr75736580vsu.35.1636388985293;
 Mon, 08 Nov 2021 08:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211103173127.13701-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103173127.13701-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:29:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjp4WQgkVxaSFJ-ge071KZ_JFWOuBQKZMpSCUW4kG9Ug@mail.gmail.com>
Message-ID: <CAMuHMdUjp4WQgkVxaSFJ-ge071KZ_JFWOuBQKZMpSCUW4kG9Ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: serial: renesas,scif: Make resets as a
 required property
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Make "resets" as required property for RZ/G2L. On RZ/G2L the devices
> should be explicitly pulled out of reset for this reason make "resets"
> as required property.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -151,6 +151,7 @@ if:
>      compatible:
>        contains:
>          enum:
> +          - renesas,scif-r9a07g044
>            - renesas,rcar-gen2-scif
>            - renesas,rcar-gen3-scif

People might prefer alphabetical sort order...

>  then:

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
