Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7121E24D638
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 15:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgHUNib (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 09:38:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34573 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbgHUNi3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 09:38:29 -0400
Received: by mail-ot1-f68.google.com with SMTP id k12so1592876otr.1;
        Fri, 21 Aug 2020 06:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/v3bbRPg15ZDGPXsn2Z2ybRxn/GbKQ9wH99VF4Cr9qc=;
        b=hFpE2ouqAZNVXtLWIat/jDgFEghkqu1oRMWp09hQPW6KQPSdzm7A0MzGz3Was9IVKl
         NJi7N8oSaGnVAF/dzOFimn0EvARfLwbP9fzDLflBrY8DYqokgd6A6eTSdUli3BruVSXK
         lrZ37uA97xNtSTG89UZW3pl1fwPUTLGqrTuT6iSdbn8y4OjPg/JuKJjLvocBbxYOk/yw
         0R/tuolKH/vzjZ3f6A62SKwoqaZWD+jT5KxbthuBIF8E5+8pIt+miB+ViuwAXbVyJ2VB
         CTC549lctaFMGbWkzzKzjQWno86xQBkyZW7nUK9FxpP1HugI1fAg+L2g2xbfaodaBQLR
         m4YQ==
X-Gm-Message-State: AOAM532T4o2ujRwbK8MUGe2NF4yrRZqPjIMR2sQplhFK0usEcHuw2/TG
        C11mrtCivgaYOvZHr7m/BhLOeZ4iyMT0cH26lO8=
X-Google-Smtp-Source: ABdhPJx0grGATdrvskmhsVyqHDs+d9cLtJv9D4J9Xk6/PuP1PkCjOlw9eUoY9GuSCOZUR7UNddY+uFqgza1rIA7xGSk=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr1893074otl.145.1598017108648;
 Fri, 21 Aug 2020 06:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200819080841.3475-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200819080841.3475-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 15:38:17 +0200
Message-ID: <CAMuHMdWDB4wQw8exQLEe5VNqHCZPCeC0TRmTvoNqsz-yMDEshQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774e1-hihope-rzg2h: Enable HS400 mode
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 19, 2020 at 10:08 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> From: Biju Das <biju.das@bp.renesas.com>
>
> This patch enables HS400 mode on HiHope RZ/G2H board.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
