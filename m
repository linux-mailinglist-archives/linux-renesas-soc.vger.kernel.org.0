Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A474A1682D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 17:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgBUQKj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 11:10:39 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43301 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgBUQKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 11:10:38 -0500
Received: by mail-lf1-f66.google.com with SMTP id s23so1872292lfs.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2020 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fzmdPVewt4poXC+/NMgaFWzacayCygYoOgCnUFqrFA=;
        b=fVdWb+3x5OJjWjTS8JQOQcRTidOkvjo2ir5U7PGAMVw5WxJMB39mldwFJOaGJBpPUy
         TygGJ4Dh2eYuVpqhNmTy3A+mpVuIa2KKYLFA3KwEZW7wHuF9sM0lfQDUBvctfKY5m1/w
         pO0dTq0SLvot91o2JkazTn4LiuQ4fl4I5uYWo0e5ArrD3w5jCckR3bFlT9HGTa+m8PiK
         8VAPpY7zeJn+UMraJSLg7HWnf8dY0AdiTCeorPVYG50crBQzgoxJZ4GIyr4FyKjRhKom
         FwWdL94yUF4/ORBxgq/aGEs+gPSJnwmTca7vaVtED+YyMLd2N70TOhnvv4WIVVP46psz
         EG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fzmdPVewt4poXC+/NMgaFWzacayCygYoOgCnUFqrFA=;
        b=YBWk62ivponYo613V49R7LnXv7ltq1stbghVcMWQEwM6J4kK1n63sJsh+ebttgsvhU
         Elopuo4b+wzoNwmZ1GUjMNYoQpB++g3XGwHiesPdM0RwtaQ4Timw4p7th4+FbHRzghaW
         0//Mn0aC8xE9tQzU+ayTnhF8+MuVXIf9KQKFuqd54bm9wCZxyibUFwMEjka0QR6Cfvkv
         bc2UDBEw0LBJew6dNlPLp5hZ9ib7Lh59vgKCiOCDf1gymAhrVmbf11ZwgiJ8uHbuGsII
         RLCta5OeeZ4PqqGLX6GYjzC5dR8Zze54vQ9ejxiklmqKoqvjOEUb5qziTrIjXnytPdeQ
         yfEQ==
X-Gm-Message-State: APjAAAW3C1NOD68RTdPwQoSk37vaWjNmjKqbjN3ou9rT6v9qq+0km5eE
        naAQHgTAhS8wieT1fAD8gWNTW9Y/iEnRjfhnXwSLjw==
X-Google-Smtp-Source: APXvYqzfFpHz+WEEPdfY1KvmrQ7fJ+JA1hBH/qsYBoXtX0Ad1P1ZdxZA5yWVXCM5V2QXzRc1KsrSTBXhNXruk6AbO4k=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr20384167lfb.21.1582301436869;
 Fri, 21 Feb 2020 08:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20200220130149.26283-1-geert+renesas@glider.be> <20200220130149.26283-3-geert+renesas@glider.be>
In-Reply-To: <20200220130149.26283-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 17:10:25 +0100
Message-ID: <CACRpkdbFRv2ab-fa3htiLBTmW4kCuB6Rmxb0Afj=eP4hH0W7BA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 20, 2020 at 2:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As GPIO hogs are configured at GPIO controller initialization time,
> adding/removing GPIO hogs in DT overlays does not work.
>
> Add support for GPIO hogs described in DT overlays by registering an OF
> reconfiguration notifier, to handle the addition and removal of GPIO hog
> subnodes to/from a GPIO controller device node.
>
> Note that when a GPIO hog device node is being removed, its "gpios"
> properties is no longer available, so we have to keep track of which
> node a hog belongs to, which is done by adding a pointer to the hog's
> device node to struct gpio_desc.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop RFC state,
>   - Document that modifying existing gpio-hog nodes is not supported.

Clean and well separated code, patch applied
with Frank's review tag!

Yours,
Linus Walleij
