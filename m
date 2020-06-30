Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA3820F79D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 16:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388266AbgF3Oxf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 10:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbgF3Oxe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 10:53:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09C2C061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 07:53:33 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g18so20548570wrm.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pd7u04aHacMlHQWEyySnd7sTkXliNVOpzVO8z+Rcu5w=;
        b=NkFaCQ+V4OEnig591m8AkSZBQ1b/h4v4zSXQCbGQjK8FGeP7BHqOTEEGCastiiIUob
         M0UVfI/NN4nkXDl8JWTMRjTXXxE7YY82izMG/nYeTbmQmokH3Y5w8MgUsyVL4e1VgYUT
         N1cPSd+vrHvWo2gcY3lMTw+tftpI6X+sjeq0ogRJa32PGCXGWVSLibvqHvWLGnfsqlAZ
         gVUWjjOIssl9YbMlBotqTT3aaqp+HzsPKnNLoe8ITTH2Rl9UfczmQAl3YiAfYlwvgbJs
         Ns773D3M2fHMZu8r4tCMXhWe/imwGkam1Xq5u+xV3f2CTem3P28CCCllcf8ELrD2BE++
         pOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pd7u04aHacMlHQWEyySnd7sTkXliNVOpzVO8z+Rcu5w=;
        b=CsF7Ed9acFi5IxXYeN6/Z5jTgohHu8g1pGiUqNkg73cK0UVoh57oDdDUniYjrQRwZT
         zDh4729zfysIX6tESMGE9BBH/IbVeyOKJqAXLKBJPW+r+Cx8/8kQN4cdMW596dm+2FU7
         xN8MeceArpfz9sAB47RGLJZmd+rgiU/BQ37IvZ7lCT6IX8SdsRfgTEwItifmYRVZyDPU
         ejacp6BzRZaxvDRPCJJyOpYTamSqRToTRr2Zv2I3cuGWfp90JozNm2cD+VLeoQVUx3mZ
         HMU3UUhuV+wR4zQO9HcamN8lb4VUgPdaow13GdAw/8cw3Q+KQ+N9rcCRReMmiOxRYEsk
         FYjg==
X-Gm-Message-State: AOAM5327/S+jrGGBR8/Lnd6DK7cgE5Y1a3xfVDz+SzwtWgLmpFvNree6
        sCL4jMsh/tBA+cbhFUY9zr8qwg==
X-Google-Smtp-Source: ABdhPJwhGwFNFixe1BGFQoohJyS2prHI3aMDtNCIwm9jyQOp0qSvzuwh8OQOhlRmoHrNF73pfYRftA==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr22295714wrv.155.1593528812400;
        Tue, 30 Jun 2020 07:53:32 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:54f4:a99f:ab88:bc07? ([2a01:e34:ed2f:f020:54f4:a99f:ab88:bc07])
        by smtp.googlemail.com with ESMTPSA id g14sm3784671wrm.93.2020.06.30.07.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:53:31 -0700 (PDT)
Subject: Re: [PATCH v7 00/11] Stop monitoring disabled devices
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Vishal Kulkarni <vishal@chelsio.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jiri Pirko <jiri@mellanox.com>,
        Ido Schimmel <idosch@mellanox.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
        Luca Coelho <luciano.coelho@intel.com>,
        Intel Linux Wireless <linuxwifi@intel.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Peter Kaestle <peter@piie.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Sebastian Reichel <sre@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        kernel@collabora.com
References: <20200629122925.21729-1-andrzej.p@collabora.com>
 <aab40d90-3f72-657c-5e14-e53a34c4b420@linaro.org>
 <3d03d1a2-ac06-b69b-93cb-e0203be62c10@collabora.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <47111821-d691-e71d-d740-e4325e290fa4@linaro.org>
Date:   Tue, 30 Jun 2020 16:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3d03d1a2-ac06-b69b-93cb-e0203be62c10@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30/06/2020 15:43, Andrzej Pietrasiewicz wrote:
> Hi Daniel,
> 
> I am reading the logs and can't find anything specific to thermal.
> 
> What I can see is
> 
> "random: crng init done"
> 
> with large times (~200s) and then e.g.
> 
> 'auto-login-action timed out after 283 seconds'
> 
> I'm looking at e.g.
> https://storage.kernelci.org/thermal/testing/v5.8-rc3-11-gf5e50bf4d3ef/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.html
> 
> 
> Is there anywhere else I can look at?

No unfortunately :/

I have a Meerkat96 which uses the same sensor as the imx6q.

I'll give a try to see if I can reproduce and let you know.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
