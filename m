Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8645C324D7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Feb 2021 11:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbhBYKCK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Feb 2021 05:02:10 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37315 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232778AbhBYJ7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Feb 2021 04:59:42 -0500
Received: by mail-ot1-f41.google.com with SMTP id g8so1478651otk.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Feb 2021 01:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hYv5CZolbiBAioqOolDML64fF1qeiSzq41fa9Blh/Uw=;
        b=Y1K1nW60i+CDwF2v6fQlEN3UFIpjH1qZpCEMscmtbVkarYmvGXKUxvZjnYa4DTh908
         s6G47OaG7EPPkVV6va5xyWS1THLqJHq3UtCfx0EEerlVT1pmiP8vhDFXL0s8ex5Yaj1k
         PuSeuKoDsG5oa8NQB4jgHSlMu0XUwR/iMJimT3Zh3jNFbfodMorpTAiPSqu+TW9ORfY/
         ZVh0MwHg9drip1FCFncD3U9jcTf3XP2HdcysP+7RqEL3VbNqP8maA/57dOZIK2sItJyD
         HEoqqAhF+EV3XLWG/vF45w2rv+DcSnmvUevhHPAk6uoeGNOqZC7MCTH07mUqnoM3UDpz
         p9IQ==
X-Gm-Message-State: AOAM533oYHL70UZ2EirqmJDelwmdFDY4bgk5vMcmw1xyfoiEueGE4NAJ
        E1mRPJKhj4wcAbANpxBgqeycrvqUTX1FYdsU4hhZMYoB
X-Google-Smtp-Source: ABdhPJxyp2AOLUNKskjAw1wg3T2ohosi7sGDCxAZQ9Th1XtbbBk16XxAAYJ9hbvg0v72VphnG9o7aC5eygc+9ybQcwU=
X-Received: by 2002:a9d:328:: with SMTP id 37mr1612211otv.250.1614247142327;
 Thu, 25 Feb 2021 01:59:02 -0800 (PST)
MIME-Version: 1.0
References: <20210217090603.1517-1-yuya.hamamachi.sx@renesas.com>
In-Reply-To: <20210217090603.1517-1-yuya.hamamachi.sx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Feb 2021 10:58:51 +0100
Message-ID: <CAMuHMdV=jQyOtm48HeZUE4P4p9QJok83mA4vgwaCr+x-Pkyrjw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961-ulcb: add HDMI Display support
To:     Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 17, 2021 at 10:24 AM Yuya Hamamachi
<yuya.hamamachi.sx@renesas.com> wrote:
> This patch enables HDMI Display on M3ULCB with R-Car M3-W+.
>
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
