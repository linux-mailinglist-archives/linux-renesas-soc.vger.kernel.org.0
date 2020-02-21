Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3A11682CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 17:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgBUQIk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 11:08:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44506 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728143AbgBUQIk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 11:08:40 -0500
Received: by mail-lj1-f194.google.com with SMTP id q8so2708047ljj.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2020 08:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RkTsQTvfjgOEGdlDXKGCeeZxoa04rIy9ygJ3R4JduGw=;
        b=Yl4rYrff+zKVIc9yoeCBgHu0Hr6Lxdr2Dk+weltYHKGkpqyZwgJl2IO1NgO2i0vT/E
         99a5A1dgaz45Pjo84/pcasIWbjqjIkhY03aq+EbKkljQaPvu53PSnv8MEzWd5lTXHMO6
         ILy1pKyOIN8MEJYzd46PlFensSAb/peD4Pyzc4ZoFZxBo5atPVjDya8qF0JhhOx/I9uH
         H4VTjhsow4h49cwt3AvmwmV5/jMHvdy9OPRNCwK3mPh3pTOogHt5J/wFCgkfN4Z6so40
         qDYMC5mecGJY7L2h7znzdfQ3Jzp5HE4zgleSo1s22yfX5NZQo5mSlGfgtS+JqaLjPGOy
         +whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RkTsQTvfjgOEGdlDXKGCeeZxoa04rIy9ygJ3R4JduGw=;
        b=Vy/r0IBKmFyz8BnU7tr/rO5o6w7RD2tgHVNbgAHA4B6CKl/GjhlvRxLfOr8LbCtQ9N
         ezITCFBb6pXj1mXmQL7hzvFolutk+Innqz13Z8OdCO2+2AkxJxlSw914tlQKhdsjUXGS
         R91NCEE82urAtj6erjV/+HmhTPwDJs37R+aKrBRYDTXk2SohAUqivU1g2dTl9AUCgTAQ
         K/A2eDt0ijS9U8idUnLt1h7xm8EO24/b5gXwucJj7pD2g3vT8az3xVAZZEag8BLSI+ms
         QAIM6wOqWojjyTaerWybS8Ckfj6552eBubBn6hBlaPwBdIp/uYh/e10pphWswKj7vCYz
         i5wg==
X-Gm-Message-State: APjAAAVv45Auxqk2ZgVlSf0gcMqDRsUjMM3n6t7GtUXkM1YhDlY7yJq7
        To02k6cuLeCQCJD5tu1e79FXMuKYMVru57IdyMi5Jw==
X-Google-Smtp-Source: APXvYqzjBTruiUzyd12hI2oewAEFW5wvp0x48B+Xz9xN6AHcyQ7rQQbPBXV6MVxQYYXX7uV28p+joU8wSXIlz+RTL/U=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23390889ljc.39.1582301318561;
 Fri, 21 Feb 2020 08:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20200220130149.26283-1-geert+renesas@glider.be> <20200220130149.26283-2-geert+renesas@glider.be>
In-Reply-To: <20200220130149.26283-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 17:08:27 +0100
Message-ID: <CACRpkdbgsR1n1qj3HmQWcEjeDdN85N1Mw8kLOUAeDjESW36MDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: of: Extract of_gpiochip_add_hog()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 20, 2020 at 2:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Extract the code to add all GPIO hogs of a gpio-hog node into its own
> function, so it can be reused.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.

Patch applied with Frank's Review tag.

Yours,
Linus Walleij
