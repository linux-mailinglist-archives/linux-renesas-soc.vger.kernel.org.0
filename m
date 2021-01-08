Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0646A2EF3A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 15:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbhAHOEg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 09:04:36 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]:36119 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbhAHOEf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 09:04:35 -0500
Received: by mail-qk1-f182.google.com with SMTP id 186so8488709qkj.3;
        Fri, 08 Jan 2021 06:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+kCGux/omP1yI0EiRCQI0501K+MWPCXiGLds36f5I4=;
        b=RHPQe8WNABO3NZvKrOLaduFuY1Oa/eUVtZAP5nquYzd7TKYo2sZN5O0EpjGVTxmE0v
         tRWsiBNhn6sjJ29BSLnCUF9MAvgbGA8Us2cV41LVqoOCDF1eqrY1gGXCAPBHcdimdLcJ
         021iyxxN/ykh0zfDP0nLIeISVXy2r1dADt8CWnNSkCufETOl3m9SokpnrRW95coszous
         Jc1Y0CypufBfFD8nUsxVBClosYc7G5rLElWPu2o1pG/tqcH16v2ohoPBslwlZLB0OvxL
         qHhikmgnxog+HoA3MMw1FKkO14gcY5fnn1uCL4ZmES4eAHSf/qfyO+DRdGigW70BEzN2
         Wllg==
X-Gm-Message-State: AOAM533KfDFY2mnLMm/KKqKGbZHusDy+PrOtTnjWRLISbqLtRFAINce4
        miTO0fSUVdhEqN8zUtTBH+AhtmMwFiIHZjMO5YA=
X-Google-Smtp-Source: ABdhPJyzW+xd6B5A8MnR8V/ADzgjDX4F5c8RBsc79VqkeGnSeZA3MLKbo147FE7JDREZ21KFVRdD0jJUI/4jHflFzG8=
X-Received: by 2002:a05:620a:11ad:: with SMTP id c13mr3866619qkk.134.1610114634225;
 Fri, 08 Jan 2021 06:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20201228202221.2327468-1-aford173@gmail.com>
In-Reply-To: <20201228202221.2327468-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 15:03:41 +0100
Message-ID: <CAMuHMdVqEZQj8E_ZhS3G4hfLxtKiFG0muKW1+wu5oxyLE2UKeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add
 support for RZ/G2 M/N/H
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 28, 2020 at 9:22 PM Adam Ford <aford173@gmail.com> wrote:
> The datasheet for the RZ/G2 Series show the bit for choosing between a crystal
> oscillator and an external oscillator is present.  Add the bindings for
> r8a774a1 (RZ/G2M), r8a774b1 (RZ/G2N), and r8a774e1 (RZ/G2H)
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
