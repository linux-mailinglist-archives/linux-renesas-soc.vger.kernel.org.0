Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61FFAD906
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfIIM3q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 08:29:46 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42108 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfIIM3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 08:29:46 -0400
Received: by mail-oi1-f194.google.com with SMTP id z6so4799626oix.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Sep 2019 05:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uK2BB+wMPHk4rLA8o17Ou/32lIuk9t+RzP+x0Gm3MbE=;
        b=UbgSH/rUvgP50Mj02vdWOVQSP6DP8Zqzu+KIXmEuigqaDtUTzslMMqtWFYkXneGlC1
         ub7wHyav03IHOqVHEWb71e0zFnopCRHPi+3mLcVXJIVUvgadkluTTCd8QoZVIi6Znjtt
         srwYBZGsZtPpk+Lfkin/Ga0FLa34EjftDkJLYvowsUKl66R/HcdMIUvEtxGeVQNgm/E2
         LAeNSsXjtAE4Mmudb+pbOh795GRs+8u5TfrJTJa8TCqdcZzrvEHVhz9xbdxJtJ6JkDXv
         bUUqcVvhmU7uV+2p0fCPFiMjMT7xOA+MjDWKoz33oSnBIDCY3SAqXl9wbooWSWk4TVTg
         D65g==
X-Gm-Message-State: APjAAAW0UcXG69iBzaVFk/efRZyHeKQcaC8I8SxeHqnQ0XVSbOPFtpum
        i5TcM1lUBi1zWwnYZOiorT20nYAa/DIetAxfm6I=
X-Google-Smtp-Source: APXvYqwMEKe+uznGaBPgWuLpWM4KMEcmQZKYzZ6oAcXXIyWF9Qma71xRGJDTrnipHxABLXHrwyWdIUmXItOFMfpzAck=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr16301677oig.148.1568032185698;
 Mon, 09 Sep 2019 05:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com> <1567675844-19247-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567675844-19247-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 14:29:34 +0200
Message-ID: <CAMuHMdWaN=V6NsOeqFpfRERrc_5xbG6F3JEeBYr2zd3Go7YqXA@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Identify RZ/G2N
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 5, 2019 at 11:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds support for identifying the RZ/G2N (r8a774b1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
