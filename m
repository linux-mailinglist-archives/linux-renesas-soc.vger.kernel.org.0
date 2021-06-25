Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A093B45A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 16:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhFYOfi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 10:35:38 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:37764 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbhFYOfi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 10:35:38 -0400
Received: by mail-vs1-f46.google.com with SMTP id x12so5546513vsp.4;
        Fri, 25 Jun 2021 07:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiDp8cJzuqGXEB1Ji9UdeXFMz7K8bhTo6qSIlkHmNF8=;
        b=GvCfVDASMNVStoV6r9aqq5R2h/J87L7glBK81HB2XV6csPVp5yBmmVU5LuJ3dZuwx/
         Sbua5tNuT8uRFNTK3KzjpbIYLNHOg/aG/M8l9BCU0nRrnyObgIvsp2zoOOTuBevDw64h
         1WJwzRha2oWfSaiIWAKGfC3G86rd1l5fsYRqAUiFIRH7mbIa9/LtmgGeierDOBbWZRML
         WWJoThqUf82Sqbf3kk4raH/XJZDlWcvDaXGRjXWME3mRqwDttGaczahaz5Fqc2ExCj3N
         NBFuaL2Gvsb+XzCL+uILNooaASiMmPSExbA1tufO5g93X/ANpwDCYGsQ0DkQ0flrASAt
         Dnbg==
X-Gm-Message-State: AOAM532d7czR+Ukug49jReS5QGDdEUGp7LF8fiL8RXgYfMu+dYDcrqQO
        t617nawhk6kNkCjk5zv6+imEipYqX9jHKwDkD2UYSsAsReg=
X-Google-Smtp-Source: ABdhPJzkcJCoxq7E/dLmPJ7twVgd73NXJM5L2VffOvTASzo+PpQeEK5Usrs5iNAZpYzB3ZMMBmAPCyCeNRq3x2qu2MY=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr8841468vsd.42.1624631597068;
 Fri, 25 Jun 2021 07:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 16:33:05 +0200
Message-ID: <CAMuHMdUsafVJYkPootZePnAE1kc+PangJj-t6yNZM1OvmaZNSQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] drivers: clk: renesas: r9a07g044-cpg: Add P2
 Clock support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 24, 2021 at 3:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for P2 clock which is sourced from pll3_div2_4_2.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
