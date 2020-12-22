Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2E42E07D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 10:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgLVJPd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 04:15:33 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39881 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgLVJPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 04:15:32 -0500
Received: by mail-ot1-f54.google.com with SMTP id d8so11341754otq.6;
        Tue, 22 Dec 2020 01:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9hQcQQWYWfh4ugI3r7QpSr3LPTc7eg3XDLNQrfFLpVI=;
        b=j0fgxH0hzXC3Oixe3fZkk89hA8YUTeSIMzYjPkhswQnVVAxxQp3VF9zgefgYK9oYYT
         lfQBEumvs6vkaGXJntWLndSfqUo0wcCyIcv90QXaFknJGlbYXlV3MJKg/WPzJvuP8uIP
         4wbbTFS9J2hknfoKxRrFRjBnaKdvg4e1LBk4m1jbWNbarwo3m/daJlrbrvE5Nv7cSdHk
         QsGTk/EWnoU665wHZdtABVfSwBbBEvjlEjCcCne6SEcyku8//o7YDAnoik4kL/WjqloX
         vAWN4VkewwV9wLG/Vs3UIl9lMB+pRD4vIqen+tgvtYBuYBWXGQpyb9Uls0RexKd+Pl1x
         NnyQ==
X-Gm-Message-State: AOAM533CK2pNPvPSFMCdefHEhK5BUyvWzT+YOCg5qgYUZLJfvfieqTwS
        iO52qq3LgdE8KvKqqfPYEkSNl/piS6G0uDcct68=
X-Google-Smtp-Source: ABdhPJzcNEKROIYpQs+xr1XfwyCvISZw+qx7IhhfaGpZjx6FEPrdiQ0hRk0sKQuU8bK3bFw+byuL3wAAeNudirzJEZI=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr486256otr.107.1608628491879;
 Tue, 22 Dec 2020 01:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com> <20201218173731.12839-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201218173731.12839-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 10:14:40 +0100
Message-ID: <CAMuHMdXZdiN5KdbzS3wB56pS1xe9kf0brs_i5bFJ0AbvOPFt-w@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: falcon: Enable watchdog timer
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 18, 2020 at 6:37 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Hoang Vo <hoang.vo.eb@renesas.com>
>
> Enable the watchdog on the Falcon board.
>
> Signed-off-by: Hoang Vo <hoang.vo.eb@renesas.com>
> [wsa: rebased to mainline]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
