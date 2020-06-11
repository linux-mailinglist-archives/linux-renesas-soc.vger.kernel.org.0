Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2561F6A7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2020 17:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgFKPBU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jun 2020 11:01:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgFKPBU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 11:01:20 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F924F9;
        Thu, 11 Jun 2020 17:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591887678;
        bh=Z1ZON2VjTI2WborDhVXC15TaxtmH61fqtnlgTg7UebU=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=Kh3zRlaD4Na8xgx4Hf3+T9Gr2U/vepPOX6rCPNfj1Ew87oHvAYSAd0kSfr74W15/z
         XLut2FFMwO8KNuUxtMCN2wZYNCtTnaU9FMNZZkjzMPLvm2m2tV9QJWqKeoDuVPvyW2
         N/Y2HPtypD1ll28cYfT34zrpTXSfSUeOJtQab6iI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [VIN-Tests PATCH] scripts: boards: Support alternative H3 variant
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
References: <20200611142601.359091-1-kieran.bingham+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8bbb22d2-f10e-7079-b789-277befbe9877@ideasonboard.com>
Date:   Thu, 11 Jun 2020 16:01:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611142601.359091-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On 11/06/2020 15:26, Kieran Bingham wrote:
> The Salvator-X H3 has had a rename of it's model information.
> Support the new naming.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  scripts/boards.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/boards.sh b/scripts/boards.sh
> index 0ec2981..001c017 100644
> --- a/scripts/boards.sh
> +++ b/scripts/boards.sh
> @@ -3,7 +3,8 @@
>  info=$(strings /proc/device-tree/model)
>  
>  case $info in
> -    "Renesas Salvator-X board based on r8a7795 ES1.x")
> +    "Renesas Salvator-X board based on r8a7795 ES1.x" |
> +        "Renesas Salvator-X board based on r8a77950")

Sorry - not sure what happened in creating this patch, but there is
supposed to be a \ line contniuation and better indenting there...

Expect a (working) v2 soon.

--
Kieran


>          gen="gen3"
>          vins="0 1 2 3 4 5 6 7"
>          csis="20 21 40 41"
> 

