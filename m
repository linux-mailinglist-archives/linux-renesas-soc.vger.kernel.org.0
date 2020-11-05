Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF182A7B0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Nov 2020 10:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgKEJyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Nov 2020 04:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEJyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 04:54:20 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D051C0613D2
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2020 01:54:18 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id 184so1384819lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2020 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nn46Rfb7E01dgOnZghj9LxIH092CO41d7sQ5WYhFVdQ=;
        b=jfkCQR9WMVdZiz0I+ac/hxFxAyN2v5LKXGC6V5xrBLsKvH6+4/Yq8SG/WVt26/P76v
         y/qWzQ6swEXFspWiKAFWGvpIVzXZBmSsV5xM+IYOflpeIhI8GhDQqdLKaPEsh3s+NMXr
         gzFxhpI8fOIYnpZCvYJBD78tKxkFkrC6/hK7xQXvZQn8/7zCAlOGMKZEdTFZw9z+5wAx
         NDf2dDOvIP9iN0P84KBM7er3rPl2kHic0NDjSszzrL6qgxzME4w7fuiW9DmTpfJdeVu7
         0KEZdJ1kZuvfDMtFD49DgJPZcFzk/m85PaTEVKNZLWuTaSVM87wZYc5KhGVDvIEYqNsj
         wJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nn46Rfb7E01dgOnZghj9LxIH092CO41d7sQ5WYhFVdQ=;
        b=b8eGC8WCqbOtvc7Q5hrG7Hg7qGnaNt4KDwDJuMzqY8c8iRAIPNa+owu+ErJXGltB/z
         NT/qK177P7lY3DBe9cSL/I3OD6ttGHYkjzC3lHEQVmWSiUFrh7TSCsdUtjaSW9NH+uJ9
         caOfPyN5zjSuXnFavAe9RQ2qfwXALho21jfu6jFgZdPoFMHhArO3/GCx5EanRMfY8LQL
         enx2EE2cVve26D4F/pBnd7lRdalIoJnAo9e5LnibeVHzLbrluqwARYcp4ea9M1kuvj2N
         YRQmo5gRcNnapvcKyu4e4hztPP1Fl1xgMVFhSKUr3v4FRyXt/7PaMR/jQ2vURW24fDJR
         CztQ==
X-Gm-Message-State: AOAM531G+8L6pEu9zO2IWXhMAWxGI3f5/lOM4Z/G9rXM8PJ2v3oHmHyH
        mWbSyS3uyD4RUq948TH6vTebhBPMtHycRHnH1C2Z/gM+SrEr7Q==
X-Google-Smtp-Source: ABdhPJxH8fkyaJj843nvQE3/sKrUAkmTYiCfA/u1a8EZfY5GBIYnjGtqplVsXyUn1piJHUgSLwE9JOWll1WCZT7M0Bk=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr714172lfc.260.1604570056828;
 Thu, 05 Nov 2020 01:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20201028151637.1734130-1-geert+renesas@glider.be>
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:54:06 +0100
Message-ID: <CACRpkdYC3PXex0CBGfLC7Hdj6a9J=Vb-P9Cay-p4G8B5_VSUwg@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: renesas: Cleanups and improvements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 28, 2020 at 4:16 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series contains several cleanups and improvements for the
> Renesas pin control drivers.
>
> I plan to queue these in renesas-pinctrl for v5.11.

Looks good to me, just some generic talk around the optimization.
I saw Biju also sent some interesting optimization patches.

Yours,
Linus Walleij
