Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C21214795
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 18:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGDQ4T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 12:56:19 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36990 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgGDQ4S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 12:56:18 -0400
Received: by mail-ot1-f67.google.com with SMTP id w17so20862727otl.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2020 09:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XeVsg+iMbkjNDRXYSwIBdvkTlRMqbu8ihCPFLQKNNUg=;
        b=SyopwuPY4ZMS3sM+wCWXuJ7dXmIrUto3UmHwoj58MkybAjDEGr26GL0IwyCSR6uZSx
         Hxv03V3PklC92x5iawo4AwrbMWqSrpDJ8/kIEz6rTw6JRBJTy+Py+dXtKN4gFYq7bChV
         cOPclwE3sQK5djPI4DJlq7zLGD4jest0y0sLF5WYDFdyPNjqdG7l7PKni6b76RWRztsw
         Kh4KGDeKbTgfBMR5bCdYfmayYgZ4DATd9bjtI9fljnA6VDpGKJ4kSbHlmo+kcaTNf+nX
         Ie8X3Q3ZwaqeBN/YKuHaLBcSZsazXhReq1CwYL7qHRWZFGJE/+Y3ggqZQtAX4ZFHvJmP
         G7lg==
X-Gm-Message-State: AOAM531Olo64xIUJ6tnpNtKJ+ywNIc5XuJhciO6VSdI/QUU5aTQ4/2hA
        u9E0zqikuVFF46RKTETxip2qx5wWbLdTT3Nu7f2VB5MKV04=
X-Google-Smtp-Source: ABdhPJxtpBNz2ds0KoGxkVIK50rT5ilyv5VeT1WAKOpF+HLzKMhHic8JRCw6aOaph72/UykTYbKvajENwduWZo1SaO4=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr22930146otp.250.1593881777773;
 Sat, 04 Jul 2020 09:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200704154752.2980029-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20200704154752.2980029-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 4 Jul 2020 18:56:06 +0200
Message-ID: <CAMuHMdWRLcu6mZcyY9fZOpADNrJbn7YeDuAxku4P_rWfNMFHXQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Resotre support for V4L2
 platform devices
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thanks for your patch!

On Sat, Jul 4, 2020 at 5:49 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Since commit [1] the Renesas V4L2 platform devices are no longer enabled
> with the shmobile_defconfig, restore functionality by enabling
> MEDIA_PLATFORM_SUPPORT.
>
> 1. b0cd4fb276653f8f ("media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering")

I thought it was needed since commit 06b93644f4d102bd ("media: Kconfig:
add an option to filter in/out platform drivers")).
This is a minor detail, though.

> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -112,6 +112,7 @@ CONFIG_MEDIA_SUPPORT=y
>  CONFIG_MEDIA_CAMERA_SUPPORT=y
>  CONFIG_MEDIA_CONTROLLER=y
>  CONFIG_VIDEO_V4L2_SUBDEV_API=y
> +CONFIG_MEDIA_PLATFORM_SUPPORT=y
>  CONFIG_V4L_PLATFORM_DRIVERS=y
>  CONFIG_VIDEO_RCAR_VIN=y
>  CONFIG_V4L_MEM2MEM_DRIVERS=y

Already fixed in renesas-devel since commit 835a056da6409ec7 ("ARM:
shmobile: defconfig: Refresh for v5.8-rc1").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
