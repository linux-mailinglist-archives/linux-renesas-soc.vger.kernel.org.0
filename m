Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16694203407
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 11:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgFVJxR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 05:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgFVJxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 05:53:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423CBC061794
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 02:53:17 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 531C530D;
        Mon, 22 Jun 2020 11:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592819594;
        bh=s7cX6z6T8NdoOb8+asf+fRHRFbJ+lZiv52PctZcITg4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TxouCerN+v0uipadsU6NXMHL7eHsyzPwZtHahBr5h+SbufG2bAo6L1+j6LI6NgKR0
         lMtnO2bjf9xAW3D/IogKHTHbuPatSojbcFQ4yExOmPratx3J5XJMRqbFCGvHUlNz55
         gUEfcSGYBTMAEq48J5JFIwThJL56tUzL2f0jMua4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/3] scripts/boards.sh: Fix M3-W identifier
To:     Jacopo Mondi <jacopo@jmondi.org>, niklas.soderlund@ragnatech.se
Cc:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
References: <20200615121935.108142-1-jacopo@jmondi.org>
 <20200615121935.108142-2-jacopo@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <21e37cce-f1f2-bb8f-111c-1592f73d01d6@ideasonboard.com>
Date:   Mon, 22 Jun 2020 10:53:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615121935.108142-2-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 15/06/2020 13:19, Jacopo Mondi wrote:
> The M3-W SoC has been renamed to r8a77960, adjust the board.sh script to
> identify it correctly.
> 

We probably don't need to keep backwards compatibility indeed ...

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  scripts/boards.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/boards.sh b/scripts/boards.sh
> index 0ec2981..2069494 100644
> --- a/scripts/boards.sh
> +++ b/scripts/boards.sh
> @@ -13,7 +13,7 @@ case $info in
>          vins="0 1 2 3 4 5 6 7"
>          csis="20 40 41"
>          ;;
> -    "Renesas Salvator-X board based on r8a7796" | \
> +    "Renesas Salvator-X board based on r8a77960" | \
>          "Renesas Salvator-X 2nd version board based on r8a77965")

But I wonder if this script should use more 'wildcard' matching.
It does seem awkward to match generically in some cases though, so
nothing wrong with keeping things explicit for now.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

But now I've written that I see these patches are already integrated ...
never mind.
--
Kieran


>          gen="gen3"
>          vins="0 1 2 3 4 5 6 7"
> 

