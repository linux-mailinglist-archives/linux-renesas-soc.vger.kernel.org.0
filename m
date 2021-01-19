Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8996B2FC253
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 22:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbhASV1g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 16:27:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbhASSoc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 13:44:32 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C098EC061573
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 10:43:50 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id q2so40062983iow.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 10:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lBtUbiJsoRQ2MnsK3Wuv9r5FSEquCYiVdXunqSB5Pww=;
        b=T9pxzuYXqs5ccroh0ZwJ5MOCm18fJia3FKRjakyzJ2A1g2POiZXCGw7ChAYwE6mhtv
         q2uO90u5fLGVvExvn7AGDYf2btS5XJl3H0G5fkyc0yutP/OfIy7AfF4rF76mUYjWPKnF
         eZ7dktnaHuJ/oMTVurwiUKUIlMGifgG4OtzIkKcLf837kq/8lbWlcQi4lWz/bE4ByEjp
         ov3Qw8yiN5M5EBzRSNsJr3yBBMAAOGXyvDgFxzpkgmaeVJ0QFkiGPkojVxPVPVPF+9vV
         QlQ315pD/dbH4skrzD/ZT96txYWjmOJuRLuJx27hLdi4XBlKLlDSM76rNhZlsVkRn6cd
         C9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lBtUbiJsoRQ2MnsK3Wuv9r5FSEquCYiVdXunqSB5Pww=;
        b=PCw7p1e52mfJVFn5A4BogYzeh2+gIA1rjppQgnRafCsy/pG58kR6GpF70krtAyYHXe
         yJMI2PkiweL2Z1fgCY9Z6p6floPNUHUehRK/AcW4IzpgLee9AoT4vmrvM9edFi0UmnQF
         ++vzFZlKam0mCHISKTXMSU8GqWtzS6SYaXubQR44zvHT18tcZ4dftasBZbSx9NXxYtCO
         09jGkdQaKcIa+VxWE7ZTgOmdnsmLWlZyfEveUlg2cBrTx2XeLyqUGPw8rt/AwI62IhjV
         4aER89z+cNTbg11eEb+uESnUuqpqNy2OpGuFQ7GCwhJiVlpkLF+vgygEwmFGfV+d4LS3
         eITQ==
X-Gm-Message-State: AOAM533prHbBNnNhBKtk1rEFEHJHFi9PnWoMtnLGpbxCa5T6Hj8v1j0e
        S0oapoIUdCW49UAHmWZKlT2EUAYkQEp4OFMYxLjtEeStAQ4=
X-Google-Smtp-Source: ABdhPJzdgfJUF1qflXMq+lmZAnsahmRqcWZgK2EG2V7ROD8EDV8Uv9/8ephYTVbq0wyXlT2I9WT6x91qSctr7VoNLQM=
X-Received: by 2002:a05:6e02:13c1:: with SMTP id v1mr4786550ilj.89.1611081828956;
 Tue, 19 Jan 2021 10:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20210119133322.87289-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210119133322.87289-1-wsa+renesas@sang-engineering.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 19 Jan 2021 12:43:37 -0600
Message-ID: <CAHCN7xLcqh0efDuMS96Tot2Wek736VTbSbYm-rQgJf=ghZ0sBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: disable SD functions for plain eMMC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 19, 2021 at 8:48 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Some SDHI instances are solely used for eMMC. Disable SD and SDIO
> for faster initialization.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> I recall that ARM64 maintainers prefer such changes in one block and not
> individual patches. If that's not true, I can convert, of course.
>
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 2 ++
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 2 ++
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts     | 2 ++
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts      | 2 ++
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts      | 2 ++
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi    | 2 ++
>  arch/arm64/boot/dts/renesas/ulcb.dtsi               | 2 ++
>  7 files changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index f4201e1c2226..c9bf5234dbd0 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -312,6 +312,8 @@ &sdhi3 {
>         vqmmc-supply = <&reg_1p8v>;
>         bus-width = <8>;
>         mmc-hs200-1_8v;
> +       no-sd;
> +       no-sdio;

No objections on the Beacon board.   I cannot speak for the rest.

adam
>         non-removable;
>         fixed-emmc-driver-type = <1>;
>         status = "okay";
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 2eda9f66ae81..7a3da9b06f67 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -328,6 +328,8 @@ &sdhi3 {
>         vqmmc-supply = <&reg_1p8v>;
>         bus-width = <8>;
>         mmc-hs200-1_8v;
> +       no-sd;
> +       no-sdio;
>         non-removable;
>         fixed-emmc-driver-type = <1>;
>         status = "okay";
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> index 422ec53740cb..04d47c0c9bb9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -217,6 +217,8 @@ &mmc0 {
>         vqmmc-supply = <&vddq_vin01>;
>         mmc-hs200-1_8v;
>         bus-width = <8>;
> +       no-sd;
> +       no-sdio;
>         non-removable;
>         status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index e0ccca2222d2..f74f8b9993f1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -712,6 +712,8 @@ &sdhi3 {
>         mmc-hs200-1_8v;
>         mmc-hs400-1_8v;
>         bus-width = <8>;
> +       no-sd;
> +       no-sdio;
>         non-removable;
>         full-pwr-cycle-in-suspend;
>         status = "okay";
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 8f471881b7a3..6783c3ad0856 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -496,6 +496,8 @@ &sdhi2 {
>         vqmmc-supply = <&reg_1p8v>;
>         bus-width = <8>;
>         mmc-hs200-1_8v;
> +       no-sd;
> +       no-sdio;
>         non-removable;
>         status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 6c643ed74fc5..c22bb38994e8 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -831,6 +831,8 @@ &sdhi2 {
>         bus-width = <8>;
>         mmc-hs200-1_8v;
>         mmc-hs400-1_8v;
> +       no-sd;
> +       no-sdio;
>         non-removable;
>         fixed-emmc-driver-type = <1>;
>         full-pwr-cycle-in-suspend;
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> index 8f8d7371d8e2..a04eae55dd6c 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -468,6 +468,8 @@ &sdhi2 {
>         bus-width = <8>;
>         mmc-hs200-1_8v;
>         mmc-hs400-1_8v;
> +       no-sd;
> +       no-sdio;
>         non-removable;
>         full-pwr-cycle-in-suspend;
>         status = "okay";
> --
> 2.29.2
>
