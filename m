Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E165386F4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 03:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345869AbhERBe4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 21:34:56 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:33659 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345873AbhERBes (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 21:34:48 -0400
Received: by mail-ot1-f46.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so7317722oto.0;
        Mon, 17 May 2021 18:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D65EnJmxTcUCbvl2GSwUBmhh4Xjfak4IzC5C4H2tkAg=;
        b=tLcIPw0bUXm7yhfWvldJP45Dy2d0zkfXFakz5a1cwTM6zzxuuwaZjo47e5SZUGZ5VO
         zgjHNKhsLAtQfS5lDn69NGe8H+9+bjQM4ooQr+5ZWA8nxbLcj+1FZw9MlGAjAPqyOK2s
         +hoI1omuFp/jpgIcoGtXmLlLmObFEgcVpZjmiIBjDDyrtdJiDvyzCIDLILpubkW9T024
         WHfyfWse3mLcyke888cZYM+6048TBcattvGO2Z067X4gcSx01hQXbnCdVApb4ZBMf5i8
         lVuOYE87BgsPmwN/XsB4Jg1a9onrs+ibqZAhDSPaU9tlETyt5K/kLMV0KaDCFE/5yAb7
         1A/w==
X-Gm-Message-State: AOAM533SXmWlRteh5sL1iaA6za9D3508uZxPc457wZtzaXf4YmHdaD5V
        332VggMtJ26eO9atwRmsUw==
X-Google-Smtp-Source: ABdhPJzOEVJqvk206Cs0D6qq0nFZ9XTKW5K75Uw7/ZzsZnxtrzHjpvHglknoArWTLhweKcajO0REDg==
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr2065553otd.13.1621301609890;
        Mon, 17 May 2021 18:33:29 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v79sm3094468oia.14.2021.05.17.18.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:33:29 -0700 (PDT)
Received: (nullmailer pid 3610458 invoked by uid 1000);
        Tue, 18 May 2021 01:33:28 -0000
Date:   Mon, 17 May 2021 20:33:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-clk@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 09/16] dt-bindings: serial: renesas, scif: Document
 r9a07g044 bindings
Message-ID: <20210518013328.GA3610408@robh.at.kernel.org>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514192218.13022-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 14 May 2021 20:22:11 +0100, Lad Prabhakar wrote:
> Document R9A07G044 SoC variants, common compatiable string
> "renesas,scif-r9a07g044" is added for RZ/G2L and RZ/G2LC SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
