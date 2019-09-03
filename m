Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EF3A7605
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 23:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfICVPI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 17:15:08 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]:41713 "EHLO
        mail-qk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfICVPI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 17:15:08 -0400
Received: by mail-qk1-f177.google.com with SMTP id g17so17525013qkk.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 14:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hrlnQyjxLq5CYivE9GlieClIZOPBePod+9zvBBHCe/k=;
        b=qPC7Qx3j42ayHV9la9MFhbRX6td6rpJIyYp9eSMHEeJdQybwunbpkbP4miL3b9HJy6
         UPykL6Q2GeYWBGPcYV4YmAEC1TTFOOJzqYVs4ujuLcj1boGGvAe0QB7TphYBmZ2hmNr+
         hE3Xt1UmCFW0dvMYmDy5OlmxWZrZXw2L9enjkN3rWOazE620AhCjKXOU1ySayn+bYF2E
         doSNvgCzLmjAzH9zLsH3RPYWAqir8ZvtVQpI6Q2lMK6l2L4nTQrGftvVctPhW9TJ1FjQ
         1sY9cI/Gk98d4xhaDn+pTqr96J8BteblPDTb8aZaKNhxzfgFHQKBggFGyrsYHDG6nfnd
         cW1g==
X-Gm-Message-State: APjAAAXaPWl+pgWDBulYYx3P1rZROGTjK3uIx3xE9lITCuK02Ivj3y6c
        uT1B37ofePBYjJ+NL0wKHF6RmL8d7LdkzSggePE=
X-Google-Smtp-Source: APXvYqy8ue7nYD2A+jriaQr6ZusrM3NzPA8WVpTMH3ZcfOqMcbj+rLuBhXygQZk/LpIuLgv48BQzUGgeHQ3s78vaIjI=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr36680871qki.352.1567545306976;
 Tue, 03 Sep 2019 14:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123643.18799-1-geert+renesas@glider.be> <20190823123643.18799-3-geert+renesas@glider.be>
In-Reply-To: <20190823123643.18799-3-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 23:14:50 +0200
Message-ID: <CAK8P3a11EfOXfwZ5Xx3vYJwfBGPh=yX73f_=3u7Zmm+hJF6HVg@mail.gmail.com>
Subject: Re: [PULL 2/5] Renesas ARM SoC updates for v5.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 2:36 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Renesas ARM SoC updates for v5.4
>
>   - Low-level debugging support for RZ/A2M.
>

Pulled into arm/soc, thanks!

This should be the last of your pull requests for the moment. Can you check that
everything is there once it hits linux-next (probably Wednesday, I may have just
missed today).

       Arnd
