Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BA31F77EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 14:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgFLM2J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 08:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgFLM2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 08:28:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769CFC03E96F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2020 05:28:07 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17E5E24F;
        Fri, 12 Jun 2020 14:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591964883;
        bh=w2jJAibkp/4eL/jTZbal6EWWwYGmS64YxHhSo86w1hE=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=M3V9+LnvbfJaocyF0APuY7pQMG64qeE2c0C5hCIoahpKwIxZw6aFGUV8nTa5WVshE
         h95b47Qt8RrUDdMj3VniLvZAgxLd2qU49hRzfjNuo7GnZsRZ3N9OcUy9LFFIyIJ7kU
         mz91xhIVxMQjd20L6C0ukh9cULj94f+FZvzMFQeE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] fixup! dt-bindings: media: i2c: Add bindings for Maxim
 Integrated MAX9286
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610144421.22592-1-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a5854f2f-c868-103d-6eab-65d2c7155540@ideasonboard.com>
Date:   Fri, 12 Jun 2020 13:28:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610144421.22592-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks - this looks good to me, and fixes the validation.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks, will integrate into the current patches.


On 10/06/2020 15:44, Jacopo Mondi wrote:
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml   | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 34e0431d0bc1..8307c41f2cae 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -176,6 +176,8 @@ properties:
>                  description: The remote device compatible string.
> 
>                reg:
> +                minItems: 2
> +                maxItems: 3
>                  description: |
>                    The I2C addresses to be assigned to the remote devices through
>                    address reprogramming. The number of entries depends on the
> @@ -294,7 +296,7 @@ examples:
> 
>              camera@51 {
>                compatible = "imi,rdacm20";
> -              reg = <0x51 0x61>;
> +              reg = <0x51>, <0x61>;
> 
>                port {
>                  rdacm20_out0: endpoint {
> @@ -312,7 +314,7 @@ examples:
> 
>              camera@52 {
>                compatible = "imi,rdacm20";
> -              reg = <0x52 0x62>;
> +              reg = <0x52>, <0x62>;
> 
>                port {
>                  rdacm20_out1: endpoint {
> @@ -329,7 +331,7 @@ examples:
> 
>              camera@53 {
>                compatible = "imi,rdacm20";
> -              reg = <0x53 0x63>;
> +              reg = <0x53>, <0x63>;
> 
>                port {
>                  rdacm20_out2: endpoint {
> @@ -346,7 +348,7 @@ examples:
> 
>              camera@54 {
>                compatible = "imi,rdacm20";
> -              reg = <0x54 0x64>;
> +              reg = <0x54>, <0x64>;
> 
>                port {
>                  rdacm20_out3: endpoint {
> --
> 2.27.0
> 

