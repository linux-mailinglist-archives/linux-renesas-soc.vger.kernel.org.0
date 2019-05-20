Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5E762329F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbfETLe2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:34:28 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41166 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbfETLe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:34:28 -0400
Received: by mail-vs1-f66.google.com with SMTP id g187so8661419vsc.8;
        Mon, 20 May 2019 04:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UH9/sjkGYt1CAC9BwyrRGZX8SnvoZEXpFocwJkf4y3o=;
        b=CQRAciDj6OhZ1qUjPhQHhhkjx56LDjgdpmiP679SGfztnM+yxje5NO92xvRaEzaJg1
         qMaIkEe6MO+SZCwVChf3wSw1/qYrPxx6CWz+mAws7VSnTbis+O2TwG1sBwbSEALncjOZ
         9ReCHEAY7mkvtr0/YMUt0wreNoc7oyuc+K4ybuh/lKUyaTUN+n35qPOzc/5M5aBkKhCS
         z9T6xk8bihaC+46zcfZTg+DVLP5Ta3VXZkRsPFS1P9NEarP9eDKZzAsKy6nCnEmf5RqO
         irla7YsuWphsvfVU+4U6YnUAFbX+H0XcoDylL87A774PIyS2a+lyBDbT6wE/ORfpJqVG
         CeUg==
X-Gm-Message-State: APjAAAVfTMmG/gt/jq8sbUF+szQefzSSCDr5sIDquazO0uvVhDfyPHhX
        2e7XdOiMw7mxs+h+rZJqvW6UYdFPw1WvvjNcgJw=
X-Google-Smtp-Source: APXvYqyc41w0n4cC6rucCM5nf/3OFkR/HW/qIjxhDxrg/CU/4dtojTyg+SiGmK4Y5TBLGWzAQyPBgCihEslvgsK0O/4=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr25866170vsc.96.1558352066991;
 Mon, 20 May 2019 04:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190520093446.30895-1-wsa+renesas@sang-engineering.com> <20190520093446.30895-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190520093446.30895-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 May 2019 13:34:15 +0200
Message-ID: <CAMuHMdXio8Ve3GGfAr+gHqN9_kP2Y3jUv0Wd-dhoaw1qQK5kDA@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/3] regulator: da9063: move definitions out of a
 header into the driver
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 20, 2019 at 12:46 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Those definitions are only used within the driver meanwhile, so put them
> there.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
