Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2E9467BAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 17:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358273AbhLCQpP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 11:45:15 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:41505 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352959AbhLCQpP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:45:15 -0500
Received: by mail-vk1-f179.google.com with SMTP id 188so2218039vku.8;
        Fri, 03 Dec 2021 08:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oxKzIzNVZ/FGGznDKhbkXegMToXMDhvvLgfWv7RHK4E=;
        b=BEo6tQTtMdVpDAVMlfWrmnWC02vKzZTe9nooAgrAXp3ZzVUxUkaGN0bx+YqZ3xtuJl
         O9HeyTZpFiay4QgeMwmLe7cfQE5lNE/cn7t2nKM73BO9BbJKLMmsEcorsXaIjyZS/vmp
         m9CR9Gh7LC8Y6gQzcahsJ5TvPLzkk4ygQIbM3C23+EMW5OeOuZU+07uNmMuwfyoHiQrZ
         jyp8GvjczP8ulGdSieVmjRnKP4YSw50tlBKGNsaNyzA1c52L85DfuJsqWIC8SzwYId4+
         j6LOjjlI7odYTnltM39xvYaR48nY3aB7XIkHcP8V/ZKmvhZ38ltmPdaSGhU53XW+bxlc
         8S3A==
X-Gm-Message-State: AOAM533wrER/PbDTj+cW4ZkQALmptkUEPh0tD+wo8oo+D93SidwbFoVh
        JYhX7nfAjCVG9KrsCpJp/hASZpEILuLC1KlE
X-Google-Smtp-Source: ABdhPJwj/m6tycmA4MlrNAo+JR1MP149vLROi3z0l4MVO7p28jrmPSJJHOlLmuHDbZ68heKr0R06Lw==
X-Received: by 2002:ac5:c0cc:: with SMTP id b12mr24354611vkk.41.1638549710413;
        Fri, 03 Dec 2021 08:41:50 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id m15sm526066vkl.40.2021.12.03.08.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 08:41:50 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a14so6726146uak.0;
        Fri, 03 Dec 2021 08:41:49 -0800 (PST)
X-Received: by 2002:a05:6102:3232:: with SMTP id x18mr21980088vsf.38.1638549707224;
 Fri, 03 Dec 2021 08:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-11-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-11-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Dec 2021 17:41:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV78Ce1Mpi0XT6F9FCZ0BzZ7vfZcX--O5=TJH=5eYOZXw@mail.gmail.com>
Message-ID: <CAMuHMdV78Ce1Mpi0XT6F9FCZ0BzZ7vfZcX--O5=TJH=5eYOZXw@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] soc: renesas: rcar-rst: Add support for R-Car S4-8
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
> Add support for R-Car S4-8 (R8A779F0) to the R-Car RST driver.
> The register map of R-Car S4-8 is the same as R-Car V3U so that
> renames "V3U" and "r8a779a0" with "Gen4".
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
