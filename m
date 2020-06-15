Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B351F90F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2020 10:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgFOIED (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jun 2020 04:04:03 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49373 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgFOIED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 04:04:03 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 99BE520003;
        Mon, 15 Jun 2020 08:04:01 +0000 (UTC)
Date:   Mon, 15 Jun 2020 10:07:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VIN-Tests PATCH] scripts: boards: Support alternative H3 variant
Message-ID: <20200615080726.2vah2bsjuqyounea@uno.localdomain>
References: <20200611142601.359091-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200611142601.359091-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Jun 11, 2020 at 03:26:01PM +0100, Kieran Bingham wrote:
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

Don't we have r8a77951 as well ?

Thanks
  j

>          gen="gen3"
>          vins="0 1 2 3 4 5 6 7"
>          csis="20 21 40 41"
> --
> 2.1.4
>
