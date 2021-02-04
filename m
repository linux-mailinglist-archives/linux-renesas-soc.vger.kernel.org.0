Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F77630F6FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 17:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237673AbhBDP6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 10:58:48 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:40629 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237661AbhBDP6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 10:58:41 -0500
Received: by mail-oi1-f176.google.com with SMTP id k142so4173563oib.7;
        Thu, 04 Feb 2021 07:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1JoS7ZOVE9Ml5mvNzoRFgSFxVIiKASQvqvy7j1NPt3U=;
        b=nhJIsssXK15CqsjxpbwmXr1f3u85DTfzZvbQk1YqZuuI1tD8nhHdWeMprjH4nZvf08
         VqYxFD7m/2ZF3ehF5mVIlCsNJklxf4ezsmSx0PN3VHmNRsIyWR2Ifut+N1h7EU176w3o
         xqKSHmmryoJNY6g1MWZUWkv9rs2oZF5PtlCtiOHMT5lEyazz/nD0JomiAL/wIuf1JknR
         Ef0fdhz33cKyDVK+GaL/VUxYeRaDRbRRfY90UJ2B4CtbEpl8J8KxBW1UScY3r3xeAfQH
         jA+TjeFotmwTWJgCXxZUSuJun1DD2sp9iSc3K89G4laINUNT/A5t9Gtw0D2cJpDoySdY
         LAww==
X-Gm-Message-State: AOAM533PBrQISRPBe3A3CFO/ZREB2LhIea2M37KQW/eG7frrmhrMigAH
        6HEUOSIlpw7yz7OP4kNMhA==
X-Google-Smtp-Source: ABdhPJwsBZ5X+etCKN8Abu4ufC5JowP7grlS3OIUacD2jRxRHv/O619GgCksaoDNro8ZLT90PYGmBA==
X-Received: by 2002:aca:c310:: with SMTP id t16mr29076oif.151.1612454280855;
        Thu, 04 Feb 2021 07:58:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w140sm319379oia.32.2021.02.04.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:58:00 -0800 (PST)
Received: (nullmailer pid 519407 invoked by uid 1000);
        Thu, 04 Feb 2021 15:57:59 -0000
Date:   Thu, 4 Feb 2021 09:57:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: clk: versaclock5: Miscellaneous fixes
 and improvements:
Message-ID: <20210204155759.GA519221@robh.at.kernel.org>
References: <20210126163955.1933893-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126163955.1933893-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 26 Jan 2021 17:39:55 +0100, Geert Uytterhoeven wrote:
>   - Remove unneeded reference for "idt,slew-percent", as vendor specific
>     properties having a standard unit suffix don't need a type,
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
> 
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH dt-schema 0/2] dt-schema: Add percentage"
> https://lore.kernel.org/r/20210126162756.1932692-1-geert+renesas@glider.be
> 
> v3:
>   - Drop references for "idt,voltage-microvolt" and "idt,slew-percent",
> 
> v2:
>   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
>     ('clk: vc5: Use "idt,voltage-microvolt" instead of
>     "idt,voltage-microvolts"'),
>   - Drop reference to clock.yaml, which is already applied
>     unconditionally,
>   - Drop removal of allOf around if condition, as it is unnecessary
>     churn.
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.yaml       | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
