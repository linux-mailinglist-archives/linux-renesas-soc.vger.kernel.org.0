Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5A11E09CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2020 11:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgEYJOf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 05:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730932AbgEYJOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 05:14:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3D6C08C5C0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2020 02:14:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 82so10146746lfh.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2020 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSWtEhfY7GuoKSs7S18uevxT7dM1KmwlES4LoPR1dYI=;
        b=iJCNd0WP4T2/2xqHFj/gIuNqq2nAz8/rYUUIUMZXbhSqNUH2wD9d3ImpsmUT5K9JZb
         HsUwtqhLL0TxmmR3R4r6kjSl752W9kBUXh4OvNsiWWoG9z9K9aPMeV+Yhz0+P/nc/qFG
         swvJAy4yoYzTVccX4U0CUZYHt46vJVgrlNyoAugFZV+j6kJEa4iI+Cx1QeUubo/b8lsJ
         +6Y3GUjKomjQlycqaTGKcxaCX0j20+DiFID247pDl4P7ou76Y7Mg9uSvjA5V0Xi4CT7+
         Q/YRNFpbc5ck+tD6ijCl4tcbtVvhXXWsDQj2kJxs8zhn1B8zAxcSKSk06O83JNFmfoIB
         fcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSWtEhfY7GuoKSs7S18uevxT7dM1KmwlES4LoPR1dYI=;
        b=WxMvSc2UA8ZaQViXvAbeAfzpHdqbgtnYulbQv8iYeRDGYK4u6TQH/yp45jO9e7npo7
         GbwLGyfjZL7x/e5j/VKJ6SriPwc6a5gI/SlVz35fQOmya1IDG+3hO++j1rUNiPVVhTuv
         4HNV2NEWRiW/xhRj1s/msy/wdyurU2nxHY2DUfCK4a6W0E8CEIbxTu7J3mxPJapX33OM
         1sur9Ea0w98diGiGu6Scr1LTgqg4smbp9ui5KikC+SmZsGEODKU2iz9IHkl3ghBAGRWa
         QW6+G/oAtm0eveA1BGCg6bvs+nHd3iihQ+kSOCm0UzQB+D+2uZ0eg8pDQ/S8yhUwYwmu
         vF/w==
X-Gm-Message-State: AOAM531q/E3S9tMwdBPIMs2UQzT5ycznVaw74mmruzjlUz/YCKGzA/p4
        k57AiE9Ay1FWuwlM2xJPizj1iA1rnXUGXk33R6FpMA==
X-Google-Smtp-Source: ABdhPJxQ9pMnQX/FaNFVrr0x1mPP3nm72DesDbrY4FPLvRnsQmiNp4caVpBfoS9ZM1qO93+pmo9dQs2du+BlgOqmq1k=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr13045361lfq.4.1590398072107;
 Mon, 25 May 2020 02:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200519081157.29095-1-geert+renesas@glider.be>
In-Reply-To: <20200519081157.29095-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:14:21 +0200
Message-ID: <CACRpkdahxkbxXd29bUJY-25gmMzZ97LUixtJ9y=ZhchkaEETww@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Add renesas,em-gio bindings
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 19, 2020 at 10:11 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Document Device Tree bindings for the Renesas EMMA Mobile General
> Purpose I/O Interface.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Pretty uncontroversial patch and you know what you're doing so
patch applied with Niklas' review tag.

Yours,
Linus Walleij
