Return-Path: <linux-renesas-soc+bounces-19320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F6AFB31A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 14:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F4E43B7DD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B4B275AF8;
	Mon,  7 Jul 2025 12:21:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC9D191499
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890869; cv=none; b=tuakTcEQKKwObdjjuX3q4BfYaeCjQACd2Yghua7SXsaUCq/Wwx1VsrnRYXQBMwPoriZ5LuvXrdRKoa2I2xFVGtkJpMEGAtHw0GTIAseJmFebEa3H6I+NHuEK3GRsu1STVxK6kXJEH0WcVwQ90VnIK1XzNxvRWIgQBpvRs0D0iy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890869; c=relaxed/simple;
	bh=6JD3aSAq8/LAvqw974LYHPei6HetMJ9ZBmla7wPbH0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMgXJmezNXGLt9w06ZQ8L0YwBKHygsa5vgk5Igm3gdtgTJ5epdO8kJAsWn16G6fFpG/ZiIE3cmGJ5g1gtG//y24kt9L/BLxO2GJkOf0iLyRBdOm2ZfZFQpsrxEjhoY0Xhr15u2G28qZ642ZZPRGapClJ3arbOHknHxVldfQHPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso1666740241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jul 2025 05:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751890865; x=1752495665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxbXVi4CG4qIKHgvTDvY36sOFFXFukjPuI1uc+3+ihQ=;
        b=EZOObJPT6MtdPAMCJWrRjCsbErm2itVYCDaQD8wz3RlEZ0+07eGZPKmGXKHPq8YQ1d
         OsxK+RdW3wY1e4IWn/6R8xlqHQg7uzQ1ww4ox1hQkafkrPz3N6SR6YGhdLe8QjaQ5bbE
         LLx0hBGlhasnU7QTiwxiMCsPk5fAE6cJnkF1IpHTRCxz9voI5ZPE1dhXx9kSJRQA8Acp
         lWcImfxho9wLdL5fxVI715WFF+Fr+E8mh9/Hr+wkN1tKHNtF2euKyzLbNYfA5mzr2AYT
         sxqya1m1VpUZghHZRkbxTRTYW8Bi//ZkevY3UE2FV6/GpEdmdvBPo+srmDO8kf+2fGRl
         LcfA==
X-Gm-Message-State: AOJu0YzkYlGJ65Xr2/ooxNS7yHSqAkxJsqNmQF92CQ9KbIClGUtV3qRN
	0rXwMWlqQdPQWiPmMr6FPWxraMXP8hF/SvdewebRievCvawkngmykF+FgA2PRqNo
X-Gm-Gg: ASbGncsRR2TnuFrktRm1VgOQdvAW5ux/CxqwOkxDpSv+sqPtxf9g9TyoD+/v3itCTiA
	3/QpSd0oQ9u1OScngv/benBFoBwPKWWWiOWM2LzlbEOlT5+Io9ssGNzahGlTJXB/zdGpdFzxmSW
	jr6xtYWsDnm9rZbXMJVeJ9wXHgq1mBKexAUjRty271V0D7Z95xuT+0BMWLmrCHRUJBcykMHOoh0
	gMwDzxDnvCbcrxVrmPuSvQVenF+2LWHk0dEiEoEhmNS0BgKy2eIm2oaFr4jnGgvgIjs06XxBw86
	KFDZO+mLwn2MjXRtgBqHKVNsIsxBm5YMkqAKvVZ1u6yn+QNKHbvBNAEDGP+/+HCWsWH7rc4+hbh
	irsKYCeJpm8nsBZzmYBuS3qqd
X-Google-Smtp-Source: AGHT+IEX3Vt3zNHyWz3RvojHPm7VowczpatPjI0/bbLvWVkUasQq69ViLJvw/eOyyR6w6QLZz5WGUw==
X-Received: by 2002:a05:6102:3e95:b0:4e5:9c06:39d8 with SMTP id ada2fe7eead31-4f3059d6016mr4495541137.5.1751890864994;
        Mon, 07 Jul 2025 05:21:04 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea73b3acsm1035990137.29.2025.07.07.05.21.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 05:21:04 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so2333595241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jul 2025 05:21:04 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:4df:4a04:8d5e with SMTP id
 ada2fe7eead31-4f305a4d98fmr4616069137.8.1751890864531; Mon, 07 Jul 2025
 05:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
 <175174255437.83411.8624204632703877341.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174255437.83411.8624204632703877341.sendpatchset@1.0.0.127.in-addr.arpa>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 14:20:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxZGB4KD_L2scf97Af96TbhjMaS_b9WBoPu+usRYiKYQ@mail.gmail.com>
X-Gm-Features: Ac12FXwqCJiUX1R3XtaWXw3EQQFl7iwt0UTD59V9EfpTr74WEO-sQwmSuuKVnYc
Message-ID: <CAMuHMdWxZGB4KD_L2scf97Af96TbhjMaS_b9WBoPu+usRYiKYQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: renesas: genmai: add rpc-if SPI NOR flash
To: Magnus Damm <damm@opensource.se>
Cc: linux-renesas-soc@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Magnus,

On Sat, 5 Jul 2025 at 21:09, Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> Add genmai board support code to make use of one of the on-chip rpc-if devices
> to interface to the on-board SPI flash U6 Spansion S25FK512S-16. Without this
> patch the SPI flash is accessible through a memory mapped window, however by
> adding pinctrl configuration and a rpc-if device node to the DTS we can now
> access the SPI flash via the the rpc-if driver instead.
>
> Signed-off-by: Magnus Damm <damm@opensource.se>

Thanks for your patch!

> --- 0001/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> +++ work/arch/arm/boot/dts/renesas/r7s72100-genmai.dts  2025-07-06 00:02:33.267119292 +0900
> @@ -18,6 +18,7 @@
>
>         aliases {
>                 serial0 = &scif2;
> +               spi0 = &rpc0;

I don't think you need this/

>         };
>
>         chosen {
> @@ -25,35 +26,6 @@
>                 stdout-path = "serial0:115200n8";
>         };
>
> -       flash@18000000 {
> -               compatible = "mtd-rom";
> -               reg = <0x18000000 0x08000000>;
> -               bank-width = <4>;
> -               device-width = <1>;
> -
> -               clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
> -               power-domains = <&cpg_clocks>;
> -
> -               #address-cells = <1>;
> -               #size-cells = <1>;
> -
> -               partitions {
> -                       compatible = "fixed-partitions";
> -                       #address-cells = <1>;
> -                       #size-cells = <1>;
> -
> -                       partition@0 {
> -                               label = "user";
> -                               reg = <0x00000000 0x04000000>;
> -                       };
> -
> -                       partition@4000000 {
> -                               label = "user1";
> -                               reg = <0x04000000 0x04000000>;
> -                       };
> -               };
> -       };
> -

Removing this breaks the direct-mapped FLASH ROM, which may affect
userspace, and prevents using XIP (but I understand no one cares about
the latter anymore).

>         keyboard {
>                 compatible = "gpio-keys";
>


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

