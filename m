Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A6A54DDB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jun 2022 10:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbiFPI7z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 04:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbiFPI7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 04:59:54 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E727192B5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jun 2022 01:59:52 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e4so792855ljl.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jun 2022 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2cUq5kiV0YABamBOXFQlBk6r4qTMXYERnHdLUVbwBbA=;
        b=0q+EJBurVNTHLpE4ln0nOouxIY7+MoAhDplKp9ONuOgec28SVZ46ngkdxeRJkFenbC
         bnYwCPezQpcIcQq2tSObH34PmwoUS0lvC3qriFQyd+VEh2OZo/EE2Rq/xzG1rlO6/afi
         VDlPKh6NJQ4PuilNLp34TtKGr3MXLTbkVLAyr9jS6YLp/yqageky3oQR9f2VuSeA0xQu
         GOyO625Qec5dqDKEBeGXpFTOGSi1stJH7hiBPZsiufUTXyyKlJ5o2sWqCvmcM4esrmeL
         NWhdVgkPmlPs8S9P6Lv/Bhg7h92gOgqaYtcGseMdgL6/bcciLgAyUoKXiLn3xYSks5wx
         YFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2cUq5kiV0YABamBOXFQlBk6r4qTMXYERnHdLUVbwBbA=;
        b=Tp6hY9hNM5MIyE5G29+cCpuEdLD07aax+nZCLk1/XNoxlTPKagWLRaBUFNtNHTJXC1
         Rz1kfkyX7iURTsra7bHHP6QtUztw3LlJpcEHGoj1Pb3tSW9rhsTmXGEXmZRYR3gx/JUx
         NjPtgFjSAv3OBIy2qII1CwqHNHAJTHI+JyasyC0piq/NYyu2TsgT/O+/UG20Q+FHvz5O
         nqzjI2uQ0otVZ56nQHRJcpXzaeaUDQZrcRPCA5Aje7J8qgwav6NO/iqSpzGlK0L/SajK
         gwMQHb1e/7m9qQpu/xWuhF9Txa16ElyE0pkC1IBSt9ntkT0MGRKRoVJfOA13TO+JnIMm
         aDXw==
X-Gm-Message-State: AJIora+FBwgLitswHtW1j3DvpIH7soIE4AS3d7cCFcO8+0UKCUbnfjTt
        vAO7UZezvuQVqPYVck0endVwBw==
X-Google-Smtp-Source: AGRyM1uwhs3gMKrbIiKjIMORyZGpOfQiONfpJyFk7roqytPNIX08FPSUPo2Q/x9dbCeQBNnEeSjsbQ==
X-Received: by 2002:a2e:b895:0:b0:255:c257:5b3 with SMTP id r21-20020a2eb895000000b00255c25705b3mr1956627ljp.247.1655369990605;
        Thu, 16 Jun 2022 01:59:50 -0700 (PDT)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id r8-20020a2e94c8000000b0024f3d1daedesm165309ljh.102.2022.06.16.01.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 01:59:50 -0700 (PDT)
Date:   Thu, 16 Jun 2022 10:59:49 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Dien Pham <dien.pham.ry@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: Fix thermal-sensors on single-zone
 sensors
Message-ID: <YqrxBacxwQmQa4B/@oden.dyn.berto.se>
References: <28b812fdd1fc3698311fac984ab8b91d3d655c1c.1655301684.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28b812fdd1fc3698311fac984ab8b91d3d655c1c.1655301684.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2022-06-15 16:04:26 +0200, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[74], [0]] is too long
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[79], [0]] is too long
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[82], [0]] is too long
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[87], [0]] is too long
>     arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: thermal-zones: cpu-thermal:thermal-sensors: [[105], [0]] is too long
> 	    From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> 
> Indeed, the thermal sensors on R-Car E3 and RZ/G2E support only a single
> zone, hence #thermal-sensor-cells = <0>.
> 
> Fix this by dropping the bogus zero cell from the thermal sensor
> specifiers.
> 
> Fixes: 8fa7d18f9ee2dc20 ("arm64: dts: renesas: r8a77990: Create thermal zone to support IPA")
> Fixes: 8438bfda9d768157 ("arm64: dts: renesas: r8a774c0: Create thermal zone to support IPA")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.20.
> 
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 90588bbff7e0b8e8..c563d26a7a71cc33 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1952,7 +1952,7 @@ thermal-zones {
>  		cpu-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <0>;
> -			thermal-sensors = <&thermal 0>;
> +			thermal-sensors = <&thermal>;
>  			sustainable-power = <717>;
>  
>  			cooling-maps {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 4c7c7feed7026778..565e9d85946e6f7f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -2129,7 +2129,7 @@ thermal-zones {
>  		cpu-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <0>;
> -			thermal-sensors = <&thermal 0>;
> +			thermal-sensors = <&thermal>;
>  			sustainable-power = <717>;
>  
>  			cooling-maps {
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
