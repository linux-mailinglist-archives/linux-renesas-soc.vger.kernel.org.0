Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA244A6133
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 17:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240966AbiBAQQf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 11:16:35 -0500
Received: from mail-vs1-f51.google.com ([209.85.217.51]:40478 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238531AbiBAQQf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 11:16:35 -0500
Received: by mail-vs1-f51.google.com with SMTP id g23so16734094vsf.7;
        Tue, 01 Feb 2022 08:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WKBhlOoIftqWUSFiJM+fo/SElMCHM247+01rYcyFYnU=;
        b=mHrKPu9TM2qhGU8y7P/Q5MZAGSgt7fk6hPrbvKHiximTEwvlLnGW8esNrxIwKXTtOG
         lKeWLnWbv3jnOT/wZWo0q3vbc09L2WR0ODiVbWe0as2qnCgFbr6tK/E7mWiuAmR6ZBrs
         QlO/FGqNFNKWHFGdCfz+hYpYf6bIi2BB5d44aKEEzRqoNZzVqaIQPeIch2yUCHrelVYv
         oA6bRM96VRWSONDn4STNr6l1CK3wWCu/2mkz2zPvSfoGd0+QfXwnsobr8cQcdEBXpPMH
         TPuonks3WwARaaxChHLebArlqJdQ8ruAUdTCWJ2yZZlch0ni2Gm3UaVDyU1KbbQd45dN
         5P+w==
X-Gm-Message-State: AOAM533UAt3lKLpA0Z41rgwKoPzwbB6vMOtpvnD//Edtjbkn0bu5eemH
        3a2TSNWq4ROofGw0WeOQ95+dUAYe4LCTtg==
X-Google-Smtp-Source: ABdhPJxRBo7jqmPUB8zF6CUfW0ToRrPBHqm/rWt/E+Q0xsRkp7OyLddl5QzoPCC4IVVFXrN2AKRYuQ==
X-Received: by 2002:a05:6102:548a:: with SMTP id bk10mr10087610vsb.27.1643732194382;
        Tue, 01 Feb 2022 08:16:34 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id x14sm1129371uav.5.2022.02.01.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 08:16:34 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id y4so14186755uad.1;
        Tue, 01 Feb 2022 08:16:33 -0800 (PST)
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr7477310uah.114.1643732193344;
 Tue, 01 Feb 2022 08:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20220117075130.6198-1-biju.das.jz@bp.renesas.com> <20220117075130.6198-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220117075130.6198-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 17:16:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKjRJkQ5c-FRuwEny3gpoWeCUXPfeU3CZud1ovT=Pp5A@mail.gmail.com>
Message-ID: <CAMuHMdUKjRJkQ5c-FRuwEny3gpoWeCUXPfeU3CZud1ovT=Pp5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2lc-smarc: Enable microSD on
 SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 17, 2022 at 8:51 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch enables microSD card slot connected to SDHI1 on RZ/G2LC SMARC
> platform by removing the sdhi1 overlay which disabled it and adding the
> necessary pinmux required for SDHI1.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
