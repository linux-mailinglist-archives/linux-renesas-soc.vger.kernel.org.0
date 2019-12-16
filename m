Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25391121E4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 23:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfLPWhX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 17:37:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbfLPWhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 17:37:22 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70EEEA34;
        Mon, 16 Dec 2019 23:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576535840;
        bh=p77Y5ZiE/rWTOBcZMbafahplTxyOUAIkK8quPrPZA3I=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Z3Ql+jruk/S34ESgszc73hnfXbNow/4vDG1ne+MTZO0IWkUpM2LFWn0ydSExEmClV
         bEazWZ0UPRFx+mj45IpM+zpZ/mX9p3ACbzNHxkemWWiQ99W9auBAirBzLBQCeLupvC
         m/0Sab8k3jz/1J5WkQQq7yZ2nvLWHuPhoy8//LJM=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RFC 02/11] fixup! arm64: dts: renesas: salvator-x: Add MAX9286
 expansion board
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
 <20191216171620.372683-3-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f422690d-d4db-8838-d63a-0992597ef91d@ideasonboard.com>
Date:   Mon, 16 Dec 2019 22:37:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216171620.372683-3-jacopo+renesas@jmondi.org>
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
> r8a7795-es1-salvator-x.dt.yaml: camera@31: reg: [[49, 65, 81]] is too short

Agreed, these should be separated.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks - I'll squash this onto my gmsl/platform branch.

--
Kieran


> ---
>  .../boot/dts/renesas/salvator-x-max9286.dtsi     | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> index cfa3ecb6b2ae..0cc4c82b512f 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> @@ -191,7 +191,7 @@ i2c@0 {
>  #ifdef MAXIM_CAMERA0
>  				camera@31 {
>  					compatible = MAXIM_CAMERA0;
> -					reg = <0x31 0x41 0x51>;
> +					reg = <0x31>, <0x41>, <0x51>;
>  
>  					port {
>  						rdacm20_out0: endpoint {
> @@ -211,7 +211,7 @@ i2c@1 {
>  #ifdef MAXIM_CAMERA1
>  				camera@32 {
>  					compatible = MAXIM_CAMERA1;
> -					reg = <0x32 0x42 0x52>;
> +					reg = <0x32>, <0x42>, <0x52>;
>  					port {
>  						rdacm20_out1: endpoint {
>  							remote-endpoint = <&max9286_in1>;
> @@ -229,7 +229,7 @@ i2c@2 {
>  #ifdef MAXIM_CAMERA2
>  				camera@33 {
>  					compatible = MAXIM_CAMERA2;
> -					reg = <0x33 0x43 0x53>;
> +					reg = <0x33>, <0x43>, <0x53>;
>  					port {
>  						rdacm20_out2: endpoint {
>  							remote-endpoint = <&max9286_in2>;
> @@ -247,7 +247,7 @@ i2c@3 {
>  #ifdef MAXIM_CAMERA3
>  				camera@34 {
>  					compatible = MAXIM_CAMERA3;
> -					reg = <0x34 0x44 0x54>;
> +					reg = <0x34>, <0x44>, <0x54>;
>  					port {
>  						rdacm20_out3: endpoint {
>  							remote-endpoint = <&max9286_in3>;
> @@ -326,7 +326,7 @@ i2c@0 {
>  #ifdef MAXIM_CAMERA4
>  				camera@35 {
>  					compatible = MAXIM_CAMERA4;
> -					reg = <0x35 0x45 0x55>;
> +					reg = <0x35>, <0x45>, <0x55>;
>  					port {
>  						rdacm20_out4: endpoint {
>  							remote-endpoint = <&max9286_in4>;
> @@ -344,7 +344,7 @@ i2c@1 {
>  #ifdef MAXIM_CAMERA5
>  				camera@36 {
>  					compatible = MAXIM_CAMERA5;
> -					reg = <0x36 0x46 0x56>;
> +					reg = <0x36>, <0x46>, <0x56>;
>  					port {
>  						rdacm20_out5: endpoint {
>  							remote-endpoint = <&max9286_in5>;
> @@ -362,7 +362,7 @@ i2c@2 {
>  #ifdef MAXIM_CAMERA6
>  				camera@37 {
>  					compatible = MAXIM_CAMERA6;
> -					reg = <0x37 0x47 0x57>;
> +					reg = <0x37>, <0x47>, <0x57>;
>  					port {
>  						rdacm20_out6: endpoint {
>  							remote-endpoint = <&max9286_in6>;
> @@ -380,7 +380,7 @@ i2c@3 {
>  #ifdef MAXIM_CAMERA7
>  				camera@38 {
>  					compatible = MAXIM_CAMERA7;
> -					reg = <0x38 0x48 0x58>;
> +					reg = <0x38>, <0x48>, <0x58>;
>  					port {
>  						rdacm20_out7: endpoint {
>  							remote-endpoint = <&max9286_in7>;
> 

