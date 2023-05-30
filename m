Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650FF7169D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 18:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbjE3QhW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 12:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbjE3QhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 12:37:21 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E90FC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 09:37:09 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64fec2e0e25so1222732b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685464628; x=1688056628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmljBxLjijPPRFlX5mO8wqHeqzDYN0rcYWjJkP07F34=;
        b=NHoWLT+l8y30+8KojH2SRMRDTxMrZHFJhQn7S2Toq69wa/LlbcKJE6IhF2ZMzx9SDp
         dK9LoPCsEM6VZi2zqniJvlVdyDnFnoUi5FzAsKrgPhp4oVMgr9B2V7uimLUyp8bx9Xzz
         UXGqP/4NcFjcZfA9O19RdWqqr+zm469inPAUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685464628; x=1688056628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmljBxLjijPPRFlX5mO8wqHeqzDYN0rcYWjJkP07F34=;
        b=VC1euoiK4CV8jNkxdaZzb4Z826kgUcrl81/L7j/JjQVfWry7hORkCtwakULUWqxgch
         E3lKPb+rX457m8qCqKtIw4IN7hg4AeYxS7ECu+y67Cf//+m3mO9sYMj/ZLY3vx/E9+UY
         U1zmpTzMxKbG3GlbFAJy7fnw+4K8bMPNeI48NWNtz2SP8N+o6T6EEkAiCv5pf/YsLUX4
         G/KLap54+JVKRFcKd+gLYZsyg6PeMw5SJS+UjNVEAA8x0AguWjUs2R5XlhpXrc9YfC9V
         3q0dmkCohY0qZgWDKAYbH8leXRrzPOTE3a8uR/f9dKCTXAfBWaYknSH+ioavrj3ybRQS
         HkJg==
X-Gm-Message-State: AC+VfDzxnY3MEyCMaZGgkDhnhOlWBPBSEt68dmUzmzA/bG3/ZAu05Z0l
        eL+e8Un2OnYl1QreNYFTyF0ryfi5GkPfNt53Ruc=
X-Google-Smtp-Source: ACHHUZ4NQZbHtyR7w5UWkbXKoixcy9zz3JccPc7pM2dP0a5u8ghN9gNyRCAFYU0UVZ8NVqNJLY1srA==
X-Received: by 2002:a05:6a00:16c7:b0:64f:85a9:3a20 with SMTP id l7-20020a056a0016c700b0064f85a93a20mr3453824pfc.22.1685464628376;
        Tue, 30 May 2023 09:37:08 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id u16-20020aa78390000000b0064f2bbe2d2dsm1871738pfm.24.2023.05.30.09.37.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 09:37:08 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b025aaeddbso339495ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 09:37:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d1e:b0:33b:4a8c:2147 with SMTP id
 i30-20020a056e021d1e00b0033b4a8c2147mr183809ila.8.1685464606562; Tue, 30 May
 2023 09:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230515131353.v2.cover@dianders> <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
 <CAMuHMdWM_t7uQqkesM3fnSK7THrmLszA7U54==A0-98xPH90Bw@mail.gmail.com> <868rd6cfsy.wl-maz@kernel.org>
In-Reply-To: <868rd6cfsy.wl-maz@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 May 2023 09:36:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbD3jPuy=eqnrsTyQpq89PFW12+fy_YufcEirJ9CYt1Q@mail.gmail.com>
Message-ID: <CAD=FV=XbD3jPuy=eqnrsTyQpq89PFW12+fy_YufcEirJ9CYt1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 devices w/ firmware issues
To:     Marc Zyngier <maz@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Eddie Huang <eddie.huang@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, wenst@chromium.org,
        yidilin@chromium.org, Tinghan Shen <tinghan.shen@mediatek.com>,
        jwerner@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        Ben Ho <Ben.Ho@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        linux-kernel@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Tue, May 30, 2023 at 2:46=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Tue, 30 May 2023 09:29:02 +0100,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Douglas,
> >
> > On Mon, May 15, 2023 at 10:16=E2=80=AFPM Douglas Anderson <dianders@chr=
omium.org> wrote:
> > > Some Chromebooks with Mediatek SoCs have a problem where the firmware
> > > doesn't properly save/restore certain GICR registers. Newer
> > > Chromebooks should fix this issue and we may be able to do firmware
> > > updates for old Chromebooks. At the moment, the only known issue with
> > > these Chromebooks is that we can't enable "pseudo NMIs" since the
> > > priority register can be lost. Enabling "pseudo NMIs" on Chromebooks
> > > with the problematic firmware causes crashes and freezes.
> > >
> > > Let's detect devices with this problem and then disable "pseudo NMIs"
> > > on them. We'll detect the problem by looking for the presence of the
> > > "mediatek,broken-save-restore-fw" property in the GIC device tree
> > > node. Any devices with fixed firmware will not have this property.
> > >
> > > Our detection plan works because we never bake a Chromebook's device
> > > tree into firmware. Instead, device trees are always bundled with the
> > > kernel. We'll update the device trees of all affected Chromebooks and
> > > then we'll never enable "pseudo NMI" on a kernel that is bundled with
> > > old device trees. When a firmware update is shipped that fixes this
> > > issue it will know to patch the device tree to remove the property.
> > >
> > > In order to make this work, the quick detection mechanism of the GICv=
3
> > > code is extended to be able to look for properties in addition to
> > > looking at "compatible".
> > >
> > > Reviewed-by: Julius Werner <jwerner@chromium.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - mediatek,gicr-save-quirk =3D> mediatek,broken-save-restore-fw
> >
> > Thanks for your patch, which is now commit 44bd78dd2b8897f5
> > ("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/
> > firmware issues") in v6.4-rc4.
> >
> > This causes enabling an unrelated workaround on R-Car V4H:
> >
> >     GIC: enabling workaround for GICv3: Cavium erratum 38539
> >
> > > --- a/drivers/irqchip/irq-gic-common.c
> > > +++ b/drivers/irqchip/irq-gic-common.c
> > > @@ -16,7 +16,11 @@ void gic_enable_of_quirks(const struct device_node=
 *np,
> > >                           const struct gic_quirk *quirks, void *data)
> > >  {
> > >         for (; quirks->desc; quirks++) {
> > > -               if (!of_device_is_compatible(np, quirks->compatible))
> > > +               if (quirks->compatible &&
> > > +                   !of_device_is_compatible(np, quirks->compatible))
> > > +                       continue;
> > > +               if (quirks->property &&
> > > +                   !of_property_read_bool(np, quirks->property))
> > >                         continue;
> >
> > Presumably the loop should continue if none of quirks-compatible
> > or quirks->property is set?
>
> Indeed, thanks for pointing that out. Can you give the following hack
> a go (compile tested only)?
>
> diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-c=
ommon.c
> index de47b51cdadb..7b591736ab58 100644
> --- a/drivers/irqchip/irq-gic-common.c
> +++ b/drivers/irqchip/irq-gic-common.c
> @@ -16,6 +16,8 @@ void gic_enable_of_quirks(const struct device_node *np,
>                           const struct gic_quirk *quirks, void *data)
>  {
>         for (; quirks->desc; quirks++) {
> +               if (!quirks->compatible && !quirks->property)
> +                       continue;

Sorry for missing this and thanks for the fix. Looks like this is
already committed, but in case it matters:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
