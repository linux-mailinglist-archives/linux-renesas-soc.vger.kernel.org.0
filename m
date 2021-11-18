Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB114562AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 19:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhKRSpf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 13:45:35 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:34658 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhKRSpf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 13:45:35 -0500
Received: by mail-vk1-f170.google.com with SMTP id j1so4432462vkr.1;
        Thu, 18 Nov 2021 10:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJuCxy711p8R/67tfEQKav+wRIgPtXs2/b19/u1nWVQ=;
        b=M/raUpU7i3zU/F3TsRP7QodLptro9OOhazOhaAQtcSitLgyDZk+t/GrkH5Tv77gxP+
         aWAKW00TEl5spj3gGO18PgWHKwaOTwRuQG0kN8mZhrJ7vJy61m/6PG+7vait8HKKAuW7
         mz+M5674QUa5qK1CjSsqDuSvO14cvLnJGLp5wE/fN8tx24jgatW5s2To+N0FsyXLepI5
         JwhPrHCTA7CnF378jGGmp/W55twGoyvv4Z+wW6sA9Qo5Q6dx/eEdjhCqlmcopOpYWD6c
         +u/kOksH2ZS4MaiKGLYwAzeU3jvQrNGzZGArj71D4IY+zQ35os5t1kLdawuOgpBUoaTj
         bYVQ==
X-Gm-Message-State: AOAM532ZT74zrqh+G4lFwMIIDbdErBd5V4Gq98ugflXqQrYKlv/5/pQS
        BfxTmCeGOxe9lU70MGXvOL5Un5ZaNdlfQA==
X-Google-Smtp-Source: ABdhPJysHq2+yADnITwgTswK5pKMArNwRXsha9Q9eutzdI+5kMO1mUWp0Yu2uwVKhuN1MA1QYXqwoQ==
X-Received: by 2002:a05:6122:130f:: with SMTP id e15mr3424169vkp.14.1637260953985;
        Thu, 18 Nov 2021 10:42:33 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id s27sm349667vkl.24.2021.11.18.10.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:42:33 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id o1so15879391uap.4;
        Thu, 18 Nov 2021 10:42:33 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr39622488uar.14.1637260953311;
 Thu, 18 Nov 2021 10:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-6-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-6-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 19:42:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa=pc0TTNo4894VPqt7K+7V1Kdxxm_cOee22v=w_5c4w@mail.gmail.com>
Message-ID: <CAMuHMdWa=pc0TTNo4894VPqt7K+7V1Kdxxm_cOee22v=w_5c4w@mail.gmail.com>
Subject: Re: [PATCH 05/16] dt-bindings: power: Add r8a779f0 SYSC power domain definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add power domain indices for R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/power/r8a779f0-sysc.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
> +/*
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A779F0_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A779F0_SYSC_H__
> +
> +/*
> + * These power domain indices match the Power Domain Register Numbers (PDR)
> + */
> +
> +#define R8A779F0_PD_A1E0D0C0           0
> +#define R8A779F0_PD_A1E0D0C1           1
> +#define R8A779F0_PD_A1E0D1C0           2
> +#define R8A779F0_PD_A1E0D1C1           3
> +#define R8A779F0_PD_A1E1D0C0           4
> +#define R8A779F0_PD_A1E1D0C1           5
> +#define R8A779F0_PD_A1E1D1C0           6
> +#define R8A779F0_PD_A1E1D1C1           7
> +#define R8A779F0_PD_A2E0D0             16
> +#define R8A779F0_PD_A2E0D1             17
> +#define R8A779F0_PD_A2E1D0             18
> +#define R8A779F0_PD_A2E1D1             19
> +#define R8A779F0_PD_A3E0               20
> +#define R8A779F0_PD_A3E1               21

The above are fine.

> +
> +/* Always-on power area */
> +#define R8A779F0_PD_ALWAYS_ON          22

This should be 64 (i.e. beyond the range supported by the hardware
block).

> +
> +#endif /* __DT_BINDINGS_POWER_R8A779A0_SYSC_H__*/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
