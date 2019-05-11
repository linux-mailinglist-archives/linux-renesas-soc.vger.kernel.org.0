Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E359C1A911
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 20:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfEKSXs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 14:23:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57068 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfEKSXs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 14:23:48 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B0AAD5;
        Sat, 11 May 2019 20:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557599026;
        bh=/qejcC+uRNbxJK5gPHHP99Vzouj8ulXkMRR3VIzU+0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N0zTy/g4Nmz/rSm37d2GXgQLcaRnJVa4OrFm8uNstUozBJ8U7nAjGk5ZmXVQ1WySZ
         eOQSKNEr8yMTLpD9etp2KlvY4qSJlVMv5KxZH/nBauhius2t1YqI76rbjtxkc5QgbM
         ETC5/LzMunqux6Sb7yukwRzcGuxxkYst7uW6wLZY=
Date:   Sat, 11 May 2019 21:23:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 2/9] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190511182330.GF13043@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508173428.22054-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, May 08, 2019 at 07:34:21PM +0200, Jacopo Mondi wrote:
> Document the newly added 'cmms' property which accepts a list of phandle
> and channel index pairs that point to the CMM units available for each
> Display Unit output video channel.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index aedb22b4d161..2ccf78bf9a18 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -44,6 +44,10 @@ Required Properties:
>      instance that serves the DU channel, and the channel index identifies the
>      LIF instance in that VSP.
>  
> +  - cmms: A list of phandle and channel index tuples to the CMM modules
> +    connected to DU channels. The phandle identifies the CMM instance that
> +    serves the DU channel identified by the index.

Do we need the index ?

It should also be noted that the property is optional for SoCs that
don't have any CMM.

> +
>  Required nodes:
>  
>  The connections to the DU output video ports are modeled using the OF graph

Could you update the example ?

-- 
Regards,

Laurent Pinchart
