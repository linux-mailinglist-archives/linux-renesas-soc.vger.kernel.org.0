Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C4745A388
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 14:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbhKWNU5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 08:20:57 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:41626 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235412AbhKWNU5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 08:20:57 -0500
Received: by mail-vk1-f173.google.com with SMTP id 188so9410708vku.8;
        Tue, 23 Nov 2021 05:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8K9GN/oaS924xTtn+p8naXBl/UNbxTzzkuFDkkYLH8=;
        b=ROjg79FmEmilngsYR1274FzTqqQU5EpsNY8cslcI2a0OM/yqeUYmUna7VmWFAGqJfE
         D0HI3YX8Lp1WYVqJgMggaYv40nyCZI5uF5yNH1ALw1wRUcJnRHIZtbqx/1XcowdRNDJ3
         RU4qHeLe5a/iox1waLdWvzqrWm2slbyEIff1HDQ4aRO4RzUd4Vn/+ovewarkH30A9WGy
         i/UE4QV8fsASzSYq/01JvivPe2hPiyM6IT8Vm+sLdTV/on7rEu22Z54+aczr0t7vdlsz
         ojNui4C2tFPyTq7KEyL3OAid5U3wpQpmwEmcwedRJoes4I9/2cVt2NpdWtiSNJnbHhfP
         H0mw==
X-Gm-Message-State: AOAM533lzM3hFDYgpA5iymRZqPzt7F+aERsgxMA+aVog/Lgu9EvVHD6A
        rnTKzha3MfuQD41ZKUgzRKYqq//Ra6rm9g==
X-Google-Smtp-Source: ABdhPJyyec5KuED/H9T65N5LYvXNLNDacrvptOdqf/RwRTi9i1/LNVrLCKgrW/LnRKBNzyKgaPxC0w==
X-Received: by 2002:a05:6122:1782:: with SMTP id o2mr10831798vkf.3.1637673468360;
        Tue, 23 Nov 2021 05:17:48 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id q26sm6795730vsp.23.2021.11.23.05.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 05:17:47 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id p2so43598452uad.11;
        Tue, 23 Nov 2021 05:17:47 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr8827372uae.122.1637673466803;
 Tue, 23 Nov 2021 05:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20211118191826.2026-1-biju.das.jz@bp.renesas.com> <20211118191826.2026-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211118191826.2026-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 14:17:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR4u2neQ5u4hQM93GDF-=TWr9WJ9OPJux4hXo_agR13w@mail.gmail.com>
Message-ID: <CAMuHMdVR4u2neQ5u4hQM93GDF-=TWr9WJ9OPJux4hXo_agR13w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a07g044: Add OSTM nodes
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

On Thu, Nov 18, 2021 at 8:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add OSTM{0,1,2} nodes to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
