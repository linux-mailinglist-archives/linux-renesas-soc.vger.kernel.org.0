Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5558C134FCE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2020 00:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgAHXMc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jan 2020 18:12:32 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41570 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbgAHXMc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jan 2020 18:12:32 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so5097127ljc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jan 2020 15:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9PdCnLDfRrpTe57HbjA01QxkIMaIeln31WkhfMvjiwc=;
        b=s4oiBbU1nrcXdyE6ajcf/7ipB/YOE89ljAV/j8S3V1GrEIqoBOr47JYnVmEsKRV8GJ
         m4q0+MdmjmzPl9uXRDzb5Amt57zy3bc3WxPF0K5yDX2VpMdCN/AhXoZnSdWYKA7heegf
         wRS55OdtQNKvabxlFMD4rrY3EAmDaAyQ/BZXlmPZ0CYqE3Lb2AxGF4u8Wn6qmi2T8j5O
         cdnewIk+KP+Htuwy0PgAnh2udE8rVTcaKVrkgALjESDjkQ3mY3GfGNqQXizf+0ZMl2Q6
         vXSmyvELflYoWLjnjXyFw556vBiDknK3YpTds+gEithiEvcry2P64oYpOGLedDWey+af
         esbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9PdCnLDfRrpTe57HbjA01QxkIMaIeln31WkhfMvjiwc=;
        b=rpq4pHWZYsgkOM9I7SWRCh2OWfurkm+aNZmhjZ5PjYxnLMxhhqAQ/0lvVNdXGwLwn/
         w/vx/uZ7yEY/nBjZC7l/IUQ5t748Ume8J4UpGYhF/GAV/3LR4y5aJd825wguaOPAFZr2
         70YvURKrpt4A1TR04F5ki38D8iE+7nPOj8upQ61OGtjI7w309KgK3YmpZUPbm5Zwwp5L
         ywQnBjToyZZdo2lkDzV8rYhyp8Q/KqmwiXNYtt8g2lBxwpLix6s3nK/Cj6pwJ4HzAC94
         L023taNzfV2LX0IXJdjchd87kcrj317Uf8aQBQFIXENd8A6U3nvADaJm/3ge7MK5ycr6
         nuUA==
X-Gm-Message-State: APjAAAWyr7AtSqKsAvIGJRnj4GwW5dGsGV2gQF8ib57I4ebv5P8n89L+
        52//MXVHXYAYADZcau1jMPgiAyIpT3zKbesbRBU7BQ==
X-Google-Smtp-Source: APXvYqzqb9iQtaKF+nk9oiPjLBxsjLdTUTmVU669xZcPD3ecVDu582+r9iYp2mPEVpHt4i81yKoxko8lyI3k7+1q8V0=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr4342769ljh.183.1578525150247;
 Wed, 08 Jan 2020 15:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be> <CACRpkdaW7nmpE99FAvBDBTmkTZOTQ5WdM=JbMzBTLk7cbLRXPw@mail.gmail.com>
 <CAMuHMdVbk5S__8OK-zNXmiW66=WVA8Jzyc=hUvf_hJSU=u9TFg@mail.gmail.com>
 <CACRpkda8QD_tDA=YVDRNVnHd8QHs-yHBTzZuJHsnocgMdxv9cA@mail.gmail.com> <CAMuHMdUGGcjoX8TDDS5qGLtJZxizUK=BpasSQK3t1K-dhEgZCg@mail.gmail.com>
In-Reply-To: <CAMuHMdUGGcjoX8TDDS5qGLtJZxizUK=BpasSQK3t1K-dhEgZCg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jan 2020 00:12:18 +0100
Message-ID: <CACRpkdZYFx3q=eS=y50hsQY5v5EMY-0XmyHsUQRczrS6PRN1+w@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 6, 2020 at 9:23 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > The rest I think we cleared out else I will see it when I review again.
>
> The remaining discussion point is "GPIO Repeater in Device Tree", i.e.
> the GPIO inverter usecase, which might be solved better by adding a
> GPIO_INVERTED flag.
>
> Shall I rip that out, incorporate review comments, and report?

Don't know, if it blocks progress I guess the diplomatic solution is to
do that, divide and conquer. But review is a social process so I don't really
know the right strategy.

Yours,
Linus Walleij
