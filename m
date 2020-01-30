Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 837F814DA9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2020 13:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgA3MdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jan 2020 07:33:02 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35510 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgA3MdC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jan 2020 07:33:02 -0500
Received: by mail-ot1-f66.google.com with SMTP id r16so2967386otd.2;
        Thu, 30 Jan 2020 04:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SF4A8MXH4i+NehAjiTIe/wipSti1DDnySBzIoKhtngY=;
        b=eSq6OFsX4FUlr2UyT62wcGR/P57xE6a1RWZKmFOUveUDcc2MF6HDoUuqNOKoI/hX/Q
         5mG9gOuUPYXSq10Qquk70XLbbshE489kwzMlFyZ/fEMlG1cIKE/CzjcSdydLnhPi93pY
         oUiTEq0UNwlUVxyKVDVRblmdhGAbQT9xy25izoBxIHzbm7hJYMOJqM4Ost6sGI3KcV1G
         gqRgmUqoqjbDSgGI83nRBNWfLmi5uX1BpcJiQ2PgVmRuTAvi1Z/KTVwzYLhEphYxUJOT
         cLxQusUClWa9kQ1e5q+NZnJLeiH2oO8cubqo3dFJKVzHmCwvo5wPP6cUAVeldR5XuTgr
         Rfrg==
X-Gm-Message-State: APjAAAVpvdwBCH8pCGTItPOSbZJJAPxLOQZpQw64tf297s9Ibff0pkIj
        TIpPhBLdXTu5Th82Y6AOkaWnFsLRXCSkwzbjVkc=
X-Google-Smtp-Source: APXvYqymSbwIVGK+M1CJKuu8V4/Pmg47Q6gWht5FbqvzeN05ArmzMI8NjyeixcBdRSkS9xgrJChKC5UFlRm4eXp+0T0=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr3438190otm.297.1580387581450;
 Thu, 30 Jan 2020 04:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
In-Reply-To: <20200129161955.30562-1-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Jan 2020 13:32:50 +0100
Message-ID: <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Support custom speed setting
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "George G . Davis" <george_davis@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Wed, Jan 29, 2020 at 5:20 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> From: Torii Kenichi <torii.ken1@jp.fujitsu.com>
>
> This patch is necessary to use BT module and XM module with DENSO TEN
> development board.
>
> This patch supports ASYNC_SPD_CUST flag by ioctl(TIOCSSERIAL), enables
> custom speed setting with setserial(1).
>
> The custom speed is calculated from uartclk and custom_divisor.
> If custom_divisor is zero, custom speed setting is invalid.
>
> Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
> [erosca: rebase against v5.5]
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks for your patch!

While this seems to work fine[*], I have a few comments/questions:
  1. This feature seems to be deprecated:

         sh-sci e6e68000.serial: setserial sets custom speed on
ttySC1. This is deprecated.

  2. As the wanted speed is specified as a divider, the resulting speed
     may be off, cfr. the example for 57600 below.
     Note that the SCIF device has multiple clock inputs, and can do
     57600 perfectly if the right crystal has been fitted.

 3. What to do with "[PATCH/RFC] serial: sh-sci: Update uartclk based
     on selected clock" (https://patchwork.kernel.org/patch/11103703/)?
     Combined with this, things become pretty complicated and
     unpredictable, as uartclk now always reflect the frequency of the
     last used base clock, which was the optimal one for the previously
     used speed....

I think it would be easier if we just had an API to specify a raw speed.
Perhaps that already exists?

BTW, what's the speed you need for your BT/XM modules?

[*] stty speed 38400 < /dev/ttySC1 followed by
    setserial /dev/ttySC1 spd_cust divisor 1128 gives 57624 bps on Koelsch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
