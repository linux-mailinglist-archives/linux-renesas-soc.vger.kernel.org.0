Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455223BC798
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jul 2021 10:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhGFIDk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jul 2021 04:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhGFIDj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jul 2021 04:03:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71530C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jul 2021 01:01:01 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id k21so27981113ljh.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jul 2021 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tdsiYeXZngdcRa07foDUtUsiu1D/PZXAOEOyf0oCjW4=;
        b=zTRA2zJ5uZOaLOIgBeP0xprF9/CQvu7kT2gD18jAv0csvNJ0yzhyNAyPUmNK+XZiCK
         Ykt3pdXiCfDh337rd3vzRRbDiSPXEShzdwZtPSxyTGlXiMjeHeqGSgnDUMXK7z9PnXDK
         KR26jhAlHsBDKIryhIECGdpzdGGLbAEMeme1El0tyJ0XAnklkpiCeMAb3tj10wd7YjkC
         9okZy888TqrvqbBW1fzkRQb59BnAATmNWurkvxO4tm3VJAS6xLO70d0OQRV67E5Xll4o
         zVVgXy0+6o4556z/tIX6o3k2vcOVOfuEspU5j8q44aJ3KOfVmtKeL/wXzk3SLeYyXjmz
         oaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tdsiYeXZngdcRa07foDUtUsiu1D/PZXAOEOyf0oCjW4=;
        b=hXM0lPNasdkSblWR0SPeiSecmoiJRpmcecRwn61UMJDC9FSDTREEuWUwg+MVhMqsVi
         O4YoAMiuft1tFQiZJWvZwDIMtz97zYiF5GeMA5CniQauHlDaoCFpeWOdHxvggZyvqxnz
         eJ54cSyJXEz2HZ+pGsVwZnTXoTJUjDUmFMyQ94h5HlBjOjwLcc36KXIlW5IEcDTY/RDs
         /wCQOwcGDpaH6YLlfJCMZvdCz70tKFRMbE2SAfjYy/8JxUMT/bnsjiA8F5FgP+nro2wv
         EWpNBGtpwqxIVOycpxLdDA/2eL68cPR6KB9EDVaCGC69wNK5GI4IAZ4Nrnv94/3nIZPi
         ghbA==
X-Gm-Message-State: AOAM531vIL+OyTl2v/dQefeeDf0bwM9w3mASCx3nZmc4gxnU0KOWWYF/
        4ZRMCI9XEgS2lFrcDeSQWQAzxg==
X-Google-Smtp-Source: ABdhPJyz9N5iXLg8nMlio14v/1lX+Uq5Rjh75jdk6zEV+rERExuZZBksLigNsyT7hqs2Ato8eyEviw==
X-Received: by 2002:a2e:808f:: with SMTP id i15mr14293207ljg.296.1625558459852;
        Tue, 06 Jul 2021 01:00:59 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id z11sm443617lfa.224.2021.07.06.01.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 01:00:59 -0700 (PDT)
Date:   Tue, 6 Jul 2021 10:00:58 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add I2C EEPROM for
 PMIC
Message-ID: <YOQNut7VkQtpKpmH@oden.dyn.berto.se>
References: <32443cd203ce2787d9a719d06a473b9e9cd508c2.1625489160.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32443cd203ce2787d9a719d06a473b9e9cd508c2.1625489160.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2021-07-05 14:48:32 +0200, Geert Uytterhoeven wrote:
> Add a device node for the I2C EEPROM which serves as external storage
> for the PMIC setup, as a backup of the internal OTP configuration.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.15.
> 
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index ab270e39d458de36..9c7146084ea1c779 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -510,6 +510,12 @@ pmic: pmic@30 {
>  		rohm,ddr-backup-power = <0x1>;
>  		rohm,rstbmode-level;
>  	};
> +
> +	eeprom@50 {
> +		compatible = "rohm,br24t01", "atmel,24c01";
> +		reg = <0x50>;
> +		pagesize = <8>;
> +	};
>  };
>  
>  &lvds0 {
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
