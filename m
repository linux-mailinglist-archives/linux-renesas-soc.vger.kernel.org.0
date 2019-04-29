Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3302E9B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 20:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbfD2SF5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 14:05:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37224 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2SF5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 14:05:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id r20so8351984otg.4;
        Mon, 29 Apr 2019 11:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WTTfQTPiR9Lln1RubqrwcdlR+Dm9PkKCSQPPuEHvALE=;
        b=G6UtgijBB692iACUhSIgq7cHJmvEMKIpxEM86Rteb5U2BE4W7xHEWfl5dfnwBReIZl
         iZ09NOTXh2oMfTgJQijkZqIAn9U7R9uArtgC0dWdTp1j+zRBLAgvD5Jfs3aF2PbF10rW
         zWepEgEg25vwD0y2aKSR+hI7Zzu+xn1ByBUpBouKcef5Csm7GcqiQ3V/Hg3wml8IXtu/
         aWDvmOem1oePs6vtjk3S40iGaSbIqgNNmH0W2nUJPMgthACboZyu6M6dh6J0mZlmxNXg
         2aB4UjtsswFh+xMmOEGX/XO7bu3H0YCMCJcSsCxVt27vRYPZOsHi4LH7cPLXhd+/EAEt
         pstg==
X-Gm-Message-State: APjAAAXZQtcW1TVH+zxq7H+NqvXveXRutm8WOc0cnEnkRDdg7z16we/T
        xewMrCIuFWGbMKgZ+efP8g==
X-Google-Smtp-Source: APXvYqwbTFStFEOCu4kA6bFd7LmeqQLNPAsocjRAPVOiLQ+SmzsJLGDcSXS/BHLijB6YjNSdo50/TA==
X-Received: by 2002:a9d:7342:: with SMTP id l2mr38879507otk.56.1556561156248;
        Mon, 29 Apr 2019 11:05:56 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q205sm13982530oih.17.2019.04.29.11.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:05:55 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:05:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH v2 20/20] dt-bindings: can: rcar_can: Document r8a77470
 bindings
Message-ID: <20190429180555.GA25843@bogus>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-21-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-21-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Apr 2019 16:54:22 +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
