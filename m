Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BBA250C36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 01:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgHXXUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 19:20:09 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34195 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXXUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 19:20:08 -0400
Received: by mail-io1-f66.google.com with SMTP id w20so7236693iom.1;
        Mon, 24 Aug 2020 16:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gK1GTkCC8Zew+U1kaN27vLD8RJiFflkvDjKcjyT1Kno=;
        b=aNVr7e1XvoOlNoKxyXVgB7pKUyDCqSn/cEFgcXWkuWp62eK4XRTvxi8iAWyxtbSxf3
         seC1PuBOpv9utopjmbXjKI1mzgIEd21U8MeBsnZgDoBOROHWSjMx2ugirn8PmVzauaZh
         qrUymskM14pfthQRJW994RNVkFI3jKjX5nw78GvnzZGd8uVmwWaa6yOh81B/kyutDKfk
         E8/E9Cr9RdsA6Qx6w2DC8PsPK4JPj1MpxbH7pHwdviQ59eEN44uQK8b5BwtxkkGH2pAR
         nsngqVOY6wZNLBfdFAAXW3cv3rdzFoAB7801NInELCju3n/xyyiSdcK6lhcsZdOBHv+D
         5VKQ==
X-Gm-Message-State: AOAM532VOwDUTd4srkSQy45RT+ZmRYqhI8rH7ky+kanqn+BtLiOawJyc
        B3OcUgn5XQRaQeoy/bJpMg==
X-Google-Smtp-Source: ABdhPJxBYS4/DghsKLFxaoIr2jx3kUrfxLwg3FjAD4LLPIstojRTz703uiXN219DtKHssoSq7utgPQ==
X-Received: by 2002:a05:6638:1a7:: with SMTP id b7mr7739743jaq.1.1598311207296;
        Mon, 24 Aug 2020 16:20:07 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id d19sm543169iop.14.2020.08.24.16.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:20:06 -0700 (PDT)
Received: (nullmailer pid 3523179 invoked by uid 1000);
        Mon, 24 Aug 2020 23:20:03 -0000
Date:   Mon, 24 Aug 2020 17:20:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/9] dt-bindings: display: renesas, lvds: Document
 r8a774e1 bindings
Message-ID: <20200824232003.GA3523119@bogus>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Aug 2020 15:02:12 +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Document the RZ/G2H (R8A774E1) LVDS bindings.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
