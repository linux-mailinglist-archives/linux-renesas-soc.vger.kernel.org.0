Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3FA386F3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 03:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345819AbhERBc6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 21:32:58 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40728 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbhERBc5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 21:32:57 -0400
Received: by mail-ot1-f50.google.com with SMTP id t4-20020a05683014c4b02902ed26dd7a60so7268765otq.7;
        Mon, 17 May 2021 18:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HGk8JGouwGwt9j4bsvqyjE+RuWeLT4fFs2uq7PWxBNQ=;
        b=uFvgzT9PGLqO0lEaFkkTpsJKXvZ+Ur4SOAwafdBsifTYFNSmKV16ZAWesFZFifFu3x
         V1ZIN9WARlVaSDbrTOhHJOimOOtkq3it7V0W8iglHP3ZRCvYhixIcascaGRKDkUIR7HC
         QKYoXu/qMMSp7SdVISfq7FFXg+zinA5JDO0U7MjOa3FxZaZwpU1xMk3jwetnEQi1gEQ7
         ODqhwx5hGKfzQcGa7wwvA4rJLzI4rqGSNs4BeI/KOC3p2714nhL6q13WzUZufg6dMaiP
         5CmTHzvnVNbLdorb99Kzrl4lqbh87J7EdBKGW8v50tf6y1Ae/sTCnEOxmjePB/by9Pfo
         aN0A==
X-Gm-Message-State: AOAM532DCS1REHbRbWP3oJwkarCCHHO0K9AIG9aUqCzdHjZeJhrRTWhr
        POyy47AH8VJlqH1y3D70cw==
X-Google-Smtp-Source: ABdhPJzkNWAr9zk2RHqwOxb9aI5YSoEFZJ+0NO4LOTlMuWhXZmQUf0agGjFOqu5Vm7Q/l4CIufCqEw==
X-Received: by 2002:a9d:f66:: with SMTP id 93mr2063607ott.229.1621301499934;
        Mon, 17 May 2021 18:31:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i23sm452157ota.16.2021.05.17.18.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:31:39 -0700 (PDT)
Received: (nullmailer pid 3607292 invoked by uid 1000);
        Tue, 18 May 2021 01:31:37 -0000
Date:   Mon, 17 May 2021 20:31:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-serial@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/16] dt-bindings: arm: renesas: Document Renesas
 RZ/G2{L, LC} SoC variants
Message-ID: <20210518013137.GA3606888@robh.at.kernel.org>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514192218.13022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 14 May 2021 20:22:04 +0100, Lad Prabhakar wrote:
> Add device tree bindings documentation for Renesas RZ/G2{L,LC}
> SoC variants.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
