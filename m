Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5965AD29AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2019 14:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387742AbfJJMiL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Oct 2019 08:38:11 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33204 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387639AbfJJMiL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 08:38:11 -0400
Received: by mail-ot1-f67.google.com with SMTP id 60so4716820otu.0;
        Thu, 10 Oct 2019 05:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4qIl5Q0cpTSTyu9BKpvC+aBjKt93LKsnZQHGynN8G00=;
        b=hFZyovspR55qAjT2fzqutumYwgEthyhH+htiQqS9iYztvFRIO4yhYfTQd4+lbi5PjZ
         xvAP4DlE4bFiGvm66NV/96TtRLTmbjAQjIYUpGzFVFk33q9eV3Uw1zEHijDJY0TiDFGh
         iC6UZuj2IX7qcQvnmPEJW7iPdUFXhGINmTivpto/npL5tTZx/JM6WRXCnzo3Cr59mcjx
         Jng/oBgy5OsiyMgfU4iWlofJVsJ9WFZ+7zjpgdzERF6D5lbbMbd41PXYgJjBhQzBKkMe
         7XeFjt7v2OoUVoYYUjuFpCmWRj8slpLXgppgNRt2b4zeZMS2TRxQjJEKzuepBQyHH0Mz
         S6Ng==
X-Gm-Message-State: APjAAAWAQWC6LULM/HF5CK36v/tExn9Au0npI39DDyqb6ZGBc/7o8o5A
        ZJA22OCxBFn0ABJfdEokl+QsW/Krn5ChvYYRaKU=
X-Google-Smtp-Source: APXvYqwIotQZuQSWAXzuPSkkIkyRBFEcQoKddSe4MXvYzFseOD++iDlBilpoBTlUYj7HIeGUTnlfywhnQN8mA+zUr88=
X-Received: by 2002:a9d:7a82:: with SMTP id l2mr7636706otn.297.1570711090630;
 Thu, 10 Oct 2019 05:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <1569837778-55874-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569837778-55874-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Oct 2019 14:37:59 +0200
Message-ID: <CAMuHMdV3uWpkYVM+PwXboXBfrbdjT9LAiyPfrD_ERjf_iPPLgw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774b1-hihope-rzg2n: Enable HS400 mode
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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

On Mon, Sep 30, 2019 at 12:03 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch enables HS400 mode on HiHope RZ/G2N board.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
