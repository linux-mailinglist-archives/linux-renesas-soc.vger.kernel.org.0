Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCEB12A67
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 11:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfECJ0I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 05:26:08 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44786 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfECJ0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 05:26:08 -0400
Received: by mail-vs1-f66.google.com with SMTP id j184so3144945vsd.11;
        Fri, 03 May 2019 02:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D2j/izVEAHiOBXVwR1epsQXhLIoevn+z7mmuHB2OhOc=;
        b=eHBtFDoVrknS6JTAfbQCYHhN4062fwhYMm6sVcWSos3jEpVPKwCdNKO5xz7Oihz7GV
         7JrKH1CYzTZpz+v2j1ocrdkHJ/4J8FT6qNAvwt/pLpvmWqWHoqZ4ky8pdpWFNNDkFAu0
         CVWnoctIL3U2YtOWkEjruMfMWL6LnWZKFpLJaNFRsuMkoLudrnRvYW6Gw/Vvm+O3eVnk
         CL5fRilUdcJibjvzqAgPoOCtg3JiHH6Kq2jy1L7pQinJ8scxvGD4Wl8PnzscD5xwTP+x
         +iQPMaXTny8eELCbKWd+wIhbXalShTsb27fu71YHJRkekTY8ZwVYAdkVmPfNt3b1/Ch0
         LMYQ==
X-Gm-Message-State: APjAAAUTX0jPRNDPs5tmMRy+SZSYtYWTQB0FHKTIFcbz7ycyvMJDcEFj
        jOgr6Z2zKFFaUbtEJT56bjEPBha3dRrUN6mhb9U=
X-Google-Smtp-Source: APXvYqzpeu9wq2O/k4NiyD1crvm+g8+Sze+kjHO7dbXFBF3wtcReaukbD5Tu910iDcYdMl2452pg6R4Nb24kW19W9gc=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr4805922vsd.152.1556875567434;
 Fri, 03 May 2019 02:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp> <1556155517-5054-6-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-6-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 11:25:55 +0200
Message-ID: <CAMuHMdUQqPFywGYMRpuf7sUW2r7WbUhSgaGKsqpi_+bPyFNbeQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: pwm: renesas: tpu: Document
 R8A779{5|6|65} bindings
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 3:25 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Document the R-Car H3/M3-W/M3-N (R8A779{5|6|65}) SoC in the Renesas TPU bindings.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
