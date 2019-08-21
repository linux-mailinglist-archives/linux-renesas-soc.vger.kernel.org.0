Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B62097471
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfHUIIn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:08:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41548 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfHUIIn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:08:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id o101so1235955ota.8;
        Wed, 21 Aug 2019 01:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I5rJ+LgesoC7AynbsAseB7wBlrDfYZEt8xOH1BAWrRw=;
        b=rjFVesl3bYbiMyX56ycIF08Tdt7DylbgiQHrsIOjZEll3OlxbA4lE2dl0RD/XqEs6E
         XhfG0gMu/o986udYYSGwVgtbIL1guOkDUY4TGEjzoLwfTwGSeZRU55A7Y/u6T/nbfavU
         OcmkBz+wFnfs7bz78GmhYfwFjGmCydQtTcrkluvxfznX+IbUaoq9iJaWMmSb//M8yIaU
         WgNSAUSoFdaLnMsg+XSivx1B/TcBYiH69qoH5V/vvuFWCEPIuZhXsX5ELZEhLuzH3IGF
         pVqGSRBPCgHAmJqhchlYBiW+Xe+NQq8gkaE7EamTtE1kNLI9LAC1NEaG9UAdbp/WxCr6
         atsA==
X-Gm-Message-State: APjAAAXuRm+KcbnWpiAvVBUN7/lF02nafadPIktPbCNWFs4d8i1VaeTN
        8pS3J4MvsnE4fTa9dS/iRX2RoX8WoU1SFYYkKNw=
X-Google-Smtp-Source: APXvYqytP9lnOmhw/UzkYieT2Cpod9tSyWoAvw9O1xo79IqGuOVYzgXkm87zepO83MQShjpWZfwTTdSYUyK1G21D4bY=
X-Received: by 2002:a9d:459d:: with SMTP id x29mr26675694ote.39.1566374922681;
 Wed, 21 Aug 2019 01:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-21-git-send-email-cv-dong@jinso.co.jp> <20190429180555.GA25843@bogus>
In-Reply-To: <20190429180555.GA25843@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:08:31 +0200
Message-ID: <CAMuHMdXFEh6fdiUermaBauQFxHNiv2KKKaC+2uQYytxShGoC5w@mail.gmail.com>
Subject: Re: [PATCH v2 20/20] dt-bindings: can: rcar_can: Document r8a77470 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 8:05 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, 11 Apr 2019 16:54:22 +0900, Cao Van Dong wrote:
> > Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> >
> > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> > ---
> >  Documentation/devicetree/bindings/net/can/rcar_can.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
