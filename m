Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B8A429FB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 10:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234791AbhJLI07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 04:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbhJLI06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 04:26:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66962C06161C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 01:24:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n8so82047346lfk.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TixieuD3Xlnz2ZUjLwM6JRg+dlEAKvSqpmTMcbFm1EI=;
        b=Ep0QEX1kJVTbSMUaEA4OvAWS4QPcKKfPzOaTE7V8KY03bZ1AZtua2+Dk8/fMdw3rBL
         469vUm3kkRWI4o/q+cGV3WbKiQtIWrLOj05Vu+qyPLbdHiBXiqjBjaJRGv1wLTs0nKsl
         3LYbSAg9XA/a1n8oAM8m9tdVPiLTV3ycZhTSULM2USsnYqbnMPFYuhJQ6e5d7+xE0u/m
         p0Lz23PSlxCpL9S7314Ej37JWbK4i5AA8lvc0nQMlkoh4YueZPwun/ZWCv7hQFu5a46b
         9HRTto0GdoEQOECwOFMqPC4UdDNFx+NOC7IXE0QYjXVbKwxdvN9VUn/PyhoT9kuAzPNL
         tPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TixieuD3Xlnz2ZUjLwM6JRg+dlEAKvSqpmTMcbFm1EI=;
        b=dB0qWeJNR+m1CGlkA3/fo/QOpo9EVBGUkeCEjuAUFn9CWRgVqQiDINoUPMfeZ3Qxdx
         w5D7e9YVXDYSz0aBEVRvFjzrG+EQRxm//oRGWBSmFbZm9Gc0BEevBoLWLwqdWhdb0Hnn
         sY4ijwR5aBWN/5yabGRt0OyiqVgMlnE3qn+PjamiXbJqHmkDp81rfx6zdqQmjLTLoE+j
         CNb5p2dUbu24xXt8BdpL5/dWw9u1XOfSJ1S5PUDqoMTkZPVlsUuLGkpudyeUfgNhN8Aa
         7jas1d+wz/8EfgLwcgdiuzG+8rZK9AJf9E79ten/xAoHrhiU03xeZYCdRkm1AmlKiCUx
         4e9A==
X-Gm-Message-State: AOAM531iZgrqeSskurw5jNw8Mdcw6P9U7F8p8j3gbXDMaETZPDkcFx93
        NUp4IU6jNzsiM3fpwR2t7IEZUg==
X-Google-Smtp-Source: ABdhPJyCF594qJPBKAP/LGWWYYogxB2cLfskSunpmzal0ogibGEpJw+Vw2/7mmM6g/VzjgBCFvFc9Q==
X-Received: by 2002:a2e:4942:: with SMTP id b2mr27490783ljd.176.1634027094767;
        Tue, 12 Oct 2021 01:24:54 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id a19sm1095382ljb.3.2021.10.12.01.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 01:24:54 -0700 (PDT)
Date:   Tue, 12 Oct 2021 10:24:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] thermal: rcar_gen3_thermal: Read calibration from
 fuses
Message-ID: <YWVGVZ/9GIPmGu3P@oden.dyn.berto.se>
References: <20211011225802.11497-1-niklas.soderlund+renesas@ragnatech.se>
 <87czoblyyi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czoblyyi.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoro-san,

Thanks for your test.

On 2021-10-12 12:11:01 +0900, Kuninori Morimoto wrote:
> 
> Hi Niklas
> 
> Thank you for the patches.
> 
> > 1. Check that the driver uses the fused values, this is showed by the
> >    log message, dev_info(dev, "Using fused calibration values\n"); is
> >    trigged when the driver probe.
> >
> > 2. Check the temperature readings in sysfs are reasonable, the values are
> >    in millidegree Celsius. On my system that uses the coefficients from
> >    the driver I have 41-42 degrees Celsius at the moment.
> >
> >    # grep . /sys/class/thermal/thermal_zone*/temp
> >    /sys/class/thermal/thermal_zone0/temp:41000
> >    /sys/class/thermal/thermal_zone1/temp:42000
> >    /sys/class/thermal/thermal_zone2/temp:41000
> 
> I checkout:ed v5.15-rc4, and apply your patches.
> This is the result
> 
> --- log ----
> 	...
> 	[    1.516781] i2c-rcar e6510000.i2c: probed
> 	[    1.532108] i2c-rcar e66d8000.i2c: probed
> =>	[    1.539314] rcar_gen3_thermal e6198000.thermal: Using fused calibration values
> 	[    1.551116] rcar_gen3_thermal e6198000.thermal: TSC0: Loaded 1 trip points
> 	[    1.562274] rcar_gen3_thermal e6198000.thermal: TSC1: Loaded 1 trip points
> 	[    1.573413] rcar_gen3_thermal e6198000.thermal: TSC2: Loaded 2 trip points
> 	[    1.595676] random: fast init done
> 	[    1.612993] NET: Registered PF_PACKET protocol family
> 	...
> 	# login
> =>	# grep . /sys/class/thermal/thermal_zone*/temp 
> 	/sys/class/thermal/thermal_zone0/temp:37000
> 	/sys/class/thermal/thermal_zone1/temp:38500
> 	/sys/class/thermal/thermal_zone2/temp:38500
> 
> I'm happy if these are the expected.
> 
> Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

These are reasonable temperature readings, unless you moved to an igloo 
to live with the penguins :-)

Thanks again for locating a board and taking the time to test this 
series much appreciated!

> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

-- 
Regards,
Niklas Söderlund
