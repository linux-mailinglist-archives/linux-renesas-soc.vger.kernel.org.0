Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6BC2121E7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 23:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfLPWki (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 17:40:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60108 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfLPWki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 17:40:38 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D01CDA34;
        Mon, 16 Dec 2019 23:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576536036;
        bh=OOQ253wdNBfpvbNdmsaRqBHLuQcDU4VRJziZhy1aLy0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iNWfkU82mhJItl90q15fuHWUVyKvz7rfHvf5u7WxpqFulmCYg9HWpB9/EXEPuKrlm
         +YXm5jV3wgsNQ1eJhINYiW3eJcunzVkGL3+pbl/dIb0Ko80yi70SvVYI5y+qB1OEdi
         CKe8NnlHS+R3+LLKWgoz1CwVOU1ffEGNzdcHZ6U0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RFC 03/11] fixup! arm64: dts: renesas: eagle: Provide Eagle
 FAKRA dynamic overlay
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
 <20191216171620.372683-4-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c8123fa1-b918-caad-4917-c6d694b49d8d@ideasonboard.com>
Date:   Mon, 16 Dec 2019 22:40:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216171620.372683-4-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 16/12/2019 17:16, Jacopo Mondi wrote:
> Fixes DTC warning
> r8a77970-eagle.dt.yaml: camera@51: reg: [[81, 97]] is too short

Also agreed,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks - I'll squash this onto my gmsl/platform branch.

> ---
>  arch/arm64/boot/dts/renesas/eagle-fakra.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
> index 1f3aeb49e4d9..d30d0f25e60f 100644
> --- a/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
> +++ b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
> @@ -63,7 +63,7 @@ i2c@0 {
>  
>  			camera@51 {
>  				compatible = EAGLE_CAMERA0;
> -				reg = <0x51 0x61>;
> +				reg = <0x51>, <0x61>;
>  
>  				port {
>  					fakra_con0: endpoint {
> @@ -80,7 +80,7 @@ i2c@1 {
>  
>  			camera@52 {
>  				compatible = EAGLE_CAMERA1;
> -				reg = <0x52 0x62>;
> +				reg = <0x52>, <0x62>;
>  
>  				port {
>  					fakra_con1: endpoint {
> @@ -97,7 +97,7 @@ i2c@2 {
>  
>  			camera@53 {
>  				compatible = EAGLE_CAMERA2;
> -				reg = <0x53 0x63>;
> +				reg = <0x53>, <0x63>;
>  
>  				port {
>  					fakra_con2: endpoint {
> @@ -114,7 +114,7 @@ i2c@3 {
>  
>  			camera@54 {
>  				compatible = EAGLE_CAMERA3;
> -				reg = <0x54 0x64>;
> +				reg = <0x54>, <0x64>;
>  
>  				port {
>  					fakra_con3: endpoint {
> 

