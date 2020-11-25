Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92032C44CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 17:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbgKYQUx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 11:20:53 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43919 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730519AbgKYQUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 11:20:53 -0500
Received: by mail-oi1-f195.google.com with SMTP id t143so3384105oif.10;
        Wed, 25 Nov 2020 08:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Huw32chi5P5VjAcJsOcLSlevzOZKJhD9SsYXRw3yGbU=;
        b=Q+mNbGC05tvVzIPr21z0vx0z3D/UbhEZPJF4uhgFgSm5qs4q45B7uSwA8CZve3t6Nj
         CXvzngohUZtur5qmz8hkyF2sPfIIyfXvjxN9FXN5ftC8MFb99RnjZwW/+5oUsQ8BSh7y
         V0JCNZJ/EBP75znlg8RC0k3iodGugA+nbGS2ZGKZ7L4y1EnPkeTuoVAfIvH+i+caatnx
         gsGexRCHpJ/Zf5v4I0bIY5lO2mVxhmkW5ImN6+f8nieSscWHA0E6aOd5VESmqAasRwU/
         HIwwaYTVYhUYm6EnKYKrk9NYRA/FsGZ6UVzvFZBiXC/+adOsg4TZQF+ZpFjeN/Eku7XD
         3MMg==
X-Gm-Message-State: AOAM5321hW0RrBJKY32cYo36QEYsQsSz4QKqjvglhlL+1H7OU70ZwcDL
        ORVaXm8z1nt5nGYMS7q+rZNbFqWDdw+J9Y6JN94=
X-Google-Smtp-Source: ABdhPJzty1xjUNinH+bl46DH/PVyMzhTfXFspSx0NTJi2beW9TOPs7ZsC+z1s04V+lPDq6I5BSFzDDf1HZAdO/xKen8=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr2834529oic.54.1606321252286;
 Wed, 25 Nov 2020 08:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Nov 2020 17:20:41 +0100
Message-ID: <CAMuHMdX+FZjAfbWWw53EToHP6c4JFmQX9wogAyW3OcOxHgMd0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Nov 25, 2020 at 2:02 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch set enables to connect ov7725 sensors on iWave-RZ/G1H Qseven
> board.

Thanks for your series!

Do you think it's a valid use case to mix and match ov5640 and ov7725
cameras? E.g. connect two of each?
Or should all four cameras be of the same type?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
