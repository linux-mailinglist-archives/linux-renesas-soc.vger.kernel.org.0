Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A82F78205B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfHEPfj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:35:39 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36276 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEPfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:35:39 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so69350405wme.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Aug 2019 08:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmJRoQM3fGcHABINnJNylqfHq7bGP8+JiPogIEJFKZU=;
        b=EwpQ8SXJ2runCO+smft/x26EqH8EjkvEn3dKW9g6qOUfZmn5NJ3/iTHH3H6lUwgXZx
         J+Vc3lcTgJywZ0E0u6QQ2XRH1nbgKSeO5oKs7zfMnAfZCcXqtI1iLh7dHsSDCBRT418M
         LFcEVpqPLBvNBbs2ci7pdKYCzNCJypIY2n/N3NhKjOCXu+JBa05aCJ5NsVJIkYCbbS3q
         zJSst9uPZeNr8R8h1a4MEjvhVyIR3VueDLba5gKKhLs1uVPF0QPF1rCgaW+E+WVtqLID
         pPM5mDJKVRydpwRObHxwJlr7GbLPo4HDbWYgLz20WPDOpBtD+JQ9/TsfKG1bp8CiO4pA
         yUbA==
X-Gm-Message-State: APjAAAWIWz4rzcvzpKvu6RxtF8dxjz/D1ArclVdBO940Bpfm3V096Wbb
        xSW3hLUtXy+rNe2YzoA9JwEPZ9O227CDAj80Ye8=
X-Google-Smtp-Source: APXvYqy5YNy/D00IHVULrKRphAiPbmrQel/0DCxGC9eupan9UJa7ZKAOgcOvvqCjrIfVJ4I/kzVDMlalogjjbRVzBpI=
X-Received: by 2002:a05:600c:20ca:: with SMTP id y10mr18630225wmm.72.1565019337169;
 Mon, 05 Aug 2019 08:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <1564669476-22680-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1564669476-22680-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:35:25 +0200
Message-ID: <CAMuHMdWc5Rn7XHqzeiGVOiXxDJbdFr1ZN-=fcb=F=gBguY=g5g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: sort nodes
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
