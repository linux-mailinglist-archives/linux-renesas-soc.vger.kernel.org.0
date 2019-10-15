Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279FCD7F6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 20:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbfJOS4n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 14:56:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33053 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbfJOS4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 14:56:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id 60so17911739otu.0;
        Tue, 15 Oct 2019 11:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=69K9D3r3isAzGWCkl4tXGaPbezJWNQZqBGY3SWlTvH8=;
        b=q8+6+p+A/ZWsD/eLyAZxTkBs6M271m0xoGS9QMLVHOTsnQiNGFWV5BxUmFiuEwIywN
         VmNOCaOKtcBWqMhXNKsVElqUIqfGPh+prxc9PSaBzfh0K1glxAaYIbJkjHhLzlmezLTI
         NuQV4xSV2/E98gj1Rxwfe+pwTsl5eqEjpu/OJlqoFvLqSCf6WDlRe6HU5SKMGip1miBq
         wC5sSJgYZFO6zfKxdmn8VDpXtL5S0jrWw9J3xSsViKAd8mAM4tK415ygUHBG9u/PC6+H
         c/2zwoQNV12pr85/xiyTEPVX0L66s/FRZYdUmw6YhSWCUC2ut5e8X0Bw8Wr8VkCzGnpW
         qn9Q==
X-Gm-Message-State: APjAAAWXKU+h9BYCldlx28SiYRTuyxuW8JRgxUnAe5cHkRgA0gkTNkhH
        xLpJssGzPB0edpWVl2Rr8g==
X-Google-Smtp-Source: APXvYqwznC5nnuLw55IrKarIOGDxG0q3cxJ3XaDTBfOOj5rvpnL8DNj9vP4G4i/KrqJyhAGfxRkjCw==
X-Received: by 2002:a9d:684a:: with SMTP id c10mr4682978oto.354.1571165801222;
        Tue, 15 Oct 2019 11:56:41 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t17sm6601720otk.14.2019.10.15.11.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 11:56:40 -0700 (PDT)
Date:   Tue, 15 Oct 2019 13:56:40 -0500
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
Subject: Re: [PATCH 3/4] dt-bindings: display: renesas: lvds: Document
 r8a774b1 bindings
Message-ID: <20191015185640.GA22440@bogus>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
 <1569834905-42868-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569834905-42868-4-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 30 Sep 2019 10:15:04 +0100, Biju Das wrote:
> Document the RZ/G2N (R8A774B1) LVDS bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
