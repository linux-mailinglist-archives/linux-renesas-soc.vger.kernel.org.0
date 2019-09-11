Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3018B00E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 18:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbfIKQGj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 12:06:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36712 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728703AbfIKQGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 12:06:39 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF88C33A;
        Wed, 11 Sep 2019 18:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568217997;
        bh=F2dlj/MFhkCIb/9CSt/w8Fw5jSo4ioGNSYWJmqdIqPY=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qdsaUQYM6hhd68U1apolZTzXB9co1nILTU0yuAVKimxwB0wlDzP++mspv/miVEfr+
         An2oEmr6fbOzXHdV1hL2ArT97vQ9oQH32eOL8jyob6Pmp8r24Q37cG3PkZrB4R6ECs
         BwWHzNIl91Psdsne5U5s8D+NNwhFBw7ylnvXCuGE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 2/9] dt-bindings: display, renesas,du: Document cmms
 property
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-3-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
Date:   Wed, 11 Sep 2019 17:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 06/09/2019 14:54, Jacopo Mondi wrote:
> Document the newly added 'cmms' property which accepts a list of phandle
> and channel index pairs that point to the CMM units available for each
> Display Unit output video channel.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index c97dfacad281..1773b0a2f54f 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -45,6 +45,10 @@ Required Properties:
>      instance that serves the DU channel, and the channel index identifies the
>      LIF instance in that VSP.
> 
> +  - renesas,cmms: A list of phandles to the CMM instances present in the SoC,
> +    one for each available DU channel. The property shall not be specified for
> +    SoCs that do not provide any CMM (such as V3M and V3H).
> +
>  Required nodes:
> 
>  The connections to the DU output video ports are modeled using the OF graph
> @@ -91,6 +95,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  			 <&cpg CPG_MOD 721>;
>  		clock-names = "du.0", "du.1", "du.2", "du.3";
>  		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +		renesas,cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;

Should these be comma separated in the same fashion as the vsps are
separated?

I don't really mind either way though ...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> 
>  		ports {
>  			#address-cells = <1>;
> --
> 2.23.0
> 

