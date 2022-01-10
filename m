Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8930489B54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 15:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbiAJOfp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 09:35:45 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:35696 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiAJOfp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 09:35:45 -0500
Received: by mail-ua1-f41.google.com with SMTP id m90so8507255uam.2;
        Mon, 10 Jan 2022 06:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ahnB6Wzu85wNpvymQJZcyH+DcWIx1h8cEvZZv2M2m28=;
        b=bUFxry31pv1BrcIfGxiIdNmA3WGvgl+jyGOnoIRpob616sYWnwULJoBfG+AWZ0crKY
         jeFGY5c3Xq8ohWhsm2FyqdVpEZdiuN4SHMtJQAlSspaJgGeRy3haHRJIQcDodXSDUFf9
         9nra7BLps1DWJo8dLlM5K60dnidL2G0U4egUkbkGbC/GVepJ24qJv21Z97m6vbA4RAQJ
         x4FP43ljI9SFmxaDCuBxgpRVCceTVNC6MUr9/NuWl4qKdknssAnJO9YhW6fqCGhkfnGl
         ZleqxTa9f8xKiYIn2S1lhTCxAxuQvC6ShcepS0NiVWQSwlEKkBOSk4bfeUWejnM7CVJr
         so8g==
X-Gm-Message-State: AOAM5333nHuSe90VydaNreK6uJ4CZUdEX5X8NpGL1mdWjfBCL0sTzxRn
        /tlSksGFrb1ODiQ04/3jnaqW/l4D5S17Ag==
X-Google-Smtp-Source: ABdhPJyEpC2kz+l4OzKNhTN4K5o1rFbUBvvE9Upmsv4/m0LW10UQ17Is6S7ASpCTzmgjBYJhp8LX2Q==
X-Received: by 2002:a05:6102:3f4f:: with SMTP id l15mr15185vsv.27.1641825344515;
        Mon, 10 Jan 2022 06:35:44 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id t22sm4168394vsk.0.2022.01.10.06.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 06:35:44 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id u6so23865394uaq.0;
        Mon, 10 Jan 2022 06:35:44 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr5633vso.77.1641825343968; Mon,
 10 Jan 2022 06:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com> <20211216114305.5842-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211216114305.5842-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 15:35:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViOUSRBde7orT+9tZBAZbt+O9EQOkutGu9sHw8SakGZQ@mail.gmail.com>
Message-ID: <CAMuHMdViOUSRBde7orT+9tZBAZbt+O9EQOkutGu9sHw8SakGZQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: Add initial DTSI for RZ/G2LC SoC
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
> RZ/G2L and RZ/G2LC SoC's are similar and they share the same DEVID.
> RZ/G2LC has fewer peripherals compared to RZ/G2L.
>
> SSI (3 channels vs 4 channels)
> GbEthernet (1 channel vs 2 channels)
> SCIFA (4 channels vs 5 channels)
> ADC is only supported in RZ/G2L.
>
> Add initial DTSI for RZ/G2LC SoC by reusing the common r9a07g044.dtsi
> file with unsupported device nodes deleted in the below SoC specific dtsi
> files.
>
> r9a07g044c1.dtsi => RZ/G2LC R9A07G044C1 SoC specific parts
> r9a07g044c2.dtsi => RZ/G2LC R9A07G044C2 SoC specific parts
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
