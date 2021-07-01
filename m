Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A94663B93D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 17:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhGAPWS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 11:22:18 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:31694 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbhGAPWS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 11:22:18 -0400
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Thu, 01 Jul 2021 11:22:17 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625152422;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=E6YG1Wycui3LkGZUNbVIXUpJBzCy7rOpz0ekLomEsKQ=;
    b=RhZTZ6/oU03uKwDZVHee7yV1Il9wLAUDxXbU/BjRaVQ/Y08WRLXvsdUhNGP/gAGzHx
    36RPo4maNF7P1j4YpRQpJsOgVcKAyn/7X/AClcFXGogLzlQPCTUat92UzGtn+K4Oj2DI
    +4wDoHnIeivbE0OA10rbpNUn6Oq5h92Zs0itwTX7cfdWMl8SxIwsX1hoYjN6LM9h14PH
    5LMb3YEPJm1KYW5+CYlCZrZIipt0B1kn0MCJfBK9OVirpnpSIVYxu+gIH144C1fn2FDb
    xGx5ajvex+M+i/xI7b02XK5n9WOObWnzajV2/jM58MwEf3qKN3n8HLtwM3A0EU8Pp6s1
    54pA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/wuMlg=="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.28.1 AUTH)
    with ESMTPSA id V01605x61FDg6Lv
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 1 Jul 2021 17:13:42 +0200 (CEST)
Date:   Thu, 1 Jul 2021 17:13:42 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <1540754379.1298770.1625152422374@webmail.strato.com>
In-Reply-To: <975b6686bc423421b147d367fe7fb9a0db99c5af.1625134398.git.geert+renesas@glider.be>
References: <975b6686bc423421b147d367fe7fb9a0db99c5af.1625134398.git.geert+renesas@glider.be>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Remove bogus
 adv7511w properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev25
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 07/01/2021 12:15 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> The "max-clock" and "min-vrefresh" properties fail to validate with
> commit cfe34bb7a770c5d8 ("dt-bindings: drm: bridge: adi,adv7511.txt:
> convert to yaml").  Drop them, as they are parts of an out-of-tree
> workaround that is not needed upstream.
> 
> Fixes: bcf3003438ea4645 ("arm64: dts: renesas: r8a77995: draak: Enable HDMI display output")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> To be queued in renesas-devel fo v5.15.
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 71203c0fa55351c6..f0f585a4046196f2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -314,10 +314,6 @@ hdmi-encoder@39 {
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
>  
> -		/* Depends on LVDS */
> -		max-clock = <135000000>;
> -		min-vrefresh = <50>;
> -
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -- 
> 2.25.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
