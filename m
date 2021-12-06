Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D99D469405
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 11:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238138AbhLFKny (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 05:43:54 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:40547 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237524AbhLFKny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 05:43:54 -0500
Received: by mail-vk1-f177.google.com with SMTP id 70so6422335vkx.7;
        Mon, 06 Dec 2021 02:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x8M6DKGiJQl4wt+U44sFRJUGtxP6q2E0Ba6s5zJjRBI=;
        b=fSpgYtheDnSBL6wXIEyL2wgDGmTuPel199fX3/PMT0GWZrbNMFGrita/s3MuHd+DV5
         DBSvlbY9moUwVbCcLWQCXqYSIWxOGgd/nGYRIR9oVbg7tN4qUnnNXi9I/FYwrnoUA4nU
         83fY68jd1EVEBJ7wmRf46+38KcaKxb48hxuMpXCZb6Qt6l8zvlpLEEFMO4SJ+daYiEB7
         xCcfmtgWK0ax+k3os6zSfpUYoJCD3ZC+ASQOfNon92vjjXr+xzXzZo50vzvNCOAqX8qY
         pfHSVIagkEerHx8W8uX3jQPia9RAvEOePeLaMoz0sIfdoUq1LydO5/GsQeumuw3vdYhd
         SyXA==
X-Gm-Message-State: AOAM5305ypzez1nH+MgBJRmeyycCaZ8/wCZs6+nmJL7v6bLt+oWlf1yv
        UuP2YhWoE2UT9TYvcg0CPOVCUWwxQBAOIw==
X-Google-Smtp-Source: ABdhPJwmo+jR7bdILsSCtUHMJCZAInoSshVUkFI2pLV8OTJd5LYaIh+lI167p98jrU/5J8tPhfEK0Q==
X-Received: by 2002:a05:6122:da6:: with SMTP id bc38mr40663233vkb.27.1638787225178;
        Mon, 06 Dec 2021 02:40:25 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id h10sm3765846vsl.34.2021.12.06.02.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 02:40:24 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id y5so18522994ual.7;
        Mon, 06 Dec 2021 02:40:24 -0800 (PST)
X-Received: by 2002:a05:6102:3232:: with SMTP id x18mr34649518vsf.38.1638787224688;
 Mon, 06 Dec 2021 02:40:24 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-6-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-6-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 11:40:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXz8UpJsFBNX_FvYGubD=u7yg66VSoWAqd40H_Y4FN33g@mail.gmail.com>
Message-ID: <CAMuHMdXz8UpJsFBNX_FvYGubD=u7yg66VSoWAqd40H_Y4FN33g@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] soc: renesas: rcar-gen4-sysc: Introduce R-Car
 Gen4 SYSC driver
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> According to the official website [1], the R-Car V3U SoC is based
> on the R-Car Gen4 architecture. So, introduce R-Car Gen4 SYSC
> driver.
>
> [1]
> https://www.renesas.com/us/en/products/automotive-products/automotive-system-chips-socs/r-car-v3u-best-class-r-car-v3u-asil-d-system-chip-automated-driving
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
