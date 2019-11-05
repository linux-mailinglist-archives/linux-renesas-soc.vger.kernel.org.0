Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4811AEFFF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 15:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389169AbfKEOfP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 09:35:15 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41215 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389073AbfKEOfP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 09:35:15 -0500
Received: by mail-lj1-f193.google.com with SMTP id m9so22067358ljh.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Nov 2019 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q811nbt9cGc7i/601xldCJxDUfsAFOiYAhN0NZ/BAFk=;
        b=iMtRZxfHpSzpZ6Pl28FID5dp3uBdwtOEZntA+nzHiUisUsGZZ3cJE0PcsRHxusYDbd
         IyDLBIe11W4ESFXkMMTPgAu2/eVC0nOLAOZ34hVJlQI/m/x5/FnlvJ0t3PA30po+3nC1
         i+W7snE0k9drUT0JOZVms47US92q7CgKxN/l7Fv74sI9HwK/84hXmXbtN11NZQq77zqv
         0fyDTdRsbU+PFXQHSaFoTJxGiDgnmwCiuweQXIzSzdkkKRg0iOBOrSsl5G7kw/2DTcdt
         26BuIUZEJ8206/qnI6ODCwnsPkngWrwcaRZwApomfQPzG15WnJRjIm9HJgsyQf1tjCYo
         63qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q811nbt9cGc7i/601xldCJxDUfsAFOiYAhN0NZ/BAFk=;
        b=rUcRy1mTRmFyfSvrqn7vJUEeGcVGKakR4AsjknxX6vDCN59CZQDB6KS4wmsZPekVFy
         z8+ECKXW8CDoUtkkBwMRvh3Xs0MPQhVkZzwrobD4UN5DYmi0LfmpjaCVi3DZ4+Xok5nI
         Vtmz+1xlyGxCxBUmxI6pc0Bq05a/biVYLCMZHBjiUUXVQ+w+5lykD3TQXvsLdxOtprgd
         wkFLmzGUTHkSWdhC53Nbla1PYFGP3B1XquEiGLh+XDnupjM7Njo5IOyaGgJXFQa+6JGV
         0e77bEDtPd8LkjWbN4fdjw+FB5poZcYP2VX1OyzGvCs8wumbIhzi65VNVXCBP6CXopOm
         6FJg==
X-Gm-Message-State: APjAAAWwt1rRiqCgAgBQC6ngstkov8JvjdB1rSzJAzUUO4Yo+wlEu5vX
        TMZZvIOGqAXOePR9+juss2bygquCpK4p/5mDPQPrNQ==
X-Google-Smtp-Source: APXvYqzsumvHJi10cPleElRA9Kzn6UHiOHl8PogMztKzC9cyMlz5dpvIxYjxOk1jtoR2mb6FwNdLeoTr/ItD+aBMAhQ=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr9971907ljj.251.1572964512552;
 Tue, 05 Nov 2019 06:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20191024122224.11776-1-geert+renesas@glider.be>
 <20191024122224.11776-2-geert+renesas@glider.be> <CACRpkdZ5DB4fBDpkCG7NMrRohHcejj0EfjqN882c5wc+pahW2A@mail.gmail.com>
 <CAMpxmJUnbYGwd0ZudV=aSddviYGaHqr9n9eHZzS7HrOrV3vBdw@mail.gmail.com>
In-Reply-To: <CAMpxmJUnbYGwd0ZudV=aSddviYGaHqr9n9eHZzS7HrOrV3vBdw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 15:35:01 +0100
Message-ID: <CACRpkdb6RzoBu5cGTjOd1Wna6hA9Z-xWvo7AG4=NKZBWgUtF7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: em: Use proper irq_chip name
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 4, 2019 at 4:21 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pon., 4 lis 2019 o 16:10 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > On Thu, Oct 24, 2019 at 2:22 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >
> > > The irq_chip .name field should contain the device's class name, not =
the
> > > instance's name.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Untested due to lack of hardware.
> > > .parent_device not filled in as this driver doesn't use Runtime PM.
> > >
> > > v2:
> > >   - No changes.
> >
> > Patch applied.
> >
>
> Oops I already have those in my tree. I'll back them out before the next =
PR.

I noticed they were in your tree later, so I backed them out of mine,
just keep your commit history.

Linus
