Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE303452BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 00:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhCVXET (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 19:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhCVXDv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 19:03:51 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3390C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 16:03:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id f26so23172854ljp.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 16:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=61tEbvh74LDj1nEZ7Nq7agcoZyeFGc3J+dkuMdEJ70I=;
        b=kKv3lNkdyc5YK/M1CPmZhT6zonZ6mdifqGJ5TFK4p0mFzb9E4Ic8GRf+r9PwWaamMp
         ENCR11Tt1ceT4pczjAxtDqFXiO86AuxYhaf938aPLG5OVEkeQUga0/AyFkkgAf+lFK4u
         15WC4ehChyEMFhKFpkPrslXUdttu1tXWpSXMUctINO5uL29uZMW/jkv0SUIGd7mRu9VU
         6E6GxyfMvylnLO62AFeV1z+FkYYZGWRg4VHjDUl4lEY6+o0nqj8E1fFL0zgF1/lzlS2T
         24+75bSFq3VjyfJ64EU3olObzlC2F8OLozbK3J31d/R5zzDLAcI5UxmbKVRNpLP1GQjZ
         1iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=61tEbvh74LDj1nEZ7Nq7agcoZyeFGc3J+dkuMdEJ70I=;
        b=dbNg9U2VAg8t6cjGO4I+kQTRJJ4AZV2uI5Q1t4MMCSbC1K5hpnsJSsbmrM4xllP4Qr
         kP0jbOzZiqj4eOkCACmBpIhOD8QTwrPLFTP35o0+NVLT/h5aOsmUo5D074Wt5gptVyVm
         dbDtEl2NsVlACXgG8fT2W6qOae6AWPzsmJ7E/YqCQ6bpgTAPTyoXftLYLb1x5F+IVJ1s
         rNfMC+OWrzBMvN6iO+9degUPLxBTO7ZXBrNPwsVFs+ismxzg1GjLWmC6/B+KHbqhgKzf
         gn/pzP1xyDEDorEZGOEIE80VDEaoJblG1QUUm44x8zzLUcSxSoPp+gof11r6aDJxg0Ci
         poaA==
X-Gm-Message-State: AOAM531lokTMrprX+PUtTtruveQCAICgEDeJH+DcT8hnq+u3hpKygTNv
        cQHi7XZuGOqvCSuOCEjMU7o65w==
X-Google-Smtp-Source: ABdhPJzChmUgU7jxo/NeitSG+Z3egulpc25Kj6Qp8kUaSb5wmcG0tzkVdOle6ZrKftThjS1VMay+Tw==
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr1081476ljm.324.1616454227238;
        Mon, 22 Mar 2021 16:03:47 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id p6sm1695398lfc.71.2021.03.22.16.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 16:03:42 -0700 (PDT)
Date:   Tue, 23 Mar 2021 00:03:41 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: koelsch: Configure pull-up for SOFT_SW GPIO
 keys
Message-ID: <YFkiTUJ/xhVN7H+r@oden.dyn.berto.se>
References: <20210303132941.3938516-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303132941.3938516-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-03-03 14:29:41 +0100, Geert Uytterhoeven wrote:
> The GPIO pins connected to the 4 Software Switches ("SOFT_SW", SW2) do
> not have external pull-up resistors, but rely on internal pull-ups being
> enabled.  Fortunately this is satisfied by the initial state of these
> pins.
> 
> Make this explicit by enabling bias-pull-up, to remove the dependency on
> initial state and/or boot loader configuration.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.13.
> 
> It is safe to apply this before R-Car M2-W bias support[1] has landed,
> as pinctrl_bind_pins() does not consider -ENOTSUPP a fatal error.
> 
> [1] https://lore.kernel.org/r/20210303132619.3938128-1-geert+renesas@glider.be
> ---
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index 751e07fb102cf454..c6c93c4452ee1e88 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -81,6 +81,9 @@ lbsc {
>  	keyboard {
>  		compatible = "gpio-keys";
>  
> +		pinctrl-0 = <&sw2_pins>;
> +		pinctrl-names = "default";
> +
>  		key-1 {
>  			gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
>  			linux,code = <KEY_1>;
> @@ -615,6 +618,11 @@ sound_clk_pins: sound_clk {
>  		groups = "audio_clk_a";
>  		function = "audio_clk";
>  	};
> +
> +	sw2_pins: sw2 {
> +		pins = "GP_5_0", "GP_5_1", "GP_5_2", "GP_5_3";
> +		bias-pull-up;
> +	};
>  };
>  
>  &ether {
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
