Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9AF3A4BA0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jun 2021 02:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFLALI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 20:11:08 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:37414 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhFLALI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 20:11:08 -0400
Received: by mail-lf1-f44.google.com with SMTP id p7so11021856lfg.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 17:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ppEre27gtFRgGig3TkXUC0tbQLY4TVyqTp6cicpd92Q=;
        b=fRVB2ivrbnamfM+8biPdwCJYeeT+cxjgi5gXm1PjRFIIGXLDfjoEw3SY+Mtw6SdpGZ
         Y+cRE3xpRvo+Re4jeatTiRX2OzZTbGcity0ej7RJKpqXm1p9JGMuArs5fTlRo5MWTgN+
         mWpLiG4/UUHt7/Rpn2pvG7xICQbvw+5KfZT2E9Y/NHWaNh1GfIkFpP+olYUcUf9by7l/
         GU4Sc3dsTPyDM377EnAJwhvh+mIT5sIODCWPa00JweWEZPWI1c9VZOL/ZVW8tRZQctTo
         Y4uyfNk7cnheVKpxPakL5A8aulU49VoPZAV+CQ5QaRzYrB0XeVGBSJMdSi++O8rGKIfv
         29ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ppEre27gtFRgGig3TkXUC0tbQLY4TVyqTp6cicpd92Q=;
        b=TifJqQQ9Y8HwVQln3dw/rZw8EmffGlzMmHznARIDim/Kxspslm9HP7QMkTRbxwYGB6
         qTgLv4GsNygUalNIct0MucYSWdN5BdQ0hJwuvYZQbj5vFpdrHh8gqWlCXLsbAfQ3WDmg
         RCh7cEJSKnpt3Bmcid+RTuJ2/OToJRuDIb+9pn0I+UkmqJIjkJGmsKHhuHfvanWwN0mB
         cuiu8YgifG/C/TToickAe2Zu6OttUQwOVDefaKhl61wDlGpmqWQdky7TXB8RfI1q6sUq
         bBA3WOYWA7PQj1YpcEkOJmqG20ovZWq6VyPOSzN/We9uKHEz1Kgi/ohoPjuS9/xDUKYY
         6tzQ==
X-Gm-Message-State: AOAM530JpeUGfWDgRUMbXXJvT0MeLYr9oo8xbAuBuAmbA2jEgF59Cia4
        iLmNWXWovgerov0ckQsUwj8LBNGH+fPmM5rOBsIzRqZmkG4=
X-Google-Smtp-Source: ABdhPJyMz2BLs51NlUhpX8WpKPmABESRW7dHKxpz+iUqfe7x85+NK5FqS0Ag1y+xvGCmykEMpcbnve1/i1KxakOMrw4=
X-Received: by 2002:a05:6512:20c9:: with SMTP id u9mr4118847lfr.291.1623456475596;
 Fri, 11 Jun 2021 17:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623404609.git.geert+renesas@glider.be>
In-Reply-To: <cover.1623404609.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Jun 2021 02:07:44 +0200
Message-ID: <CACRpkdbwomRRHc=GAh1p_=1V1Xm+yQjvim5577-+wB7ykoMx_g@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.14 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 11, 2021 at 11:47 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 904ec4bebc1df908a943bf3178f6c633672ce47b:
>
>   pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences (2021-05-11 10:04:42 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.14-tag2
>
> for you to fetch changes up to c3975a73ca9410519cf62531f640b68d69b0d798:
>
>   pinctrl: renesas: r8a77980: Add bias pinconf support (2021-05-31 10:50:29 +0200)

Pulled in, thanks!
Yours,
Linus Walleij
