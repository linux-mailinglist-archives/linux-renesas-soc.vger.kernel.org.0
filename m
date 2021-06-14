Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D393A66DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhFNMrj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 08:47:39 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:46716 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbhFNMrf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 08:47:35 -0400
Received: by mail-vk1-f179.google.com with SMTP id 184so4122887vkz.13;
        Mon, 14 Jun 2021 05:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sCs1x7UelxMldo6fYxbJ/6H8xooK6/oAxf17KmLAmCg=;
        b=FMqTj6zg1TzGUh4N8DE/wrrJOLebNDT9UHE1toIOishrZSu5jsQufE/HkhChuIG/Rg
         Vzmuu7qWDxz1rELPMFsO5AelEDMcmVtyY0yJJwzIOjm9QzQz4HiBQvvI+eiW9dv+SdFp
         KKOMEKQ+seYnC1pxpUdGYZ7fHwaR1JOOOG6igUWJkudtemF1pbX8uAesbI7Eqrbd5pyO
         HkZ+IEwaWFVXeWlOhGcNzncVzx9YLDOckAngGWzZaesTkjv26WUnGhes8sBmOKwYHkUi
         RaB2NxbbL31JdXEHO7XdJTXBxLSdgkMt1QvStblJdUXl3GXxww/vPjbbhrEm5nD7foOs
         y7YA==
X-Gm-Message-State: AOAM530rIyRNmoCgdvdh6mOSH7ljRgdLZ0hdbQrAUFY/2D/dZFSo4/pt
        v5O+B8TA10CtYAHJD0VNGrOIM8+esSUMYRnfX77US7RAY4A=
X-Google-Smtp-Source: ABdhPJyJeabCUpSCqAbqB6UrdDQBaMoXR7mE1F51HC9+tUTsWllcmkE39R4bkQRx8tAduyCNMOe36U8Rhkm33IDHI0o=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr15339722vkd.6.1623674719120;
 Mon, 14 Jun 2021 05:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com> <20210611165624.30749-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611165624.30749-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:45:08 +0200
Message-ID: <CAMuHMdUFvPPyiOF_1TKdaQCL=9cG1TTGyg5EZZanbZRGqtMynQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g044: Add I2C nodes
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

On Fri, Jun 11, 2021 at 6:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add I2C{0,1,2,3} nodes to RZ/G2 (R9A07G044) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
