Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47A82D5B0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 14:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgLJM6C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:58:02 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34275 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgLJM6C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:58:02 -0500
Received: by mail-ot1-f66.google.com with SMTP id a109so4742487otc.1;
        Thu, 10 Dec 2020 04:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ed+orW1Np/SsRBg/HtwvZUi+1oCxNv52FBDPOQ84Ync=;
        b=tprk5OfvveI/V0NgmyG/dXO2wXEipGA9t8brrNAsolx23z8lQJW6932MYwsPI3Wi6S
         Fd9FgB8y/8VjeFQy/UBsCNJSje5PcCOYMnuBujkmtnLxrDCh35mf30NUgqO93IFaOyTQ
         uGKyPIR8NRjY4RxIdalmjRl0ZIJgvuA9Vjl8uGJIDdFmYskEUMJoHhvx65rb3HnH6Lb1
         hqAbefBTM0I7CaQM9MKlaczi7etpXdQ/l2B9QS4KVB8lpLbYs8Sm0bgh7zPwoh3GF4ps
         jqf0AHoXAkaF2U/rsxxlsjQEtCQt/UTLfFyE9C4YGgSQLtGuR5RQl1ZsEx7wHk2cg3SD
         Up/g==
X-Gm-Message-State: AOAM533pYR9etUABStvMgD9zlX+VIWQBvoOE6ymzLBeD4m0wACEW9IG4
        VUgjNCKdHX37Ju/O/GDjrAZrDlEBEiTaoNz3D9gmfhtA
X-Google-Smtp-Source: ABdhPJzmAYspIEsCasqe+nmVH30uGvDyIp2eZoH08Z3xCzxVpcFK1IX/fsjMF+isjAQ4CMuIGi37GZTSJ9BlzfaOYq8=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr5656189oth.250.1607605042026;
 Thu, 10 Dec 2020 04:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20201209200738.811173-1-niklas.soderlund+renesas@ragnatech.se> <20201209200738.811173-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209200738.811173-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:57:11 +0100
Message-ID: <CAMuHMdVVjLWQEih4AVFea4zKwkJxKBnU0S74EAh4k6zk7Bavjw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77961: Add CMT nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 9, 2020 at 9:08 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Compare Match Timer (CMT) on the Renesas R-Car
> M3-W+ (r8a77961) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
