Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D759AC04D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 14:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfI0MHE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 08:07:04 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39184 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfI0MHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 08:07:04 -0400
Received: by mail-ot1-f68.google.com with SMTP id s22so2004291otr.6;
        Fri, 27 Sep 2019 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQUfrwmtNA9Ew4P666b0rG4KYFsmfzKC7caBKHjOR7A=;
        b=W8m7ZyTGJpiwmlRZmZ50KewVLpzrTP30eCAjEzzjxm+ZZqmaD1BOr7p/JnXzwbIPF5
         ZSq1LJlq/M7fIkHxYqgONpuZ3Klcbc5tvYqStqygxJMVPzptIBtl9n29cGC8K2zkkMGI
         PJ3eqLa0zvQZI6asqQhedG5Ts9ZVkbssR0bxb1NgB3GjgzwKMaQuT+Kvh/SP/UZU3pZV
         5as1G7n2v11N/6D7B0BQPUCcwQNsmQvqofnZPkBq/qcCX/1xmynzy5lbeU+3lJFL5yHn
         hBBd4H1Vm72CrYJh7dWZq7vC1fpXCCMRGJpCN43UkfyfOjGcE5fdglKbBFx0YuY3geCF
         iYCA==
X-Gm-Message-State: APjAAAVC/IidycCFW872z0OG4HINA9fmSfqG9i+kEGafZWcQ3vGjoIoP
        q35s5hsv2oIHuPmwiCnPMgVAiMU6mTCkkigXo6Wh37dD2Vs=
X-Google-Smtp-Source: APXvYqw91liXfST0dl+4xdw5CaXGSUDfkMlGkTAUpJkjnVji/bz+InlrkHEmdtczbDZxYDCO2f1/2hhRB9TstrUR0lk=
X-Received: by 2002:a9d:404d:: with SMTP id o13mr2952804oti.39.1569586023005;
 Fri, 27 Sep 2019 05:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com> <1568725530-55241-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568725530-55241-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 14:06:51 +0200
Message-ID: <CAMuHMdW7erKQHKjf7ca2yjY-gUfQV5CHaT8HEoz7zPR26OnCnw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Initial r8a774b1 SoC device tree
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Sep 17, 2019 at 3:12 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Basic support for the RZ/G2N (R8A774B1) SoC. Added placeholders
> to avoid compilation error with the common platform code.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi

> +               avb: ethernet@e6800000 {
> +                       reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;

According to the documentation, RZ/G2N does not have the stream buffer,
so the second register block should be omitted.

> +                       /* placeholder */
> +               };

The rest looks OK, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
