Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBED1CFE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 21:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfENTaF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 15:30:05 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36610 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfENTaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 15:30:05 -0400
Received: by mail-oi1-f193.google.com with SMTP id l203so1326oia.3;
        Tue, 14 May 2019 12:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v3w1ecDtAsBGji4FDBMEJkqZ/7+Xfd8+g7YwC1rmRsc=;
        b=dUOj51yPN470iIPlEZYRGzaFjX+wLn23Oz4eOxHZMutyJoHUJl0CwkGHQ508gDqezD
         E8eP5n6IgHE7sHe9/8q/XJvQIzKLEec9CtHwZMkLnm0tnklZnXFIiSd8ZL0YOAFWk/m2
         goXC7HNRYexJz4y4+mypP0Scek8ZVUCg9fvV4VsYwLfIEFNJ+zYwkmJM0H7lRUyDVjnK
         O5SNfgeG11sczhpFtfEar/56bJ9+wYBGVJQ1/B/bVHjQDGtsNcbFgpU9yErbvEYNrSz8
         rFfUDxRkhw+wn0JlL/I93FHS7G9sbrdFGNrjCHarjyNEWBL8W1OYoBl8KjH/4caoveHq
         XbUA==
X-Gm-Message-State: APjAAAXMeK4mj/gxw8f9azAyCesC0Zao5NjVdEcStG2Z/0Vilk+ckSJ3
        TA7sQ+5VRVbbaM1NtH0QqFs6WXw=
X-Google-Smtp-Source: APXvYqyaOJmZAXY84NCFKptjXl5161/TSMlgN0yRYGmomMdRDUyFWJXUiSRnI0izBzD6ki8jnqVl3Q==
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr4242269oia.88.1557862203455;
        Tue, 14 May 2019 12:30:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t14sm2541115otm.15.2019.05.14.12.30.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:30:02 -0700 (PDT)
Date:   Tue, 14 May 2019 14:30:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210
 support
Message-ID: <20190514193002.GA17443@bogus>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-8-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-8-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 14 May 2019 09:55:57 -0500, Chris Brandt wrote:
> Document RZ/A2 (R7S9210) SoC bindings.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
