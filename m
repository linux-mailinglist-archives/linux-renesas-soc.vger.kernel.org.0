Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1654A9819
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 12:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiBDLAD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 06:00:03 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:46684 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346116AbiBDLAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 06:00:02 -0500
Received: by mail-ua1-f46.google.com with SMTP id c36so10081392uae.13;
        Fri, 04 Feb 2022 03:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PGW77nPqjjnnaVKGhCsQpz29j5T0Yq94caSxLC2wGj8=;
        b=IG6x9FZd+A5GDO+UYBxxi30CIKV02vcAhkc3IrON4Q4XBhYHELKTAJgd2n0VCvFX9Z
         dqtPJC0yyevDEA2WPlzR+rp8fnPEFK2Gt9HdySOBNFnZGc6pqT6eEap8n2kXbc59kFeT
         R0yhoyQKOqtIwtbDJyXkyQLGd3jh9NDCmwwmAJrDlGw9Fse442jfcZkrUMU9B7+/5RrC
         YNAHsJlRctcfvwrJm9Cq23nLOExNCa1ltpGnCeWWUp7kb37I6QXUEVfV3uGefc7PG0GE
         NeYC6nbpHSd1jPtUncucHrFLJttM7ZLvW4t3UFCgoT3fW9xT8MR6Ua+gjqO9J5SweJhQ
         0Hzw==
X-Gm-Message-State: AOAM533783qW4HDmlZQudQeW9kI3eB2ycy23eBbe82WYxS4T2eSkCmwK
        2sFsglbsCQMjn4qOrnGYukSWeH6iURFyNQ==
X-Google-Smtp-Source: ABdhPJz3D1qfD4Kppa/wJoIMnGhZeTBOBMZgqTHpdLShTPnHHbkY+ouT96NYZwAD74EC4yH73T1dJQ==
X-Received: by 2002:a67:cc05:: with SMTP id q5mr612459vsl.82.1643972401307;
        Fri, 04 Feb 2022 03:00:01 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id g22sm346568vsk.26.2022.02.04.03.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 03:00:01 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id m131so3440686vkm.7;
        Fri, 04 Feb 2022 03:00:00 -0800 (PST)
X-Received: by 2002:a1f:5d84:: with SMTP id r126mr711208vkb.33.1643972400634;
 Fri, 04 Feb 2022 03:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20220203170636.7747-1-biju.das.jz@bp.renesas.com> <20220203170636.7747-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220203170636.7747-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Feb 2022 11:59:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXr8cNRe0JqKkE39J7gX3gZ7K_rVE0z54CPsbPteSHT9A@mail.gmail.com>
Message-ID: <CAMuHMdXr8cNRe0JqKkE39J7gX3gZ7K_rVE0z54CPsbPteSHT9A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on
 carrier board
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
> SCIF1 interface is available on PMOD1 connector (CN7) on carrier board.
>
> This patch adds pinmux and scif1 node to carrier board dtsi file for
> RZ/G2LC SMARC EVK.
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
