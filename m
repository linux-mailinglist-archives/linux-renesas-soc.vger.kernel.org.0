Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411A61E85BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2020 19:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgE2Rur (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 May 2020 13:50:47 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40057 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbgE2Ruq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 May 2020 13:50:46 -0400
Received: by mail-il1-f193.google.com with SMTP id t8so2806266ilm.7;
        Fri, 29 May 2020 10:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aZMImuOMErdosJw902w3lfnnqYNAbBeX5tzr7TiMmoE=;
        b=jjXD8JYRB9kL4yAYfByvrPi5szWrSQ73Ke/yrYwX/ezHQJKItg/V8rtuAZ8/7e9pQ4
         BwaxwoldxZOyjXsMqbKLAlMB38J7z0C0FK/idECL1BVOtfyH+pZ7582VShmlMCQNUxxt
         U6bmI7gb9RUcLf2kJHdwfzcTqEF/VrOULpNp68vPumMbVJwNzPyZr7bWh8wbuZ6Vp+Um
         PLVYSUGXvKcjFzm8mNwOgtlP+WIHUwlr6SCiu6pyr0htcRdsFxm64DnEPbpLZJ2q5ick
         Pa1DtcCFiK+igj4+1uEOjhKwgP+ju8vDaNQALIiQ92YTjJ4fiQR4jWaETADXQNdviFpo
         upjQ==
X-Gm-Message-State: AOAM530G6DXqiUp2php6HYUwAROCved1R/gcAbDMayj9K+x9Vddpan/6
        ED7HTxh+4Fq0QyxdpwQxIl+NO0TQ7g==
X-Google-Smtp-Source: ABdhPJx2Ns3zNiNxUdzgyDku6xMKAeXBcxz6x0Fk8S26HMB57s65sJE/GP7d3bzt0EqhR0Xyk9Bf6Q==
X-Received: by 2002:a92:ba05:: with SMTP id o5mr8844482ili.263.1590774645587;
        Fri, 29 May 2020 10:50:45 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v2sm3151751iol.36.2020.05.29.10.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 10:50:44 -0700 (PDT)
Received: (nullmailer pid 2647017 invoked by uid 1000);
        Fri, 29 May 2020 17:50:43 -0000
Date:   Fri, 29 May 2020 11:50:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     alsa-devel@alsa-project.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
Message-ID: <20200529175043.GA2646968@bogus>
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 26 May 2020 22:01:43 +0100, Lad Prabhakar wrote:
> Document RZ/G1H (R8A7742) SoC bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
