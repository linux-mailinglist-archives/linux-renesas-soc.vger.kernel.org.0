Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE78300025
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbhAVKOM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:14:12 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:37804 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbhAVKJB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:09:01 -0500
Received: by mail-oi1-f179.google.com with SMTP id r189so5431587oih.4;
        Fri, 22 Jan 2021 02:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xY5GiH5IAFy+C6+svonjBQxaaIilTn+htyqsnOOxaVQ=;
        b=TJ+86Xi9W2UhqoSAkYaEvwBMgPe69597R4gV1TgNoS2enmFtSGDgus1K7ZzDwSVgQ1
         x4oAD+6n7HAxbtipkh2xz3/H44BaqENS7Tsm+yNhMeH09QG23oFvOoDXEPq0CjPw948m
         YcC6ZYqR/84DVn0CYqGTuo80CU7BPRAh3h6O6WvxqLaQ0jQJPJjI5MfrXoz3fVhr9hek
         dr6Yx5CspzEgo3XqwDPTp2gFYH38LVbneMopP3MEwKHPVJJqdNFJuDt2qjBJNKMGjNXS
         SPy/UTNi9BQ79fM5uSk1JzqD5ARX9zUAo2tlgJol7X/uNVXfwHrgLRWNkjNc+fhgm2I3
         7aVw==
X-Gm-Message-State: AOAM531D+HzbBeqRIdUv01SqhX8AgqA1PC9zBaNXQS/CRuxkwczGy/7I
        Y4jN07NXnGHKgOO9cX6+JL19yNySyzr+xzB9a5g=
X-Google-Smtp-Source: ABdhPJwMhQgZWV8G3hOf/8rIUQ+PBjApl+jabWA6Wrq7oWMS3tMVVxGvPVaPw69jgWpQQvAjw197VlsnkJSqzKWb4pc=
X-Received: by 2002:aca:31d5:: with SMTP id x204mr2679744oix.153.1611310091886;
 Fri, 22 Jan 2021 02:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com> <20210121095420.5023-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121095420.5023-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:08:00 +0100
Message-ID: <CAMuHMdVwR3kYSOmJsTuVYLgyxRhFByevHhmY5xi62RGjVr+zUA@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] clk: renesas: r8a779a0: add clocks for I2C
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 10:56 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * use S1D4 as parent clock as described in the datasheet

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
