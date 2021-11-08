Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEFE449A2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241385AbhKHQsG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:48:06 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:36684 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241404AbhKHQsC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:48:02 -0500
Received: by mail-ua1-f47.google.com with SMTP id e10so32774922uab.3;
        Mon, 08 Nov 2021 08:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cM16ccq56jKmEiW9Mc6XePx8TDSNH34IQxb9MWE7m6c=;
        b=xyDqDp6uM3v5lhrFChw3nhJyoBHpu+SnbcAwrn7YiqCOXWR32CSr3UKp0bPyqI+WLj
         9NL3re+NDRNNPZuaNzNW4dOdLI19snI4NqDoXJZPUorysImk7o/ZRXCO++1w67BxFho0
         pr+UpcUgLYfo5PmyKsrQ6Oq+oVhxgPK6q20rJPMTiYozbyzhVRdGVFchUF+5h/jo5BOU
         lLpFPXfIY9Gqm+ojQkBQxUMg9QsX1uofmQ6YL27Zp76tIittzznPX55rzKVhIRH2ci/g
         9DCefckW5fEw2O+Nu70KPJuSE2w8JpqpBP64e4gZGRH5I2cc5TVsWDWmN7nleLT134ke
         U5rw==
X-Gm-Message-State: AOAM530v5Lx8Yo9RzuHOgHCqAkB6+js5BWF9Wwt9opymrZsBAKovZkyL
        /6VDzXpYl1NZWTzJNGBmy00eAe2g9yus7wkL
X-Google-Smtp-Source: ABdhPJyIlqX7vjkPNEp1GCnwPD8LI2Ud/NQTkuGA3QlKgu7D19zl1uTmk2i6tcPJy3pwuF0+fFOb2g==
X-Received: by 2002:a05:6102:3709:: with SMTP id s9mr625143vst.10.1636389917002;
        Mon, 08 Nov 2021 08:45:17 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id p69sm2903929uap.1.2021.11.08.08.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:45:16 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id q13so32776112uaq.2;
        Mon, 08 Nov 2021 08:45:16 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr40232813vsb.9.1636389916397;
 Mon, 08 Nov 2021 08:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211103195600.23964-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103195600.23964-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:45:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUH+FC3SHxn3L9wxFt+8XJfyRZ_bP7F67Yoaco5QhickA@mail.gmail.com>
Message-ID: <CAMuHMdUH+FC3SHxn3L9wxFt+8XJfyRZ_bP7F67Yoaco5QhickA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a07g044: Add SCIF[1-4] nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 3, 2021 at 8:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add SCIF[1-4] nodes to r9a07g044 (RZ/G2L) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
