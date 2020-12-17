Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC162DD34C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 15:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgLQOxE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 09:53:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48948 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgLQOxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 09:53:03 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89A732CF;
        Thu, 17 Dec 2020 15:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608216741;
        bh=cEGaVI2tJhN5ajVC/K4Tal/4c8ASBdqHS7bVwvqOdEg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gfSzSnanMPAatrV998KoAP1Sbo6eZ6GYyBVmTBB9jdtKHZrb69kPl871Wx0Jd/H6C
         JwnxVa3KZsIGMhYQVJYZ9udMJpwGs31BIPX3fl1d0QfU5yb6taNMexhcYiKLLI39Ne
         nrieaVfRBBWyvb5xag5kyPnv9f9yLXM6IJT20ncQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a779a0: Add FCPVD support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
 <20201216170018.861710-2-kieran.bingham+renesas@ideasonboard.com>
 <X9pGs3NwNQcmzu1f@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d1ec30f5-a72e-df69-4a39-7e68e81b5066@ideasonboard.com>
Date:   Thu, 17 Dec 2020 14:52:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9pGs3NwNQcmzu1f@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 16/12/2020 17:41, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Wed, Dec 16, 2020 at 05:00:16PM +0000, Kieran Bingham wrote:
>> Provide FCPVD support for the V3U.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>> index 6cf77ce9aa93..ba6fbbd8710e 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>> @@ -117,6 +117,22 @@ gic: interrupt-controller@f1000000 {
>>  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>>  		};
>>  
>> +		fcpvd0: fcp@fea10000 {
>> +			compatible = "renesas,fcpv";
>> +			reg = <0 0xfea10000 0 0x200>;
>> +			clocks = <&cpg CPG_MOD 508>;
>> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>> +			resets = <&cpg 508>;
>> +		};
>> +
>> +		fcpvd1: fcp@fea11000 {
>> +			compatible = "renesas,fcpv";
>> +			reg = <0 0xfea2f000 0 0x200>;
> 
> This doesn't match the node address (the former being correct I
> believe). With this fixed,

Oh dear, that's bad indeed.

I'm sorry - could you help me locate the correct buttons on my keyboard
to fix this please? :

> https://as1.ftcdn.net/jpg/00/74/64/78/500_F_74647888_XIrZ25aSYKhu5YB4PyuU7qYqzAJr3EjQ.jpg

:-D

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks.

K

> 
>> +			clocks = <&cpg CPG_MOD 509>;
>> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>> +			resets = <&cpg 509>;
>> +		};
>> +
>>  		prr: chipid@fff00044 {
>>  			compatible = "renesas,prr";
>>  			reg = <0 0xfff00044 0 4>;
> 

