Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACAC220E14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 15:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731621AbgGON13 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 09:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730868AbgGON13 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 09:27:29 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5627BC061755;
        Wed, 15 Jul 2020 06:27:29 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id s21so1945172ilk.5;
        Wed, 15 Jul 2020 06:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PbxQ2FDotI1NR/7QgrtYPUlW34gpA/IpqMQYvPXzsaU=;
        b=iDq2OQUoCKcNJHDuF1T6d6391NGSAhrjIFSytd7aoJCNDirq1KL+Psa6IKX5H6ipVM
         8EveZhhHNSyKFw/tzyQaOtNXZeQzcR0GF/MIV9VZCU3jRmVk/X8xXOqb+mrXQZdVOiU8
         sgMdsj24bA2TqMGMWY7Lz/L3AMdEsknaRLHa5wY5RUFh0epZQ4o8wNzCv5KSgdgGlBB9
         +RS2abuIaRFEy8FXo+KOu/hb9/fZigZCnkQeXHTxpJ4YqlMWMYl++BVLzDnQ9W7RuCH7
         jioDJ281lKpUYjK63GolcPL8BXF8eNMnTqSrgNmhHV2xS43l9OL+oaM5EOLOuNDBUEG4
         Abog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PbxQ2FDotI1NR/7QgrtYPUlW34gpA/IpqMQYvPXzsaU=;
        b=iJzW6yLowkHcRJe1k04k03mYRvyXpkn8IyqtsYCaiFMjXs2YBRg+qEPzcY51A69nBF
         EGm7qkXhmD8NR1itV/eAUrkVCfVsVOg8GPHE9kNx8h/rQ+gCi8nVGAtNQvz/WQz0nuCN
         nA7v2XO6CtHB2NYxEBrHYRx9y7WWWOhK7x+Mk7vf9fODrZdwqHaEWbZAHC4DGsRap7nh
         UZMv79NmM3xrmIk5Jz8535WUg+a8u77Njt5Ciu1vAXqBSPg8Vf29I4qeVsLPj2aCeol3
         M2jWa9jD/w8iMEAWRt3HKkkw+srgx1Eu7n7UK/nO8OzuUa0CRRaVFvMCCbDn1ljo3eYN
         TcoA==
X-Gm-Message-State: AOAM5309QliQa93XSQ6I9C7UBAqnfU7NJB4NFXCfDK/r23rG24VxiE1k
        vSCJMOL1jKaWqhj7gGLdTxpGZeAR2hZmGxILS+Pepw==
X-Google-Smtp-Source: ABdhPJwdqZKNGvFCLxnhq+oCKi4llzKqdgvXEJwMn81yXVIrPJa37UczDq1B8Jt5nKtorIFiwpB6OK09gkPFEMUZ+x4=
X-Received: by 2002:a92:5a52:: with SMTP id o79mr8892696ilb.89.1594819648301;
 Wed, 15 Jul 2020 06:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200714123419.3390-1-aford173@gmail.com> <20200714123419.3390-2-aford173@gmail.com>
 <CAMuHMdVS6Hf344EbyroGCWR_yxtO3DZh=JUJhauy5OeVG2hajA@mail.gmail.com>
In-Reply-To: <CAMuHMdVS6Hf344EbyroGCWR_yxtO3DZh=JUJhauy5OeVG2hajA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 15 Jul 2020 08:27:16 -0500
Message-ID: <CAHCN7xKpXErWc8Bjji1==8+AL-9oeFn3QsP-qmE4QD2NpGt=3Q@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] dt-bindings: arm: renesas: Document beacon-rzg2m
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 15, 2020 at 3:58 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, Jul 14, 2020 at 2:34 PM Adam Ford <aford173@gmail.com> wrote:
> > Beacon EmbeddedWorks in introducing a development kit based on the
> > Renesas RZ/G2M platform.  This patch adds the entry to the bindings
> > list.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.9, with the typo pointed out
> by Sergei fixed.

Since you pointed out some stuff I should correct in patch 1/2.
Should I just re-submit the first patch by itself, or do you want me
to submit 2/2 with these fixes?

adam

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
