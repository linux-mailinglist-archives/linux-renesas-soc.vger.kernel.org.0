Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF7E7184FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 May 2023 16:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236722AbjEaOa3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 May 2023 10:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236708AbjEaOaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 May 2023 10:30:25 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E05126;
        Wed, 31 May 2023 07:30:24 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2564c6a2b7dso2541661a91.3;
        Wed, 31 May 2023 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685543424; x=1688135424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkd3oJamBaoISu2RBF+GUcZuSEdMzNTzEafcj+61KB0=;
        b=kSK+25R+WYi4NZ0bfLo8KGC4vbbbyIdLSDBKKbmk1qVwQLnHeylkrUV1g6SgPxucxB
         7T7GxlPatRxkz3GBdUdaZb/WWLiXIa4OCzzRL/AFq8Tl017D0ifrEMS+Oy9KgdS2E5lJ
         DCMIHC8nak9Mrm8wISjNH7R+nRT0ALAA3h3t47ZoJuQUr6WJFJb9uuGWBdbJtREEWfue
         eTpt/tBOQk472ECc64RGwBkw+FWguS1pyZ6BLpPDuQ8a784c0ig6jA6cyqBrY5zLAg9r
         s44a88fIxvQFERHmTIGouhVlI76r+07oEfjIGVXXP8rx5g73JuLC3k6ddyBmHbCUns1j
         cuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543424; x=1688135424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkd3oJamBaoISu2RBF+GUcZuSEdMzNTzEafcj+61KB0=;
        b=Az0PhsYRMCTJzvUFgWDua+xWdXchqQkotRu/l8o9V/rvNagqijbYCblQz1oMZhlYLk
         i4Nis1Bg8/xk9DJMSIxkjBwN9sMnGbZg3NbYW2qTKojDY+orUsHa+qGh3s8k5PVWaIGt
         azuPGUk4drMWavKNVOQ4biNbWD/tETnZzX3TZrQwADCs81FfWKCQrHPd7RsIsA3ehAjd
         SRsfNLO/GumR5KmpFCEPkTqSFX5WLCspkgwDPi3ppAuCK8BYc3YZnv/vCz3fKDil17Rr
         JYaCrwTafuyrdXZxOPok5UL51LpmvSJF/lingTjQCPVScooKYJPn79Jc96fuoXm0zw+8
         b5Xw==
X-Gm-Message-State: AC+VfDwNGKUX1n7gk5u15F4glJ7V65JcwaOQ191sFD6FwzO+FlPi+PAM
        5EmR/of82X2lG3KrCh+oQAa07ePiqHyMtE2F9P4=
X-Google-Smtp-Source: ACHHUZ567Mi9uMVn16wo685hmNI5ZIt4TS26PUrXTVKyoYoF1HD4KmoR8r65AruSaqzoU5xsa1+sAbZmXXF6+u5G4yg=
X-Received: by 2002:a17:90a:a60e:b0:255:b1e7:dd24 with SMTP id
 c14-20020a17090aa60e00b00255b1e7dd24mr4598420pjq.17.1685543423494; Wed, 31
 May 2023 07:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 31 May 2023 09:30:12 -0500
Message-ID: <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 31, 2023 at 2:00=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Some SD cards failed to tune SDR104 occasionally. Adding a delay between
> tuning commands makes the cards work although it is not yet known why.
> It seems to be host dependent, only a few need such a delay (I found AMD
> SDHCI and Freescale eSDHC so far). 25us is not enough, 50us never failed
> up to now, so let's double that value until we know what is going on.
> Extra thank you to Adam for sending me a problematic SD card to test.
>
> Reported-by: Adam Ford <aford173@gmail.com>
> Closes: https://lore.kernel.org/all/CAHCN7xK_fr_gREVsOzN=3DatcS08mwufr-=
=3D7q1JAN=3DCCyVk_k-dA@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This is one of the patches which look simple but took quite a while to
> come up with. Part of it was identifying the issue, part of it was
> trying to understand the issue. But I am stuck now, so I need help:
>
> @Adam: could you kindly test this patch with your setup? First, we need
> to make sure it helps your case as well.

I am testing this on a 5.10 kernel based on the Renesas RZ linux
kernel branch.  The good news is that the card doesn't hang like it
used to on the older 4.19 kernel, but it still does not enumerate to
SDR104 speeds.

[    5.222863] mmc0: tuning execution failed: -5
[    5.308026] mmc0: new high speed SDHC card at address 59b4
[    5.314397] mmcblk0: mmc0:59b4 USD00 29.5 GiB
[    5.320745]  mmcblk0: p1 p2

# cat /sys/kernel/debug/mmc0/ios

clock: 50000000 Hz
actual clock: 49999998 Hz
vdd: 21 (3.3 ~ 3.4 V)
bus mode: 2 (push-pull)
chip select: 0 (don't care)
power mode: 2 (on)
bus width: 2 (4 bits)
timing spec: 2 (sd high-speed)
signal voltage: 0 (3.30 V)
driver type: 0 (driver type B)

On other platforms, this same card registers 200MHz at SDR104 speeds.

I'll try again on the latest 6.4 RC branch to see if there is some
progress there.

adam
>
> @Shimoda: If it helps for Adam's case, maybe we could ask the HW team if
> they see a reason for this delay? I already scanned the SD/MMC/SDHI specs
> without finding any trace, Marek helped as well. My gut feeling says it
> is host controller specific. But first, let's hope it works for Adam.
>
>  drivers/mmc/host/renesas_sdhi_core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 345934e4f59e..6088cf94e1d3 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -711,6 +711,9 @@ static int renesas_sdhi_execute_tuning(struct mmc_hos=
t *mmc, u32 opcode)
>
>                 if (cmd_error)
>                         mmc_send_abort_tuning(mmc, opcode);
> +
> +               /* FIXME: Needed for some SD cards. The reason is not kno=
wn yet */
> +               usleep_range(100, 250);
>         }
>
>         ret =3D renesas_sdhi_select_tuning(host);
> --
> 2.30.2
>
