Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FC92F4C78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbhAMNtV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:49:21 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35698 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbhAMNtU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:49:20 -0500
Received: by mail-ot1-f46.google.com with SMTP id i6so1931281otr.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JIs05OEcZbOChfa422Ebj10lTKHVAC/f8v1QLw9S05c=;
        b=TQkWrLQgdbJiVxv3As9SQ2rIy+Zo8ctQduYOVYTKBFSXh+vVf3RITmDt+lYbZ2l+Ox
         PK9wj2Q99YUF4ljPTXSb/3XaeoZw9r3pB3ZJJaEp5SoBLG9IcVvQjI51mIq7Ufemj5ur
         liho7Jm76CBTO3XaGNUlAw/qpcVfiLvU9A7ceQFGkRBRiXPkb5GII+2oXRXyNpxx+X1/
         fSz2lpllL3F2Kajg8A5HAEMi0/fyG0NMBZae7oi+I1r6hN0hDPBKhAQ/9zDORpfE76f8
         isQ2oBjl2oVeT8H/+ndUk1CLHHfx3qZWK81vko2AJqn1FmPIK5iTgI0d8K+1ttcxc67D
         UqYQ==
X-Gm-Message-State: AOAM5303ZeK5eRTLmh1klHrKGHo+OOkBi0OvisHAPEjkWNatvkaOSEX2
        MdQGWnh+snqWIdiw34PlxSQTo5W0IL83n7aaMt4=
X-Google-Smtp-Source: ABdhPJy1exeaEAQarppKpkVJqiDxS9lEM7LG50punXu5B590Um+0HocawipOrYru/AANipnGiIcy4rwmh3atMgonzl8=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1245997otc.145.1610545719622;
 Wed, 13 Jan 2021 05:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20210112165929.31002-1-uli+renesas@fpond.eu>
In-Reply-To: <20210112165929.31002-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:48:28 +0100
Message-ID: <CAMuHMdV1k++POj0vRuuDHN-NYYJ4X4TejMMHvz-WFBXMQrjnPg@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] pinctrl: renesas: R8A779A0 (V3U) device support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This series adds V3U pin control support for EtherAVB, CANFD, DU, HSCIF,
> INTC-EX, MMC, MSIOF, PWM, QSPI, TMU and TPU. It depends on the "pinctrl:
> renesas: basic R8A779A0 (V3U) support" v3 series posted earlier.
>
> This revision includes one commit message fix as suggested by Geert and
> adds a bunch of Reviewed-by and Tested-by tags.
>
> Thanks to Geert and Wolfram for review and testing!
>
> CU
> Uli
>
>
> Changes since v2:
> - CAN: fix commit message
> - add Reviewed-by/Tested-by tags where applicable

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
