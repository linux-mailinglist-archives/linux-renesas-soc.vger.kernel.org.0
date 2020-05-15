Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AFB1D43AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 04:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgEOCnc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 22:43:32 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34425 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgEOCnb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 22:43:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id c12so984612oic.1;
        Thu, 14 May 2020 19:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P5OdkXkYaCsxx8ZhbJ+caZ8fR1lcvCqja+I1M4czDnE=;
        b=WiDgVtoBE+HYKtovsxXKjiuQ1ump7tc91DdhiY7yKOfAxiq37OgL6LDkt0Ho1Dxj5J
         OUl+aQKmkmx7kLuPGBt4ykSf0Q2aKVJx/L9ss8uwMZ5ZPDZCqqhbmniab3SZIu/TBbKV
         v0yklNkMYKPde3pTjzypdZPp3Hd7faxPYkUu+cqXeMxKYjd6H8zPuhMphb4c2LkY1zvC
         TZOBdd3sqDZOhJYMoL+/dcxU+EWmClKTL4RSNfmjrd/odOlFBReAcNl0hBgRrkyn8FRr
         irVQlhXy4yfgu2pBSrj5JZI3F+MbmYxee3cAVpUNiXP2L3RvnYWH/U7YENJXf/Ys0Jxk
         c5VA==
X-Gm-Message-State: AOAM532XoRCZNyBdvKGkAkJJvhJdqKmgUoNDDeO1DEKh8JfuzeFo0KfP
        iW/UJc0h8DdqLM0kCf+VDBE+X+0=
X-Google-Smtp-Source: ABdhPJyCBdE+0e+PzM+ACFGMBJf1zOk0NX9UV5pHGR2Qzgb7E9TaKScNwQM2zTpPcvF19Pc5Ghaf+Q==
X-Received: by 2002:a54:4087:: with SMTP id i7mr667154oii.65.1589510610564;
        Thu, 14 May 2020 19:43:30 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t6sm243119otb.27.2020.05.14.19.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 19:43:29 -0700 (PDT)
Received: (nullmailer pid 20109 invoked by uid 1000);
        Fri, 15 May 2020 02:43:29 -0000
Date:   Thu, 14 May 2020 21:43:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Convert to json-schema
Message-ID: <20200515024329.GA20037@bogus>
References: <20200507075026.31941-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507075026.31941-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu,  7 May 2020 09:50:26 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas CPG DIV6 Clock Device Tree binding documentation to
> json-schema.
> 
> Drop R-Car Gen2 compatible values, which were obsoleted by the unified
> "Renesas Clock Pulse Generator / Module Standby and Software Reset" DT
> bindings.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.8.
> 
>  .../clock/renesas,cpg-div6-clock.yaml         | 60 +++++++++++++++++++
>  .../clock/renesas,cpg-div6-clocks.txt         | 40 -------------
>  2 files changed, 60 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
