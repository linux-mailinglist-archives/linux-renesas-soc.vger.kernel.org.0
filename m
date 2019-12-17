Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF5B122B4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 13:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfLQMUA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 07:20:00 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41292 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbfLQMUA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 07:20:00 -0500
Received: by mail-ot1-f66.google.com with SMTP id r27so13524842otc.8;
        Tue, 17 Dec 2019 04:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0U15JxqTWohe4GLhfwPMbmA9156s0i20ALyMdM/t43M=;
        b=PZfd/VIm/ZEAeC1vT5QTgtadoAH3VARjb5G1wyCu899S00I3QqpUmuUew7wtxuMEzs
         KGqcgQXwhCgTbt9Sqi/mUQkhfRLwjewTaL7Bsq7AfePOsznz6A8Hqm/l2sm7EVmEy/d4
         WdyCzeevQHnt9kO1lGe8X2oZNzsE+UHK6LULMFlALKSmk+CxpzGhNjJPclTpBILG1j8I
         KdUSBTwYQl+R4hOwMKXF2yMLN/96SW5G5T8Nyft3VaMwhfN12bE1PAgMM87ZBcRfMBFJ
         4SHHYg8EBBSCxIhu75hBs/PaEOiCU62SuPIi98gzwEffIhyToX4+KKAd3YXCnZ+6/j3a
         bpuQ==
X-Gm-Message-State: APjAAAXxlggpS+MZ7RDHPkb2aX28/n3ET8H6BZG7kHqOJ/vawBHczPo6
        E+tPuw+4Us2IKbPcEdV37SN+AiN8Hx+XH49Z68ZcWg==
X-Google-Smtp-Source: APXvYqwkdCwHahSuzYZ+Y81qKjRN63MiahQdOtK75IEiAYkiWMv9UXYUX0fqo59WGI8tjtR25Z+A2O3DlS1vzMShzgI=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr37395735ota.145.1576585199481;
 Tue, 17 Dec 2019 04:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20191216124740.16647-1-geert+renesas@glider.be> <20191217120116.GA11814@vmlxhi-102.adit-jv.com>
In-Reply-To: <20191217120116.GA11814@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 13:19:48 +0100
Message-ID: <CAMuHMdXoKN0X+pukArrnfeSs9vaF20sW2zaf=v7UX2WD6w4G-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: renesas: r8a77961: Add more device nodes
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Tue, Dec 17, 2019 at 1:01 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Mon, Dec 16, 2019 at 01:47:34PM +0100, Geert Uytterhoeven wrote:
> > This patch series broadens support for the R-Car M3-W+ (aka R-Car M3-W
> > ES3.0) Soc (R8A77961), by adding more device nodes to its DT source
> > file, up to what can be tested reasonably using remote access.
> > For your convenience, it is available in the topic/r8a77961-v2 branch of
> > my renesas-drivers git repository at
> > git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
>
> I only see below r8a77961.dtsi commit on topic/r8a77961-v2:
> 8e4529f2ac8293 ("arm64: dts: renesas: Add Renesas R8A77961 SoC support")

Oops.

> It looks like the patches are from one of below branches?
>  - topic/r8a77961-extra-v2

Yes, that's the right branch.
Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
