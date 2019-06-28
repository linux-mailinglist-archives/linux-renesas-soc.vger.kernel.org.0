Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19785A147
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2019 18:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfF1Qri (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jun 2019 12:47:38 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36574 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfF1Qri (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jun 2019 12:47:38 -0400
Received: by mail-ot1-f66.google.com with SMTP id r6so6630028oti.3;
        Fri, 28 Jun 2019 09:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TGn4lFERvp7M9+DNIvzZo/sZnI385yEo2mmoo8SI8gw=;
        b=OKmFYcZeVY1qufwnjiRK9GJmna4CPJFePP7vKMY+JqXzotM8j8yxTRdoxYF1HPBcuf
         6beqprqZv2Kefu6DxPCaOQiSj4QEy5rfI+GkLs7+fq8hqLyzmv/WiYPyTf4Eu9RS13cI
         xULFyy4NRIPVBgAy27gRV3ZzpdbFyR5aWLN15VccFN36JQxIb6B5bvVmVazTpCoBR54j
         oNr35WrLdZGoJPySl/lVkGOg1JjtRBKG3X4dJi1UztaXxtK6QOKe8WtQM1g89zEneUmm
         sLC6PjwPCvMKx/Xt9dm77i78MPe78hvVQ59skv43scI7wKExw8vpLSNT1of4tCl7tnRj
         yb6g==
X-Gm-Message-State: APjAAAX9fuLU/U9X4m7DbOVAB8slyD5VvslNj9I9tRtTS/zxjYfybIWA
        +MCESeRyb4ctU3wBNKy+4mqgwuI5Vufm/qA0v2M=
X-Google-Smtp-Source: APXvYqxqC6Dja4LQX98O/RoSg0LZDqZ2ELoCtccnWo+MyF+Ej0nuN5wwF+dIheiMti5oONhPBS4Q+9rH/YI8YJK4zn0=
X-Received: by 2002:a9d:529:: with SMTP id 38mr5455197otw.145.1561740457613;
 Fri, 28 Jun 2019 09:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190628153448.4167-1-wsa+renesas@sang-engineering.com> <20190628153448.4167-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190628153448.4167-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Jun 2019 18:47:26 +0200
Message-ID: <CAMuHMdUdscxTyFQpOP0SG65BpupvJPdLaeR3hd9KLzP7tFvd0Q@mail.gmail.com>
Subject: Re: [PATCH RFT 1/4] mmc: renesas_sdhi: keep sorting
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 28, 2019 at 5:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The two devices next to each other are super similar, but still, let's
> keep the alphanumeric sorting for easier additions later.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
