Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B10963E76F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 03:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiLACDy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Nov 2022 21:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiLACDx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2022 21:03:53 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C223256568
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Nov 2022 18:03:52 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id jl24so238324plb.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Nov 2022 18:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0DEiQmeMgrdK6YJ0GgLB3Jv3Ci6xLHfEcOnl3XLLYY8=;
        b=iP/HAJ/0GvHY5WECx7kbralJKyJMBFe69TYcPNdG+1+eKPAATALepikSeQHt+RiwZZ
         Hj8q+gyF9lkYSCwap8AyqEz3y0DMo52ZW7VxILomoIAi7FeyUQJhMWzoAkKMvzNRgLc6
         Ke7TbH+zYCbh5I9E8I3z5+/bS+r//iAGL4Ju3jT8LUGDiQPnBnADBCaSi8af6qKGm4gD
         4B+xW/WhgwCfQbDqbs4e7HSNg/fUuRyZ2VldEQE7mvr9cZKWUvxnvC4PXXQHXGRZjDrJ
         6sMneAtHjVQdJvsQFlqtXuXccwUMOn4RUkywQXrSndRIbdMYvCRBQ2hcJjoj4boSqYOa
         ZHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DEiQmeMgrdK6YJ0GgLB3Jv3Ci6xLHfEcOnl3XLLYY8=;
        b=45/b0ObcLeL5iC2c39bgqFuRqfZdhd/I2L48sd551AuoWr2AEPlsqAjW/8IhSSK6Ov
         R5XoWY2SQk1/VXXlIIJShK+mDoaz514bNa2nKe5eWCnNDgFrW0qhERIPqNU4nGBHMnsB
         39j9xsLByttF1nRk8LbyhkUdZJPn20oFum6hxZwzmcxclpyug9pKcsc5b4otbyOmYxkC
         QHbKt93EMa6Qt3OMw8vBF1UUmka1LrbBGG+jMJLDpccJmRCgqnxKlZUpVY/+yIuNVvtN
         U/nVxlcGQH0wzlyPfEhq4s2ptxCnyp00gsRSVGHkvKYKEadIoMPDeBpopqUlhjofs6tT
         Kb/Q==
X-Gm-Message-State: ANoB5pkt2uUTTc3gH2O4xYkL9SqgGgLCp4i9U1RlBrzJgZM11tbRaK+P
        5Ff7ibwcH6nwa0t7qjv3397mSw==
X-Google-Smtp-Source: AA0mqf7AaM8rZjDT0svKyWgdeqkBH7vI4+VbH4Ar7fn/HcMDFX69/stKQPzNv0xiH6xiAgEzdKsKtQ==
X-Received: by 2002:a17:90a:5aa2:b0:218:e3ea:e6b3 with SMTP id n31-20020a17090a5aa200b00218e3eae6b3mr40319536pji.42.1669860232255;
        Wed, 30 Nov 2022 18:03:52 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id h5-20020aa79f45000000b00562a237179esm2018664pfr.131.2022.11.30.18.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:03:51 -0800 (PST)
Date:   Thu, 1 Dec 2022 07:33:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Tho Vu <tho.vu.wh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Add CA55 operating points
Message-ID: <20221201020347.dpoaccvkzuss3jpk@vireshk-i7>
References: <ae78351d702a53702a1d5fa26675fe982b99cdf5.1669817508.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae78351d702a53702a1d5fa26675fe982b99cdf5.1669817508.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30-11-22, 15:16, Geert Uytterhoeven wrote:
> Add operating points for running the Cortex-A55 CPU cores on R-Car S4-8
> at various speeds, up to the maximum supported frequency (1200 MHz).
> 
> R-Car S4-8 has 8 Cortex-A55 cores, grouped in 4 clusters.
> CA55 Sub-System 0 (first 2 clusters / CPU cores 0-3) is clocked by Z0φ.
> CA55 Sub-System 1 (last 2 clusters / CPU cores 4-7) is clocked by Z1φ.
> 
> As the two sets of clusters are driven by separate clocks, this requires
> specifying two separate tables (using the same operating performance
> point values), with "opp-shared" to indicate that the CPU cores in each
> set share state.
> 
> Based on a patch in the BSP by Tho Vu.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.3.
> 
> Changes compared to the BSP:
>   - Use two tables.
> 
> Tested on the Renesas Spider development board by using the CPUfreq
> userspace governor, writing the desired CPU clock rate to the CPUfreq
> policy's "scaling_setspeed" file in sysfs, verifying the clock rate of
> the Z0φ and Z1φ clocks in debugfs, and running the dhrystones benchmark
> on the various CPU cores.
> 
> The Linux cpufreq driver creates two policies under
> /sys/devices/system/cpu/cpufreq/: "policy0" and "policy4".
> 
> With a single table and "opp-shared", only "policy0" would be created,
> and clock Z1φ would never be changed.
> With a single table and without "opp-shared", 8 policies would be
> created, and the rate of clocks Z0φ and Z1φ would reflect the value for
> the last touched CPU core from the corresponding set.
> ---
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 62 +++++++++++++++++++++++
>  1 file changed, 62 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
