Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100BC4A6125
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 17:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240946AbiBAQPZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 11:15:25 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:45840 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240957AbiBAQPX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 11:15:23 -0500
Received: by mail-ua1-f47.google.com with SMTP id b37so14077471uad.12;
        Tue, 01 Feb 2022 08:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=//pwmHitoqEgVhCvBVFHn6cANuSQZwYa5f5yA3MsAV4=;
        b=f4WWIXQXb09DjiCeqluC5Y+Dl5jHZ4wi73zZKrSICUxiCTCkYiQ56WkQ52aMfNtUNa
         sGKXX0u48/DMrbjUrEFnfpvK3UL1iCJEclAZ6p1pc0IEtZFjKv//iFgu9N8NIsna8zJP
         hqWKal0vtq6QXbPInapjebH2OXP2EBW/TTBoUnkVh8YCPTik6nLdjarQEjHBeB6pdWFh
         cG5AqePCQfhcP4plvSe3VG5rS41gjlzCwdCZcjxm/dGmmhGgFNvWx/PF6VLG7XSSBR3W
         0qzQHFpTfLPwsOVGLf+GFXrStnUDvTZDwg71n7/bA4Tk0iofRkwiDJl0amPlR+cTTcTl
         28gg==
X-Gm-Message-State: AOAM532qRuyjRXxhufPVfNMj9zJr3sW5EssGvTuR2R0y/jM9qUVXqlb0
        mKZTFou5MS2shyE5UAby9+wijEGa6e49SQ==
X-Google-Smtp-Source: ABdhPJwjcvN8Ao2Wly9NZRT55G17X2agGrlPuFrbt6nJvV+q77yyKEDngQnXKs4Npl8bbqC+fhYzcw==
X-Received: by 2002:ab0:3d0a:: with SMTP id f10mr8265578uax.84.1643732122559;
        Tue, 01 Feb 2022 08:15:22 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id e1sm4171210vsh.19.2022.02.01.08.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 08:15:22 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id b2so16697215vso.9;
        Tue, 01 Feb 2022 08:15:22 -0800 (PST)
X-Received: by 2002:a67:b00e:: with SMTP id z14mr9907575vse.57.1643732121815;
 Tue, 01 Feb 2022 08:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20220117075130.6198-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220117075130.6198-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 17:15:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFgGfd2N4-9+rREVFyS2ufP6PTeOxTibgZ__Y_+ir7RA@mail.gmail.com>
Message-ID: <CAMuHMdWFgGfd2N4-9+rREVFyS2ufP6PTeOxTibgZ__Y_+ir7RA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: rzg2lc-smarc-som: Enable eMMC on
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
> RZ/G2LC SoM has both 64 GB eMMC and microSD connected to SDHI0.
>
> Both these interfaces are mutually exclusive and the SD0 device
> selection is based on the XOR between GPIO_SD0_DEV_SEL and SW1[2]
> switch position.
>
> This patch sets GPIO_SD0_DEV_SEL to high in DT. Use the below switch
> setting logic for device selection between eMMC and microSD slot
> connected to SDHI0.
>
> Set SW1[2] to position OFF for selecting eMMC
> Set SW1[2] to position ON for selecting microSD
>
> This patch enables eMMC on RZ/G2LC SMARC platform by default.
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
