Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013E1489B38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 15:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbiAJOZf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 09:25:35 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:43636 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbiAJOZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 09:25:35 -0500
Received: by mail-ua1-f48.google.com with SMTP id i5so23644489uaq.10;
        Mon, 10 Jan 2022 06:25:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hmz4tIdCkkzRQ/5Rh9uSga+UNIlxj9BUzl50+uAocmA=;
        b=FMhUNkqqtLEHXy5Z7e8OFYzmN2N06Gk7ywp8gqyaD/bPfG112eGe4Br9yinWtQG504
         66/xh0SCCbVZsPkDSvRSIaNiAPcAYBF01pvQjh4yYNqyBx2sry2I8ldeQb3ixw4d3p+f
         cM6xM4VSbGt+wgi9se42Doowin76CHw05ptYb4O4Yx8JN48KR7BNHZd9JmDUcLpA2Pvk
         aQOGCtExeKThMtLEK0jUPmPX/cjOHvusx2EOFlaWGW+jjQgLr1Gbj+FbTk3wZRUaCz0r
         IjDMezPgv3rONuOk1ku94GWSjDoRcLjAQIkxylma3icJNAOTpML4e9kHgjYX7ytQafmT
         v4gg==
X-Gm-Message-State: AOAM530un9SBttZ3d+cPUXsy0OWjNZO4yPLFHgLQTk6X5iBNBvncYeze
        UhNTPd82N4Q6qbVI5vVuov3pyunuUxefyg==
X-Google-Smtp-Source: ABdhPJwYdFOvPH9cy96uo5dHx7Iv+iucM1SL0AMf1ct8E+hf7gZRkAjQ0SYa7bfLXJmiqiHudzMR7w==
X-Received: by 2002:a05:6102:f09:: with SMTP id v9mr25134150vss.74.1641824734393;
        Mon, 10 Jan 2022 06:25:34 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 188sm1008283vkb.24.2022.01.10.06.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 06:25:34 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id v12so23682780uar.7;
        Mon, 10 Jan 2022 06:25:33 -0800 (PST)
X-Received: by 2002:a05:6102:2329:: with SMTP id b9mr26286177vsa.5.1641824733806;
 Mon, 10 Jan 2022 06:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com> <20211216114305.5842-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211216114305.5842-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 15:25:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUY=8F1HYpO54yg5jsC8DhvLbhBQbUvOFm3KEKht3XVYg@mail.gmail.com>
Message-ID: <CAMuHMdUY=8F1HYpO54yg5jsC8DhvLbhBQbUvOFm3KEKht3XVYg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: rzg2l-smarc: Move pinctrl definitions
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

On Thu, Dec 16, 2021 at 12:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L and RZ/G2LC SMARC EVK use same carrier board, but the pin
> mapping between RZ/G2L and RZ/G2LC SMARC SoM are different.
> Therefore we need to update carrier board pin definitions based
> on corresponding SoM pin mapping.
>
> Move pinctrl definitions out of RZ/G2L SMARC common file, so that
> we can reuse the common file to support RZ/G2LC SMARC EVK.
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
