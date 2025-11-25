Return-Path: <linux-renesas-soc+bounces-25101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23997C85593
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3987F3B2AB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 14:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0CF23D29F;
	Tue, 25 Nov 2025 14:16:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DCC1EB1A4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080177; cv=none; b=B2obzlpLb7vO7lfpRbrxe+gTbZvB2gPLy/pwH1ApMgnMVTCQ3JMEihzWpYJIIwpL8PCs4B0F2isnNvk55yydCOoOi+8T5oWyiZE/B1fj8xoJOaXRekLEr7BfCckac+PzB6jjuz8/og3v9Ke2g5nR3nOCrT0EYvrryDCFwYZqsgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080177; c=relaxed/simple;
	bh=/K37xfxWHmn2q59GTOXMsRaLp0zKMUrwRq7iQbAVXlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2kjFC+xU2lIjWWmnsIkuEkjhGrksiFk0xBkZon31mEphSEhYz59iYTN9NnXWse3CyV89qgUfQJ3qEEyu2+im+KoaUGZQwjh7kaxbEkYckj7doUUJqlmkyogBrhv5opF/WHHDV58i9PRIcn6IDt78D9BOVmjl1/vSkcUxYji1I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2aa1ae006so709106085a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 06:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080175; x=1764684975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpqva75E+/1bzSUnB6Db17eeITC1uo8KnqBCNeKmeC8=;
        b=O/0ZBJ1S/rh7/DhkccgnbeufQJ2/mWBBLLZ/SKS0eMHIredbTkxDxk4S+8sWH4CVMk
         eP4lUSgGCg76L6eIb9Ql2wqcXmkSw3D+WrZv7zvMTKwZ9AWE+m7H0rysfRXVrjzaEd8z
         PyH730vhnmMRujyiCc5Fi0Se7QLvolweyZ6K285YPK4OZo2kdybNCiAtO49GoXHzshWE
         ywT54jiOb9nk9rbG2zkVr3uQdFUSlMPcHSDQcRzVLS9EuJa5XLRRTu8MqhNjtJELkPTy
         yL+W10h+MLMP3GAWnxzd3zDR2g5ueR521AJfcKNA9Lwv7qVJivA+x1dKCKkgE8r67uJF
         1tZg==
X-Forwarded-Encrypted: i=1; AJvYcCX/EMJZQF+Rs0/ALueLfHKuQ/hUMUKIM0rKPCskezmqXsd082pourfoYtRdR2Thhw6U9cy8SOkeQrRdgjq5ey9VPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyurs5n/b0WUq4vzTqT9qG039YqPMHeuRffGX31JNbqer2u7ThB
	qXzD4kqgKuprWsnevRnjPmKxpuz/SwD00ToRXDebrY7Oj5ka1DcHDmw/1l/yDx1+CtM=
X-Gm-Gg: ASbGncuHUtvuoi5jBV2t1vZ/UZrmiFke2iSrbRmDI58bcyRcW71HEjI+GDVBUzlRPzB
	6pSr0u8k2F1tC4Z3FRU+B5orNCqOyVh2dJwluimuDmQ1TsCreBqjoU8dH+iu7rZEX955sV554yY
	9lH/d0kViQYxfjgBaPlUMQaiF8wiie7CPNGK22GfuGcMVT1eLE46ATl051lCwWcGKCScNfEQ6Uo
	jI3yawmu3trxPjrZwLp5rORCoSvlo2HbeWdrLTvnWsM1CdpAGhMk9BIub2hkYPjgp1ppDN3Qjlt
	lo+XvyCfmYv+TK9rvJkFoh+uepA33lhpgjTl+cXc1opYl7YWZ7zlcY2xjo0Fe5ZPVh7/VcC93/g
	LnQb/zddSYfyGba+JaIcMy0LZ5Ii+gOMPx3Vp6dnNGX9/IYeoKKHkl7ZD9w0f2erLigc1rPLKAs
	00shY7MdovOKl4o4WSDX1aRCq+MLIClfu74AgAHg==
X-Google-Smtp-Source: AGHT+IEXeNbRFyqKf12cpphUu0bN08qEiP33RofNv6vR9k1/ZHqcHXZYODAoDjmTKMI+5tqpyJS1Wg==
X-Received: by 2002:a05:620a:400d:b0:8b2:dd0a:8807 with SMTP id af79cd13be357-8b33d4c4aa0mr2297672885a.80.1764080174411;
        Tue, 25 Nov 2025 06:16:14 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3294336besm1176523185a.19.2025.11.25.06.16.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 06:16:13 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8826b83e405so80223486d6.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 06:16:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/WKRaxxN51ZccALjQesDTKYPrTs4FLP67+nUqSvDiN7UyQnB8sLTDxv3vJ62bUxiwdKBrCS4uw9YRX58xtVJ2fg==@vger.kernel.org
X-Received: by 2002:a05:6102:1484:b0:5db:d07c:218e with SMTP id
 ada2fe7eead31-5e1de4a7207mr5657352137.41.1764079835352; Tue, 25 Nov 2025
 06:10:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com> <89b6d61854e94966fc9781d5832b6c187c35b4de.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <89b6d61854e94966fc9781d5832b6c187c35b4de.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Nov 2025 15:10:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBbzTeiQJQWuUnJ_rRD1Zo=1TBOzrv4WbvC7whL1=E9w@mail.gmail.com>
X-Gm-Features: AWmQ_blmZJeMsinamgGW4f3qFK-TiajCRRQHceRXLE0egHCuP5sJvvaiID97Ruk
Message-ID: <CAMuHMdXBbzTeiQJQWuUnJ_rRD1Zo=1TBOzrv4WbvC7whL1=E9w@mail.gmail.com>
Subject: Re: [PATCH v4 11/22] phy: renesas: rcar-gen3-usb2: Use mux-state for
 phyrst management
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Fri, 21 Nov 2025 at 16:14, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for selecting the phyrst mux-state using the Linux mux
> subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
> initialization and integration with systems utilizing the mux-state device
> tree property.
>
> A temporary wrapper for optional muxes is introduced until native support
> is available in the multiplexer subsystem.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -938,11 +939,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
>         return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
>  }
>
> +/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
> +static inline struct mux_state *
> +devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> +{
> +       if (!of_property_present(dev->of_node, "mux-states"))
> +               return NULL;
> +
> +       return devm_mux_state_get(dev, mux_name);
> +}
> +
> +static void rcar_gen3_phy_mux_state_deselect(void *data)
> +{
> +       mux_state_deselect(data);
> +}
> +
>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct rcar_gen3_chan *channel;
>         struct phy_provider *provider;
> +       struct mux_state *mux_state;
>         int ret = 0, i, irq;
>
>         if (!dev->of_node) {
> @@ -1019,6 +1036,23 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>                 phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
>         }
>
> +       mux_state = devm_mux_state_get_optional(dev, NULL);
> +       if (IS_ERR(mux_state)) {
> +               if (PTR_ERR(mux_state) == -EPROBE_DEFER)
> +                       return PTR_ERR(mux_state);
> +               mux_state = NULL;

No need to set mux_state to NULL, as mux_state is not used below.

However, shouldn't you propagate all errors up?
If the mux is not present, mux_state should already be NULL,
i.e. IS_ERR(mux_state) would be false.

> +       } else {
> +               ret = mux_state_select(mux_state);

This causes a crash on R-Car Gen3 and RZ/Five, as mux_state_select()
doesn't handle NULL pointers gracefully yet.

Adding a check like

    -       } else {
    +       } else if (mux_state) {

fixes the issue.

> +               if (ret)
> +                       return dev_err_probe(dev, ret, "Failed to select USB mux\n");
> +
> +               ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
> +                                              mux_state);
> +               if (ret)
> +                       return dev_err_probe(dev, ret,
> +                                            "Failed to register USB mux state deselect\n");
> +       }
> +
>         if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
>                 ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
>                 if (ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

