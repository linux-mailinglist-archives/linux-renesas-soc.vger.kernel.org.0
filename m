Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE6C9C0452
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 13:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfI0L22 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 07:28:28 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36361 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbfI0L20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 07:28:26 -0400
Received: by mail-oi1-f194.google.com with SMTP id k20so4899733oih.3;
        Fri, 27 Sep 2019 04:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJWp2V6Xz4QA/S2clbdlrdbmCGKBJN0sVc4Dlr90USc=;
        b=q0W+DplEtfVY+hfMvwnhonPGP1pLpXibpwQSbmHTnJXq9biMmIU7TU+gug9c8JSItr
         kGutTGBi1blbqTH/V+0zoNv7jus6cgCKBfvEn1WU3DLslRQeT19Uh7dtJKCBNrMK6OP0
         CWrIu8D8EToGioBFMm5aP/9wDu4P4fz6QoV27NFLUCh9W7Gt40Jb9GtwgAtF8nFZH9nx
         xUXGT8p2R35apRDdtCMgTN69eJIvcFsD3Ts7kzpaeU7ZXsTSziZd4E+q+XZkETLynOLv
         0e2vLrRxMLjMhkrfFPpMI0GIjXdRttTK4Z9TR+sIApYjj1SjwdWlbwFf1wXprT0bPluU
         pNlg==
X-Gm-Message-State: APjAAAWweCQjsTDcnzYIH9LQRfcNvYghZpox5i/anoVRKjuT8fr5lB9y
        CmlnajwGybEl3a+cUla5M0MDEQvHpT3EtFSChTc=
X-Google-Smtp-Source: APXvYqwU+RgtK2Fqm+qawKtG55tqgJyNQcDrsjZSPplXBY7GHuEyU6oOsLQRfRPQGhyJH7xF+1wrhCQQBcukMbdaXHc=
X-Received: by 2002:aca:b654:: with SMTP id g81mr6331878oif.153.1569583704438;
 Fri, 27 Sep 2019 04:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-7-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 13:28:13 +0200
Message-ID: <CAMuHMdVckNDikQ-yGLAVCDZYFboFfNcRLY8-DWk0vvUb20nTTw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] clk: renesas: cpg-mssr: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add RZ/G2N (R8A774B1) Clock Pulse Generator / Module Standby and Software
> Reset support.
>
> Based on the Table 8.4d of "RZ/G Series, 2nd Generation User's Manual:
> Hardware (Rev. 0.80, May 2019)".
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
