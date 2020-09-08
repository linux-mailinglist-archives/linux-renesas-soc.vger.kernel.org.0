Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5CC2617D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 19:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731352AbgIHRmE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 13:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731657AbgIHQOE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 12:14:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68135C06137C;
        Tue,  8 Sep 2020 05:52:32 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74FB639;
        Tue,  8 Sep 2020 14:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599569532;
        bh=82Ig7qKF5ln6orTKjywtdCUifvSel0QPp4ksH4LLSQQ=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eG9xY8+ZjcQTDTCt6MNaxU1rJ4v1NkZC7T+D6Exlm/PguyuFPNTF6omQauBB5Ckfm
         ZLsKSJQXnGoz//rSPMHuQ76piQH3Z6O6k3zvbAJjKsOeCJwQiy5623nix/bmPZWXfd
         bcBd7Uyfn1yihzEVG78h2FzBpdM0W+BT+KIm9ru0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 01/10] dt-bindings: display: renesas: du: Document the
 r8a77961 bindings
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
 <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <0e94a8c9-7f87-ebdf-4514-7f4984a6860f@ideasonboard.com>
Date:   Tue, 8 Sep 2020 13:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
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
> Document the R-Car M3-W+ (R8A77961) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index 51cd4d162770..317c9dd2d57c 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -18,6 +18,7 @@ Required Properties:
>      - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
>      - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
>      - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
> +    - "renesas,du-r8a77961" for R8A77961 (R-Car M3-W+) compatible DU
>      - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
>      - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
>      - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
> @@ -83,6 +84,7 @@ corresponding to each DU output.
>   R8A7794 (R-Car E2)     DPAD 0         DPAD 1         -              -
>   R8A7795 (R-Car H3)     DPAD 0         HDMI 0         HDMI 1         LVDS 0
>   R8A7796 (R-Car M3-W)   DPAD 0         HDMI 0         LVDS 0         -
> + R8A77961 (R-Car M3-W+) DPAD 0         HDMI 0         LVDS 0         -
>   R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
>   R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
>   R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -
> 

