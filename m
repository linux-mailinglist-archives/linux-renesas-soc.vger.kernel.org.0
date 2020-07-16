Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB80C221EC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 10:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgGPIoN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 04:44:13 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39199 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgGPIoL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 04:44:11 -0400
Received: by mail-oi1-f196.google.com with SMTP id w17so4491984oie.6;
        Thu, 16 Jul 2020 01:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c43oANq6OzYmzlJxSTpUKdWNvyI03SAvrrJGrRoQ9Lw=;
        b=cEZMz1uqOpGjEqB/3ive611VHMZHjBmNO7M5uDdyUxnbqeDimNZ4da0WvKPPMWdZka
         Zgq0dqoSr9gsN3z6G2vWAM1G3VBGisoqThYGEnXSnnJlv1WHYl7nkd1Kzrh+nXHTU3Kh
         ea+ilp9nbLKCb1sKArTF6et/pZugGFF0wXbkEwuuSbjk2WT2KkLRAIfsoSufeRiB7Sk4
         TwcXGXeI0+PAlg1SfAjKNBv5e5JXz2WNAlnrcVL3HLo67f139nVdqC3ZB9KYtCJM+xb5
         D1yaIlMj/GzWm9O3/bfqgAy8fYTido+5C3eBPQdJaAqwKMM2gCH82zppbScrjmcMKINW
         Nnyg==
X-Gm-Message-State: AOAM532MUQ+1RZvn7XjiBdYatzwiz72a3DINWy3Y2KgnnkmNFA7LczJV
        xyPFqcgHWPm6MRVVhqvEZdw7ZlDoZw+dYYnfhSo=
X-Google-Smtp-Source: ABdhPJwNp44runSJD/wbft9WqzyuECnuZJT6DojqUYIfIs76R3X3bBHIwYj/c7l6O1oNa1zeCCJ71Siwmynt7kFgD8A=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr3066870oih.54.1594889050195;
 Thu, 16 Jul 2020 01:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200715140622.1295370-1-aford173@gmail.com>
In-Reply-To: <20200715140622.1295370-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jul 2020 10:43:58 +0200
Message-ID: <CAMuHMdXfTCDmKS88vSztdgvgTUK8-5+DMLfXbqstPGmO3QpJUw@mail.gmail.com>
Subject: Re: [PATCH V3] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 15, 2020 at 4:06 PM Adam Ford <aford173@gmail.com> wrote:
> Beacon EmebeddedWorks, formerly Logic PD is introducing a new
> SOM and development kit based on the RZ/G2M SoC from Renesas.
>
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
>
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a variety of push buttons and LED's, and support for
> a parallel RGB and an LVDS display.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V3:  Updated makefile so the beacon dtb reference is alphabetically in
>      order, made 'vsync-active' in lvds node a valid number, added
>      power-supply for the RGB node, and changed the versaclock on the
>      baseboard to state 'clock-controller@6a' The SOM cannot be named
>      this yet due to how the driver extracts its name.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
