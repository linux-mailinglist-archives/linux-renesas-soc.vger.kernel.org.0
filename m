Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A96B3EBD22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 22:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbhHMUNt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 16:13:49 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:42845 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbhHMUNt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 16:13:49 -0400
Received: by mail-oi1-f172.google.com with SMTP id t35so17601752oiw.9;
        Fri, 13 Aug 2021 13:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OquAakahea26nEMMYnVSuFdMaOwT9nWOuEZ5pT1GDFg=;
        b=QN8ueV5MJRO1DZbtUgELK/L+FUDxnoGeP3yTQnA5oUo3JABLK7a6x/nrcd/fXN+a/n
         +EGH6xrcQPhqGCYGJVl+kQ8/zB+clwwMJVPDZgpv4WrfDlUemmCw4P1f7Np2gqnYGU7y
         81SrAzdd051wjshsSQs8+xAt+ff5qR2EbBUhGdGKZ72HbddRre4A0PSXChv1LClMqLgN
         hWPxJQH8ijqkqipCdyI4bb4i58M3LhPoPkP0s26CYyieJsWvVlFPIM8osr6ST9fSlTLS
         NHRgymRNKh+3niy15CXDEKPnSP75W8RpTHKU4Wy+7uSRWk2D+PG/ooc7veWzaTcab3w/
         HUjQ==
X-Gm-Message-State: AOAM530RBa6HV8x5DJaFUJyS6TIa49LmXIeeNy6zcGnL/6Hx8Fbvd7Fx
        4DUxWiQMfPxEtJD/IoXVTw==
X-Google-Smtp-Source: ABdhPJz+sTeYclyG6tB76eUhdgMTPu4W3K1FCrw3tb0uxcBscFGu5U1dDPVVvXhkvpngfi+DznOqcA==
X-Received: by 2002:a05:6808:1389:: with SMTP id c9mr3468628oiw.89.1628885601554;
        Fri, 13 Aug 2021 13:13:21 -0700 (PDT)
Received: from robh.at.kernel.org (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com. [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
        by smtp.gmail.com with ESMTPSA id o18sm558321oiw.27.2021.08.13.13.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 13:13:20 -0700 (PDT)
Received: (nullmailer pid 3945957 invoked by uid 1000);
        Fri, 13 Aug 2021 20:13:18 -0000
Date:   Fri, 13 Aug 2021 15:13:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
Message-ID: <YRbSXn9P41o28u32@robh.at.kernel.org>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 06 Aug 2021 11:29:29 +0100, Biju Das wrote:
> The DMAC driver on RZ/G2L expects the slave channel configuration
> to be passed in dmas property.
> This patch updates the example node to include the encoded slave
> channel configuration.
> 
> Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note:-
>  This patch is based on [1]
>  [1]:- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210806095322.2326-2-biju.das.jz@bp.renesas.com/
> 
> v3->v4:
>  * Updated bindings as the DMAC driver on RZ/G2L expects the
>    slave channel configuration to be passed in dmas property.
> v2->v3:
>  * Merged the binding patch with dmas added
>  * Updated dt binding example with encoded #dma-cells value.
> v1->v2:
>  * Rebased on 5.14-rc2.
> ---
>  Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
