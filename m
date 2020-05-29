Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9D91E882D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 21:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgE2Ts3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 15:48:29 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35733 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727811AbgE2Ts2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 15:48:28 -0400
Received: by mail-oi1-f196.google.com with SMTP id z9so3681337oid.2;
        Fri, 29 May 2020 12:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pst8C2tVyYuFv+xfb5MfEs+AZNNtDDZgtn4hcqD1seA=;
        b=FhyQ0coXbfgQkrxRrcYwgPfItE0jJxvc/5JJI03p+Of7lbVP6IY8pYmtOlv9ZaB9+o
         5U17B0z8QTWbAlKov+93YdQEpA7nm8upchx0DQh2IV6NVMMpSRz5JsXL5kSsMUtWus8v
         VtzkEYaLAhjKX9DpcnW3ud/pOHpFHbJJ19YfKGIIisibl6GcvmwjcQsfAUc9LOt+Ejpq
         42oXCXcawZQs9EFaq+1qN1T/Rg5XG1xLRQe06Do1K18WZVwgS3OHNG/OY26rjb4sRQMU
         gb0lGtr1RBRJFCuTXmzXVMM/IGW4LA6zUc2VlwVzsK1JakOI8bxfZEZi2fAlWTCorieb
         zYQA==
X-Gm-Message-State: AOAM531wjiG4/f37dAJK7kLnHPK4w/t9O2/QDh3+qglP+674Kc65KlGW
        CNRe0uPauE44N4pppEfS+rXtObE34wAckU2ZSEE=
X-Google-Smtp-Source: ABdhPJwlQSai9nYpf0uOpQAS4xHdM/Sp0KKbEBrax8t6pK+klNcpA39HMQmQJYs2Osqqn0x40DZD5fjgF1dMgh/+a40=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr7204321oic.54.1590781707694;
 Fri, 29 May 2020 12:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <1590614320-30160-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590614320-30160-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX+m7WixJiNJyrpHxjnp5vFHi3ULuT7QgPOA93NE1XiHQ@mail.gmail.com> <20200529191402.GA2771130@bogus>
In-Reply-To: <20200529191402.GA2771130@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 21:48:16 +0200
Message-ID: <CAMuHMdURcNed9EmG+gkfUzF1tvcEY1jxpOmMF86yOxOgWsG4gg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: timer: renesas,cmt: Document r8a7742 CMT support
To:     Rob Herring <robh@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
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

Hi Rob,

On Fri, May 29, 2020 at 9:14 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, May 29, 2020 at 02:53:02PM +0200, Geert Uytterhoeven wrote:
> > On Wed, May 27, 2020 at 11:19 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Document SoC specific compatible strings for r8a7742. No driver change
> > > is needed as the fallback strings will activate the right code.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Please note this DT binding is under yamlization, cfr.
> > "[PATCH v2] dt-bindings: timer: renesas: cmt: Convert to json-schema"
> > (20200505155127.4836-1-geert+renesas@glider.be).
>
> Do I need to pick that one up? Doesn't look like it's been applied
> AFAICT.

Would be nice. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
