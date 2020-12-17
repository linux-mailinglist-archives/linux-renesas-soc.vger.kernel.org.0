Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E868A2DD098
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgLQLl5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:41:57 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:40740 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgLQLl5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:41:57 -0500
Received: by mail-oi1-f179.google.com with SMTP id p126so31802237oif.7;
        Thu, 17 Dec 2020 03:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WRI/yodUSsUQE0QeZgWG+nQyttn6Dry6H11MB1crvno=;
        b=b9Le1k3rqRioaMz+cljBnrh23piaOxqwctkPeN1TxzH59AQBLIoJ5i4ybP2B7JqtL1
         GGL/8Mq+7S4VyCvunkWwoSzwrGlYGMHilFh3pwKulEME2P4XytpMGzOyLuQ87dUmEM3n
         IrnxgTF4tQsBJd+QXjJDAj0V694Yes5iXQw545PcJm4QRKPizmguOKhpzBpWRTOc3Egp
         vx3jsCJ3cSAMWocEmgIT7v+qzIiyKTufEjMItJWkKNhto6+UZp+SrZFQZwOWSRMbu6BP
         agNzlquL473Y8poQDgZFswpXG9gRUIj9VGkwlOerNsQs6ASU/aQOVlyvXyKIILiNLm1q
         D5QQ==
X-Gm-Message-State: AOAM532qTuKSNfXVzwiIf1nMoNcYmjO77t80DEEkoK0vCSUrf7kxMg4n
        /teqLv0MdNsk11Skx/+5s8aHhtW2l1EjDAtN0PA=
X-Google-Smtp-Source: ABdhPJzBTXakQNjeeS0ubjK1cVKWQKmOyHKOENP9yHHfNIQ/MmLX7f9IBS3QYPPM7mYlwGlK1u/pZtrU+XMTaELbjM8=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr4530352oib.54.1608205276390;
 Thu, 17 Dec 2020 03:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-16-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-16-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:41:05 +0100
Message-ID: <CAMuHMdUjaqWE9GmW+JuxHjUJe4XvB=AtgBv_kFtDomHTwF7J-w@mail.gmail.com>
Subject: Re: [PATCH 15/18] arm64: dts: renesas: beacon-rzg2m-kit: Rearange SoC
 unique functions
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

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
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
