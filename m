Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D107426795D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Sep 2020 12:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgILKIQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Sep 2020 06:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgILKIM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Sep 2020 06:08:12 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A48C061573
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Sep 2020 03:08:12 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so14488301ljg.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Sep 2020 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LhS5fiHNS+mf8gdgKUyRgo45ZOROmtSlUAQLqDxlfa4=;
        b=m84ZT5BPICoUprfBrZfjZJo2ToERzKGaIY2M6zIDJinD/VsTcZGwo12Haard8p1vhC
         MjZ8Hx1mOMoZusfjl0oIINyvWLew3L/D9Vjr6BiIPqengZMXdB/f0RVu1NZMRU2Q3z2V
         kDw7HrGgkIRJkY7ZdDYxtEtXHKR5/QKvHKBVMwnPxWhPJDa8IJD1nxJmu+ACxDeUAVRj
         eWLRVBXOA6MNERWuGkqiqoNBVFHwzaDGQ/HFBHpcyhLZgLwuWw0uLKa/KkF+xDYIC+Fm
         y512jagysE3SZE1JiPHWpTndTacUnZvwMYiNVx5FAlo6DD9u1U+4vzX3/glDN2wD5pMh
         pEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LhS5fiHNS+mf8gdgKUyRgo45ZOROmtSlUAQLqDxlfa4=;
        b=UMOPfkUYW3pCm+xA/2SOznUl6yN2cpbJGow1mPtBo1+JViaOljE53p+OBQXGpe5dq5
         HZEO9hTtZWZktjC93jd+UmnwnMMwXwQxKzkAy7CQjcxt+8Cpy7Nfp4lRMSXuxdYmUV4J
         71PnGGsSbzs8RfvKT/HqqtHWg5/nTwG20eMfajpoFJSPXPYjMkEs689yR7aJUMXWHTRo
         CDBbY1/elehM6nmWMYR+oVSjwJZzQWztm3nwHNIZXwccc5USkIrU8/9NIB+TLA9Fjb9W
         aII/uIwHx5gCmkBpc6Z16HzdqX+BH5aTEj8PyNb34VK8Vk+T113z2TVSdPmf6z7CVjNi
         /SJw==
X-Gm-Message-State: AOAM5310HKWSBN42LvC7ryckhJpbTFWYiQsJg08YPS27NaPlGAf+mBaJ
        FykUsDnpzVMaw438ZQPlppRmM7aOitJpl/XYrEm6drk3VBQ=
X-Google-Smtp-Source: ABdhPJztH8Y3Zl30n6XdqCSNpq33ojnWBwr/h05qXrY6CWiTumbfWA4LLSAc0k49IpbpJ+j5i9pFRwI9T1f7AE6sj0s=
X-Received: by 2002:a2e:9988:: with SMTP id w8mr2308597lji.286.1599905290685;
 Sat, 12 Sep 2020 03:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com> <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
In-Reply-To: <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 12:07:59 +0200
Message-ID: <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 11:54 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> More over, there is already generic schema for gpio hogs: gpio-hog.yaml

Where is this? I don't have it in my GPIO devel branch for sure, and
it is not in linux-next either so not in Bartosz' tree.

I did suggest that I want a gpio-common.yaml file which includes the
hogs.

> Originally, gpio bindings were defined without restricting gpio hog node names and,
> generic schema follows this.
>
> I think, the generic "gpio-hogs" sub-node may be introduced to place gpio hogs child nodes,
> if gpio hogs node names restriction need to be introduces (*which i'm not sure is reasonable*).
>
> gpio@20 {
>         gpio-hogs {
>                 yyy-hog {
>                          gpio-hog;
>                          gpios
>                 }
>         }
>
> But this require as gpio code as generic gpio schema update (with backward compatibility in mind).

The whole problem I have with the DT bindings is that defining
them is not really a Linux problem and the people maintaining it even want
to move it out of the Linux kernel tree. It is supposedly the responsibility of
all operating systems using device tree including but not limited to BSD
and Zephyr.

But there is noone picking up the responsibility outside of the Linux kernel
tree except for Rob and Rob cannot do everything.

With things like this it breaks apart because noone takes the overall
responsibility. And as subsystem maintainer I am fully overloaded with
the Linux side of things.

This is of course not your or anyone else's fault. But:
GPIO DT binding maintainers/writers wanted!

Yours,
Linus Walleij
