Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02A0AF990
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfD3NKI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:10:08 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38560 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3NKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:10:08 -0400
Received: by mail-vs1-f67.google.com with SMTP id v141so1137136vsc.5;
        Tue, 30 Apr 2019 06:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JmP5YZqer+G6WA8veaKczWZ02ILPF+TdPn0Cgq3lY24=;
        b=oxmI9w5Bjwi2+Ryk5DUR1MCLonA1BaE1F9YtEy3y4CF2UctEgHjTIfeUctRjFJQPaW
         OV6v6Wy0SUXPn7BSr3Bs2FZpIh+bRnKMdd01uciJMPE68day8Ao8KkUXAi24yLLljvQU
         qijltS0gDBSFrIpJzcHJObWSw+Tie3/HiHLoa4xqbUsTt3LIfFMcHjOc5skefbEILcFD
         26N6wWU0mmyKYUkDuY+jdGHTQIwSnu82bFyqZAC/93hrljPqdRHXAssDzznCVJfuHW7Y
         MseIjyv6CFFT/d3BvHwzb3TOYWOsqIj5fH98oK/6yt/wXE/Pb7XydQa0D1PsYizM9ads
         aQgQ==
X-Gm-Message-State: APjAAAXj/V8JQv3qTY57tVvYodZ1BMtPuhlCHLLeLQR2eMwKDmm4qCCT
        fxyCe2a4wKqjlTvTYEK8IUBNtUF9giipfziRbMw=
X-Google-Smtp-Source: APXvYqx0vwdYxx8vWiQocO6kVEfSaRD4UkV/MhiVodQ4V1vE/X9E+GzqemxhBhdKTE6cjEUFOc0Kl0Edl5pwoVdX+JA=
X-Received: by 2002:a67:7d58:: with SMTP id y85mr5533111vsc.96.1556629806892;
 Tue, 30 Apr 2019 06:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com> <1555428717-18376-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:09:55 +0200
Message-ID: <CAMuHMdVinMfepPYmVvwY_Ow-qoTH6_A3+7swJgMQ5FOzoMLAqQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a774a1: Tie SYS-DMAC to IPMMU-DS0/1
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 16, 2019 at 5:38 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Hook up r8a774a1 DMAC nodes to the IPMMUs. In particular SYS-DMAC0
> gets tied to IPMMU-DS0, and SYS-DMAC1 and SYS-DMAC2 get tied to IPMMU-DS1.
>
> Based on work for the r8a7796 by Magnus Damm.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
