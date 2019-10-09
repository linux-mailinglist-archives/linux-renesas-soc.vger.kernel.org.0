Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E90FDD0E40
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730344AbfJIMFV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:05:21 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37801 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731076AbfJIMFV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:05:21 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so1505880oie.4;
        Wed, 09 Oct 2019 05:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0ptFalfLHqLlcUJsJMhSaR4mOy5nVhfeg/pyVzNNok=;
        b=RbWTYy+Zn8fLkIZoJ11Q89WDDptgtNxSR1PRtRWYu+VsChbS9Q/Fd4tbRBCQvwKfIM
         aqtXfJsbHtyQvzBRbUZuoI/OYipLH8zogAKwRus2dk1CaZX9EeEkesmPBPGstJdyRA+L
         eCa9rHiO/PDVkusGUcWZknb+u6CZLBXwnDkE6L5kf4DSFsd4yui2/yvbcvusrPLaM0sO
         KI7NY86DNdtKbOuCKSOc8WZNUw9xDqdKCdraCPBH9CBtVzw40zAF/j+BU/qlI9NzX7sU
         xprgDdbt9fmdlS2+D4rHHQsNGaHujZ2JQ+itPy34IN35XoB1ZpkZNhcQOoQeO7FdH6Z3
         FTVA==
X-Gm-Message-State: APjAAAX2rTrJ0HGFz09t+qMzCGJem2bibrZprbr9Pl9MtZc7XAcOOXTf
        hERaScXfeS8KnMIm/N5hrXzP61aDWXxuiANQL6skrnk8
X-Google-Smtp-Source: APXvYqwETSD0sBCmyTE8wJ4kU6Kv00ohPKIdXc8LjlPIbk7zqhpekopU92i8Mdr4A2lLKMLKXD/mDSP+jZwsQ2Y+NoM=
X-Received: by 2002:a54:4e89:: with SMTP id c9mr1827119oiy.148.1570622719296;
 Wed, 09 Oct 2019 05:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <1569831527-1250-1-git-send-email-biju.das@bp.renesas.com> <1569831527-1250-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569831527-1250-6-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:05:08 +0200
Message-ID: <CAMuHMdVy56o1FvaYKVUtNW3Espk=eqgHPBnOo4jE37Hq+komQA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: Add HiHope RZ/G2N sub board support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Mon, Sep 30, 2019 at 10:19 AM Biju Das <biju.das@bp.renesas.com> wrote:
> The HiHope RZ/G2N sub board sits below the HiHope RZ/G2N main board.
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
