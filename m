Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08989D69AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 20:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbfJNSqI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 14:46:08 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:45218 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfJNSqI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 14:46:08 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 1BE7E3C04C1;
        Mon, 14 Oct 2019 20:46:06 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IjD9bq8Hj1kl; Mon, 14 Oct 2019 20:46:00 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 0DCF63C003F;
        Mon, 14 Oct 2019 20:46:00 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 14 Oct
 2019 20:45:59 +0200
Date:   Mon, 14 Oct 2019 20:45:56 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH/RFC 03/19] dt-bindings: clock: renesas: cpg-mssr:
 Document r8a77961 support
Message-ID: <20191014184410.GA10366@vmlxhi-102.adit-jv.com>
References: <20191007102332.12196-1-geert+renesas@glider.be>
 <20191007102332.12196-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191007102332.12196-4-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 07, 2019 at 12:23:16PM +0200, Geert Uytterhoeven wrote:
> Add DT binding documentation for the Clock Pulse Generator / Module
> Standby and Software Reset block in the Renesas R-Car M3-W+ (R8A77961)
> SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt       | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> index b5edebeb12b40638..b9b0927b7c780699 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt

[..]

> @@ -42,10 +43,10 @@ Required Properties:
>    - clock-names: List of external parent clock names. Valid names are:
>        - "extal" (r7s9210, r8a7743, r8a7744, r8a7745, r8a77470, r8a774a1,
>  		 r8a774b1, r8a774c0, r8a7790, r8a7791, r8a7792, r8a7793,
> -		 r8a7794, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980,
> -		 r8a77990, r8a77995)
> -      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a7796, r8a77965, r8a77970,
> -		  r8a77980)
> +		 r8a7794, r8a7795, r8a7796, r8a77961, r8a77965, r8a77970,
> +		 r8a77980, r8a77990, r8a77995)
> +      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a7796, r8a77961, r8a77965,
> +		  r8a77970, r8a77980)
>        - "usb_extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a7790, r8a7791,
>  		     r8a7793, r8a7794)

Not easy to review, but 'git show --color-words' comes to the rescue :)

-- 
Best Regards,
Eugeniu
