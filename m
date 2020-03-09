Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF6717DDF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 11:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgCIKyU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 06:54:20 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44373 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbgCIKyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 06:54:20 -0400
Received: by mail-oi1-f194.google.com with SMTP id d62so9638914oia.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2020 03:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BMqxsizsmqHj7Xij98u5eyjufmYYq4an7Y1I22Ek/3M=;
        b=kwWhc+g2xqnjT5vDDggQKrx983ksl7ipXyh7w6/a1uKwMymsfJiY8LN7I5vtT+Azar
         fFRFZaUWtPF9eyo0T8q78zzjPlfWsdQGI0nNFyQ5q7uHJRZmj2SGul7VCwS66mxlOnsc
         1QkZ1b0WR/pfnP7bFtCCOmpd4QNiD3th72NCLxI51Ki1vCPI0A35F3OCjO8eqUoiOo0L
         fkfvMZ/89djw5z35VglFQpmAY32BuLiAoIVgY4hYw6+F8dMZOAagcEx9HJLRcQUHkBdY
         UcmJXkakjS0d3w4Rf6SIjSbZASZuN8zymphCbWZRUeaJ2IfrPVVbHTtpF72+NV8DT/re
         DRkw==
X-Gm-Message-State: ANhLgQ11LgPSUhQ+6Jn4L+7Vg43SKtVTqGN2ZfR1WupwQtdEPjWpiMDv
        y94RaCQmTFXu1msxC2h5rpYe1MjD+jRZT1gyKJQ=
X-Google-Smtp-Source: ADFU+vvMmO//VSQoo43IowiaSJ76SjlW5MZm6UO+XgnGYknfmR/k3USVvRHDu+yBkjQC023ismo9FRUiaX6GQ4YuT/g=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr10360418oig.153.1583751256638;
 Mon, 09 Mar 2020 03:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com> <20200309064425.25437-2-yuya.hamamachi.sx@renesas.com>
In-Reply-To: <20200309064425.25437-2-yuya.hamamachi.sx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Mar 2020 11:54:04 +0100
Message-ID: <CAMuHMdWYMTv9ccK00jQgNk9JT5_jTnVWjOuUrrwBL+nrPS8iNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: renesas: Add M3ULCB with R-Car M3-W+
To:     Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 9, 2020 at 7:49 AM Yuya Hamamachi
<yuya.hamamachi.sx@renesas.com> wrote:
> Add device tree binding documentation for the Renesas M3ULCB board equipped
> with an R-Car M3-W+ (R8A77961) SoC.
>
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>

Assuming the part number is correct,
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
