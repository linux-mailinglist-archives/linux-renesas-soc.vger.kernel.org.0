Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4314268AC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 14:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgINMVh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 08:21:37 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:34666 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgINMUP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 08:20:15 -0400
Received: by mail-yb1-f194.google.com with SMTP id e11so8550848ybk.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2020 05:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f1Xvnib1KAvoqjyhzUrY6wqtD7BsCds6nReVVkX9WQM=;
        b=m+X81XQqEIt/MbGq0hSPFWUZHzLl30jlKSV1uE0bfcj+qys//IDFgpG1fH1RkHZAEq
         5q/vJYLDHC3vNOr9leH4gv6zprtJtrUe5VtR04SuKsG5Uwzl0URJcebMVF3lOivAFst1
         Yu8m0o4WtS2BK/5DUUzRpsDOEMu2lmDy7vT3wz0NjJXCfVyvwAdyWfFGne8xtr7+bJ3r
         4LjAwhQwYSCwsQAhnotfYRjFMK16WCvfVHzPO+I3T+yK8DP+rKLfPg6mh23v+aWTMDoS
         Nl77fQ/VOWjdiwGUjOsaBm7z5FZY2H+uXT0jLLSkjWJWHFRCgxvu1Zg4pYYwASocuXxO
         Epag==
X-Gm-Message-State: AOAM530qwcWX4dk+SJDeg6yJgPRT2ZpkV5QsCUsBShEbsefO3u/MmWPM
        AZjdrICdPHGtqL0vYGfX8TEZnWGKyD5F9v4YSCmQY9bh
X-Google-Smtp-Source: ABdhPJy72w8a2dXJqwISoVPXy6X0f6peo1TA5+SnjUmc3HqjNuicmMLWTtDJxeSF1zpkGqCB77dveuzxHxvy766AYgg=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr8317812otp.107.1600084321973;
 Mon, 14 Sep 2020 04:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200911080929.15058-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200911080929.15058-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Sep 2020 13:51:50 +0200
Message-ID: <CAMuHMdUsxo14TA4qEajZcvJa=M9dO71Vvk8mDcvaOvTBmAOYNw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742: Add VSP support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 10:09 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add VSP support to R8A7742 (RZ/G1H) SoC dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
