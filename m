Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A43D7F68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 20:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbfJOS4Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 14:56:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46847 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbfJOS4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 14:56:24 -0400
Received: by mail-ot1-f67.google.com with SMTP id 89so17875609oth.13;
        Tue, 15 Oct 2019 11:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HHTFz9uSwh4OuUts3UgqslOAVdahwqh8IjC9kodDCZI=;
        b=KfDFXVmFe1US8DJ9dBiepi0vx39H5RRAcOzPlUY+MENMrqKV/YLk/o41CpjI7eZqCz
         IrANqph7JQmvDQejHewAkK6jt8hpCvrs9DxrNVdoAWKd9DFTcv2mHvA5bj30RwYwn94/
         93t0fKRFacDoQU9bTcDDZHbbPIZoqcvIXocdEhqVWifkcgK+1UXadyYx8GqxZ4IvrSdc
         AZhNs9KdFeECt+TTYYpts0wTIG5hXpNwQmcbpNN0+rl3ARtNemDhfxI0vTRHkCb3fQwH
         x6M6tNZM8Zrh1FBLMTN8vOArStO7TIZM5jTxWMZGDVfIT8EMLGeKCTqbphuqoQ0j3phy
         CiQQ==
X-Gm-Message-State: APjAAAWfQUXLIm7cCUjQZefcw3V48isNIFdnTrCVCs8Tk+oiQy7HmHfA
        wO7FIxZ0kXG2AWu4LH24Yg==
X-Google-Smtp-Source: APXvYqzcgr8bvUAb/uvZB4lhcUUCtQIoS4GH/lbZI/6dKUGnytDajQC2KeD4gr+ONlprmtGvzHSmFw==
X-Received: by 2002:a9d:6e92:: with SMTP id a18mr3410641otr.313.1571165783758;
        Tue, 15 Oct 2019 11:56:23 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d95sm7324238otb.25.2019.10.15.11.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 11:56:23 -0700 (PDT)
Date:   Tue, 15 Oct 2019 13:56:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas: du: Document the
 r8a774b1 bindings
Message-ID: <20191015185622.GA21864@bogus>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
 <1569834905-42868-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569834905-42868-2-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 30 Sep 2019 10:15:02 +0100, Biju Das wrote:
> Document the RZ/G2N (R8A774B1) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
