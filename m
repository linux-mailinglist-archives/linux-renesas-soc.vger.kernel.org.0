Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC816CE142
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 14:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbfJGMLH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 08:11:07 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35710 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGMLH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 08:11:07 -0400
Received: by mail-oi1-f195.google.com with SMTP id x3so11428488oig.2;
        Mon, 07 Oct 2019 05:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+639AsUxid/Zl2C2YpIDh0L1HCvXBUELKFCka1usCm4=;
        b=q2s2hKxu0T0+Y29szGeEj6L1axEaE5rmRao2Yxa3BkEsRvJh8zHXTl+1kArID94NKu
         k5d+g8LTGwqC0/qXGy1WVUoOlpiZGnuuKBoZ9JDhD/eCsrSsBQyfzurEYH1upwFEVGev
         LQTCs8/F2w2DvRGiNiuzV+9d9qoVkWBc+PtE9wu1r0zlHz7iR7h8kwApxyDyUK1uix25
         FRoVUgK9yo6t4Ag5J9dSJsuPW7yM+ARVLzJ4CVlV0oEbrrIbn63cX+q5YL45lGcp06zN
         Yn0uroTDp0Udy8cOVMthkjZBlLCxAiPtocnxM3hjm+5dk8NU33uc73a5aoOIS/BBltrn
         wyCg==
X-Gm-Message-State: APjAAAUIsY3eXIJN2h3FIlhmVB8X1t1eRzwlJz1Fm+mRyWB7MVERTauL
        eY3TCIq0CXHxRsSds5vCFNBU7d7D6u1aFU/J+wY=
X-Google-Smtp-Source: APXvYqyI00lNVSCyb2x9ZmueOIWEu3WCQyLx0Cdw4Bi2PilOo0njw1w8+E6AHJGEqcvxcF6dDRrrrZrLIW0hD0QMqbs=
X-Received: by 2002:aca:3908:: with SMTP id g8mr18244916oia.54.1570450266307;
 Mon, 07 Oct 2019 05:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <1569249688-15821-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569249688-15821-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 14:10:55 +0200
Message-ID: <CAMuHMdVi2W=P=GncTf8ZWiPLCE+BPFZbfVoHya20YxnY7MS5fw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a774b1: Add TMU clock
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 4:41 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds the TMU clocks to the R8A774B1 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
