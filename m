Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6E497FBCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 16:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbfHBOKM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 10:10:12 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37938 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHBOKM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 10:10:12 -0400
Received: by mail-wm1-f65.google.com with SMTP id s15so45127546wmj.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Aug 2019 07:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/j+eIuVn8yfBsD/4njpgrl63xtXK7Uo/Aq0daTrXic=;
        b=B+i0d2z+egCQvL/zT0xsfKWUOc6MYfWipNKed0G30/PbYLFq43vnJG4nR6k6vz/zXO
         R+5plA9g+owcE/qlZAAvQNALukY/6UizIKNqlb9rReUQwf6JSmEfIhKejdhV6MWR3fbq
         3PqTBN8WBJ32sfQVXWpKUT550L4RSX/qtfUGLE7moTAjAFHKxpFGog0btIs215Ec0/7T
         X+qEEFYBPvJkFtyHoJQ+hqGat4FbAkDcqrJuBj159gYO30f2fZDPbREueqFce9tEbNbh
         Rzh7ZbQ68DEt2UySoz5cyO2u1HR0pDv3Bul0LFopYw4d/jCXoOBQAI6wLYTBmocRoGB5
         2pRA==
X-Gm-Message-State: APjAAAUCxh8mPkk76dea0QNvGJKJlz53OFAEzW5UIdhJ/sJYQQ2srqR3
        +mEYu9ulk8CRspM0eBWpaQCVpRVqNykWvSS6v0Y=
X-Google-Smtp-Source: APXvYqz2eKCyQo52aRlSc3KupJbE199EJ97I8+oJuDGbrvsEElSPJ3KlzJknpLlKZ3kv3rVDSSnHocp6+G+Jv3ohb9k=
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr4822811wme.146.1564755010126;
 Fri, 02 Aug 2019 07:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190802120355.1430-1-geert+renesas@glider.be> <20190802120355.1430-2-geert+renesas@glider.be>
In-Reply-To: <20190802120355.1430-2-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Aug 2019 16:09:58 +0200
Message-ID: <CAMuHMdUndFnvpxHG6NUkw6L_B1Oetc_EZuQh4aNiidiCH+4wjw@mail.gmail.com>
Subject: Re: [PULL 1/3] Renesas ARM64 DT updates for v5.4
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

On Fri, Aug 2, 2019 at 2:04 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.4-tag1
>
> for you to fetch changes up to 0a05b3d7fee511de8a1c9dffc3d86f1df55e1737:
>
>   arm64: dts: renesas: ulcb: Sort nodes (2019-07-30 11:25:35 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM64 DT updates for v5.4
>
>   - CAN support for the HiHope RZ/G2E board,

As pointed out by Chris Paterson in PM, this is for RZ/G2[MN].
I've recreated the (signed) tag accordingly.

>   - BT and WLAN support for the HiHope RZ/G2[MN] boards,
>   - Sound support for RZ/G2M,
>   - Sort nodes in various SoC and board DTSes,
>   - Small fixes and improvements.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
