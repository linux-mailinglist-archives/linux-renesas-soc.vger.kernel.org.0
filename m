Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEDB386F41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 03:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345838AbhERBdX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 21:33:23 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36532 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbhERBdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 21:33:23 -0400
Received: by mail-oi1-f175.google.com with SMTP id f184so8292166oig.3;
        Mon, 17 May 2021 18:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uez9nCOpOm9D096tE/R7AY7+y+Bqv1JOFq0gvLGzvTg=;
        b=M86gOTc9wN/FUaW8CSHutRUZ2wT4XFfQQDmJjrC/g4Y+HYNmbGK8ICeS4bmBOc7h6v
         eVMi+Ce4r5g6cCSAwZPofmhCn89lULAoABHvZWxJDFMGDLOCbt7ZjR/HKCJDTqadrx7L
         BT3nNynRIxsy1exDwnM7WzB6M+V8E272y3YCKwYE46tywNlKqOdYa/URSPWVwynKj/Ck
         rhHgGBDn7XkbXgtXZjeBoSCeBltvv8NKzDkc779XMKWXSTqmE7a3KdP/dIIbxU2f1KjM
         IaH1STziiERpLIGkZjdQ+f4kXGm5sKAl2xofIEOV482HLFll1Ja2Z0lc9WRvEpME09Fk
         TXqw==
X-Gm-Message-State: AOAM530vZz8d4I8VbiL0ujsk1hauT1JPqUlx2+vt3ojNoh+mGzQzip6G
        +LDFHNis6c7+EaD2SLTARA==
X-Google-Smtp-Source: ABdhPJxYPDkxfDU+yhqJ9LIuQ1LaCxsxiw/kcAm7DF6ejxYfpGvFgfCUjY4wP61+e85+ixBM9TyJFg==
X-Received: by 2002:aca:da89:: with SMTP id r131mr2006628oig.3.1621301525131;
        Mon, 17 May 2021 18:32:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x18sm3063408oix.28.2021.05.17.18.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:32:04 -0700 (PDT)
Received: (nullmailer pid 3608070 invoked by uid 1000);
        Tue, 18 May 2021 01:32:03 -0000
Date:   Mon, 17 May 2021 20:32:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Will Deacon <will@kernel.org>, linux-serial@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 03/16] dt-bindings: arm: renesas: Document SMARC EVK
Message-ID: <20210518013203.GA3607834@robh.at.kernel.org>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514192218.13022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 14 May 2021 20:22:05 +0100, Lad Prabhakar wrote:
> Document Renesas SMARC EVK boards which are based on RZ/G2L (R9A07G044L)
> SoC. The SMARC EVK consists of RZ/G2L SoM module and SMARC carrier board,
> the SoM module sits on top of carrier board.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
