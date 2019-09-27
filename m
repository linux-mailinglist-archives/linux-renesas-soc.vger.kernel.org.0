Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0329C0474
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 13:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfI0LjN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 07:39:13 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37184 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfI0LjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 07:39:13 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so4917427oie.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2019 04:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFIeKehCcCnyqHTx/a8NY/j98j4ze9OA8lNySRYKaLY=;
        b=ISJxzoSCFAEVoW4+7v8lxInP7P1f1YoAfJMS4l4VR4Jbhm7DYKXUYycwvLqooFju8o
         0P5YunMMZpU4rO/TY3FdrBvvehd+SNkXwy0VuIZ9WMy9ZxvxkAYrlEX9rklVAsOdd6sn
         Yx/1jhJeaYw+j1WNbrEb36uysGgmx18MPuaxDgfu9CaYcI+ay3Xt/tsILDYvBjjrwYy/
         4rg/iIj5n2g/0XWOtgC6wV1RKm3FrqnD9oneVYX83CTU6mGEbPVZ+LtJL4IMao/wJugc
         6sQax64EH83YTe++3SPbtcYR6OruS6DqHP9UkVEP05vMbZgvb+96uCe/1e3Oy7xDeL0x
         meMg==
X-Gm-Message-State: APjAAAUiDEqsfGRK81Z95kaft5Otici4wzTG0T/bZF6VA2K284tzgvZY
        QYoTXWQeMfvLxxsJUn4kE9MYbuRlw34hUaRBvXk=
X-Google-Smtp-Source: APXvYqzIbTzTKnKRbLCmCp291spcvyH2M5lWRNI2kfJsb4ZMf1aPCZiuLO4BzeuGr54c2ibpvs7ospnn6BgWaLHlmDQ=
X-Received: by 2002:aca:f305:: with SMTP id r5mr6403681oih.131.1569584350618;
 Fri, 27 Sep 2019 04:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com> <1568725530-55241-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568725530-55241-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 13:38:59 +0200
Message-ID: <CAMuHMdXd=Jzmz-k4KrXF=ov=YqGtGmPBkxCCGDs_tFC76+cY_Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: renesas_defconfig: enable R8A774B1 SoC
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

On Tue, Sep 17, 2019 at 3:12 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Enable the Renesas RZ/G2N (R8A774B1) SoC in the ARM64 renesas_defconfig.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to the topic/renesas-defconfig branch, which is not intended
for upstream merge.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
