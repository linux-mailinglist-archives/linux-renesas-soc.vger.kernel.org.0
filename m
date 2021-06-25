Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC3A3B45A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 16:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFYOgW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 10:36:22 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:36535 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFYOgW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 10:36:22 -0400
Received: by mail-ua1-f49.google.com with SMTP id a14so3632626uan.3;
        Fri, 25 Jun 2021 07:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OchEvIkQva1UbbfJgUo4SeZJB0RyVE35od4c6g60H3k=;
        b=J1DrnOwbc1gs1457zcSDviw3MbFDTq6UpC9qyhulFK95eAdKaZvfVrehbHWEOZRCeV
         VLsvHPHqyqpvRSfjpWLas8PFx9kqCL6eX/lYcpXo6gUmff/sfCzB4RL0NJDuO7W7xsyY
         Ka68UaXCfK82gjY87el3KOy1gFkjulai+ury4hw+W6mhDl3dR6btW+Nd15jfBvrZwlCp
         ETnUqPAj4F+6aB9+h0lv2k5JvxDZsd/lRsZ9+ozu3niyvhuTAcrQeQ1x4/5yVW5dEZJg
         qeL3WXCl2+wdLJjjmLqinIFBhDmXjIKauyftPFsRhq1TVu2mK7zTXd7dWuhXD5R+s15V
         kqmg==
X-Gm-Message-State: AOAM531T6di3R4QZDi+Lps09pErLXzcezX34xixl+zDzDwvSWzXQJc0+
        yNh3i3FIe9A6yIVaBZOeXY/ZWXgdzvZg3gFZj5A=
X-Google-Smtp-Source: ABdhPJxQunNXO7629MNado5P1AeRu+g/d86/Bf8k6dCzOw29d0T9KtaTbBPrOjH+bQuA5Kf1JOb2BvU+jJVb/+ge4r4=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr11815150ual.2.1624631640151;
 Fri, 25 Jun 2021 07:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 16:33:49 +0200
Message-ID: <CAMuHMdX1SEQcdkX-e5re-3TQbXAyV_9T4GjK=coZzy_F4wanqA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: clk: r9a07g044-cpg: Update
 clock/reset definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Jun 24, 2021 at 3:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update clock and reset definitions as per RZ/G2L_clock_list_r02_02.xlsx
> and RZ/G2L HW(Rev.0.50) manual.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>   * Added seperate reset entries.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
