Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7C261C70
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 21:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbgIHTU2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 15:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731119AbgIHQCR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 12:02:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2ABC08C5EA;
        Tue,  8 Sep 2020 07:18:27 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AE7639;
        Tue,  8 Sep 2020 16:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599574703;
        bh=YdLhhX1YXIgXvVADm+8UlIZ3RcNUC3MnuoMlrS6ie2E=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XtAMJBhr0zA7V+OyWB5mD+NFXiOMRmJalFA49DcnKi9OsKg4l7ag7DdpY4vrejEl+
         D0xAd45duxD1W2dmaIKBR+6v72+a46M4ckM8ZZhkOhl+wUChxjkD/PbyN9GsRubmbf
         X8P/aq8+hcY7rTQsPz9pB7A/bFJyIweOpfmfg6uk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 02/10] dt-bindings: display: renesas: dw-hdmi: tidyup
 example compatible.
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhlrtwp.wl-kuninori.morimoto.gx@renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <6e1eedf0-d05f-81cd-e437-33fc4c7337f3@ideasonboard.com>
Date:   Tue, 8 Sep 2020 15:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87lfhlrtwp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On 08/09/2020 01:34, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> required is "renesas,r8a7795-hdmi", instead of "renesas,r8a7795-dw-hdmi"

Hrm, technically the driver will currently only match on :
  "renesas,rcar-gen3-hdmi"

But I see how the '-dw-' has probably snuck in from other devices, and
is inappropriate.

Perhaps this should be more clear that it matches on the generic compatible:
	renesas,rcar-gen3-hdmi

(or a combination of both?)

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

But if the generic isn't required, then this patch alone does fix what I
would call an error, so ...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

We could always make this more clear when converting to YAML.


> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index 819f3e31013c..e6526ab485d0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -42,7 +42,7 @@ Optional properties:
>  Example:
>  
>  	hdmi0: hdmi@fead0000 {
> -		compatible = "renesas,r8a7795-dw-hdmi";
> +		compatible = "renesas,r8a7795-hdmi";
>  		reg = <0 0xfead0000 0 0x10000>;
>  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> 

