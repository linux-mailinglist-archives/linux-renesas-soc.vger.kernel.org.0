Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CC2B35D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Sep 2019 09:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbfIPHmI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Sep 2019 03:42:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44838 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbfIPHmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Sep 2019 03:42:08 -0400
Received: by mail-oi1-f196.google.com with SMTP id w6so7466494oie.11;
        Mon, 16 Sep 2019 00:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nP8TqS4UQz5dlTo75axjeefJ4XkRBuxdkx0AqHrxW00=;
        b=Ag6mI3RsiO9pU2fW28IOTZYhYdOE1cz8iA7QvPTaL4fKYdvWKlwPfsaPRLffSD8ENU
         uZN6eyLoIq4odw2yPjto/lm0RRAgHZK7dsnkNsAcfVr1uCxoCMXWpXyb88vPn2F2ekD9
         YjHGKsgHu+GUTGC0Ux3T/X2XensMKvx7VXeHNQIR6KTq2JiuSj9w4esoDlHiKDuco1Wc
         LfF6WP+F5WYOo3Ierym22Y/1+ZHcOwyAZ9YsXWLH8zc/RYlhSqmRy3/UkrgJXbLHfGGw
         a50Vy4n6mhB6y8X/RsXTW6aHFe8umE8uJNY6IQApHMUsEVKh2+WWWGAN3aEQ32JNSZdg
         c6JA==
X-Gm-Message-State: APjAAAUtzR4pmVmtPm2A80W5vUkVXzDG86MmoucebDosblXIY+ohUb60
        TZ3Sn3dONEal8etDTD3jumBQq8c8qs+fS3mWqOI=
X-Google-Smtp-Source: APXvYqwBbe+gYCi1fMPT4JY1DjQnjcQcm432wsyEGYCkEUpqiA/v0dWst3e9O2G5eKRRGZIVDzKYaQvWSmkmDdrb3wM=
X-Received: by 2002:aca:b654:: with SMTP id g81mr6545318oif.153.1568619727766;
 Mon, 16 Sep 2019 00:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Sep 2019 09:41:56 +0200
Message-ID: <CAMuHMdW7fWKvOEaL_w7uY+Soni5tO7sk6xYw-CpYFX_TgvbG6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0: Create thermal zone to
 support IPA
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 13, 2019 at 10:57 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Setup a thermal zone driven by SoC temperature sensor.
> Create passive trip points and bind them to CPUFreq cooling
> device that supports power extension.
>
> Based on the work done by Dien Pham <dien.pham.ry@renesas.com>
> and others for r8a77990 SoC.
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
