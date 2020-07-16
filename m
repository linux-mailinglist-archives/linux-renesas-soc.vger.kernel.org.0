Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EADE222476
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 15:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgGPN5v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 09:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbgGPN5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 09:57:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE2DC061755
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2020 06:57:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j21so3324239lfe.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2020 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3CikeVXsmSH3xLejOtc64KxmHFqUPdsBn8HUNTfiQdM=;
        b=qCTvAswWd3m3SFChWcBhgjSBV9sXk0iKF+7Njy/yLDzYrxghImOwWXRjF9o8Wtrf/b
         jLJt5mYhaXRH1FURrwzxmUh4LdwSR7X3n4vKK2nzsFmpCbRqoCluigSiSfXJMUFR7aFf
         h+tkfv9tzeI6leN8Z8uGxSHi717r7MI+mxTew9gvnfTy0JC5OSG0bKToY5HAurR9vKfm
         wK0wDBQliaJIptP6i7OGYKHh+rcyiiQqD3mXU/Pf3H4XLmi3xULSHCXqms6zk0Mov4Jg
         x4vXazJcuaZz+UAGy5hsejggtpbZyzZeTWNaWqNHwKwId5M0sDi2mhXEwmmzacTJClMt
         1nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3CikeVXsmSH3xLejOtc64KxmHFqUPdsBn8HUNTfiQdM=;
        b=qjxm5ndU7dgrW8WGZzgTs7vOWpr5fYgZwd4+/DAfr1a9PIia6bszSx1uoe70cdqaSQ
         wUwaJl9vCTzhcEEQMOe2owdxdR63lSRzLWwcePFtCVZ6QFpKCTOmMcTZrj8FDnGoOxs3
         B9cqL/kUISyFE43TQibaG7TlJXq7GzTmlthiSmyENtGnnlbq6VCaS+EqDXS/B68KkpGX
         Tvpqw+ot/q3LaNb+iTB74YWNEpXWHqobVzE/rDIl7ZHVon+fzK+5EJNlrypt5X3Jvwqr
         M4LYze86aJYQfrqeMyKdNik4HxBfURitpni1gMyc2rx7nPZhbjhDTrzL34RJvTmEZeYM
         sr8Q==
X-Gm-Message-State: AOAM53062txLLtnJbt7T25dqyH6jUFxu3+31J/lGL3RP8b6oqzo091Of
        CmvETTnC6Bruq8rJVt54lOMcOy+P/R/cyA4+fgVT9Q==
X-Google-Smtp-Source: ABdhPJxVFqXa0LJbvSZZW1t3IXhfBWED/cnhyxm/+4d67HItSPQn+L5o6S2HvAr1UKqianvKT7hJBHSeaZYmBa2iAKE=
X-Received: by 2002:a19:e05d:: with SMTP id g29mr2138883lfj.217.1594907868617;
 Thu, 16 Jul 2020 06:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-21-lee.jones@linaro.org> <CAMuHMdWMUN8sU09J1eSsSJ9sXMhf10GUHeP47UDf6+yp8vnAnw@mail.gmail.com>
In-Reply-To: <CAMuHMdWMUN8sU09J1eSsSJ9sXMhf10GUHeP47UDf6+yp8vnAnw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:57:37 +0200
Message-ID: <CACRpkdYep_r1KsTnU2gVr-DeOf50hRiyTRq=jgeas=fD-qPHVg@mail.gmail.com>
Subject: Re: [PATCH 20/25] pinctrl: pinctrl-rza1: Demote some kerneldoc
 headers and fix others
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 15, 2020 at 9:30 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in sh-pfc-for-v5.9.

OK since Geert is queueing this I'll drop this patch from my tree.

Yours,
Linus Walleij
