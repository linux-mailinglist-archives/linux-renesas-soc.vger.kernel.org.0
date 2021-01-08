Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994822EF372
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbhAHNtD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:49:03 -0500
Received: from mail-qk1-f179.google.com ([209.85.222.179]:35093 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbhAHNtC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:49:02 -0500
Received: by mail-qk1-f179.google.com with SMTP id n142so8462315qkn.2;
        Fri, 08 Jan 2021 05:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsWlo1zvyIlqHcMyjUDRI2wxTIK9nGJHgxOSincESNo=;
        b=mJmLzqms6f2t1q808VhY2IBbnrdalltuFU85fNGbEPWD0SHd0Nbm6sN8AgEC96//JY
         h4ePL58x9IJ6ldpW6cMke3yiQBFAV8SH+nhjS0fRyKU2smGxEM3DzmpouD6FzNtbAHvU
         n4VdlkbT6fgLXNRfIjCuXb9H9Wc3g71+m/dFObbFpGAUemoPv3VPX7lErpweMZ5on/c1
         J7IM1fW3riYfgO032woqav/ROqk/E0iUBMYtZrgUtMA+Y4UsQxIr/hSWtUu1FqV1gcYD
         e/NU7TXAIp7iHQIINCJFGY4UsCN+GxBGfctm8pnNCkOBg2c/2Oyr8PIgqPhBWyPhTfl3
         ntMw==
X-Gm-Message-State: AOAM530QivjzuE3+pSDYvM20qLgAOhEQ0Jz2iylzoKALJJFf3/o2pxue
        RjAb6EV8MUD9TStHZC1t630N3jxF7P4tDVLHVNDAnQrs
X-Google-Smtp-Source: ABdhPJzdxGzfJwat198rymz5ud2yr9A1pPdGTaJp4KL9PrpPBr6TSgOk95fSlc1AoTd30hb9iUOyw+Yhy6YytyFRY5o=
X-Received: by 2002:a05:620a:531:: with SMTP id h17mr3955686qkh.428.1610113700546;
 Fri, 08 Jan 2021 05:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com> <20201224170502.2254683-6-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-6-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 14:48:08 +0100
Message-ID: <CAMuHMdWE6XfKGdkAoXN_KMNK9ZrSoTTjLP6MN2j+1P5V-KmAPg@mail.gmail.com>
Subject: Re: [PATCH V2 6/9] arm64: dts: renesas: beacon-rzg2m-kit: Rearange
 SoC unique functions
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 24, 2020 at 6:05 PM Adam Ford <aford173@gmail.com> wrote:
> In preparation for adding new dev kits, move anything specific to the
> RZ/G2M from the SOM-level and baseboard-levels and move them to the
> kit-level.  This allows the SOM and baseboard to be reused with
> other SoC's.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
