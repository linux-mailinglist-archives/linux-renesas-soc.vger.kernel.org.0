Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0729C250C3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 01:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgHXXUa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 19:20:30 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42889 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbgHXXU3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 19:20:29 -0400
Received: by mail-il1-f194.google.com with SMTP id t13so8809157ile.9;
        Mon, 24 Aug 2020 16:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8XWgtZ5vK4Up0B/TM+RG3qQRtltpsqm7mpiHnDxkI/k=;
        b=S9ui9W8J5Zw0Q+ks8yTkkKtxP/5ZzvEpbVHevEYmbKKdvXwPFSlDJ4qcRi4ywEGT4K
         D9YGxfJxlocwAdjJ/i2wmD66qC5XEtC9AvdC2cn10898yremd/9WIpg/l+RokEt13+A4
         h+Ev+L2gZKrEPqMFO8PyVT9zvdWDfgYAV3OHtBMwM3nvte7G8dxRoTnt1Z/4WJfJMTDe
         +ce7XR70SLFg4kVtKs4Xf9d4IH+hJfcGenxFsoHkr23mjo9yYQEhiGsa779/wOOVHBUq
         /StkzbvF6SuMQ7dKU7R0P/XI8yULw2HZt7aRUakjP/PxvPitmCLqY3p0uHLnjFooJN4O
         ghlA==
X-Gm-Message-State: AOAM530gx1VaArpYBZVyPxCKJuZIS9plS7Eh0G8ZmV8uUIbgTg72M+yZ
        tYt5PdrxZpJ4xVzEF6MQ3Q==
X-Google-Smtp-Source: ABdhPJz81NPScr2o01A9W03ELR+DP9VWy39xJ2Ke3mVIJWm3TaZo+hozKvdkj9Tji8yfCnvlI+90Yg==
X-Received: by 2002:a05:6e02:f92:: with SMTP id v18mr6694844ilo.125.1598311228358;
        Mon, 24 Aug 2020 16:20:28 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id s87sm8176382ili.73.2020.08.24.16.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:20:27 -0700 (PDT)
Received: (nullmailer pid 3523832 invoked by uid 1000);
        Mon, 24 Aug 2020 23:20:24 -0000
Date:   Mon, 24 Aug 2020 17:20:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/9] dt-bindings: display: renesas, dw-hdmi: Add r8a774e1
 support
Message-ID: <20200824232024.GA3523701@bogus>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Aug 2020 15:02:13 +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Document RZ/G2H (R8A774E1) SoC bindings.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
