Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F38B203713
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 14:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgFVMoG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 08:44:06 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33882 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgFVMoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 08:44:05 -0400
Received: by mail-ot1-f65.google.com with SMTP id n5so12934875otj.1;
        Mon, 22 Jun 2020 05:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r2pqvv2p5cRl0AhDVTKno1VFxc+4Nq9uvMsZtz+prlQ=;
        b=s4dz0FOugkhxBAMcD5bmrMHu4dTR+dLFun5g4NR9kaXk0bA1tOmYZp7PUgAsxbXKQO
         4pnJ0PJh1TwiZamtxLWQezii3yOO8YxZGxAnFAJMXYiWXiSckQEWASad8FxZkWPaNOWW
         h/v/F00s5Zb5UC1kgj9i/qT4aSygsfJfmJ5YkOlsAioU9fIJ/p5DzLeS94NeXRiAJNhe
         r6OxQMNvhSQJiq9k92YxM88hlOGpQiBERSPNEff7vsGL9vgzzC6sR72cUEp0UpOsEMjX
         zPXG/sKkpBNXp1zmXSMrSs9MFdEQY3eOjCqKT6MyzlQxTYiHfi6HonRvfnJ50phfVzx8
         XYbg==
X-Gm-Message-State: AOAM5321CKz51wMpl02xjJFH2R0xGlMOZvcpkLo22bCfJ+uSDwUfQxLB
        sA0Na10Aao4H4POJYzBmHXYojX9WTUJbUTSgoBpwzl/K
X-Google-Smtp-Source: ABdhPJw4yDjoqiFgwYIZto3QPv/0I1Fk2APtBoVYh9DzLxLoLlAnngyuwUVSS/JT/zAgdNlJOqTm0EjuaYuPCovg2jM=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr13446164otk.145.1592829844736;
 Mon, 22 Jun 2020 05:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Jun 2020 14:43:53 +0200
Message-ID: <CAMuHMdUWawKp_gcedDHFx3zbs2iST7HSrFR9zK4j0Gq7HixD3Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0
 sub board support
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

Hi Prabhakar,

On Sun, Jun 7, 2020 at 8:42 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M Rev.3.0/4.0
> main board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts

> +
> +/* SW43 should be OFF, if in ON state SATA port will be activated */

Looks like having this comment in r8a774a1-hihope-rzg2m-rev2-ex.dts
would be useful, too?

> +&pciec1 {
> +       status = "okay";
> +};
> --
> 2.17.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
