Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5C4372E3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 18:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbhEDQsQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 12:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbhEDQsQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 12:48:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529D3C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 09:47:19 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05E99580;
        Tue,  4 May 2021 18:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620146836;
        bh=HZBWdIAE24TsMi3WzAwcMDQHYFa615RbODQWsNEc5s0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=puRnk0fCvMmznm9US3izZY3ZMoXSh9E0sttHxTe5IWKiZAb/O7YY7CyQddaJoZbTs
         /pLJJ4OmNS054LDHrzdKekuTZ/8mveGpNuG/T/Ck3iNN1Yta7xzCTvOB00BUuebdgx
         vB8UjakzEkCT1Vq8ar4qL86oPvMncHn34mzQXORQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] arm64: dts: renesas: eagle: Add x1 clock
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Valentine Barshak <valentine.barshak@cogentembedded.com>
References: <75a66bae21937da1c69e8024ce61b35aad4ac9b8.1620119570.git.geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b0017f77-5d83-9cd2-c826-9fbede1748d8@ideasonboard.com>
Date:   Tue, 4 May 2021 17:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <75a66bae21937da1c69e8024ce61b35aad4ac9b8.1620119570.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert, Valentine,

On 04/05/2021 10:14, Geert Uytterhoeven wrote:
> From: Valentine Barshak <valentine.barshak@cogentembedded.com>
> 
> This adds X1 clock which supplies a frequency of 148.5 MHz.
> This clock is connected to the external dot clock input signal.
> 
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> [geert: Verified schematics]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of hardware

Tested on my Eagle-V3M with running the DU tests:

  Testing composition on CRTC 46: SUCCESS
  Testing connector HDMI-A-1: SUCCESS
  Testing plane formats: SUCCESS
  Testing legacy mode set on connector HDMI-A-1: SUCCESS
  Testing modes on connector HDMI-A-1: SUCCESS
  Testing atomic mode set on connector HDMI-A-1: SUCCESS
  Testing page flip on connector HDMI-A-1: SUCCESS
  Testing plane positioning boundaries: SUCCESS

and verifying that the output visible was as expected.

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 874a7fc2730b00db..5c84681703edad2e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -73,6 +73,12 @@ memory@48000000 {
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	x1_clk: x1-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <148500000>;
> +	};
>  };
>  
>  &avb {
> @@ -104,6 +110,8 @@ channel0 {
>  };
>  
>  &du {
> +	clocks = <&cpg CPG_MOD 724>, <&x1_clk>;
> +	clock-names = "du.0", "dclkin.0";
>  	status = "okay";
>  };
>  
> 

