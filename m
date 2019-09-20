Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8CB912D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 15:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfITNxN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 09:53:13 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35685 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbfITNxN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 09:53:13 -0400
Received: by mail-oi1-f193.google.com with SMTP id x3so1815111oig.2;
        Fri, 20 Sep 2019 06:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ew6nG7uE2nCglBGvtLTGWDJ9g6OFEZPeUvSfGAO1CvA=;
        b=IAU/mk6WiSwaigieZcQpajVAoiautaBfkbsIPHVW4hGPEFuXnHqB179zLx6SpOjYgV
         m/zaJqvWiioFLB7GaQnwAHVL6raQj58qK0R4/BvvDMKeLPqUaV48G4maj+pUqjEiYnFA
         8s+ljXNFEEMt1Yc1gKdAsnzLQLmeXlHdV45aaViP5Lfh2rgSjTqA12bIKAYEnL4oAr4H
         Ej2xvfSAkoVduhhrUxcpMauA0F8fzS+iXSBgGCvG6vi8aOk5wIBQlzUo9YGhzFq18h+R
         UQMICcAsxYpZbJfofc2t6GbdstvqULXL1ZdiZibrRA3DEg0MT5wdHO/i5xZWcXauuJfd
         Ktcg==
X-Gm-Message-State: APjAAAXCJquuXUedhfXd2Bk8ILTLhKQl+UYkEGLk+rUYqg/IXdNPW1u7
        u+bkOcQGNLki+VItC+cA8JoUDdr5wqxP2msdoAo=
X-Google-Smtp-Source: APXvYqxyoTNvKH7T458ph8kh+7/xWwRdrE5jz5zjyMR4oIb1jJD/RFwuE2RDNv0DtrqX2JS96ax+IqIjH9IvJiK/VZw=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr3113597oig.102.1568987591649;
 Fri, 20 Sep 2019 06:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <1568724324-26995-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568724324-26995-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 15:53:00 +0200
Message-ID: <CAMuHMdXOicpnUC7UNHT+P1bMsTKgm2oVsewnzjo4MmznwnNahA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Document r8a774b1 bindings
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 2:52 PM Biju Das <biju.das@bp.renesas.com> wrote:
> RZ/G2N (R8A774B1) SoC also has the R-Car Gen3 compatible SCIF and
> HSCIF ports, so document the SoC specific bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
