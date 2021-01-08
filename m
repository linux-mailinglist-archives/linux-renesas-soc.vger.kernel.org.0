Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF6C2EF38D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbhAHN7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:59:13 -0500
Received: from mail-qt1-f174.google.com ([209.85.160.174]:35686 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbhAHN7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:59:13 -0500
Received: by mail-qt1-f174.google.com with SMTP id b9so6547151qtr.2;
        Fri, 08 Jan 2021 05:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z98Cd2/q2vk4PKmNKdE52oNoKy4mQtUfKoV21d500nM=;
        b=eM4wv3vfZarA4M7cY+MvLt+wOUvydnmBRibqEldzzPOnLzXEzomCI5gGbDWmbX+ggt
         r609hus830OkAEXtlHJaPiRSyFbm7l07DOmqkG8KI32zILIDXhlAjrC0K0a8s/RkGseL
         Tj4WaDfiHkIVYwIYkikjHUqGakOoh6U9QuVbJnwJ/aMIXNEbsE5OAVvPdbry2fQEYUkz
         oLXHkysx+DtN7hFEdVRTalYHXuSG/1rMLGCzAaewkit0Z+iudi5TC6ahi4zX2FqonxnG
         EiDW1fkTXF53UE6pOw+Lo9XSAvTAiyZWkwglyul0dGc4RbEtrkrYToF4AUd0YHHIRprI
         qlKw==
X-Gm-Message-State: AOAM5300KUoscMQyKr6b327ohrz58RH8B7YRQvDJC1VHV2gYd8tn/7Dd
        MzILsgVFXIYsf59MbI3mJwIft0tP7m42UHG7430=
X-Google-Smtp-Source: ABdhPJy8s9cWkWVLvubXL5qgjHOkSLPTugK2fgLodKBV0ctBtVEj6eKy4znHg0OLjA1BM+hHQbhcpvj0KvBtL8mvrn4=
X-Received: by 2002:aed:3064:: with SMTP id 91mr3495946qte.151.1610114311781;
 Fri, 08 Jan 2021 05:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com> <20201224170502.2254683-8-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-8-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 14:58:19 +0100
Message-ID: <CAMuHMdV1TVJyTGcLbYd=PK5FL2qKUQSKBPnZc7+jdF6pqn_=aA@mail.gmail.com>
Subject: Re: [PATCH V2 8/9] arm64: dts: renesas: Introduce r8a774e1-beacon-rzg2h-kit
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
> eacon EmebeddedWorks is introducing a new kit based on the
> RZ/G2H SoC from Renesas.
>
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
>
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a variety of push buttons and LED's, and support for
> a parallel RGB and an LVDS display.  It uses the same baseboard
> and SOM files as the RZ/G2M and RZ/G2N kits.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12 (with the company name
typos fixed, also in PATCH 7/9).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
