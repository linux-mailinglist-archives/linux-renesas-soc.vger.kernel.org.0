Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C33121E82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 23:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfLPWlk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 17:41:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60124 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfLPWlk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 17:41:40 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3507A34;
        Mon, 16 Dec 2019 23:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576536098;
        bh=I1Qn/jmgMmQAuyycrP2Kf5riyO8UBNWgt1qwWrm10MQ=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=W1dvgzsEs+xumP0X4T5D58EN6tf2sPkvdkVRnA60ZISwpBHuf/cosVVzdu0SuB00z
         JIJZb2HCb9KwJgrkHWIS/Y/7cTEv6d7EQsyAZs9nbYTTnSXLhgS6qY+fAwT/QzjmDM
         52QmjlA0xCzw3YA/nQgFpE/vcveUtgcGAI483ObE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RFC 04/11] fixup! arm64: dts: renesas: eagle: Provide MAX9286
 GMSL deserialiser
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
 <20191216171620.372683-5-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <93eaaa42-53a5-3aa6-5c22-0786e1fcaad6@ideasonboard.com>
Date:   Mon, 16 Dec 2019 22:41:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216171620.372683-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 16/12/2019 17:16, Jacopo Mondi wrote:
> Fixes DTC warning:
> r8a77970-eagle.dts:236.29-335.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@e66d0000/gmsl-deserializer@48: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Aha, this must be a left over from moving the child nodes into an i2c-mux.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks - I'll squash this onto my gmsl/platform branch.

> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index c8cd548b7981..614f8d68d991 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -263,9 +263,6 @@ gmsl: gmsl-deserializer@48 {
>  		compatible = "maxim,max9286";
>  		reg = <0x48>;
>  
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
>  		/* eagle-pca9654-max9286-pwdn */
>  		enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
>  
> 

