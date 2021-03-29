Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA21734C51D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 09:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhC2HlN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 03:41:13 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:42629 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhC2HlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 03:41:01 -0400
Received: by mail-vs1-f41.google.com with SMTP id b5so5917283vsl.9;
        Mon, 29 Mar 2021 00:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvucXyZIiF5l7X3LSpV4S0alfsgQo0dfn+ISLlJ3Rxk=;
        b=I+/f5bg4m77bgSg3BcRhk3C/PLLpILTKQdjCG1ydyCJBkplyO1xZ6VohgHEMpgDdtt
         sKL9b2xqRDWD9n6SJ/EgZFXJ6bNAsGNeiR2PBggY2IXHfVz3ohgNeZMDkh8YzJLkxc5R
         iPSztMwRj1v8RKf1972H5GbYHKEuvfBNWwtUX5llJjsm1OSdFH2aJR3+RUyIDYO0EBuP
         /llgkK0EfPqoJRWOxwj3BcTssrwYyxWcHlqv9d4ub+SmrX3ugBjmz3+EngQHHGj3feTA
         kXfWuKhFfBQAfs6FKyz0wb8M01OfbHU027asfmTW+tJWoSBzHIKfP2HTjmOku5JNbqcN
         PzGQ==
X-Gm-Message-State: AOAM530FmZFRGKeGxWsSgS71qt87ekJllNXDTW062OnIkbEUqc9v2CM6
        7leZTYGnpsPhKTzmRCi1u2ou6ut6By8myd+aGracFXl5
X-Google-Smtp-Source: ABdhPJxfhfk8pS9GfNI76dcLDeJe0ZDV3lU+YFGaB/JcfGajWIDmLLyYqEe1Yll0N6XAsASIKXoS4KzFCb0DctMSQmw=
X-Received: by 2002:a67:efd0:: with SMTP id s16mr13945819vsp.3.1617003660893;
 Mon, 29 Mar 2021 00:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210322172919.1154686-1-kieran.bingham+renesas@ideasonboard.com> <20210322172919.1154686-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20210322172919.1154686-3-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Mar 2021 09:40:49 +0200
Message-ID: <CAMuHMdU0tPay7VmP23PFxG=5peYgVLZdYEtEbUbaDh9b7kobgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a779a0: Add VSPD support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 22, 2021 at 6:29 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Provide VSPD support on the V3U.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
