Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEA9413942
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 19:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhIURyx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 13:54:53 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:41644 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhIURyw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 13:54:52 -0400
Received: by mail-vs1-f43.google.com with SMTP id az15so83775vsb.8;
        Tue, 21 Sep 2021 10:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyyeEHOVCNvs6CZwx6C5mr8cJQBkuMT85d26cHc7CJQ=;
        b=mDCHk12gp5Bd6JoQRste5BQ3DCPwVodAmAbiYYHAbrQlHMlIKM0SYuhwB2RNsrLDw8
         qUctL3tlDYPuYsfnO85kTtkou0JB6fAYHAMad9bSJq5gZOSamzkOSRuxLQpwfY4UB7g/
         YjCL5G1EkbzFLMIqDoWlgwiXyrB84Af0KYFh76KyqKy1e3zhKqKFLiqa9zd1LeNGlWnS
         iutfiqflrTKfWGmm0sFuBBPcRYPswAvrs+WeEmOJ1Zwv633VBDMdyEUKJt1w+TPzbkgA
         I2YETmsIzsM8XklVhTsn7gXkLj8SOzt/Wxoh7mywr1p9bMg1cF1zcbcEJgL0VZUa64t0
         aTSQ==
X-Gm-Message-State: AOAM533RSo3skVKOU1B5s7sXJQ3cmLn7hdR/3LVu+A4ytVcrdwwgd6MP
        yJ5RQI1WfX+D7KbAV4+QwJQRu2Fm9ID5u3qUsK0hBb4QWgs=
X-Google-Smtp-Source: ABdhPJwxli5fsnZCcxIIYenKV2X5BerNuj73HIQ3fjV2MKWZadPDwTjcTelNzPxFb2Mp4J0YOm+9NQEgYfuvrDcytkI=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr21188353vsl.37.1632246803736;
 Tue, 21 Sep 2021 10:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210920182955.13445-1-biju.das.jz@bp.renesas.com> <20210920182955.13445-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210920182955.13445-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 19:53:12 +0200
Message-ID: <CAMuHMdU-e8nd2ooOWjomSOdh2mOuLUqzZOp5NeNc1K=OYQys7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: rzg2l-smarc: Enable USB2.0 support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 20, 2021 at 8:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable USB2.0 Host/Device support on RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
