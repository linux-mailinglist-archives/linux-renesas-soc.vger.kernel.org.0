Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B908D4498A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 16:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241047AbhKHPqF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 10:46:05 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:35648 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241045AbhKHPqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 10:46:05 -0500
Received: by mail-ua1-f42.google.com with SMTP id q13so32361131uaq.2;
        Mon, 08 Nov 2021 07:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6f4m66ES+zAHQFCu69oPASDFzuFbgcNAF7o+ncaDghY=;
        b=UDVqfv0lMWY+D7JYYkyjuLd+Po1x7NJsFdFDYgRDUTcvGsEKtRT8pOI5ov4mrOD5Tc
         maX29HuXSYUEkQqvaDRiiofUaoGtV3KJ1rLVWo8m/tPI+GZ9a1EoENf2uu4W3/2lZXpL
         teOyMNNWT75H8Nxd9au7/EUkgC5Nq6rCEY2+mBKcL9jJmmWGZPAQ02ISIH1Ehhv4g6pv
         m/jIMgeuBCJWMtR8u5YU4OmD54ZhQ0z/49T8HGNrnyzunDdJruKBpel8Fg7cvI8x2KyP
         QLXtV5SOhDselHOBdC7u+9ZVahXlKawnUuSZUTjpq4kRxT4HTZmS1lvawhytbyocLVDU
         70Bw==
X-Gm-Message-State: AOAM530oAogiVZ/dPwXYIL/EBLdgtH/Al0EdmQDcmw7jjlfMwO7HPtDd
        Nbur8jb+RfaexY8lfGl2+dxY2j7YjHJy0Anb
X-Google-Smtp-Source: ABdhPJzJVcAyhWkkLZIY5N19BmcX5lARglmGDgvRvs8eXIQtpmC8rWs60xuyqB/EiHue6Vd8iLuI7g==
X-Received: by 2002:a67:ae47:: with SMTP id u7mr104895393vsh.7.1636386199770;
        Mon, 08 Nov 2021 07:43:19 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id bj50sm334548vkb.7.2021.11.08.07.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:43:19 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id q13so32361049uaq.2;
        Mon, 08 Nov 2021 07:43:19 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr425738vst.37.1636386199161;
 Mon, 08 Nov 2021 07:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20211103160537.32253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103160537.32253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 16:43:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8wq6Fxbj+PbuGHCCSa-T3C7tXj=oSo=SmwENkXoCR2Q@mail.gmail.com>
Message-ID: <CAMuHMdU8wq6Fxbj+PbuGHCCSa-T3C7tXj=oSo=SmwENkXoCR2Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for SCI1
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 3, 2021 at 5:05 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add clock and reset entry for SCI1 interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
