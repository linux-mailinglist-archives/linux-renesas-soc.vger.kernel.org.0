Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14822300024
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbhAVKOE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:14:04 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43515 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbhAVJ7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 04:59:16 -0500
Received: by mail-ot1-f41.google.com with SMTP id v1so4529230ott.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 01:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqigOQVef+ZYsxoWJnmLLrE2kIEROjGNmadgPrxo15M=;
        b=Njb/nk80pd03yfTvgNax6flb2s+2ZEyog0P1fwPm6NHoUxUHuXgyvbT9qVVSaVH2yG
         lddvYkKUuHx9tnjNaKyREovhfrbJ4EM9+DGfCv2eQprZ1fG+d/6qQl3Gdn7+eQuGvYAr
         NOse+YcMwgo05IM/zNW7RmtHu86ZJMsfdwImMK3pxEj6uuaeBfSbmNA2eh55XH+xwrVs
         Q3cbshH23ghI4gSIhD1PhBWhLbgYUHOfmYFrVLalY4tX+UxXjzAo1RlK0rt7vf6DXupO
         3hX7UcQZxJNWXkSRvdX3WVOEYIb3e/nfA11cIC32cReVePgLz2cX5kwh68ryyQ/UFLu3
         UmpQ==
X-Gm-Message-State: AOAM533wlqOP9jLaLMnuhK9JHzbzY/7i/u99ja4IwyLirtuMLWpfghPy
        9P51uqAHQOJTSTA85EPvznHO/bXkyZiGQnLIPIQKFAJ9
X-Google-Smtp-Source: ABdhPJyGUgklCAdYEjjbjMXMPHfn6dujY7dI+8yWkLeJLPQkFfwVWYX7Jq3jNoRiHLj683O6iHoXndMqZUqzY3BZi1g=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr2669261otr.107.1611309515348;
 Fri, 22 Jan 2021 01:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20210119133322.87289-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210119133322.87289-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 10:58:24 +0100
Message-ID: <CAMuHMdW5pi81=eLui2GLoYUiuZ6BT7O=jDT_qtMp+_btNo5jaA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: disable SD functions for plain eMMC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 19, 2021 at 2:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Some SDHI instances are solely used for eMMC. Disable SD and SDIO
> for faster initialization.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

> ---
>
> I recall that ARM64 maintainers prefer such changes in one block and not
> individual patches. If that's not true, I can convert, of course.

Correct, thx!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
