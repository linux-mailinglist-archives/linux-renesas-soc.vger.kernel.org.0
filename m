Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE9C257995
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 14:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgHaMpD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 08:45:03 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36135 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgHaMpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 08:45:03 -0400
Received: by mail-oi1-f194.google.com with SMTP id x19so846825oix.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2020 05:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wrQEXQu/I1notIgo8m1WHfEI1oHGXF4VKnxQggXCm4=;
        b=oBK7o20dQH7bHNS6p4CFAbVsEhEz9E9C6HJbJ4PMCPW46kF0QTLRFlR600X3iRt0uh
         4jVFZJBG+gaWm3k8iy+HQg3bwOGcqti0JZZI7/8mlSa1arHlhMzkJN1Et0RpHgnBxyRD
         p1xsAoV5Fc2brCom/8V+XEJaXYca2BNfxKOmnXcE9nNa34ItvccmMifzlA+0yaUXaKF1
         05ThF47fQ12xifpWCVC101Qrs6RSDw0tUnTyOTdBJ/jTDM5U8QvFx5sW8mYnmplKCsS3
         8/HL/oYL9Ebx+FFS985f0imSHfL0CH/7oQQflQ8jpzxDKuWIZJxX0/sBGnAGJEcAUoFw
         a5bA==
X-Gm-Message-State: AOAM532i9IVEYAX6T7+GlH7VdLgt2ZxAlQjhssQ4V4H/OZPpNp/EbkAW
        74MgrHZzdMSsKYqAJFSQqV0Ws+XvhcrMQrjDWUGzmkGIvCM=
X-Google-Smtp-Source: ABdhPJwVZPl0yYgz8ZOEvZuKoUsn52moyMkeM6/MGMnBZd4RppR7fWUvTo2IYYkQHoF2rmr1intP/+GHC3eiEjh5zhI=
X-Received: by 2002:aca:3402:: with SMTP id b2mr596268oia.153.1598877902579;
 Mon, 31 Aug 2020 05:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200826100358.5936-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200826100358.5936-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 14:44:51 +0200
Message-ID: <CAMuHMdVZ_bGyeopSbOKZo_SRVj=DxhkZqFke_8F75VoLogC=EA@mail.gmail.com>
Subject: Re: [PATCH LOCAL 1/2] arm64: renesas: defconfig: Enable CONFIG_PCIE_RCAR_HOST
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 12:04 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> config option PCIE_RCAR internally selects PCIE_RCAR_HOST which builds
> the same driver. So this patch renames CONFIG_PCIE_RCAR to
> CONFIG_PCIE_RCAR_HOST so that PCIE_RCAR can be safely dropped from
> Kconfig file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to topic/renesas-defconfig.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
