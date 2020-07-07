Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62DD216959
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 11:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgGGJnp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 05:43:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:47097 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGGJnp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 05:43:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id n24so31637005otr.13;
        Tue, 07 Jul 2020 02:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aVNed+XcsSFc6kEErK54OMiK5kW1iDeyWbIyDVGhaEk=;
        b=oyWXKxxYQQ2NZyvLlCr88phnWuRWyz319ZOjgYNn62afshIDp/vnvJ1grotif3FFVF
         YPdGHqAvLXtfGQiComgTHt00PYfepYuPcjd0G1isWx84LKZiORwHNLuwT8MYEGCgEasR
         ETUR01qeANlPct9WSwCIhXRvVnqt9hkwXn30jp2/ZHPUgXqtYuFVM0csy2ncuacKYvsO
         wGJrfcdMZE7a+rayynYYYG1kB5m92lSID36H5r9AXy7YBUg68amBJXQCkyFy0lfc3hAC
         qfQ/FG1ndzu4KM1SoivFvOT3hDSMdG1RlzKbdRTZ5sGtDKdiK/ixTIb1Ub40UuxWBqcl
         5IFQ==
X-Gm-Message-State: AOAM531m6AIcCj32jXAwcNnYYt98AyjvRuo8XWEEvuW6ayhukP2DBUEU
        Csgc5ha8Nv9vsui+PCs1C6dLCVWjjOsn8K7UvaE=
X-Google-Smtp-Source: ABdhPJxu+PXqg6O/tjlHlt3qdCoDKyA3froDfF3UCnKsTixpmUHxpJqNJwNZMrGGQqjG9PBMjnuIca4qfzAlKQLU2cI=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr32634902otp.250.1594115024285;
 Tue, 07 Jul 2020 02:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com> <ba8bb326-7e77-6ab7-668f-fdc22010c8ef@cogentembedded.com>
In-Reply-To: <ba8bb326-7e77-6ab7-668f-fdc22010c8ef@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 11:43:33 +0200
Message-ID: <CAMuHMdVvP7zUmbtJU7DX+_cEsVKDv8v6No9Raf5wiZXy84ZVuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77970: add RPC-IF support
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 19, 2020 at 10:21 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe RPC-IF in the R8A77970 device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
