Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2636811E1BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 11:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfLMKMK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 05:12:10 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44894 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfLMKMK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 05:12:10 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so1512427lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2019 02:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/LtYexBY2dXuMD99CyEqehHu+qZn+VwunxTbXsEsdM=;
        b=EfY9U2dohuaFocXEdGwpV2jB5gwsb/ceEYegtN52xewKHbBp3HUqhPkb4isfJq179J
         VzFHyb0kppgRTt3KQPhtPZDGvlf8OH1HIDaCvewdlkFC8+luy/SC2xXfffh7+VLLRwC+
         mHPVxFAxO2ebwyTtO0MfyaKn3c1g4KQxoifLUyFBWs63q3N9RdJ0o2xOaGnjKxAF1reL
         eOA05cw3KiYUH7N8J2UJwVHS1+MSYTxy5J1LlHX7ORWi40VpkBwz0uEpEMzfv8jrlxg7
         W8+EMbApNOtHTEBm+FMdeI4AC8EZEuiKO5ZdEH/Y8QHWmQHV6/5EM9pvimlKMV12ym3w
         LmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/LtYexBY2dXuMD99CyEqehHu+qZn+VwunxTbXsEsdM=;
        b=gmZzZDSakdEu5lE0k19QGXIBbbgsQGEsECinkAVc/JZSu6Gzm50ixhmAOP2kr89pqB
         6/p7QgPI4x+x2gbuUa/n5cgiIpPYA6f2lUl/U4itkoyOf9HLDnUsN78l5rEgdF9fa4EI
         Agzom2PfCxvYoT4+rWEDVgOkbjM4FGf+23qkK0CZE/5B8FNbSvE++qWut5u4UfBrhC04
         UDwKdn35vJP4gZid3pyF7Bb3KX8Y3/Vhkrs5JCHQr6QnliMRGj1YRuuu2dwHzl1HruNK
         L7n6WoLErmAvXhkeUuNZYjVEf+0x5873RYn6bvY0lnTReZC0092HjYnNJCsXuRrdURnl
         BR9w==
X-Gm-Message-State: APjAAAUQ0um9+/tCR1ziNkuBmHbNyPC6/MxaOBeHJJO6OVsCSB1xT644
        xx6Vg/HMWDSxOj0PLoY7+oERWMH7pasvDRMT+Q1S/A==
X-Google-Smtp-Source: APXvYqylxfzNVPGqr9591RfVZ99OAOsLlKI2sKmjjlNFv7cMeHHTZsq313giYfhVet28Lcs1R6wVKgUeBdcUBTsUkqw=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr8287131lfg.117.1576231928054;
 Fri, 13 Dec 2019 02:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20191205133912.6048-1-geert+renesas@glider.be>
In-Reply-To: <20191205133912.6048-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 11:11:56 +0100
Message-ID: <CACRpkda=VSn1PS3J2iMnFZ=iGthCCtw7NX+S+8-76D30tntPRQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Document r8a77961 support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 5, 2019 at 2:39 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Document support for the GPIO controller in the Renesas R-Car M3-W+
> (R8A77961) SoC.
>
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
>
> No driver update is needed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
