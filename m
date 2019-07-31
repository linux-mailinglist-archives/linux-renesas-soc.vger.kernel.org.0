Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6597C503
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 16:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfGaOel (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 10:34:41 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:12634 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbfGaOel (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 10:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564583679;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6JQW9FrxZ4Nhb1sGfMXzALMORCiJfSJFL3Hr79iTemE=;
        b=qsHtcEqoW07DO7wnasc09RaHLL5ePt7FL+sTyqbjg9FPvHgGZ6WV5r21nBswfCA7my
        ifMdBT8wNas+fC3dlv/9DP82HDJJlI+GA679I3B7ZlBN8sw2JFU2b4rYRzvpBDQeM3xb
        YSDWyLG9hffgz8jKzNqKiTpW37S8BHDiWzmp4OUqqRUX2ZCKldR6uwjo4VMNsXxVUZ9Z
        7T5w3C3wC+Qiof3XN2Ve+rW+rVp7MoiKoiP7D34zHbG2tshqzMTXiNruNuhao+iqsq12
        iLj6nskeABnzAdHx75q1gpdbEJCO557/wOjmChODYySqT+PlRJrYZz0HKmhbcae+sXj2
        n1gA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v6VEYdZry
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 31 Jul 2019 16:34:39 +0200 (CEST)
Date:   Wed, 31 Jul 2019 16:34:39 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <2035520176.323020.1564583679166@webmail.strato.com>
In-Reply-To: <20190731133656.18037-1-geert+renesas@glider.be>
References: <20190731133656.18037-1-geert+renesas@glider.be>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: Fix IPMMU-VC0 base
 address
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.10.1-Rev16
X-Originating-IP: 85.212.153.30
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On July 31, 2019 at 3:36 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of Feb
> 12, 2019, the base address of the IPMMU-VC0 block on R-Car V3H is
> 0xfe990000.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index a901a341dcf71981..461a47ea656dabdf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -1299,9 +1299,9 @@
>  			#iommu-cells = <1>;
>  		};
>  
> -		ipmmu_vc0: mmu@fe6b0000 {
> +		ipmmu_vc0: mmu@fe990000 {
>  			compatible = "renesas,ipmmu-r8a77980";
> -			reg = <0 0xfe6b0000 0 0x1000>;
> +			reg = <0 0xfe990000 0 0x1000>;
>  			renesas,ipmmu-main = <&ipmmu_mm 12>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			#iommu-cells = <1>;
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
