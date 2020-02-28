Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD21174250
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2020 23:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgB1Wn3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Feb 2020 17:43:29 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42429 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbgB1Wn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 17:43:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id 83so3247026lfh.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2020 14:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1BxbADyqh67zLR4CkPE+bXFbR7jY3OFFxVQi+eBGBI8=;
        b=i6Mz6v7Na8BLINyiuQ/hSPnAQQmxYEOfbBcBVFXW97UtP8mWO1dwLWdjpxC9QcQGCg
         GdGmH5PSCv3zZzOrPrMscGcCVDWEUpcF/bT6gk4hxsNm+jfO9DSU3BDnWl0836NcMsVt
         AeoxZzXYTmEmRyTbde9eiR8/snn6du/PNUk9R33LMErQxsnUUVCGoyzoCaR7OPs1Lycm
         KFvIQTf9dTXt9wDtHbgx+sHgl2V0qBKNBlC7Chtn3n2RL5q+hsn2Nku/sT5hzRzxg/Mk
         GW5LmRNmZk92fK87ghlEjij9rPeSrQnhwdJqJ4cTn9k4ZWcE8oEBFHkcz1F+cG8aVhSU
         oaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1BxbADyqh67zLR4CkPE+bXFbR7jY3OFFxVQi+eBGBI8=;
        b=UM4l0CPOTwZxGzm+dg5TeRoAkFQ1XwLt6ULuI53EROHEalgJ/tiNUN93CDAcgohzwx
         rVNOJy2CvabsJlEnAtwUSUNuhAp9vV+Vl2g9OAbxULIwrHUsuVZwAsv/LlJL9vPNF3dy
         YFG0m1jCO4r9pxZiZQm9cBFjLD7IHCdGdIy8EGuUhRxTJh8SJexWOlPFJ2ggT/NlhhQE
         6nCMAjxsB/ZormY7pB6PPR4BQh9YCoz5YSL3IyMizM29au1XzQACbd1C9U5ov3oCWTCN
         6Q4GNsvpRjNvhuaUWwUenIV8r5xV1EIW5/JcG+kWmYmA/4TmhZQJBb+vrcPx6ieOUkmh
         tjYA==
X-Gm-Message-State: ANhLgQ1izn8AfoQtOR520K1TJ/H+uLZBB1hLkZpH5M/3aZLMYnTygemJ
        jsR2SNm5zBZgETlo6WuDCS5MBVGCAUkT5t9yUNTtcA==
X-Google-Smtp-Source: ADFU+vvwV+eXKAqc/AH6wyolv56OmLms52Q1I+Lg/sFK1m7+034EZ451eAX8G9p01LxfFc6BXUqFS0ufeeNdx6RY9L0=
X-Received: by 2002:ac2:44a5:: with SMTP id c5mr3584341lfm.4.1582929807065;
 Fri, 28 Feb 2020 14:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20200220130149.26283-1-geert+renesas@glider.be>
 <20200220130149.26283-2-geert+renesas@glider.be> <CACRpkdbgsR1n1qj3HmQWcEjeDdN85N1Mw8kLOUAeDjESW36MDg@mail.gmail.com>
 <d2b87102-fdf3-f22f-8477-5b2105d9583b@gmail.com>
In-Reply-To: <d2b87102-fdf3-f22f-8477-5b2105d9583b@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:43:16 +0100
Message-ID: <CACRpkdZwaKA-Gq4wjkPZ_VFiOgNgvLPnYmx4A3AFE-0eNNjQpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: of: Extract of_gpiochip_add_hog()
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
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

On Fri, Feb 21, 2020 at 6:18 PM Frank Rowand <frowand.list@gmail.com> wrote:
> On 2/21/20 10:08 AM, Linus Walleij wrote:

> > Patch applied with Frank's Review tag.
>
> I created a devicetree unittest to show the problem that Geert's patches
> fix.
>
> I would prefer to have my unittest patch series applied somewhere,
> immediately followed by Geert's patch series.  This way, after
> applying my series, a test fail is reported, then after Geert's
> series is applied, the test fail becomes a test pass.
>
> Can you coordinate with Rob to accept both series either via
> your tree or Rob's tree?

I see Rob already applied the test.

I do not personally bother much about which order problems
get solved but I guess if Rob can back out the patch I can apply
it to my tree instead, before these patches. for some time,
before I start pulling stuff on top.

Yours,
Linus Walleij
