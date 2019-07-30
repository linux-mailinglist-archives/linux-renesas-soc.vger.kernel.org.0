Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C04B7A352
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 10:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbfG3IrM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 04:47:12 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41826 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731102AbfG3IrM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 04:47:12 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so61599056wrm.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 01:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXZ8F+/pdkw6+4mstV+IqTyMZaGGWzvH632IwSh+5tY=;
        b=h8DnwP76TLif7GE27UPPtk6Pzrn5durXENEebK8xOev4HWTHWpM6yL5J5P9dyF0YAK
         40zbLuk96v5QYHfS1cqfETUCa1bsIQU95AGpGVa+iDdIBx6nwp8huEkt5Kh2praCe70C
         0EiHhEQvN/aI3W/m84Iu9OsnX0PXIhSV4CP0pVMlbN/ez9r+x0oFT6x9l3lvBXBlw7oH
         y8ku9bsxbtu6b5AdU8lDiNUYugiAkZT5Tq/uwFPuUdPp0+F0OGRr51DMcpLAJ85NmMfo
         FmIZaJu+gpiYLejtzTclCjcGrZLMQS+b0zmfFfpeG0sSyZGxFiSJZVhsobF3DgCUYCt9
         NmvQ==
X-Gm-Message-State: APjAAAW/7LkKDjVM3FdNgwfxtyH8WWGaTALM9wQMb/8tzPJI5TxmHB3A
        qCRQy9SWlypIZAow549vSsnDFN7N7ojsXckDVYKIDQ==
X-Google-Smtp-Source: APXvYqx3uOX9bZRHOS54TKu9DFrgudYYDsQGL1bQnJ2QjpiEcvGuqielw5CNQ1GjKe+IwRjU1W9wT5ysCE9ax/YUyzQ=
X-Received: by 2002:a5d:4b91:: with SMTP id b17mr6154861wrt.57.1564476429831;
 Tue, 30 Jul 2019 01:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <1563461006-19658-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1563461006-19658-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Jul 2019 10:46:58 +0200
Message-ID: <CAMuHMdW+pyis2DqgJj6Q-1ngwos4syeXMCSF4xTYMhNq8Og3Xg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 18, 2019 at 4:43 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
