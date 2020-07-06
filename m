Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F13D215A7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 17:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgGFPQm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 11:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729248AbgGFPQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:16:41 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE383C061755;
        Mon,  6 Jul 2020 08:16:41 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id h17so32281911oie.3;
        Mon, 06 Jul 2020 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mm0vlTFeGVgW52u5moYgXz2m36p/HxW/iJhsgevmAS4=;
        b=EyM9DJYgqZsfV1SWVc6/M1TBfo943qBuFXf5P/E6J7iYHMrGfMddh8f16SGETs8O39
         lIxfxF/rTSfECK/dKFraXWB0ycJ1DgmZXorcjsiBpZ+dNmB2styG078yQA7UYG9ie8vk
         2UvYS5b3qc4b4u3T0/yQOVqq4RdiPe4/wpFrhDWhkY/chO/7FTDxLOpX/a4pv4R4P2Zr
         y8QQYxS4QDuI1EtdTKNdBteZzke2Tbt7FYHfaZhVhx75ybd/ugpePj9rojS864P7xGc4
         a9rEChxFvVl5FM7XpdwJgfrpEqkznVw2fvGYPn01vSO8ZbxKdayeyAeU5tEgMlV7n6SJ
         SInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mm0vlTFeGVgW52u5moYgXz2m36p/HxW/iJhsgevmAS4=;
        b=gSptpDuBUMAXYTkhDJvYo5iGHT2yv1ndq+hvs0c1f1PyYfF7qI/OMamkolWBvNOPj6
         O84tj6l2Z2JGMD39S5RNsW/VEfi6JX1n1Nf4PrGfezQnUJxu+h0bufBts93EKESLUvhG
         ph9g+SvUwM3InhfW2oh++uor84jr5nCPdvn1hicsXkPJQsw+ZXtlSQrpI41y8Cx+UnuM
         xBzXrnnANnA5GCRa2ya8eK0v3HC8uQkUu3SqlubJEi+pq9Ioj3ukCe7rRdXi9BvwyXc8
         bogTSXaLccCcUa4zmvGkgUdoTvePIKsl/wui+gC8Js6BD1MxKV2Y52TvAq1xhLkkTv0j
         2W2g==
X-Gm-Message-State: AOAM532+Dx9OlLA4qIA0BclwMcMiSCQubaB+r8cU6Yg3sw0a0lmHaJpx
        TjlPHUz4iBMbMsd637dkK8xr7i5EYKKafk7MK/o=
X-Google-Smtp-Source: ABdhPJz3jFtfs8keb/hU5mf/blBJGfZsbjbw6DrxhYWX14llhEIm6YVIu7lKlcEqAOrV5AJ4qYixrhMaJPm7aonPFCA=
X-Received: by 2002:aca:4fd3:: with SMTP id d202mr34901622oib.142.1594048601058;
 Mon, 06 Jul 2020 08:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <1589494238-2933-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW8aQyHm7uzOd3cL2kPXc0EZ=DN_MmVa4AVFLqo5PwMKA@mail.gmail.com>
In-Reply-To: <CAMuHMdW8aQyHm7uzOd3cL2kPXc0EZ=DN_MmVa4AVFLqo5PwMKA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 6 Jul 2020 16:16:15 +0100
Message-ID: <CA+V-a8um0M4S2EL0yRvY0TZRZ2vkgEy+Q_nJahHs1KiZX=YRvA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_PCIE_RCAR_HOST
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Fri, May 15, 2020 at 8:22 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, May 15, 2020 at 12:10 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > config option PCIE_RCAR internally selects PCIE_RCAR_HOST which builds the
> > same driver. So this patch renames CONFIG_PCIE_RCAR to
> > CONFIG_PCIE_RCAR_HOST so that PCIE_RCAR can be safely dropped from Kconfig
> > file.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I wrote before:
>
>    "I can take patch 2/11 through renesas-devel.
>     Probably it's best if I submit it to arm-soc as a fix for v5.8, after
>     the driver part has been merged into v5.8-rc1."
>
> so this will have to wait for v5.8-rc1.
>
Now that v5.8-rc1 is available can you please queue this patch.

Cheers,
--Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
