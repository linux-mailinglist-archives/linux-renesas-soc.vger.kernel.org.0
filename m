Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CFB227228
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jul 2020 00:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgGTWVe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 18:21:34 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46039 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgGTWVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 18:21:34 -0400
Received: by mail-io1-f68.google.com with SMTP id e64so19300901iof.12;
        Mon, 20 Jul 2020 15:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bKYIymgYEsaoAp0VGuX+X+GdB+8XUwPd9yIWMXOJP1w=;
        b=hyTu/7AZwsxWFKuXgHnq/8w3UkGTp2ZOT/wjdl+ecTqi+F7gHTc8szOv8BUYE1Wb1Y
         Ie+uzbEwe0V02SvAEE7ajlFj85aMVKwxkFEhKDLQGmTiSNa/VuBjNT7Z8vudFQ3MJcWp
         tBhgE+Q2Vdvym3BNc+bZ9GOv6l/pcphSDrXm3sJ+599u5xfFRmSwelKG3seOIvy65HCp
         +cucKDdr4xMvr6ifw0ElxIybvbQKYvKPzIMcPK20KFdTzRoJ2EfIV6TJkVeoUM1b9erd
         Da9Vc4U6BsIV8MAB/oxGFC1Aav0ABecPMzqpWF+hNBhGHwobBcbmaBzbDx3eJXkMixi2
         D8VQ==
X-Gm-Message-State: AOAM53133vsFyVUtIjvoUKePadMO4QtB+CaVrymcgsdU93ON2X3PhOMu
        mVx/asb3fUiOSckQVflzfg==
X-Google-Smtp-Source: ABdhPJyw7PV9vqQm9bNholJCp9qVWUHQhJ4HzWTR9RO+AmibGdJC53lLZ6Ro0lZ/VF/HqsMbn+QlAg==
X-Received: by 2002:a05:6638:1187:: with SMTP id f7mr29447388jas.21.1595283693108;
        Mon, 20 Jul 2020 15:21:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n1sm9463052ilo.68.2020.07.20.15.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 15:21:32 -0700 (PDT)
Received: (nullmailer pid 3055517 invoked by uid 1000);
        Mon, 20 Jul 2020 22:21:31 -0000
Date:   Mon, 20 Jul 2020 16:21:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: mmc: renesas,sdhi: Add r8a774e1 support
Message-ID: <20200720222131.GA3055470@bogus>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594230511-24790-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 08 Jul 2020 18:48:27 +0100, Lad Prabhakar wrote:
> Document SDHI controller for RZ/G2H (R8A774E1) SoC, which is compatible
> with R-Car Gen3 SoC family.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
