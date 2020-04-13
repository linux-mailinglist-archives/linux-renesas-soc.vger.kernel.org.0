Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C131A6457
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 10:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgDMIyQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 04:54:16 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38322 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgDMIyQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 04:54:16 -0400
Received: by mail-ot1-f65.google.com with SMTP id n8so3024770otk.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2020 01:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BjiJzoZw/Ff1iUh99dhlxKn3mP4XQjEFtQNqF4aO3as=;
        b=C+va6tEIFSMMH40H/SdMJjd8HNJ39eSzKY4IUt3BVxOFl4sZCqLk1M93Ndb3P0HrU2
         XVy33S5Or8lt7EFKObMKfmOH38vyJWYqEx3oWpi+sn6z2A6wqQKQjIg99HBOPedaDcBx
         ml7omE5TIlkqzLajgHZ5AkENObLCXpQ3081+24w0kJESsxx+0sBJJwflvvH+mzA+V+RK
         T3EXYKtuFe9sdHwuYaOaauFqdAyBiMQdb5yin0gam1MLwNr0Gsl8xM3+KLQsC0Lt7NYF
         EUNNZEAXdiG9n61xpxk8dPCkeVmAsWS/KBn3AXlgZG3qYNUNCfsQzlAfn4UEa2MmgVKt
         0RRA==
X-Gm-Message-State: AGi0PuZiGu7JaxMLAPyIXzQdr/rXfhcNrNzhzgcuwNuMaiEyWcOcyjp/
        ehdtpTeivBXFs2PAwlq2pwBKHkxBOSv1VnrqqjI=
X-Google-Smtp-Source: APiQypJHX1Xqfnth8zv9icBt/o0Rae1Y5ZVg1wAfJOExrQAtdL82SAisdRw3iTN/gbS1faQpgDyudKyeHs/z1qcfS8A=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr13195294otl.145.1586768054301;
 Mon, 13 Apr 2020 01:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1586515634-28095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1586515634-28095-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1586515634-28095-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Apr 2020 10:54:03 +0200
Message-ID: <CAMuHMdXmN2M2==FNOxfrA0k8jYKyTCRX=qxDXjoNGXE1Rgi8aQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/2] arm64: dts: renesas: add PCIe device nodes for r8a77961
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 10, 2020 at 12:47 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe device nodes for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
