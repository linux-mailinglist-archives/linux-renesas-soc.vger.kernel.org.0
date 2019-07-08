Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C6A61F2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 15:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730918AbfGHNBl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 09:01:41 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44976 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfGHNBl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 09:01:41 -0400
Received: by mail-oi1-f195.google.com with SMTP id e189so12439654oib.11;
        Mon, 08 Jul 2019 06:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T3XPJxTT3Dvt4jElTyeiu9x0dJjghihvSuLu/Ho1cgc=;
        b=cb5ikluCY8e8/5awDbNJf4Z72DWeTLlXu4wRbWWsMz11u6ZShMQ8SkxBcK4NK5lX2A
         aMLlmZ3mT7XhxVG48/YM5kcrCCqS6I+JLtUhD7rY/CYbc+ABL4sjz892wWpfvHLJxwoQ
         WefC9MUWTTTvP2K4BNUgWTIA3gUWqNYEKzK3dU0no/ifr9B07VNCmieFUa5asKvXCh0U
         yS4bD0VUavXO/QKn1yTtNk5QTYb+OJRzwjg2VtOd2OvEMakuMrRcQ4sw0DQ1OuG/10Tr
         uAotBRaWa8pYiJ8LyTa1+hOUj0Dt9oxPEHf4s2XiqLimx5TKRmIpeInhKiCMQFs3hKKL
         /seQ==
X-Gm-Message-State: APjAAAVwi9sAH4m0L+KYMH++phqSo358u1kijz90c57TXrrv/fImc2FS
        0iZrqKF4Nw2tMsdEKwLpyQnD44+07VscLSa8BGo=
X-Google-Smtp-Source: APXvYqxsVlZygjslE8N71C+XOGMO7/jQXqhSrFAiDESzcTVjf0XqbapoEjjE8J+JtqP4DdmNz6tmc3avNB3rEtn0Vek=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr9099417oia.153.1562590900082;
 Mon, 08 Jul 2019 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560513214-28031-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560513214-28031-6-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 15:01:29 +0200
Message-ID: <CAMuHMdVR8WP=8G8ZYmdd675jvx0nyh2iramyFqCuR-v6a_QF0g@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a774a1: Add CANFD support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 1:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add CANFD support to the SoC specific dtsi.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
