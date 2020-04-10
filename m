Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49851A494B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 19:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgDJRix (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 13:38:53 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37528 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJRix (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 13:38:53 -0400
Received: by mail-oi1-f194.google.com with SMTP id u20so1972599oic.4;
        Fri, 10 Apr 2020 10:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XdKkhj+MIxestaIobaBF5Py0O55b8FRAkYxg8/qU7Mk=;
        b=KgSXwz+n1GxeJB8pkcb6fhZVXNUPmBpoeY/6WvcDcc+8WVr2uCw0ptFIaSNypMObCX
         Gd661dyWNZFwK2uwQwrphEt7h4gthcN8AZhlmoZtyA8SMG6yfkxnRxLokCjoa+z5/HWH
         OgOXX7Dzj0UClavu9gBeV6DRfn2icQJD4sYrppnhbjUoTEp61JivjOqcfg2+/D/yoSic
         pcuNpuyK32olMu6WBcHGaBMicHlC8zB+yhr+LMH5WkMFB/VDv1+bYegj7e9lm0iXTTe7
         wDyabENvXdVU6FYSmdwcdAAS2JKoKrNwu87mpstRPOFigAUhMuUzoW9BMf/ukm2KRo//
         cHrg==
X-Gm-Message-State: AGi0PuarWM9/AAr2Etey+rZF7nV0vBqPlUCfrR1lHOpy9QSJB6tBT/SI
        DGeRGs+p3PGnEGYjwxFrp3bWLRc=
X-Google-Smtp-Source: APiQypJoGfjYY2+R90mg/VCe0oL9AoPHsPbpx8B5DlTnW/KgFKTpCZjQ+xOJRrNLiSFb2SkDjnwKYg==
X-Received: by 2002:aca:4142:: with SMTP id o63mr4045861oia.118.1586540332912;
        Fri, 10 Apr 2020 10:38:52 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net. [99.203.29.27])
        by smtp.gmail.com with ESMTPSA id i20sm1495642ots.31.2020.04.10.10.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:38:52 -0700 (PDT)
Received: (nullmailer pid 14592 invoked by uid 1000);
        Fri, 10 Apr 2020 16:31:39 -0000
Date:   Fri, 10 Apr 2020 11:31:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] dt-bindings: usb: generic-ohci: Document
 power-domains property
Message-ID: <20200410163139.GA14488@bogus>
References: <20200326163807.23216-1-geert+renesas@glider.be>
 <20200326163807.23216-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326163807.23216-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 26 Mar 2020 17:38:06 +0100, Geert Uytterhoeven wrote:
> It is quite common for a generic OHCI block to be embedded in an SoC in
> its own power domain.  Hence allow the DTS writer to describe the
> controller's position in the power hierarchy, by documenting the
> optional presence of a "power-domains" property.
> 
> This gets rid of "make dtbs_check" warnings like:
> 
>     arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dt.yaml: usb@ee080000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks.

Rob
