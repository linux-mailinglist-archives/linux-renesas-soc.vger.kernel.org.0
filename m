Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D002EF39D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 15:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbhAHOC4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 09:02:56 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:45079 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbhAHOC4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 09:02:56 -0500
Received: by mail-qk1-f180.google.com with SMTP id b64so8409773qkc.12;
        Fri, 08 Jan 2021 06:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mDweryYeuggXhC0OuRMnobqg5ELRrYBSuHnqfXOjGVA=;
        b=YSi+rwMRNrTs92KrQ8B2UdAV55zckcTNvziid8MZ5HrdEeloMqStZpcY2v6gxQAkrU
         Bp4m5ZhE/ogfRGjU9seGGTC/Q1cL5xhapg9YF4tEGY96ufQdcBK2CMqb9yg9HYIflObe
         xj1mn4bFgwwOXh3kJTwKnG1sfyP7sQMFGQVLm6McFnVs01c1KSNapjFhbHCxz2Ul9r1J
         vGNmfIJpwk1m6wMIW1n9mLnOMl/m9w2IYM+C0vl9PghWwTw60qZdOsPurJhSh7exIg3h
         y4PzErHwxq9NiHcLEYkFGCewKyDTVYk94bO0aGYnDq+rdu5Fra+MkFtRxFT3Ekj1rRHe
         hgdg==
X-Gm-Message-State: AOAM531fHaqc25WuqlcRK8A2DNrzGtt3H3/ouI5Ms0FyDCuTOgXeHiuG
        DgPDC/JtsUIw5SmFXmS9ynF0iax3+ym62qe8JQVmXzrS0yg=
X-Google-Smtp-Source: ABdhPJw7Wi0RXnPWX3AtBnXjSkwAnKyK40ylT7DEDTq6iuF6Zyzoc76yAbzx6dbjS879CCynMB/f2AixdfSwvQEcapI=
X-Received: by 2002:a37:6c06:: with SMTP id h6mr3943141qkc.115.1610114534929;
 Fri, 08 Jan 2021 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com> <20201224170502.2254683-9-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-9-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 15:02:03 +0100
Message-ID: <CAMuHMdXf9iXvoDHDvx0fjx1yQx=5-cjDz_pECDjrXZn__z4cFA@mail.gmail.com>
Subject: Re: [PATCH V2 9/9] arm64: dts: renesas: beacon: Increase sdhi speeds
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Thu, Dec 24, 2020 at 6:05 PM Adam Ford <aford173@gmail.com> wrote:
> The eMMC can run at hs400 and the WiFi chip can run at sdr104.
> Set the respective flags to push the sdhi faster.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -271,8 +271,9 @@ &scif2 {
>  };
>
>  &sdhi2 {
> -       pinctrl-names = "default";
>         pinctrl-0 = <&sdhi2_pins>;
> +       pinctrl-1 = <&sdhi2_pins>;
> +       pinctrl-names = "default", "state_uhs";
>         bus-width = <4>;
>         vmmc-supply = <&reg_3p3v>;
>         vqmmc-supply = <&reg_1p8v>;
> @@ -281,6 +282,8 @@ &sdhi2 {
>         pm-ignore-notify;
>         keep-power-in-suspend;
>         mmc-pwrseq = <&wlan_pwrseq>;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
>         status = "okay";
>         #address-cells = <1>;
>         #size-cells = <0>;

The HS400 change was accidentally part of "[PATCH V2 5/9] arm64: dts:
renesas: beacon: Cleanup USB References":

| @@ -315,16 +306,12 @@ &sdhi3 {
|   vmmc-supply = <&reg_3p3v>;
|   vqmmc-supply = <&reg_1p8v>;
|   bus-width = <8>;
| - mmc-hs200-1_8v;
| + mmc-hs400-1_8v;
|   non-removable;
|   fixed-emmc-driver-type = <1>;
|   status = "okay";

You probably want to keep, not replace, the "mmc-hs200-1_8v" property,
though.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
