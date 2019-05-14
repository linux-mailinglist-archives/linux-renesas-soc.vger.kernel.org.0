Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0AB1CFE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 21:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfENT3K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 15:29:10 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45063 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfENT3K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 15:29:10 -0400
Received: by mail-ot1-f68.google.com with SMTP id t24so7648701otl.12;
        Tue, 14 May 2019 12:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/MVTf0aisppTTKdP+uxkdUKpiOTIcmtmXPVZxRcn+Gw=;
        b=o+PBgeir2uE1fugsvX9EOthKiLbA9fXpPqHfNbrjYuJFg5uST67AktnZYkqgIRHk/o
         ObvlWiAEAMTbz7gV9opTfeu9UiHBxm65tHaxILcfkZSIfID7L1DWKDvWOB2/7KoT5Kk1
         /c8CFh3Lka2fhD/F3cNbDx9zv227jJrH2XQSLPq6eiL8u1KOjLzNZyAWznt+HYjOqp4+
         MjX849ELFgHMxXF8FOov0Wyi9qHGbg9E0PQbip6UI5pm45Rtwk/g6+09UrieB0whMG6U
         bq43Tq61zFI0NKlEseFFSEkpbMKB2ehhlOXsxhfnB+L51CXVj1K9jUj3AOWqyfmNFy+Z
         rjrg==
X-Gm-Message-State: APjAAAXUTNYB8dULbJbx3wYqVvbulD6W9GmdM00ta/4s/zSJ7BW+qF+1
        n/QVN3p3G3UXr5Mgb64B/w==
X-Google-Smtp-Source: APXvYqyhH4NMCJBhWewdCdOzAuKi9STBhWmi4iLXvPTi6RiMyDzEQGnw9jW1+XfSqXfY0YgvViq7fQ==
X-Received: by 2002:a9d:6852:: with SMTP id c18mr7067480oto.174.1557862148697;
        Tue, 14 May 2019 12:29:08 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p132sm6549315oig.37.2019.05.14.12.29.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:29:08 -0700 (PDT)
Date:   Tue, 14 May 2019 14:29:07 -0500
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
Subject: Re: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use
 of usb_x1
Message-ID: <20190514192907.GA15691@bogus>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-5-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-5-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 14 May 2019 09:55:54 -0500, Chris Brandt wrote:
> Document the USB_X1 input and add clock-names to identify
> functional and USB_X1 clocks.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v3:
>  * added clock names
> v2:
>  * removed 'use_usb_x1' option
>  * document that 'usb_x1' clock node will be detected to determine if
>    48MHz clock exists
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
