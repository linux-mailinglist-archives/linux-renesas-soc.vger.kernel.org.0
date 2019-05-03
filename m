Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4791128B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 09:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfECH0G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 03:26:06 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37010 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfECH0G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 03:26:06 -0400
Received: by mail-lf1-f68.google.com with SMTP id h126so3714878lfh.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2019 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GWyOvulffdPmoJy4VjcbFGVFmuQLekuQ0m822Q/1tE4=;
        b=Ub+XbMidIqZRHqeZgWpg+Ffe7mLXnvgT0QSWGRsWeBoObFeGRI3WSrFbibCHTUP0/L
         4iv6isUQxHYvJJOwxVpCS8VxqBDgool17jmHpUqq8X1Yx3dfmTksbcuVwhAio6mQu28Y
         ZlsCv1LRr2f4b8MO7HPPSB5Wz9P6yCwVKA9gyM3cMWFQLVGWqN+qs8XvhoDJXutxLYiW
         aNbEscbNJhSU9nXiajuj57KvXfV7ZH1H5wK1dEsgnXpjFvMfBQ/Id5EmwS1KXk0cOgdp
         74nsVZGNMW/dsRFWCV3dTIIBCt4mdh16OsDQVjEWhBcoF+XeZCvVeNvCXkXucDdzxFoo
         0A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GWyOvulffdPmoJy4VjcbFGVFmuQLekuQ0m822Q/1tE4=;
        b=oPRqBbyGhHNGj5fwd8jY9hbxr9paG68xmJdAOuA2URGUNpd5XhpL+Gwc/oFswTJrFY
         IVk7ONXzxMdP/UDd0E8kotKLWacE3a/tUPF8Y7X3ecHkzO464LY8H6GfDe1t2WtniCdq
         pIISVVUr5eOl81J0YSFQaSEyTqiNLVz0GPmSY8v8Hqgm+1hQ8VeMpfX4A/W0mkY26PHy
         17L1hU8Ve7HQ+mFi1kvr/7jchm+d57ADsnnvhRCPzJQFvNJQaMdJwVsJmiCVylO0STOs
         MqASn5vmEdgMp0LKuIgQHXsaOJXfDhmBwmBEG8HwvXtRpSipHR6ZkLaB0ckNle/rMi2E
         fG/A==
X-Gm-Message-State: APjAAAWvnWgMSI77OXgTuNvYDhyWgpevjNc3LVQrT/EvTpZuco0T5mYU
        eHRC3Nfhxa05TpbAceZAzRzGArPwT5AeBVp0NoRLarAukJ4=
X-Google-Smtp-Source: APXvYqxD72lqogVdVFkqHMHcyIBu3Z9QH3+lIYInAnACqEb8WSPId60oRH+a04KV7UilhcL5P52IOc+wl4Ok7bQ7ZyA=
X-Received: by 2002:a19:97c8:: with SMTP id z191mr4120992lfd.167.1556868364355;
 Fri, 03 May 2019 00:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190425095542.726-1-geert+renesas@glider.be>
In-Reply-To: <20190425095542.726-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 May 2019 08:25:52 +0100
Message-ID: <CACRpkdYkv=oMWvmcxFXkcjVEnZkL=n-KadMonX+6x=EQ2iUONA@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: Run-time debug code fixes and enhancements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 10:55 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series contains several fixes and enhancements for the
> debug code to validate pinctrl tables at run-time.
>
> I intend to queue this in sh-pfc-for-v5.3.

I don't mind to take this in for v5.2, but it's your pick.
If you send me a pull request pronto I will pull it in.

Yours,
Linus Walleij
