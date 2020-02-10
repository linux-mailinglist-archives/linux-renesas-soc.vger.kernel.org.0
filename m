Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67D5315743B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 13:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbgBJMLH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 07:11:07 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40617 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbgBJMLH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 07:11:07 -0500
Received: by mail-oi1-f195.google.com with SMTP id a142so8954682oii.7;
        Mon, 10 Feb 2020 04:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tcbUQNxLQdRzAKQEUP6q8ShOgl/q5m4kohc0WkQ4/78=;
        b=tgdf9AcyZ++QF4rN4x7EeXBIG5XPdtg79MI5vzMJI3WeOWETP2BDLccLr2fv/9KsXQ
         9UQRsfag5EDFJyOmTPxNGD0l4Wh+YTrkbvZbseqIj5X3bxs2jlJBQ+Lm5uaTzpaleC2S
         f9D3FixWkiFQ5S7kNHczboKbvxfxgNCG2Qe47qdTOt+T3F3QDxInOBPNu+7osyUD11ia
         0DJWEDdjk32ZZ03+tNil51k6znc5TwHe3YS3ndrqhIIFiClawnfMpFbv2nGlHWOnAmjX
         FkHpnloo2VhDYPrdPXUOy3D1mXAiaI1sufUhUGy/QOjaeHQ7zrMrjj4SUQnbZIBfuxqr
         iO5g==
X-Gm-Message-State: APjAAAUNH5VxtjDIUw67Yda6d9t6+N8EAsNhAM+9TF4CTYwZMwbI1CHW
        fWqBTEb07y4rnUOX4XzXFiKiWDAVmsWT5au8LkbULA==
X-Google-Smtp-Source: APXvYqzvEhqhh/WaLj6/1cODx/BP5Kl3mLFZLqSIfRlZLt2KBw2TtkWuv9ozOCKyXhwPIJl+eQVsIJ07ldN2iQ8SAjg=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr648099oif.54.1581336666599;
 Mon, 10 Feb 2020 04:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20200207162704.18914-1-chris.brandt@renesas.com>
 <CAMuHMdXdgcs0pgmeVR+DW_oxsUcR159i-=ZL+LLoqpQoAvq6fA@mail.gmail.com> <TY1PR01MB1562D7E98F1200B868A91F928A190@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562D7E98F1200B868A91F928A190@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 13:10:54 +0100
Message-ID: <CAMuHMdWsDiNaW-cX-C4SNNJep8LBzCANR-jsJJ3i2H-1Z=ytYg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r7s72100: Add SPIBSC clocks
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Mon, Feb 10, 2020 at 12:31 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Mon, Feb 10, 2020, Geert Uytterhoeven wrote:
> > However, I believe I cannot queue this in renesas-devel yet, as to avoid
> > a regression, the flash node in r7s72100-gr-peach.dts should gain
> > appropriate clock and power-domains properties.
> > And to avoid bisection issues, that should be combined with this patch,
> > right?
>
> Are you saying a patch series? Or 1 patch that edits both files?

I meant a single patch that modifies both files.

If the clocks go in first, the SPIBSC clock will be disabled.
If the FLASH update goes in first, the SPIBSC clock cannot be found.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
