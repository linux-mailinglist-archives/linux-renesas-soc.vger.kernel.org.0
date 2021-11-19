Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C39B45747A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 17:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236126AbhKSQ57 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 11:57:59 -0500
Received: from mail-oo1-f50.google.com ([209.85.161.50]:46721 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbhKSQ57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 11:57:59 -0500
Received: by mail-oo1-f50.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso3917070ood.13;
        Fri, 19 Nov 2021 08:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zUhpnNDxh/kL1/qn3nX2Hug0FaP34iEbtzLmhVZQOnw=;
        b=t+HJNM55nwcBaJoLqf5RHakkgctF7hcvDspeTePgkLrzMpvkV77DOX7ZxSkvTYsXAD
         /imjwDvfx8tAAq5qDxBMeBI/AdvbUsgkmVeMOYl99bsuKfb2zGoX7pHMazLEOgLSRwwk
         2PejLq8uGLfS3B+oHZD6S/IOTwUuqVU/OJdsFtxLfYr9b8Xb5IR9J4bSgDIeHxjtfq4l
         bGzB5W595aGgK5+qFB+dxupauzjXRl0XJiF33mFyzwddxc1DBkHpX8qMmNs7V8JMDGpm
         O95Q9Z6/9pPZxHe3CgHRzZpfg1BK2ZkCDWo3ndg3BzxJdOFSZ5gzqII22woOKf9qTO2A
         z8xg==
X-Gm-Message-State: AOAM532AxEwrRKbUbOUmqFb5Vaa+9X9TOnev7hzup3/vbHLV/LModj7P
        LljIe0/FF7N42uJjZLEGBnR0re1nxA==
X-Google-Smtp-Source: ABdhPJwO1Dyb6njB8jf/zuAdX+BmFyDedIe+i8GY8qKCIj9UmJGgb/b2wuRghEMuK+7DqxeU/7KxkQ==
X-Received: by 2002:a4a:9204:: with SMTP id f4mr19127682ooh.87.1637340896737;
        Fri, 19 Nov 2021 08:54:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j20sm68034ota.76.2021.11.19.08.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:54:55 -0800 (PST)
Received: (nullmailer pid 4029482 invoked by uid 1000);
        Fri, 19 Nov 2021 16:54:54 -0000
Date:   Fri, 19 Nov 2021 10:54:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: renesas,sci: Document RZ/G2L
 SoC
Message-ID: <YZfW3hIbwzz6UTVx@robh.at.kernel.org>
References: <20211110232920.19198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211110232920.19198-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110232920.19198-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 10 Nov 2021 23:29:19 +0000, Lad Prabhakar wrote:
> Add SCI binding documentation for Renesas RZ/G2L SoC.
> 
> Also update the example node with RZ/G2L SCI0 node.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3
> * Added const "renesas,sci" entry under items for h8300
> ---
>  .../bindings/serial/renesas,sci.yaml          | 46 ++++++++++++++++---
>  1 file changed, 40 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
