Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54C844A82B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 09:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239782AbhKIIM3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 03:12:29 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:42592 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbhKIIM3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:12:29 -0500
Received: by mail-ua1-f51.google.com with SMTP id t13so21585888uad.9;
        Tue, 09 Nov 2021 00:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VDlawz965Utm7O9XOUz+5TnqIAPK1Wn3ecvbxBCM5IQ=;
        b=O45J1pSNetUeKfCgsij5th/d99JOKbHd+tVW4VF5reN+D3rKf6JGj6E4+WrqRCGpRI
         KqjU/Tjb42RK/PBILDF+OW57Hm/nSCHmpQ48CnOjvoHro4rps6lpgIfDvDVzxhkLStmC
         UEkH+OKjjvPGKpSPoDYkdBqQmAFCtR+1ipoLlbzo+1RZkKZwchZWr7NkFSrpoZtgn1TB
         +U2c5TN6rSAXlJ8J79QRJ0Q3rmOz4ts6dhmuS8uME7tE/36+V+xHvOB7PBVEcQE4DXVz
         mY+9WQMlfaqOX2fMolMcPGRvYGmRhl2F1su3CXYhax8d+UGwzfFxDwbsMuI7WECtRZ0l
         69KA==
X-Gm-Message-State: AOAM530nhVTdyiVT2PyUBvlNpybx0bhUovKCryO130QdWxk0ds4beKVw
        KhA7ikPKeOKjJdxljwMErsCjeGNVJ+JuBZIE
X-Google-Smtp-Source: ABdhPJy2x31gSzQ1qmersN1hpOk8ZGgNSwRfhitJ+gXCi9txjO7T2Bnr03QHTiWWxuG+a3civNBSGQ==
X-Received: by 2002:a05:6102:3f48:: with SMTP id l8mr8844845vsv.3.1636445383130;
        Tue, 09 Nov 2021 00:09:43 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id v1sm3142603uac.18.2021.11.09.00.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:09:42 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id t13so21585802uad.9;
        Tue, 09 Nov 2021 00:09:42 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr9356518vsj.50.1636445382453;
 Tue, 09 Nov 2021 00:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20211027073020.17055-1-julien.massot@iot.bzh> <20211027073020.17055-4-julien.massot@iot.bzh>
 <20211108184252.GA1971795@p14s>
In-Reply-To: <20211108184252.GA1971795@p14s>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:09:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZTXp5O56wkf3Lesd4jDv4tvhpKfagq3uUW5qNTNYdOQ@mail.gmail.com>
Message-ID: <CAMuHMdWZTXp5O56wkf3Lesd4jDv4tvhpKfagq3uUW5qNTNYdOQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] remoteproc: Add Renesas rcar driver
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Julien Massot <julien.massot@iot.bzh>,
        =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 8, 2021 at 7:42 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> On Wed, Oct 27, 2021 at 09:30:20AM +0200, Julien Massot wrote:
> > Renesas Gen3 platform includes a Cortex-r7 processor.
> >
> > Both: the application cores (A5x) and the realtime core (CR7)
> > share access to the RAM and devices with the same address map,
> > so device addresses are equal to the Linux physical addresses.
> >
> > In order to initialize this remote processor we need to:
> > - power on the realtime core
> > - put the firmware in a ram area
> > - set the boot address for this firmware (reset vector)
> > - Deassert the reset
> >
> > This initial driver allows to start and stop the Cortex R7
> > processor.
> >
> > Signed-off-by: Julien Massot <julien.massot@iot.bzh>

> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -261,6 +261,17 @@ config QCOM_WCNSS_PIL
> >         verified and booted with the help of the Peripheral Authentication
> >         System (PAS) in TrustZone.
> >
> > +config RCAR_REMOTEPROC
> > +     tristate "Renesas RCAR remoteproc support"
>
> It is probably a good idea to include the type of SoC being supported, something
> like:
>
>         tristate "Renesas Gen3 RCAR remoteproc support"

R-Car Gen3 please

> That will make it easier to support future RCAR processors that may not share
> the same architecture.

> > --- /dev/null
> > +++ b/drivers/remoteproc/rcar_rproc.c

> > +static int rcar_rproc_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct device_node *np = dev->of_node;
> > +     struct rcar_rproc *priv;
> > +     struct rproc *rproc;
> > +     int ret;
> > +
> > +     rproc = rproc_alloc(dev, np->name, &rcar_rproc_ops,
> > +                         NULL, sizeof(*priv));
> > +     if (!rproc)
> > +             return -ENOMEM;
> > +
> > +     priv = rproc->priv;
> > +     priv->rproc = rproc;
>
> I don't see rcar_rproc::rproc being used anywhere.
>
> > +     priv->dev = dev;
> > +
> > +     priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > +     if (IS_ERR(priv->rst)) {
> > +             ret = PTR_ERR(priv->rst);
> > +             dev_err(dev, "fail to acquire rproc reset\n");
> > +             goto free_rproc;
> > +     }
> > +
> > +     pm_runtime_enable(priv->dev);
> > +     ret = pm_runtime_get_sync(priv->dev);
>
> There is no dev_pm_ops for the platform driver nor clocks to manage for this
> device - is there something that requires pm_runtime operations to be called?

Given

    cr7_rproc: cr7 {
        compatible = "renesas,rcar-cr7";
        memory-region = <&cr7_ram>;
        power-domains = <&sysc R8A7795_PD_CR7>;
        resets = <&cpg 222>;
        status = "okay";
    };

the pm_runtime_get_sync() is intended to power the CR7 power domain,
right?

However, I have my doubt about the (bindings for) that node, as it
does not represent the hardware.  Shouldn't the Cortex R7 have its
own CPU node instead, with an appropriate enable-method?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
