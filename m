Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2343416D25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 09:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244467AbhIXHzF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 03:55:05 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:34479 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237965AbhIXHzE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 03:55:04 -0400
Received: by mail-vs1-f51.google.com with SMTP id u8so9159942vsp.1;
        Fri, 24 Sep 2021 00:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wqg5n6nab9ugsulRhXLiyyfabgAZjZq1ey/bukQzXI=;
        b=pjFo65XMRMGcdX/Juc8qACKvHbc6dOtXPRIQzOg9HDFVLGZTQyXBoV+Y/mLZ2zJxM2
         DXqK4Pqhic56BI3RMUuKSTm+OwqrmMINGWeB9GfXbGQNEb670TQYaAim50vaJ70SRiLZ
         kqJqdmVmBjGfUwHCSMlOB2fr2UgzKTGnCKWmJczkEv35pWS5eQYGqFKu8v1ZzoOY3ydW
         duukEopE4Rjy0ary5raUVdCrRTXhe4RAm1g3q9k103yOF+fv/Zb5VYa34co83ODq0ZnI
         OMZ3Oq1cv/mXEq6vHIOyHYkC+MdiVKHsoP8DoLT2Oqm0aXPjVE0JzT/ea8zcMmjgb4DJ
         S3Gw==
X-Gm-Message-State: AOAM533VuMkg+xmsVXIrsqIfQZWPMFwEIXQlqdHJ34/ey4gYuhU20V9d
        S1AjoXxDtgSuqWh/HxEThKIESzTieIMJCfdLl1s=
X-Google-Smtp-Source: ABdhPJx4OYDbkYO/nWsttSMQzSN5AuMDXx2uyCVmLLBQ+8EuzzgnWbMoiIiTvs0CBMpVEXHiXFiHDQPw4mm9Eom5BmI=
X-Received: by 2002:a05:6102:2086:: with SMTP id h6mr7963853vsr.50.1632470011230;
 Fri, 24 Sep 2021 00:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210921084605.16250-1-biju.das.jz@bp.renesas.com> <20210921084605.16250-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210921084605.16250-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 09:53:20 +0200
Message-ID: <CAMuHMdV+Jr+wKSFEyXw+CaGS9cD2PJ1yZt6sT8DVhwU5-MBpAg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a07g044: Add DMA support to SSI
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 21, 2021 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add dmac phandles to SSI nodes to support DMA operation.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
