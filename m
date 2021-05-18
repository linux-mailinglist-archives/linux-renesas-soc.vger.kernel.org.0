Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50022386F48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 03:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240520AbhERBea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 21:34:30 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:43698 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbhERBe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 21:34:29 -0400
Received: by mail-oi1-f176.google.com with SMTP id j75so8246633oih.10;
        Mon, 17 May 2021 18:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uTLXERbDhAh7r0mJaAjns09/cR3tBAq0nsSnw1ftLOo=;
        b=Qbi7LeEsmxqpKl+qNhfVFK8UZMmuw2lgCGmcM19l7U17jzb+/VQJMOsA16EIUwY7L5
         XAS2tsg4biz6CnRdRzeEJ0VVhaAzkc3NpSW7TxbhQFUhgi4gAppG0e6ozJoz2z4YfNDT
         jLctLwKhJRdqyM2G7ge9dEd66TMJUsZMSGJZM2g2VeSqdZoYzDfEx4BneW/Gw8n6Rafc
         11k5m0R6OUApW5OztnsKouQl9fVpGCkrp9e+jQ2l2FEyNSeGpkeVPnGdfg7SB9QnqMrE
         MCOgmAzir4CDYt9TZAClIjGw70VoBKxAGnmxI8cPvON6F7Y93Iz7eSdRawnNibAPDYwn
         eXBQ==
X-Gm-Message-State: AOAM5309yAUo3P+UGAm1RBT0wSwreNnQfncLuk+bbXEhIXem6461F6fj
        gSUZiCE23znM2fg42zDVlQ==
X-Google-Smtp-Source: ABdhPJzwOANur1ugLK6xrOZpw1Judb3emQqShZJnU0yZUN8ssZC+aL018tnvyDpdNFzU7zMM4cByug==
X-Received: by 2002:a05:6808:13ca:: with SMTP id d10mr2102586oiw.24.1621301590968;
        Mon, 17 May 2021 18:33:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k7sm3416479ood.36.2021.05.17.18.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:33:10 -0700 (PDT)
Received: (nullmailer pid 3609867 invoked by uid 1000);
        Tue, 18 May 2021 01:33:09 -0000
Date:   Mon, 17 May 2021 20:33:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-serial@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 06/16] dt-bindings: arm: renesas, prr: Add new compatible
 string for RZ/G{L, LC, UL}
Message-ID: <20210518013309.GA3609813@robh.at.kernel.org>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514192218.13022-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 14 May 2021 20:22:08 +0100, Lad Prabhakar wrote:
> RZ/G2{L,LC,UL} SoC's have LSI_DEVID register to retrieve SoC product and
> revision information.
> 
> RZ/G{L,LC,UL} SoC's have 28-bit product-id compared to other R-Car and
> RZ/G2{E,H,M,N} SoC's hence a new compatible string "renesas,devid" is
> added.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas,prr.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
