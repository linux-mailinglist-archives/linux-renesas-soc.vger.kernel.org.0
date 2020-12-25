Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839972E2A8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Dec 2020 10:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgLYJLZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Dec 2020 04:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgLYJLY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Dec 2020 04:11:24 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43070C061573;
        Fri, 25 Dec 2020 01:10:44 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x20so9102158lfe.12;
        Fri, 25 Dec 2020 01:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RrJp4JaeyUNbP8mtUxpzAiLzACsrw+J/4NUxzJORe1Q=;
        b=rahTKbWu/IWqmTQsEBdFDuVVLN/7M8btVeDiRRep94k4aoEP2kbVGEr98WwqP6QXTO
         Ic5IlfsHXhCYkpO8KMiJs0x9uvgnbKWFIS3HitDXo57picC6Yb/tuIVeF8lELtiAUNsK
         P7r+sXpyCSacrzQFPWVgyEjJRG2i2qjmqjfOz/JdaA49j2sWQ0gFd8QCR3sI818B8lbN
         b1DcLD2QIRNYXT3zGgwPXNumMMnV+4IOZqS6U4Rh55dAvnU9JphTuF+nGORAMqNS5asE
         6E9QMqY2sSJvwVccwIZKHI9u2hQUCMkl+Bpug/2NBDE0DYB9EsEgcQsLULbvaRhIi/mg
         Xg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RrJp4JaeyUNbP8mtUxpzAiLzACsrw+J/4NUxzJORe1Q=;
        b=C/1VNXKlz5ZjeWkchiDIhydyxhXNfmOnnX58Goh4sdFHcLgGnNBtp7lDbFqTucXqT8
         HeKTZNl5GhR8KevOnTIb3TQ61dW3OAymGBYj/3mJBTIytiqTX3gXiXwwfZgdnzuksiR2
         lwtkUE9BxPYb1NZM8yeams2m2ih3CF1xacUTVgZx1D6fH4PqxdNIK0ebwhZ16sto3heK
         jOnVepYnI73hRX0HrneweYiGbGf7iwgGN7b1nrITAD5r70Uy/k6LFB4cp7kiUtMBNhZK
         vUydivwzd5/9a15DXup5yzavDLSoc+BKEoj5C2CVo9wxmPkHQahV9/FczVMHuYvMV2fo
         3A8Q==
X-Gm-Message-State: AOAM532O4pc+sx/ZA+nR2XoaID8PjFf/XE5/x6fbJzt6/YolJWOsNlKn
        V4UncVo2Y1gIddViQROJnZb0/8UewMCRHQ==
X-Google-Smtp-Source: ABdhPJwbrEtCiolwhRozDfJYnm8QXy8p7pQgnmC/1RIjuDK7ltXWio112BmSkJXYZVmqP49pUnEUKw==
X-Received: by 2002:a19:644b:: with SMTP id b11mr13028100lfj.358.1608887442528;
        Fri, 25 Dec 2020 01:10:42 -0800 (PST)
Received: from [192.168.1.100] ([31.173.84.55])
        by smtp.gmail.com with ESMTPSA id 6sm4440560ljq.69.2020.12.25.01.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 01:10:42 -0800 (PST)
Subject: Re: [PATCH V2 5/9] arm64: dts: renesas: beacon: Cleanup USB
 References
To:     Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201224170502.2254683-1-aford173@gmail.com>
 <20201224170502.2254683-5-aford173@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <28a3d016-3741-a2e3-7035-f0accf09803b@gmail.com>
Date:   Fri, 25 Dec 2020 12:10:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224170502.2254683-5-aford173@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24.12.2020 20:04, Adam Ford wrote:

> The programmable versaclock is used for the usb_extal reference clock for
> the EHCI driver instead of a fixed-clock.  Because the versaclock needs to
> be enabled, the clock reference needs to be added to the clocks list.
> 
> For the USB3 Phy, the perferred clock reference is usb3s_clk, so

    PHY. Preferred.

> remove the usb_extal reference.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
[...]
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index ade2f58ad99b..a6f7193e4d97 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
[...]
> @@ -315,16 +306,12 @@ &sdhi3 {
>   	vmmc-supply = <&reg_3p3v>;
>   	vqmmc-supply = <&reg_1p8v>;
>   	bus-width = <8>;
> -	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;

    Unrelated?

>   	non-removable;
>   	fixed-emmc-driver-type = <1>;
>   	status = "okay";
>   };
[...]

MBR, Sergei
