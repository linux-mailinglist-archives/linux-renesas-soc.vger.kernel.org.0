Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691CD182B37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 09:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCLIaR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 04:30:17 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45809 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgCLIaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 04:30:16 -0400
Received: by mail-ot1-f65.google.com with SMTP id f21so5211597otp.12;
        Thu, 12 Mar 2020 01:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VKG8yNfRKLFF13WE7drzafjAJK7p5JW49JiEc3PE2PE=;
        b=JyUKMh1yEWrAtPjZ0Qdu9YcB1t3PeHPImykOrsbSZEGXUSglCY7C7vxry8UC8awcqx
         8Pp6f6SvMPI+N+8yQM4UZl/sdFZsVEdk3Gzkhim5oLeJa37xYR1onC5r1UgpTmdQkv3B
         iQha9T4twEaKqTk69fHgPaMagKFIBYnubSuFy4EMI5klNW74vIfBj31isEENLZPgooeV
         LlgzKPZLH1l3nIyeke09PZ/ufCfW2Gt//qBHyiv6aH+usqwTYiyXWRy/8Zy53xGd+OQW
         EreQg6c9YUnR3VwbNGb1KihHrgTxDJli8RA1AXvqnOAEjWwFmdA17h/nvpa3AFIdIVcU
         cpQw==
X-Gm-Message-State: ANhLgQ0ZHQ7H3WX7umVZ460AuunYoF25an6EdfRtmss2GJL/xfq8wwfs
        vAgBRUIAtiGZFCV8IB3XCyCnVe5Pd6vgL7c8+zs=
X-Google-Smtp-Source: ADFU+vsP0HKdXKOf5hUEjBxHEb6q7+o7ka6DErZh1aQdfavQ60ZLfs7xrBkLLXjDkW8pDmS5vdd8h0MkxlKsgPn5Vog=
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr5139172otf.107.1584001815982;
 Thu, 12 Mar 2020 01:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200303094848.23670-1-geert+renesas@glider.be>
 <20200310205504.GA27288@bogus> <CAMuHMdXMSQtmJjmTnph5cKBLStCidzBij8giwvJszNxy1_yt9g@mail.gmail.com>
In-Reply-To: <CAMuHMdXMSQtmJjmTnph5cKBLStCidzBij8giwvJszNxy1_yt9g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Mar 2020 09:30:04 +0100
Message-ID: <CAMuHMdU0W5h_gUsnCm2CY4Wteb2EwXYzCx9XGfAOrMq1rfN7Jw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 11, 2020 at 9:08 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Mar 10, 2020 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> > On Tue,  3 Mar 2020 10:48:48 +0100, Geert Uytterhoeven wrote:
> > > Convert the Renesas Clock Pulse Generator / Module Standby and Software
> > > Reset Device Tree binding documentation to json-schema.
> > >
> > > Note that #reset-cells was incorrecty marked a required property for
> > > RZ/A2 before.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > To be queued in clk-renesas-for-v5.7.
> > >
> > > v2:
> > >   - Remove complex if-construct implementing per-SoC clocks/clock-names
> > >     constraints; list all possible clock-names upfront instead,
> > >   - Drop Clock Domain member example.
> > > ---
> > >  .../bindings/clock/renesas,cpg-mssr.txt       | 100 ---------------
> > >  .../bindings/clock/renesas,cpg-mssr.yaml      | 119 ++++++++++++++++++
> > >  2 files changed, 119 insertions(+), 100 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> > >  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Thanks, queued in renesas-devel for v5.7.

Oops, clk-renesas-for-v5.7, of course.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
