Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79B525BEB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 11:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgICJz0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 05:55:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34818 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICJzZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 05:55:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id i4so2170784ota.2;
        Thu, 03 Sep 2020 02:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mxd/4nV94gENPbWr5vineBXcIlKgMjAz5Ru6u3+1SJw=;
        b=udVVrKLEFnOJSFTTFK3eOTARvNFUhMnnbYdTo+Fu2cVx64k9nCnhTYNWdRjjjerStU
         mKBP5s3R6G1JTDiJSpgbTL/v4/024K0GLvwqnvCv/91KCRXrGa+TRNbsbca35rmLdWM0
         9qPA33m+rIoOpffyQOEBSfJPjoSBL9LLm31+Rsn0UCYgvLCHjwTNmNZyJkraPz2d4K++
         Vbs6LoIFqmGy6kcMI8GRDfY6SaKdAF+Y14B5KbgVvLCie0rGtfKHDO4x+TT/KwQiX/rU
         9uExa3oivsGBECuP70ySd5OBa/fv0LomYDh6FD823I88ctaR6YvnILetPxyc8oFdJQCd
         2ZUQ==
X-Gm-Message-State: AOAM530pteMaHF8OFGJeW78KI58j5U/az4sZXa5Tgu0Ks5PJXswIZETv
        P8ymOZFMfbHDU/wa6vlhgJe3qh9xciIJOVK/Sl8=
X-Google-Smtp-Source: ABdhPJyeSRbUKtD7sMTdA7aGWTBEJsisVjdfNr+DMP4gt47zwDTvJkxLTdEJb/z3SByYoU7/hwDepBj6YbI2sQOaBTw=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr948617otl.145.1599126923013;
 Thu, 03 Sep 2020 02:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200825141805.27105-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200825141805.27105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825141805.27105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 11:55:11 +0200
Message-ID: <CAMuHMdVgO+nkudF_W9oUfqD=Z5dWX2HME5jcTQqA1DsGm3+nrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: Add r8a7742 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
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

On Tue, Aug 25, 2020 at 4:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document RZ/G1H (R8A7742) SoC bindings.
>
> No driver change is needed due to the fallback compatible value
> "renesas,ipmmu-vmsa".
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
