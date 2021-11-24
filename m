Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1807E45C707
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357989AbhKXOUx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:20:53 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:35572 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350639AbhKXORg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:17:36 -0500
Received: by mail-ua1-f44.google.com with SMTP id l24so5440606uak.2;
        Wed, 24 Nov 2021 06:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aHaXIml+9ov44sHf9RSNgNeXg3mPjcuDiHa6lfHBDmA=;
        b=5Si0eDiJamOgzK7yAvWEUEiru6ElWgWq929YeX3Rm/uA/K8lSXqxnoWEWne9prW9a3
         ltM0TISRRbo8feeBEAG547d+CSPqUsCaTeXCMKHrQQGTfpV9Pr7mlI2HYXpynhKHoJiN
         +ryhSySLU7dmIiSTRbP8YgtkVFkmmsHQ/S/iP+F0MipkkkqXu+ElwG2vYVqleSb/nquS
         0BzNgAcyK75zG4AbIbGEb/Pd3DgZUVURPfJWeIcjQWznvcTzuw/+A/+AISrCoMS8PsZh
         1XEOB/FKSfF/PfFFJBaD27cntReEdE2w9f6uigerrR5DqvVRWx51OqcL30C90ZHCx82s
         oN4A==
X-Gm-Message-State: AOAM5328FCnuLgtKVzTt0knFd+gvVIECu3gEVEE6Ry/3RFnjMdx3lefe
        zMsT44FgaBMcg0W6o3z5LeDYXC2SucTUWw==
X-Google-Smtp-Source: ABdhPJw0MbtyBMiPRvYqO/fBm3nbtgrXreQDUVQdQDaqxr2OM1EVAlv9BNqj1AGjk2d7X/oOMTk6yw==
X-Received: by 2002:a05:6102:105b:: with SMTP id h27mr23754383vsq.60.1637763264326;
        Wed, 24 Nov 2021 06:14:24 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id r20sm7746082vkq.15.2021.11.24.06.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 06:14:24 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id n6so5454080uak.1;
        Wed, 24 Nov 2021 06:14:23 -0800 (PST)
X-Received: by 2002:ab0:7354:: with SMTP id k20mr11059233uap.78.1637763263577;
 Wed, 24 Nov 2021 06:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20211112081003.15453-1-biju.das.jz@bp.renesas.com> <20211112081003.15453-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211112081003.15453-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 15:14:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxRA0xe=h6ZBSFBGpt_V_kcNRboi-FLbAE9bdtuZ4ubA@mail.gmail.com>
Message-ID: <CAMuHMdXxRA0xe=h6ZBSFBGpt_V_kcNRboi-FLbAE9bdtuZ4ubA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r9a07g044: Sort psci node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Fri, Nov 12, 2021 at 9:10 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Sort psci node alphabetically.
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
