Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2601E7EEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 15:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgE2Njt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 09:39:49 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:44707 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgE2Njt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 09:39:49 -0400
Received: by mail-oo1-f66.google.com with SMTP id u40so471114ooi.11;
        Fri, 29 May 2020 06:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3f28yw0QDcaEzHgGdMpHejbPMhbDBFHHK/0bqlZmX8=;
        b=c2hq2C7XLX/A4vgjrqP4tMtYamwq+4CpsDaft7zDOumqUlXvVFXuj8OtPTlDts+3Bz
         TRuWjjzNvmvjityh53YTx6C05kjYAvw9aALkUQzBMVAzRHSj1ONpd8GwlafoBmVA/yyl
         wn1tA8eiUHBXTBISj94tJ7zzwaM/espgXKdap6UMXvwIMuynei7cu9Zae4ndsDZZzWwX
         GRe2ZKiV1c7aI9s/CGYi58ezZBGmGrBkoF88vBbDLlgEDj2GPPAT+V1A50rhpqBjgRcA
         oH8gr9B4irRdmBNDPn6oH+5U9jfZZ7pWYsRRMZncTVjSQTlVFi94teaSi/iZ+VBp3INq
         xaeg==
X-Gm-Message-State: AOAM532ie1ocITZr8FqUiN9gZk5VFKKRtW0CrxjJEXOk5kPHECPFyCGz
        ThxvX3PCdOexh9EfRQ92PXiGzgs6IyZXTJRJg2U=
X-Google-Smtp-Source: ABdhPJwm/rZ3o5sWjux4TP2w0te6CgxFjYJHWYjLax6PNzOmNuPAKH/6xILv9+rUMhcbfW2+qjgQ5Z3waEshJY+3lRk=
X-Received: by 2002:a4a:95d0:: with SMTP id p16mr6533251ooi.40.1590759587218;
 Fri, 29 May 2020 06:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590614320-30160-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590614320-30160-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 15:39:33 +0200
Message-ID: <CAMuHMdXYJ1W3KPvFusKivv21hJNgFT_qLLxCOiem85NBxKMwKA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: r8a7742: Add CMT SoC specific support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 27, 2020 at 11:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add CMT[01] support to r8a7742 SoC DT.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
