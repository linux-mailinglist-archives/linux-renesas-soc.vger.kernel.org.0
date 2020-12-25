Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97162E2A88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Dec 2020 10:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgLYJH2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Dec 2020 04:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgLYJH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Dec 2020 04:07:27 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5DDC061573;
        Fri, 25 Dec 2020 01:06:47 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o13so9186061lfr.3;
        Fri, 25 Dec 2020 01:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cUbyJb06o/hnZsz1MOHR+WMF5JNEWawg3ZDN0CmkUUQ=;
        b=cUkepVbyR/kMQ8zl6sCVU1pYKH87b4JcGpsDrS5y/QkLl0l8aYy6yFFpkEe5vtPna/
         QDW+KeDKCgoQ1vnGu7ifAlYmvoBFEW5zLeSLKhPE9JJTYYx3p2vCZnhq6YMaqwcYHyif
         BMwQV+F0Vm1d4ZHp6cFoLc6mgnkuT0MJOrTQgQhfA+6fcKfZkO6h9D7gLcXKkdcjFbmT
         bmHYT70Uysyb0O8ZUY1G8SwDeUH4okynNLZJxN66/Nb+CDxDP+y42qIevvmOuzChx8bv
         4glm9SeKQsXZTkaHbQDft2xehRaQoonBorkeN4vrYsOQRpSAhShVcwu8snBnmPny55It
         McXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cUbyJb06o/hnZsz1MOHR+WMF5JNEWawg3ZDN0CmkUUQ=;
        b=uLGL8/sPO9PGBZQtm0iolgFaoqdWF/CX0d8sXlKPlSSGIBn18gbq8y56G1xg59Jkl6
         QIft/V1tVslc+G/HxylnByRza4svw+vfQgMuPtljg1eTF9/KCZJqMoiaXdDDK+YIm3Ks
         cNHMay01VUJVrHYMMni4s5qNOMuErUiU/Pt/5qFuzCYW8qnA9Qpfo+uwaoyeBNGRSZ+F
         CfMvgFnaO9VBvdL6CV0sq8x0EnZ9rlE6giogVKnMUtAa52K6esUNuz4BJoeP5jUdNhpg
         2BksCwO77kp0WZPwCMClPn0Cl1HrAkthbkAiaqqnbdcQiw1P2hOLCsrbK0tIyim0PB4w
         IAgg==
X-Gm-Message-State: AOAM532ac/tX1T8Mam5wM7kAmmZM/+9+NqLuvvQasAPSlcCt/PahvOEO
        PNdiMBzKfB33y+xjdBpQSeTCpSJ4H8rLjw==
X-Google-Smtp-Source: ABdhPJxBbjrWqj6PhEuq6sWp9flyEd4AVkmve9TI+Uw52hNfCpWC+J6V4irHIoQlYoj3LmGXjsiEJA==
X-Received: by 2002:a2e:9dd4:: with SMTP id x20mr14972581ljj.37.1608887205486;
        Fri, 25 Dec 2020 01:06:45 -0800 (PST)
Received: from [192.168.1.100] ([31.173.84.55])
        by smtp.gmail.com with ESMTPSA id f15sm4035668lfc.10.2020.12.25.01.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 01:06:44 -0800 (PST)
Subject: Re: [PATCH V2 8/9] arm64: dts: renesas: Introduce
 r8a774e1-beacon-rzg2h-kit
To:     Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201224170502.2254683-1-aford173@gmail.com>
 <20201224170502.2254683-8-aford173@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <5e0abd1d-1006-dce9-5d15-dbda22ed459b@gmail.com>
Date:   Fri, 25 Dec 2020 12:06:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224170502.2254683-8-aford173@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24.12.2020 20:05, Adam Ford wrote:

> eacon EmebeddedWorks is introducing a new kit based on the

    Beacon?

> RZ/G2H SoC from Renesas.
> 
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
> 
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a variety of push buttons and LED's, and support for
> a parallel RGB and an LVDS display.  It uses the same baseboard
> and SOM files as the RZ/G2M and RZ/G2N kits.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
[...]

MBR, Sergei
