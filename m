Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF8F2DD047
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgLQLZ0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:25:26 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:42690 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgLQLZ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:25:26 -0500
Received: by mail-oi1-f178.google.com with SMTP id l200so31749465oig.9;
        Thu, 17 Dec 2020 03:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ye23hBbfnHcKQODG9BbEdQi+7RSpwQlYeXWySCGHRoA=;
        b=K4WNYthey8FCkQr0GPnCoKT2/v9V5kemnMtZfMV7PVVlES29LN/Rs2HkjtdZ2v2RBP
         urR5+HvDHJaycsIIebYGEBnuw+79n2ZgpkoBjPW35PfcDzrwuAvFIYfW7NABlgl5w2Nr
         SlE3VNUbfUXJf+rFbi2fNhbCh1Dg9UqjyUkfGRYIi9O68v0FA2S4B8EeEX1LBUHniDtq
         rruTGXVnsOFAzhfxM18Ehizc+L2clcGPczJYKCMRSCC/hJc8BvcopEoyJ9A4CIhn4aMK
         8ljhHUBp7VQbrODFPyyNiC1yZNU1zMJJRRXZu4bpoi8VkEchmLaOMckLfEZsoe74Nw4V
         WY6A==
X-Gm-Message-State: AOAM532Tgs1ycR/C2BaR3b/U8v61XIoLFPEaBUeP1HlXYXNwnLfhBYfZ
        LFCf7BhtuGlhb+013EzxMwM/lQvSpjAuSd5jBeJuyQfa
X-Google-Smtp-Source: ABdhPJzgIN2bVZaY3oKtlIdAPDr+0ZVUWELQPcGC1FhKksYVNZHJ7McWrhS4NTz0PS+86hOn3kkX81LmTzT91lEJQTk=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr4381743oih.153.1608204285143;
 Thu, 17 Dec 2020 03:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-11-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-11-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:24:34 +0100
Message-ID: <CAMuHMdU8FrUDNs5y2cqdTPom0YC1O3HihTO1Lz_mASoB2WfdHw@mail.gmail.com>
Subject: Re: [PATCH 10/18] arm64: dts: renesas: Don't make vccq_sdhi0 always on
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> vccq_sdhi0 is referenced from sdhi0, so there is no need to force
> this regualtor to be always-on.  In theory it could help with

regulator

> low power modes in the future.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12 (with the typo fixed, and "beacon"
added to the one-line summary).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
