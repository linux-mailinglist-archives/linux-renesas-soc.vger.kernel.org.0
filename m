Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E90978208E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfHEPmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:42:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46553 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEPmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:42:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so84889780wru.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wsHQaSPQGYEkepxVE3umVE5xPQOek4p1ILIyAPJFy+c=;
        b=rAPnIEequcXKukU9yhbVixbjc6mqr4b2IOVTtJXORmknbVN6eMTRJwm179WEFF3l7R
         eMc9h4nKEpcEF2KmI087F2j4/DacG/HcjE/e+fqstfSqP2NcdUkeuks2W0GpQxFGyZ1E
         YmY8ChfubDlqx9ZOmhUoeTvZ9B544BetX0IDD0gkCSbwvIcsdIKKEdavC/vChr+bJBPW
         w9AN6hlowq7xe+yQpzhFsfyorD0WGMhD52A1UtMYGUgayVmgrlOWB41iOy6SEq7oPJnt
         kJ1mU65ospg9Vfvn4IwJK7W/I371qLYPt4G8oipd5FFXVuGAeY5Y0o+bA6YUlHvJrvpy
         iIxg==
X-Gm-Message-State: APjAAAWrDfWcO2BicXmH0y/Dpx13SIcuHkFkK9yZcB/lIHefnQaTLpNO
        5vuzOtHx+gq7Vs4mKm6+1WY05icdvYhzZq1NjMA=
X-Google-Smtp-Source: APXvYqzC70oNeaAuyKHa1Ox6i7CK9ZGRt3hm7YCXxSDyI0XEcNiB8PbsXG2sOf/PizD03juBoRt2WvC/xjAxX7Saa3U=
X-Received: by 2002:a5d:630c:: with SMTP id i12mr22683041wru.312.1565019741508;
 Mon, 05 Aug 2019 08:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <1564669432-22593-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669432-22593-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:42:08 +0200
Message-ID: <CAMuHMdW-f52gDwHtHn-ELD18JxD5m7X7tpt3pkFAoYqrLEveZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980-v3hsk: sort nodes
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 1, 2019 at 4:24 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Sort nodes.
>
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
>
> This should not have any run-time effect.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
