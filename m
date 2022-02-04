Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F804A981B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 12:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346116AbiBDLAc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 06:00:32 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:42947 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346009AbiBDLAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 06:00:32 -0500
Received: by mail-ua1-f45.google.com with SMTP id e17so10117406uad.9;
        Fri, 04 Feb 2022 03:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B/xLQeplgkZbenuENyLdq0P69puk3YOu9jb+YaW1mxE=;
        b=iiCkNiqesQDIzVTZ/vdEuPf0qqG8OuzDr0QWgF2YQF7Mg/Cfb+zoj9KzrqiQzvTJ59
         HY2tcPVyxF2adgrZCMtv0vO9MjNG49/fEamUBdU2pUN9SCuGnfjT6OR7t83SE8X09SnL
         1+coAp37QtsMpexAgB/04pAsvgBCwwVA+ksoYAtW4zkZTr+zqzBInNkwvM/fhPmpxu9s
         yhEBG+5lLL9RyyduvQciKc60866xCXCupo74M94bhVvICZI6Xw1HVvuCcPLA6/mvDW8k
         1bf4t5mTyH1cYhF7ibuDHQLPGzyM66HnMeewhodqW03zMLfgyyNP4V9vm0aA6gvM1lMG
         SaeA==
X-Gm-Message-State: AOAM533AYLXIA/xhvmegymftQ2KmNkijqM5rZRufOJUYjAOdYp3I+vg0
        AAGJ/PBD+ZkrBqhouo6eq04QnRLYmVfyMg==
X-Google-Smtp-Source: ABdhPJwHbYkXG5harvgXWXbxH0ZgPDv3vAvazmjD6JcWiXV5I+Fe5ZqB7CX3hG6a4TdywNAX8de8gw==
X-Received: by 2002:ab0:6e92:: with SMTP id b18mr906382uav.132.1643972431557;
        Fri, 04 Feb 2022 03:00:31 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id z13sm334568vso.11.2022.02.04.03.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 03:00:31 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id 60so10212168uae.1;
        Fri, 04 Feb 2022 03:00:31 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr631198vsj.5.1643972430971;
 Fri, 04 Feb 2022 03:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20220203170636.7747-1-biju.das.jz@bp.renesas.com> <20220203170636.7747-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220203170636.7747-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Feb 2022 12:00:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCf8m9Tx5L2CpnXZOfe54DW0yhpB8Su+ftSS1S0OQWYQ@mail.gmail.com>
Message-ID: <CAMuHMdXCf8m9Tx5L2CpnXZOfe54DW0yhpB8Su+ftSS1S0OQWYQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable CANFD
 channel 1
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

On Thu, Feb 3, 2022 at 6:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G2LC SMARC EVK, CAN0 is not populated.
>
> CAN1 is multiplexed with SCIF1 using SW1[3] or RSPI using SW1[4].
>
> This patch adds support for the CAN1 interface on RZ/G2LC SMARC EVK.
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
