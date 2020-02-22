Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0795F168FA8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2020 16:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgBVPEA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 22 Feb 2020 10:04:00 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41018 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbgBVPEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Feb 2020 10:04:00 -0500
Received: by mail-lf1-f67.google.com with SMTP id y17so536790lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Feb 2020 07:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Xifd8WijE8GTahP3bmRGY4Sh30aYMNX7/F7d8gaMK0M=;
        b=kvhJmk6XLbSxYn8Qjx1BuLosQ1khAzVj8FF5GAPFk6XZqKJ8Qss4pEneppvA9kr8XL
         pgiSNkEtfDwsUE0qcDMkOS0tz3HarxiRexYMFIOgJI2hI7ywPC5rq7Rs9y4+mOrwQhpW
         9epQWVUoz6Xssan3vvFeqfSWNV50tIK+9QIHvjrXoiZf8ZWSnmD4muv4WZnv9ZmtCoQf
         sYFRLK+HfTiuZZpdcSXteB02Pcm4LFV/4TgY8KGJsxIHgloidZpzfPCGH7u2+4JWssDs
         gNu2LGtTf6e3u7/qSbEAeSAOjRdxskSfBCX1/+eWAWs31GwfUtQ9EgKvt4rASQ+qj1Mg
         /yvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Xifd8WijE8GTahP3bmRGY4Sh30aYMNX7/F7d8gaMK0M=;
        b=e+FhjEneH8DkRoaSoBmb/zhlAguNNca3FgvyKI2Swt2GMr2fbV1gRU9/lht8Tmgamk
         xv0TDz0FMIXHoRx2x8mdthx0UgV5V3Sx3DK7mfaq+P+ipRR3hY2CPxfZ/R4+ZIo4mi3M
         lOtOPos78pQaBkGlDxopdcimyXF5RMvLxvHlDASRXrpD1oKOYisPkNK+RlqljigSqQCy
         3XBk53vXqKWpldGyu2fiHX7ytD0Xc7Q/b+i4RkK99g/FxtbhjW+zdxfAxdUKMbj0CLiO
         xx3bKz3gKpBKOQTWoi/rDBLfR+TtGurDeLOlxkny490zJRHukWxnpyFT16h/GWHY+4XM
         QIJQ==
X-Gm-Message-State: APjAAAWsRnw7niRJXXQYfQp2pIYFaE9EoNX2765TbMr43qewTlmp27KA
        hH94esdI1kxtR+ZXORfJtfrIcw==
X-Google-Smtp-Source: APXvYqxL0tbEYrhWH41q9mPIM4qs0NfEKPE2NiFblTDT21q2Rpd/pk/K3bhgcG+848q06IQNrgpF1Q==
X-Received: by 2002:ac2:46dc:: with SMTP id p28mr22696651lfo.23.1582383836868;
        Sat, 22 Feb 2020 07:03:56 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id z1sm3230464lfh.35.2020.02.22.07.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 07:03:56 -0800 (PST)
Date:   Sat, 22 Feb 2020 16:03:55 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7779: Remove deprecated "renesas,rcar-sata"
 compatible value
Message-ID: <20200222150355.GE1444588@oden.dyn.berto.se>
References: <20200219153929.11073-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219153929.11073-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-02-19 16:39:29 +0100, Geert Uytterhoeven wrote:
> The "renesas,rcar-sata" compatible value was deprecated by
> "renesas,sata-r8a7779" many years ago, in commit e67adb4e669db834
> ("sata_rcar: Add R-Car Gen2 SATA PHY support").  Drop it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-fixes for v5.6, as not having to care about the
> deprecated value will simplify the json-schema conversion.
> ---
>  arch/arm/boot/dts/r8a7779.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
> index beb9885e6ffca7a5..c0999e27e9b145e3 100644
> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi
> @@ -377,7 +377,7 @@
>  	};
>  
>  	sata: sata@fc600000 {
> -		compatible = "renesas,sata-r8a7779", "renesas,rcar-sata";
> +		compatible = "renesas,sata-r8a7779";
>  		reg = <0xfc600000 0x200000>;
>  		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&mstp1_clks R8A7779_CLK_SATA>;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
