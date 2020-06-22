Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98DE2036D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 14:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgFVMcW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 08:32:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40265 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgFVMcV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 08:32:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id s13so12887887otd.7;
        Mon, 22 Jun 2020 05:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ibxUnRRCECiCbSmDxzdIIXocGNM6i8JlycCHedFdcTI=;
        b=pxmMi1G8yNT5kXMHnm/oaaCn25zK3wLRRFwqk7EMg3d8Ay9SC02BdHjxhM5liwzEzK
         MYCqftsb0h/yqgVwfS7BlELWKkUeFUMJXyi6lkH0VKvcjhCtxyj8raQwx8984/p6RVmn
         wU1qcbeBgj2V7caO9pg9sMVP0hVw2ccu7gT9SwI+h4fa9goFfbpJwaiBw9DauySXvyvu
         KKT8QOG+B96K/9niG4R+gOnOdUljMcbCl8dT6MgipkBx0b7lEgynHuxD45HY+AvFxzGX
         Oda750jHv01NDf7arZvSiY8k+yD1vwJXWFPQ6v3fBwUdV1CbsYWLhAfHrsNG5GtXD34/
         WWaw==
X-Gm-Message-State: AOAM532TZuyLMnnUVt9TynD4LERSi0OOm+900YcSrg+O1gMon4IsgnrY
        4m3RlNePXDK9IfxM5xthHnn95ww5Wf7tbBQA2p0=
X-Google-Smtp-Source: ABdhPJzIeiFPEgRt94Dd9Zt37v6KnXnM7WPcdiPuluhCOlGqTR5Pc0TZnvyL2WxJTIMQFFHCC0xL30KawJ1LQKjLg9M=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr13406400otk.145.1592829140448;
 Mon, 22 Jun 2020 05:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Jun 2020 14:32:09 +0200
Message-ID: <CAMuHMdWY=2YxxYX8pOCTzaH9q7-cNYpiL9mQhzwQK4C3NN+kqQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0
 main board support
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

On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for HiHope RZ/G2M Rev.3.0/4.0 main board support based on
> r8a774a1 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
