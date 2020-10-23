Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472FC296A93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 09:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375849AbgJWHse (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 03:48:34 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33146 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375847AbgJWHse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:48:34 -0400
Received: by mail-ot1-f66.google.com with SMTP id t15so563148otk.0;
        Fri, 23 Oct 2020 00:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIe/mHeTa+ilTJbmDCcM8LeOw8q5C9qXcM6+qzg3FWc=;
        b=TzsM03azT1PXaA8gVH1NSz39R0qMKWgCpTmuTmOKtPodl9T3aLU4K9vpoD6E5BNqPY
         o/D1yn/KfGpgePY199PPOEASgzSoIlmVQD187yF8dxHiIRWqO0en2TkOIMB3OLUvlZjR
         F0YTNJ6ddbJCLwKKGYlbZCe+A2dkgOvaY5FwUwGm/aX9AEMUhQJGOsRbY/lFmZaHA4re
         IEJflH5xkvK92UFClZbU7dP01lHIcnPfnB2sRraxjp0jS31cnloWcB+XZYZxf8IHR+XG
         gmUobek5FJBvFuIs9Pb1KBV5H5aUTSoUHSnKL9z31oioRxdVeUygPsB/LOu578C8hrMf
         KNSw==
X-Gm-Message-State: AOAM53107/9maN3SN/DbnSt9Y/gm4KaCXXqq1fw2hKHl/fsRRUciYtPn
        nkY2Z5QlvpKwAsNgLNh77zNfXHSvexKXzjbFFKCv8S0b
X-Google-Smtp-Source: ABdhPJxvy3cdokwnQ4uNcADGgpFKWcwTt7eB9hV5VJmTHIo0C4JRXc6LOt/WzUNc8QVH6u1SR3VoNV2ZfAxYDS/5iWA=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr662539otc.145.1603439313221;
 Fri, 23 Oct 2020 00:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201020125134.22625-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201020125134.22625-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201020125134.22625-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 09:48:21 +0200
Message-ID: <CAMuHMdWnmrcdRXFcGa_w016EAO2NC51f=oyPx28KbkvnKW0-QA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: aistarvision-mipi-adapter-2.1:
 Add parent macro for each sensor
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 20, 2020 at 2:52 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> For HiHope RZ/G2H the OV5645 sensor is populated on i2c2 whereas the imx219
> sensor is populated on i2c3 so add support for handling such cases by
> adding a parent macro for each sensor.
>
> Also update r8a774c0-ek874-mipi-2.1.dts to incorporate the changes.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
