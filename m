Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C5B3FE495
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 23:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244841AbhIAVNJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 17:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238488AbhIAVNJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 17:13:09 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1345FC061764
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Sep 2021 14:12:12 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id t42so802138pfg.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Sep 2021 14:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NmD6NfZ4ntJSAzZVeHzGwx+9LMKE03Sdt9CwYbMKD7Y=;
        b=rrRU0L93Wl3dd/9llX/ZnoKYuGFSdDWKG1uN8Gv1fFTegETF12B23Ag/5WGRKWIWau
         O8EFhntrOcOx6d3AuhaU2V/BjDQCb3DDLPHbovVi9M84wf1HCPIfdTV3Ba9ZKbS4IcCZ
         6YwnCs8Zp7jc6H4EJrtjsZ2KLjXqnLzng7NRbloC/ZV8ZeG9KOkOWoMxlnk4mkCW/ld7
         KBqQbYocAZvotTNrQotqhaBCSrQ83H2JX/t6VU/1//LmZ3sJZKp0o6j2aD3IYvNDDn9D
         MVfd+v7Ryf93lGSGYO8a9PhqJoN1GODF+EVDV18LG2HXaHV9nfFd6fumgo4HVnFq9yqu
         0N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NmD6NfZ4ntJSAzZVeHzGwx+9LMKE03Sdt9CwYbMKD7Y=;
        b=NmnzSsy/tBgVzXYFiUXfosEDSgTm90GBE6NnjiHzEkKkifueJdS3m7rjbGFn2dWT1Q
         ZtPGI8JVPPdUL77+HVdoJWlCc5XROWmwHk/6iGR3ElNfMBxJm+ljpgk48j0a4GirIvNJ
         yp7rLfiyzl72aKdXdb8yuH1BNwTDOIe0dq00BEj9171gsUUU1FbWmTG4AytwuqGmngxc
         Cxog2iETvZaZ+IeJZt60LulsP6GEkFsJTCEImZ6N0Fs8kx+RiIdIw2eOsl4fyIDhiORe
         zdbk6uow9/hMXNDO+Uby1F44b7WEpU2CnUP4L9n0kuIRkhed/txve+VBU6/4SzLSqt97
         IXGQ==
X-Gm-Message-State: AOAM532h9xWriB7nB/dEt+IVcSw++E2q5RVeqmvNEf/Ge6x8Do5i6jox
        mDa6D0bAHObGBs0dKxkPmBhQ/4isGu5eaLDYol4IfA==
X-Google-Smtp-Source: ABdhPJylbGieillP4v3Sou9GfiOafHmfSdD7JjHyJBYaAf+EOtB7ue7nViFrVdrgxVrSReapdfqxB6ae0ZGRSPj/Qs0=
X-Received: by 2002:a65:44c4:: with SMTP id g4mr981021pgs.254.1630530731360;
 Wed, 01 Sep 2021 14:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org> <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
In-Reply-To: <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
From:   Olof Johansson <olof@lixom.net>
Date:   Wed, 1 Sep 2021 14:12:00 -0700
Message-ID: <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        DTML <devicetree@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Fabio Estevam <festevam@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Otavio Salvador <otavio@ossystems.com.br>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Razvan Stefanescu <razvan.stefanescu@microchip.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> In the patch ("drm/panel-simple-edp: Split eDP panels out of
> panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> give everyone who had the old driver enabled the new driver too. If
> folks want to opt-out of one or the other they always can later.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Isn't this a case where the new option should just have had the old
option as the default value to avoid this kind of churn and possibly
broken platforms?


-Olof
