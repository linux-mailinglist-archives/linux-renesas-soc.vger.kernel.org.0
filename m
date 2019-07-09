Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC336367D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 15:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfGINKP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jul 2019 09:10:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38404 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGINKP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 09:10:15 -0400
Received: from [192.168.43.26] (unknown [86.8.202.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C854256A;
        Tue,  9 Jul 2019 15:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562677811;
        bh=MC2VktNHFEzC8E+DTe2UiB5DhWKIJmSeaH4pPOxCqyU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IZxchB5GZRgI3H3uorN1VxyGSwpEy5eytBXqvjMZquAsTYicmUZHDF1z/6VHMipu4
         uEiO3Jo2FoWLZEIdljV/pAdAcTJ1zk6jRSHUs66TUhR+KwguZKwhGg4z2Ti7wke+MA
         UdC54Omud2BY6i4EdMx5SCsnpg9IK9B42MqL4byo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-4-jacopo+renesas@jmondi.org>
 <20190708031121.GA5046@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
X-Enigmail-Draft-Status: N11100
Organization: Ideas on Board
Message-ID: <6c62ed5e-fbfd-cf5e-7611-47577e78efe6@ideasonboard.com>
Date:   Tue, 9 Jul 2019 14:10:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190708031121.GA5046@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 08/07/2019 04:11, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Sat, Jul 06, 2019 at 04:07:30PM +0200, Jacopo Mondi wrote:
>> Update the 'vsps' property in the R-Car Gen3 SoC device tree files to
>> match what's in in the documentation example.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

+1 from me too. This certainly improves readability/clarity IMO.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
>> ---
>>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
>>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 2 +-
>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
>>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
>>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>> index 3f86db199dbf..e643f9d3c102 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>> @@ -1807,7 +1807,7 @@
>>  			clocks = <&cpg CPG_MOD 724>,
>>  				 <&cpg CPG_MOD 723>;
>>  			clock-names = "du.0", "du.1";
>> -			vsps = <&vspd0 0 &vspd1 0>;
>> +			vsps = <&vspd0 0>, <&vspd1 0>;
>>  			status = "disabled";
>>  
>>  			ports {
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> index 097538cc4b1f..432f4036a8a8 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> @@ -3098,7 +3098,7 @@
>>  				 <&cpg CPG_MOD 722>,
>>  				 <&cpg CPG_MOD 721>;
>>  			clock-names = "du.0", "du.1", "du.2", "du.3";
>> -			vsps = <&vspd0 0 &vspd1 0 &vspd2 0 &vspd0 1>;
>> +			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
>>  			status = "disabled";
>>  
>>  			ports {
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
>> index 2554b1742dbf..b701aeb4f438 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
>> @@ -2456,7 +2456,7 @@
>>  			clock-names = "du.0", "du.1", "du.3";
>>  			status = "disabled";
>>  
>> -			vsps = <&vspd0 0 &vspd1 0 &vspd0 1>;
>> +			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
>>  
>>  			ports {
>>  				#address-cells = <1>;
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
>> index 56cb566ffa09..79db5441b7e7 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
>> @@ -1764,7 +1764,7 @@
>>  			clocks = <&cpg CPG_MOD 724>,
>>  				 <&cpg CPG_MOD 723>;
>>  			clock-names = "du.0", "du.1";
>> -			vsps = <&vspd0 0 &vspd1 0>;
>> +			vsps = <&vspd0 0>, <&vspd1 0>;
>>  			status = "disabled";
>>  
>>  			ports {
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> index 5bf3af246e14..49a11b4f55bd 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>> @@ -1001,7 +1001,7 @@
>>  			clocks = <&cpg CPG_MOD 724>,
>>  				 <&cpg CPG_MOD 723>;
>>  			clock-names = "du.0", "du.1";
>> -			vsps = <&vspd0 0 &vspd1 0>;
>> +			vsps = <&vspd0 0>, <&vspd1 0>;
>>  			status = "disabled";
>>  
>>  			ports {
> 

