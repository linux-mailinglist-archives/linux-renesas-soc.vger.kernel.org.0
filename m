Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1706D3DE11C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 22:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhHBU4V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 16:56:21 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:39560 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhHBU4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 16:56:20 -0400
Received: by mail-io1-f51.google.com with SMTP id f6so16051014ioc.6;
        Mon, 02 Aug 2021 13:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RXpLWT2dYimgWZeFIoJm103crGanx3fTeHn26441P4Y=;
        b=ZPUGYhWw+l9agD28FATbVa7z6/O/aUhxdCVvPazR/tKaDXiDkPCOHoAlZ7ppn2jV7A
         4gDpXCE2VCOD8+Nd5SIN6ij+MAWUgoWnJ5q8eZyL+LI798CRG1PJuTiIXI/UoSz05Y0y
         JcG+YrHiP+SBLANMFPe/a1Vs4YdDb/2vEAi4yJW7PsKokY1+z06aGg/Qj6JTxN11EYxv
         6PWeHeunghUoDeJZxG11avgxk3pviRqzj8rB831WU76eHIktbKz0Jd78x0ZwkvL/gx5P
         tDoXhEsEA4TNVoy4hMzwvqqBt8DNlfzfoPfGFxQfSoXfSx/KZ5t+r1LcQY3a6iGBnUxD
         4YYg==
X-Gm-Message-State: AOAM533slSjVko20W+Yjk6alBrrdC6moJBwpQakjN7xxLhN4ALRCHHEH
        zWHvB84xIc+o0cTZqZeXrW9hFob/aw==
X-Google-Smtp-Source: ABdhPJzGjud67K2ExwO/Pyr5iuExgA8eKOWi2kBVjRCiIH66/x6u6Aq8OQoBzg45BYOYuVHPIw3GJA==
X-Received: by 2002:a02:6983:: with SMTP id e125mr9365456jac.112.1627937770422;
        Mon, 02 Aug 2021 13:56:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id u16sm7591156iob.41.2021.08.02.13.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:56:09 -0700 (PDT)
Received: (nullmailer pid 1595195 invoked by uid 1000);
        Mon, 02 Aug 2021 20:56:07 -0000
Date:   Mon, 2 Aug 2021 14:56:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: usb: renesas,usbhs: Document RZ/G2L
 bindings
Message-ID: <YQhb59/Aj6wwGTdA@robh.at.kernel.org>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
 <20210727185527.19907-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727185527.19907-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 27 Jul 2021 19:55:26 +0100, Biju Das wrote:
> Document RZ/G2L (R9A07G044L) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
>  * Added interrupts maxitems=1 for SoC's other than RZ/G2L.
> v3->v4:
>  * Added maxitems in interrupt property as per Rob's suggestion.
> v3:
>  * Updated the bindings as per the USBPHY control IP.
> ---
>  .../bindings/usb/renesas,usbhs.yaml           | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
