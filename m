Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7D3120152
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 10:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfLPJlj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 04:41:39 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:34202 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfLPJlj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 04:41:39 -0500
Received: by mail-vk1-f196.google.com with SMTP id w67so1440241vkf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2019 01:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o8ue8WstBbTvZ5MD1WJHZz4/JEOmPpoYuv/nyxwH0bM=;
        b=rIcpVznsk/1j0LaDbixZPqNHMyoDhlKcn3OZjSxvp0A2Rm04ONdNGPE3FLzxTh4x8u
         6a2mD/ZYdnZHTkLaIJSe1tKHtyoMhMzi4c6PN2PsW2sPMD5WrfJ4Jrm7LTnMybQ+aC+6
         CFYvNscHt6AmFm3B9nYhdACkWrs5QG2Kv7bUtmb7RYxiDf7xAzW6pB5SubsKOW8OaI+Y
         77wnbkpkQZJV0lx6JOlCwkjWhPUgZnhggBOdSR02abGGL0MVGhhPA84tOu1MZ0My/ki4
         3+QnhWobbz8A/v0OStPJCydpG8qzlzzymfmuIKjouEcXuCALBzDZZrnIVpe4gubibCqE
         Q8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8ue8WstBbTvZ5MD1WJHZz4/JEOmPpoYuv/nyxwH0bM=;
        b=KgljqcBzJjiFAX8WH18mMhIhMeEZZYZyvv+a6a39jLhPCiF5zFcuHUZ9rHamysJOTg
         lOWFF16z2sk+Me2NHysyZqM4aZw5P5BEvOyHPG3rbl44+93Y+J34O9pD2jzMOa0RwzFG
         u2fLdYyG9tDnYEaiseIJYHVQdmk4cZNxhsK1MLKSzCXdCuNoVMrmzwvwN8TRl9Xr6Nxj
         vF/XkJceHn7+uied6CFZ9Fne7qPlFdmQ36Xv/5OE5WRbDGx2LBb48StwXr+yCejjp7Zj
         RUCQAm4fCKQJmpWOPdvaOmAvRtlh2kXdNcd8RaoQyfF3Ar3nDoAaxOEzvoTWPatVpUMN
         Y+Tg==
X-Gm-Message-State: APjAAAW+uq09/S9c2fW9CFiX1LWyhunsKopLt0/TpK8fYnuY7XI4yNn9
        X3l5axR+UAtkIx3f9QJU+OmkuiFohuuEPb/YuGINkw==
X-Google-Smtp-Source: APXvYqw448b6MJHQ+1gYr0FxfBbs6P1M9wsSV57mWhOV4FjMYQ4aFlghp4Zw6XDTPza6CPDzXFY9U4a6hSt7qTc3598=
X-Received: by 2002:a1f:add3:: with SMTP id w202mr1646583vke.30.1576489298274;
 Mon, 16 Dec 2019 01:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20191212135301.17915-1-chris.brandt@renesas.com>
In-Reply-To: <20191212135301.17915-1-chris.brandt@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 10:41:27 +0100
Message-ID: <CACRpkdYOXvWpAs1LkgeQFxZiU=HvnaUod=px+42qpJBrcKGCfw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: rza1: reduce printed messages
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 12, 2019 at 2:53 PM Chris Brandt <chris.brandt@renesas.com> wrote:

> Since this message is printed for each port, it creates a lot of output
> during boot and would serve better only during debugging.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I think Geert usually pick these up as well, else tell me if I should
just apply it.

Yours,
Linus Walleij
