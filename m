Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2882D8392
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Dec 2020 01:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437890AbgLLApV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 19:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437887AbgLLApP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 19:45:15 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC13FC061794
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 16:44:34 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id w13so15879478lfd.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 16:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ojiwrY+ZigW4MbMKaM3cKtAMFmnYZW97rMZ5rGCM3S4=;
        b=uIKntd+/bJYBnWVBDeH+N1U01OpBjcuanNPf6R2BA0MGhZuAb/cIpFUP/Wro0xUl5/
         80niKGlnLsnbxhltlRfEMxKdkHdKbvXZy9sLY9d/WplFBJb1/IhIU4bAwUetqMpg2uNq
         ld5Hp1mdFw8xV+/MkMXL+lUnYRP/w6ewSUgY/nFN2WdlEp4Sekl7uoUn5HxuKfNt9JQH
         FBvP4w6cOlKr7datxX8fv6Qi6z1rrMqgpfayxexEdXSIPXJ0uunQu7iUWwqhi5XMRF5+
         FpgQDr4OcRSu7dqQzQ+j1C2/B3Wp5ieprhEJnRfc4SiZ57iZRd0rN05wknfIeO1CK4Wb
         V3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ojiwrY+ZigW4MbMKaM3cKtAMFmnYZW97rMZ5rGCM3S4=;
        b=JVIxDbo9h1Oc4BHTDLA89kCm1sPJV72IiUOefZo86vCoVj+mH9X9u8dyZM0+oUtb5Y
         p/njXTtfA7L5IAvGwu0BE3qxv13qJLW7EmtY7J7ilhAbSdWpSDCMWeeDR+OinIbY/tC/
         JK5hnRwXrzZhJHBlbt83zfHTsxpFht43KCtzailYMfuIh1+xOktDJpgCQ2enVcAVOEEC
         Jnd2wzXD6JJhgDRna+OFb2Z8lf7xlUoChD3jWLiuzEF2btuNoFJjze3YwSKKWl4YdG7O
         z7lKE2H70dE1dsDdL6madjoVW+gjbMaH4G0vsFpM4ovpTRiopg1LwfGvaqgVwPC0zTHQ
         BIhQ==
X-Gm-Message-State: AOAM532aSFUSrH2JfqrGJMPO7LzK6H0zsWph4FUKx/OcSI2juhWv5C5O
        lXJeAr1fz2lyagt1hZSyKOEafgWjmgOdFrTnAWNVzw==
X-Google-Smtp-Source: ABdhPJz/kCgDaOeM+wc7R8xbfzQ2o0mJro/QZuzOBa2e6AnI1Q4zmUmmhZD4CMDcg5BOlWEVEpPBe1xFM9AK7/V2OYw=
X-Received: by 2002:a2e:586:: with SMTP id 128mr6291814ljf.273.1607733873395;
 Fri, 11 Dec 2020 16:44:33 -0800 (PST)
MIME-Version: 1.0
References: <X9JcUZCLh3WjV7Bw@manjaro>
In-Reply-To: <X9JcUZCLh3WjV7Bw@manjaro>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 01:44:22 +0100
Message-ID: <CACRpkdaim0XNnNxNm8d=Sg0ThMbgN0HirQBsKs+i9Z10_=3Dng@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: remove empty lines in pinctrl subsystem
To:     Zhaoyu Liu <zackary.liu.pro@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Patrice CHOTARD <patrice.chotard@st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 6:35 PM Zhaoyu Liu <zackary.liu.pro@gmail.com> wrote:

> Remove all empty lines at the end of functions in pinctrl subsystem,
> make the code neat.
> Target files: grep -nwR -B1 ^} drivers/pinctrl/* | grep '[0-9]-$' | less
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Zhaoyu Liu <zackary.liu.pro@gmail.com>

Nice!
But this doesn't apply to the current "devel" branch in my tree.
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Please rebase and resend!

Yours,
Linus Walleij
