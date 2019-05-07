Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E05915729
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 03:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfEGBGK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 21:06:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:43726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbfEGBGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 21:06:10 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73FE520B7C;
        Tue,  7 May 2019 01:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557191169;
        bh=LSi+ahKBHhtw0SgbhSpbkRCSMnUdvf1fGu2M/pFQX24=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SIS1StPP4NbTujJmlzTuo2pAgCNds02uDQsfRzaBsXqe2d1pwkDakgNKmikcAZEME
         C61ghM/9m/+nYPTEaNy+yNThadAzPjnv53he/3UKCi1FXaHIi9/jl9hMXyUYot2pCS
         3OXzO2T7Nxyss0W3SANVJovZHT7EDMEUnRoGiYHo=
Received: by mail-qt1-f174.google.com with SMTP id p20so313251qtc.9;
        Mon, 06 May 2019 18:06:09 -0700 (PDT)
X-Gm-Message-State: APjAAAV3WnWsQWw5mjEncBcvTdDpYJhUswMh1P1PkDIOjIyQKT7nV2hv
        sWTggvlQe+vkCBdu3o2fBvPxq5NgJ/GHFWSH3w==
X-Google-Smtp-Source: APXvYqy+NuDcDyonM1Kzd44j7O5gxBOBCZ8Ws046DLNcOj8lxZplb1Ao8VEBgO3qLKZrXHRnSrbk8sBvVkd0dwokA8s=
X-Received: by 2002:aed:306c:: with SMTP id 99mr23508625qte.38.1557191168661;
 Mon, 06 May 2019 18:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190506234631.113226-1-chris.brandt@renesas.com> <20190506234631.113226-3-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-3-chris.brandt@renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 May 2019 20:05:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+LkTXMv+YpHyLcGh4ztUMmz2dSfnzcHXymHi-_VMi_KA@mail.gmail.com>
Message-ID: <CAL_Jsq+LkTXMv+YpHyLcGh4ztUMmz2dSfnzcHXymHi-_VMi_KA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: rcar-gen3-phy-usb2: Document uses_usb_x1
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 6, 2019 at 6:47 PM Chris Brandt <chris.brandt@renesas.com> wrote:
>
> Document the optional renesas,uses_usb_x1 property.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index d46188f450bf..26bf377102d3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -46,6 +46,8 @@ channel as USB OTG:
>                regulator will be managed during the PHY power on/off sequence.
>  - renesas,no-otg-pins: boolean, specify when a board does not provide proper
>                        otg pins.
> +- renesas,use_usb_x1: boolean, the dedicated 48MHz crystal inputs USB_X1 are
> +                      used for the PLL source

s/_/-/
