Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D2C1E1CA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 09:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgEZH6U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 03:58:20 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36120 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgEZH6T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 03:58:19 -0400
Received: by mail-ot1-f65.google.com with SMTP id h7so15588562otr.3;
        Tue, 26 May 2020 00:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SQz/g1UQo2PLzZue916rto+4fVizs6mX0h0IORmeiK0=;
        b=BMpO/DQPMIDCK5RSnRFDmaVNOlR8KrVFFMYvVFSsOsyWOhmRcfvNHwszEFap24xxQj
         3vzHMuvCKdmkUlqp1fkNEUuA241d2qQzXSrTHjiDnfsSLxaQIBT6lDTrEMQX0tAL/z76
         lgXfENByj8urcYxrZg6o4HK1PaGQ3dbT+b45XoLia5ik3Ig0zD/uVohTq7NbJUqT6MQ2
         ov6h472GwXJcReydSrV0lr1onsQNj7+/zFfHk3H/MeUBnaWTACIbSgh9kpeCErSY0lpe
         AQXBxTOJrzrhC/4RkwfzbI09cRRzwup29CEZaggNuFCCVuPcsmFXaSWWgDIrMT5B/lBH
         KF3A==
X-Gm-Message-State: AOAM533HydBs7iDNDMZEyA0ZBLQgQUJdUGnloVn397hJVaiyMQgeF10j
        +YHKwGezA9IZK4bGQb34XIl8Q2jp6R2CnhGmR90AvQ==
X-Google-Smtp-Source: ABdhPJyuK6xwILTTOZRjRZdK8dk8+wKmTSvqQijuIOWWRVWKbQR78bFQXvGUvPSmgY/YJKHrRp9PMVfS0D5qbVByH/g=
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr22222885ote.107.1590479897644;
 Tue, 26 May 2020 00:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590420129-7531-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590420129-7531-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 May 2020 09:58:06 +0200
Message-ID: <CAMuHMdWjGX43EDnwxu0xp3U7aedWHuW5MLQo==1d5v_mV-1R9A@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: r8a7742-iwg21d-q7: Enable SDHI2 controller
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, May 25, 2020 at 5:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable the SDHI2 controller on iWave RZ/G1H carrier board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

BTW, perhaps you want to add an LED trigger for SDIO_LED, connected
to GP5_22?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
