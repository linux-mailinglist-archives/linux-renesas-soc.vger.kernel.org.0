Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3DF33086
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbfFCNEd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 09:04:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40309 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfFCNEc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 09:04:32 -0400
Received: by mail-wm1-f67.google.com with SMTP id u16so5769080wmc.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2019 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=03wIuI+95U2k5wsZC8Hm2JFpOnjzC3cBrRUf8IxbDpU=;
        b=iIlx/qlAtzx4C+kJiByh9KQ/8RYsdZpNtII/z4eZYZqEFIDOqI3yOqbROGVScEIhFg
         dhIVxFYa8JH/414z6aG+bF8W10a3l0G5I2opFuAeeCIhZ8JG4uEKH3J8lPD+lg6QNR4t
         9jG3T32ausmHo7QnAhk9TP5XOQQBhCiuMxVKwoK1TGLZYVsdaSsGWmK44dIVFm2iGCoZ
         FVc0cUPmdmfq7XzWQBCwLAOJZQ8k4pp5NDz5oKyZeco3NmzRvsp26ASWtPnethz/BBIa
         Sj79C/FFLdVdOvIrgz7iKVSzela8aqrxdRyAPluVPG9ENrCBdAUh9QN7B0jLNsIc7Ols
         /CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=03wIuI+95U2k5wsZC8Hm2JFpOnjzC3cBrRUf8IxbDpU=;
        b=BHvHVIWAIfFVqwjNvgrfixYEtcfclHYp6kLojG38WuwOzWlDYCzIWdi2ZIhWPteNRZ
         2OWQ+d90Ks9IPX+jTsTlZZkCRsHBpQyEY0u8/8lK/t4lWuPWZuOZ+vU2kIdwhiUyjUw0
         nA0X3BhB+O0+msRkYptxU/D8/pNoFBz1v6AKfN9XhPkXgmwnKiL0v6dmu4xQ2vIKWSzW
         t7d+4VoVl0hJjwMS3mELXO0PGFOY0juBDvfYgfdo46ir+oCsXjOrovDsR5bCHBjGwavH
         K99ExAZ22FEWuJUm5t2R/RH3eCkbT8ery236YZcnsC3JsgWt7j6ICc0dxlasCh2+kCTj
         f3Eg==
X-Gm-Message-State: APjAAAUMYcVfPYVaDqrACn2lC2ysNCiGm8CnEIeNDYXA6NzDlR+/90Nq
        rZr9vs+7roO6zkpNcmWIqzsVdwN6NAE=
X-Google-Smtp-Source: APXvYqzE0Z8unVGrUlHJ6gais9BAMuNRWey3Q/3dVyTPEl/lsPXneHfZZPM8FyhWjW7pcb2cO6NENg==
X-Received: by 2002:a1c:6a11:: with SMTP id f17mr13444788wmc.110.1559567071120;
        Mon, 03 Jun 2019 06:04:31 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id b69sm10857016wme.44.2019.06.03.06.04.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 06:04:30 -0700 (PDT)
Date:   Mon, 3 Jun 2019 14:04:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, bbrezillon@kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, juliensu@mxic.com.tw,
        Simon Horman <horms@verge.net.au>, miquel.raynal@bootlin.com
Subject: Re: [PATCH v13 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3
 RPC-IF controller bindings
Message-ID: <20190603130428.GX4797@dell>
References: <1558423174-10748-1-git-send-email-masonccyang@mxic.com.tw>
 <1558423174-10748-4-git-send-email-masonccyang@mxic.com.tw>
 <0e2994d6-6efc-9f36-f681-609199f20b9f@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e2994d6-6efc-9f36-f681-609199f20b9f@cogentembedded.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 22 May 2019, Sergei Shtylyov wrote:

> On 05/21/2019 10:19 AM, Mason Yang wrote:
> 
> > Document the bindings used by the Renesas R-Car Gen3 RPC-IF controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  .../devicetree/bindings/mfd/renesas-rpc-if.txt     | 65 ++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt b/Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt
> > new file mode 100644
> > index 0000000..20ec85b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt
> > @@ -0,0 +1,65 @@
> > +Renesas R-Car Gen3 RPC-IF controller Device Tree Bindings
> > +---------------------------------------------------------
> > +
> > +RPC-IF supports both SPI NOR and HyperFlash (CFI-compliant flash)
> > +
> > +Required properties:
> > +- compatible: should be an SoC-specific compatible value, followed by
> > +		"renesas,rcar-gen3-rpc" as a fallback.
> > +		supported SoC-specific values are:
> > +		"renesas,r8a77995-rpc"	(R-Car D3)
> > +- reg: should contain three register areas:
> > +	first for RPC-IF registers,
> > +	second for the direct mapping read mode and
> > +	third for the write buffer area.
> > +- reg-names: should contain "regs", "dirmap" and "wbuf"
> > +- clocks: should contain 1 entries for the module's clock
> > +- clock-names: should contain "rpc"
> > +- power-domains: should contain system-controller(sysc) for power-domain-cell
> > +- resets: should contain clock pulse generator(cpg) for reset-cell,
> > +	  power-domain-cell and clock-cell
> 
>    That's just some nonsense, sorry...
>    I suggest that you stop reposting your patches as I'm going to post
> my version of this patchset RSN (based on your patches, of course) and I'm
> going to take care of fixing this file as well.

Why is this necessary?

Why not just provide some constructive feedback instead?

> > +- #address-cells: should be 1
> > +- #size-cells: should be 0
> [...]
> 
> MBR, Sergei

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
