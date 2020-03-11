Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F191812A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 09:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgCKII0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 04:08:26 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38739 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbgCKIIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 04:08:25 -0400
Received: by mail-ot1-f65.google.com with SMTP id i14so1013593otp.5;
        Wed, 11 Mar 2020 01:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ZCSe7QWfMOzQQ3PCkmW4sMD3ngbByjQtOhyC6jqIEY=;
        b=iM3roAG2M2ins5K6ZLqiLBLvKa8k6suyJuAo7A90VOQsCzDRjDwAhI0aDL9nCdLY/O
         xLrA+wqYix1XWO14tT5l+HDYMPd1/dJ1F4ghEwmRUPsxa4bYQAlUSFCmYEGIVZ7gxyMO
         VshHOQ4cNHmPMTtKfSn6FkM404fAXTdpQRvbUlfDSfuwvNYpsafL+MBDiJxTY3b2LyJH
         tvvcIXRp01xlbm9E5zyMYkIx5cWWaXHZznIhuUi5jIVQMT2fWMIonYl066qyY1RZr537
         nO66+l2JthpIZ/bKL5RPOCcLqabIbyUR+GGwhIlSXXWA/dUtPqFVr/7YhIvaSobpKB0O
         o/nQ==
X-Gm-Message-State: ANhLgQ2rej+SaabC4LTQBohO1EKplV3lK3ZOQsFowp97CLctMyVbSTDR
        HX7VzrV2DgDExJ0BfVkDwuA8CNhZpHwX3RqQjKA=
X-Google-Smtp-Source: ADFU+vtdA3bMWi79K8mxJuFPVQLhN8IjOjgpxHdBtcYZn6uR2DlMZ9emkM1RqnXxSoanwu5YiJmYje8PvUuFj2dXYlY=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr1416001ota.250.1583914104997;
 Wed, 11 Mar 2020 01:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200303094848.23670-1-geert+renesas@glider.be> <20200310205504.GA27288@bogus>
In-Reply-To: <20200310205504.GA27288@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Mar 2020 09:08:13 +0100
Message-ID: <CAMuHMdXMSQtmJjmTnph5cKBLStCidzBij8giwvJszNxy1_yt9g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
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

On Tue, Mar 10, 2020 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> On Tue,  3 Mar 2020 10:48:48 +0100, Geert Uytterhoeven wrote:
> > Convert the Renesas Clock Pulse Generator / Module Standby and Software
> > Reset Device Tree binding documentation to json-schema.
> >
> > Note that #reset-cells was incorrecty marked a required property for
> > RZ/A2 before.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in clk-renesas-for-v5.7.
> >
> > v2:
> >   - Remove complex if-construct implementing per-SoC clocks/clock-names
> >     constraints; list all possible clock-names upfront instead,
> >   - Drop Clock Domain member example.
> > ---
> >  .../bindings/clock/renesas,cpg-mssr.txt       | 100 ---------------
> >  .../bindings/clock/renesas,cpg-mssr.yaml      | 119 ++++++++++++++++++
> >  2 files changed, 119 insertions(+), 100 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, queued in renesas-devel for v5.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
