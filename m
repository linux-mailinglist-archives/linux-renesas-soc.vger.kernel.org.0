Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 926D11A490D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 19:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgDJRgz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 13:36:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40918 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgDJRgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 13:36:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id q2so2489275otk.7;
        Fri, 10 Apr 2020 10:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MzwM/gQ/NLaRvDFMI25L91K+i3EhNsGz95soTyWuQBo=;
        b=WCAbFeh/+b8aiImco+FcjemeUmUjLuH7pSK3E8H/CC9dnOB2DjOatVw/kXjZgLkrGe
         FLuNW+hcRyh4BlHgz0aSQRYUcxIFZHBuE91bwhRF/xlOTb72sRqDGxTf5cfMYxR+NKbH
         ZPL+hQJh3WCpaIbzJxDJFeyIcXDGTh2f5ptJSihmiw7mnnDlo9hTrYe0LH4dWOom12VT
         7kKCuRcFbFt/EF0gK86SEWNqTJ0PudWpFctKR/8ZJnj5WVbG4z1VSo/JNWMqFLAiSPy4
         SxxEhzM24qZqXEQJwhXCCA0dSwERA9L8JMXBO6avJ/T1AmotlIvNLi8SF06VjFYh7+cO
         TmJg==
X-Gm-Message-State: AGi0PuYyslzXsjDds9AkvAeScoCAKxfAur09hvknncm0vRxnS+VHzOSj
        hEo3UeLoRBd1NEP1LDwkhA==
X-Google-Smtp-Source: APiQypLnAMIYEtn1snzAX7XsnL8YdEKpMgCeNLiH6hW+fVNoQm1scqQIshatQunCogs3B6D0xJoNWA==
X-Received: by 2002:a4a:c819:: with SMTP id s25mr4930618ooq.6.1586540215007;
        Fri, 10 Apr 2020 10:36:55 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net. [99.203.29.27])
        by smtp.gmail.com with ESMTPSA id d25sm1625369ooh.34.2020.04.10.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:36:54 -0700 (PDT)
Received: (nullmailer pid 13792 invoked by uid 1000);
        Fri, 10 Apr 2020 16:31:08 -0000
Date:   Fri, 10 Apr 2020 11:31:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] dt-bindings: usb: generic-ehci: Document
 power-domains property
Message-ID: <20200410163108.GA13579@bogus>
References: <20200326163807.23216-1-geert+renesas@glider.be>
 <20200326163807.23216-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326163807.23216-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 26 Mar 2020 17:38:05 +0100, Geert Uytterhoeven wrote:
> It is quite common for a generic EHCI block to be embedded in an SoC in
> its own power domain.  Hence allow the DTS writer to describe the
> controller's position in the power hierarchy, by documenting the
> optional presence of a "power-domains" property.
> 
> This gets rid of "make dtbs_check" warnings like:
> 
>     arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dt.yaml: usb@ee080100: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks.

Rob
