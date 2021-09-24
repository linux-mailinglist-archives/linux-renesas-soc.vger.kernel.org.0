Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C02416E50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 10:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244992AbhIXI6m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 04:58:42 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:36803 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244621AbhIXI6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 04:58:41 -0400
Received: by mail-ua1-f42.google.com with SMTP id u11so6122973uaw.3;
        Fri, 24 Sep 2021 01:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yWBwxApblMDF3q6kdl/4edYZKWCSaPmrZg+7mZ5l+5Q=;
        b=ABkCeJUTvYdbCg7m2sL6nJwDoIK5/CMczQvhh2m2RazuMuumQulQlAcOI9Wp77mNhr
         ThuRvGdQUrWp5lqqKwSfXB9Aqffk3/yCjFWFx7+35UmNBFnP3C3CsEGusvW1N0radyzn
         z1MXWZ2thKMBN/Ck+jt/vEJiDg0YvO88s+GT6I4I5MbGSuQcyKhVrBho84GnX5Ld6csX
         3mZzAm8XGzpfmHyLMlTWUBkpBfwbNcEYLqcgkY7EYuK01B1TkD11dUijwv0I5/MpEXWw
         QNHpgK5S7Sm5OVKKdKW0M62LYr93PtGQs2pn5SXwKmMtUj5FWBjHYeJsslmfErwCFURj
         dHHQ==
X-Gm-Message-State: AOAM530OsJxHW4m11IQtAaWKj8dGU14s1v6JLU/7oOZHRiucY0LW744x
        UVfy9dp9IyqRurxuOUR+hcDOHk3BqgLC1lvY802HZwtK
X-Google-Smtp-Source: ABdhPJxjeRLUeN9s2JqLiyWKVJRtNyDjyERsX01iahUcov2OctU+fHFjhrW1xlohzh5mnWr/pAyNyuZq7PjLeBPkdhw=
X-Received: by 2002:ab0:7d5:: with SMTP id d21mr8319253uaf.78.1632473828287;
 Fri, 24 Sep 2021 01:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210922212049.19851-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210922212049.19851-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 10:56:57 +0200
Message-ID: <CAMuHMdVgqyYkNxW+gWeS9NYAXCGqN_r4NMt8gJRZAmnzyhQABw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable ADC on
 SMARC platform
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

On Wed, Sep 22, 2021 at 11:21 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable the ADC which is present on RZ/G2L SMARC SOM.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
