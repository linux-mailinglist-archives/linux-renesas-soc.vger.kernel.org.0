Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7617629EDE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 15:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgJ2OJW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 10:09:22 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37944 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgJ2OJW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 10:09:22 -0400
Received: by mail-ot1-f66.google.com with SMTP id b2so2348705ots.5;
        Thu, 29 Oct 2020 07:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZqcG5BM74s2+jIafSVroKGlCe4Jg7YqfD/hOTBxRhPs=;
        b=RzUG2g7q1ogzXT8awbw7GD+mb1tIB9Fe8zqHbQ7Jb7hNof1Vyw3vaT5yLw3ZrqkOhV
         pG/l9Sq3Zq+JFYHSFQ7/MSvw0Q7AVQXHTyetSjN0grWCQ4LrgKSloyG8d18uYkrXzPcV
         e+/Y9dzaopetAuCfaE3uPByvt8w569v4M8fcQgsksL9Xqn645544oaP2hRlL39iYh1I5
         ++hoekYdPWdgAQ1vuaXdvaLFxlYR14UIXcFrn9ojoEFldo7LL3Z6HDZKXQEH52lUgbaT
         v7w2SItgwcoFuZ3jr27WwCSez+siu6GUCJmcwRpa7OhrJsbYed2cgV7t3B85Mv6RuSik
         Y36w==
X-Gm-Message-State: AOAM5305eRB2vSYEZh9k1GrCttkt1jWEFi5AVrVZzZroPdpdIgd/BDfY
        qZpSkLL5hsUHyNWmx8rOgSTU2gqVVB/Tz9IrnC4=
X-Google-Smtp-Source: ABdhPJxCeisCXlpEt4pPAk4haBd27I6P8zUu7mLvTQUPY2aIPwEyUrPQljOl+MchOmHe7uUzUIwjlVKW3UNVD8w5t0o=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr3122076oti.107.1603980561108;
 Thu, 29 Oct 2020 07:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201029133741.25721-1-erosca@de.adit-jv.com> <20201029133741.25721-2-erosca@de.adit-jv.com>
In-Reply-To: <20201029133741.25721-2-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Oct 2020 15:09:10 +0100
Message-ID: <CAMuHMdX5pCtR-LMbuSJQvDNyVOwcipt7zZOF3c3J-d-Bq98NQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: ulcb-kf: Initial
 device tree
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Thu, Oct 29, 2020 at 2:38 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> Create a dedicated DTB for M3-ES3.0 + ULCB + Kingfisher combo.
> Inspire from the pre-existing ULCB-KF device trees:
>
> $ ls -1 arch/arm64/boot/dts/renesas/*ulcb-kf.dts
> arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks for your path!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

> +       compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
> +                    "renesas,r8a77961";

Can you please send a patch to add this combo to
Documentation/devicetree/bindings/arm/renesas.yaml?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
