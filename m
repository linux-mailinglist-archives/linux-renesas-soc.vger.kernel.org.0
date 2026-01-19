Return-Path: <linux-renesas-soc+bounces-27056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F08D3B2EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 18:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57E4E31442D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E78835CBDA;
	Mon, 19 Jan 2026 16:40:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE69933D51D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840838; cv=none; b=P4gO2PxKCOwfkqSJNl5mTCW2yGZ3ZbfbKAwXtUErxR/uAtn3yi8eQHpprA9K3M7546vfeHPzHLuHJgFFcNYiA2KnvdpOsmg9nHPN5DStU8r2s49Q6qXUWR3nh5OxdZ2QklTwidfEmtnjFJuBG8nKC5z/VBd5tOmrANmy8MkmLnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840838; c=relaxed/simple;
	bh=hezZxiDsR/BDlnnj4LcPyEjaKpRFKEiIOROLZukg4h8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFwFkDd6KGI37/YuEyxBRN5TIRIkNjBdm3MjO772ZutGwMFRm5WBK0YGSHhOgpehtRx2hvXAE6dgHPFVz6gb9NMNd2cXQJCCHFuhBSWrxhOgvBJuhH+bgDPFCi8Z9iQLbISDKvnp02wRUlrftLMGrpvo8BXxlJlLoUo9RY/GNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5635f3eff8aso1071290e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840836; x=1769445636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2MpEOmpeO4/5fw0E94NX631Or+ttCr7v6BCMV3w81w=;
        b=hhUcylaBtHHVnjKa2hnDSFj3/Wx9Te8wLeYkvkMxj5rmYNdmBXrJDjFZ6UqXv3q1e2
         QB5OMKIB/K/KPO0WHN5RQ+fMQ8DLyhDJagO5BHYSRv9oSl7V4lRiVBYiQg1wymyxA4Ph
         5dPtJIyckSooBORza0ZruS7V8LLz0oePBk/ap4piVmaB6mjcMK1aijMEJ58+WknlN4fu
         tdsIFe018HHyCUIrcWx8AskFtjZlqBwM8tu6x/gopPNHal8SkcONauyK2OzxSEnF1PZC
         tqOpIhlHIvJ3PyH3+yNiQBIXUzrky2/XhbEtb8CSzIUUydNNIFczDnwS0OOckzQhqMn+
         IuzQ==
X-Gm-Message-State: AOJu0Yxmw/iLHLvKeQVpCspSqbeYbLOua8F/3uB4PUaScAk54m2RgTIs
	8hQETyNXSO4uXYr5kNbC939E/xtShKzPxyCtJdmtKSzAAr/KQumWPl1sWPoBJ+/R
X-Gm-Gg: AY/fxX6gSFFgGQkFKn7+kPPZqKQFjx37XzvhNGyjgsYcpbIuN1y9XjGrBKDxz0pY6fp
	mYgrHnBMYjuqbQAQjgQ8qX4QlOMGHRS8UEk9Fy/H0e+gEwLaioqEpPey63kVrmQtBzssJXzy+yO
	JiOCcjPQUQxOj8UrTUC1rLL6BQEJfpOemuTE8oMCj47J34y5y5HSy46966N/VB2igl+MOyix2WX
	haejx0WT8Z1rpnFa4+2eQtwHlIH3pcOTDMZv7HPsfac6jIWalsp8jCo1TlnipUc8RFwmgSPEj+8
	z5OkVxXr2WWOjU9vA7Il9O1eY9azknUF9TPKaMw86ZI3alh+cLVs+LAaZGxCfoWd2Mwj1K//hZS
	fmX2pqiBNlUp1UCfYtrtMpCEtmiE4yf7n3s2v2dJQLg+eLKU1dI0IFlyXMOeSgwafWpnQvV3tTK
	ymfb7kzmf6nRDeC97eLkhRIfgKBzEyUOdFl/3uzb06+vqvpzj7Khio
X-Received: by 2002:a05:6122:2210:b0:563:6dad:a0a5 with SMTP id 71dfb90a1353d-563b5c3a603mr3404868e0c.12.1768840835723;
        Mon, 19 Jan 2026 08:40:35 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e6042sm2780793e0c.10.2026.01.19.08.40.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:40:34 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-563686cba0aso1144848e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:40:34 -0800 (PST)
X-Received: by 2002:a05:6122:168a:b0:54c:3fe6:627b with SMTP id
 71dfb90a1353d-563b5b56009mr3875991e0c.3.1768840833719; Mon, 19 Jan 2026
 08:40:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116114852.52948-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260116114852.52948-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 17:40:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW24pRL4Ujqvbwjv7edMpHRzOGpjEJ8k0m62tN3zcsa4Q@mail.gmail.com>
X-Gm-Features: AZwV_QhAuEIutjR_12DUTSQHjINgIxncNQEL6V2RP_w-8AA2IPTzsGxx6mo8cPg
Message-ID: <CAMuHMdW24pRL4Ujqvbwjv7edMpHRzOGpjEJ8k0m62tN3zcsa4Q@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: add QSPI
 node including NOR flash
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 16 Jan 2026 at 12:49, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Enable the QSPI controller to access the connected SPI NOR flash. The
> NOR datasheet may suggest faster tuning parameters but those did not
> work on my board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -300,6 +300,84 @@ pins_mdio1: pins_mdio1 {
>                 pinmux = <RZN1_PINMUX(152, RZN1_FUNC_MDIO1_SWITCH)>,
>                          <RZN1_PINMUX(153, RZN1_FUNC_MDIO1_SWITCH)>;
>         };
> +
> +       pins_qspi0: pins_qspi0 {
> +               pinmux = <RZN1_PINMUX(74, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(75, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(76, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(77, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(78, RZN1_FUNC_QSPI)>,
> +                        <RZN1_PINMUX(79, RZN1_FUNC_QSPI)>;
> +               bias-disable;
> +       };
> +};
> +
> +&qspi0 {
> +       pinctrl-0 = <&pins_qspi0>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +       bootph-all;
> +
> +       flash@0 {
> +               reg = <0>;
> +               compatible = "jedec,spi-nor";
> +               spi-max-frequency = <62500000>;
> +               spi-rx-bus-width = <4>;
> +               spi-tx-bus-width = <4>;
> +               cdns,read-delay = <1>;
> +               cdns,tshsl-ns = <200>;
> +               cdns,tsd2d-ns = <255>;
> +               cdns,tchsh-ns = <20>;
> +               cdns,tslch-ns = <20>;
> +               bootph-all;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       partition@0 {
> +                               /* 64KB */

KiB (everywhere)

> +                               label = "qspi0:spl";

Is there any point in the "qspi0:"-prefixes?
AFAIU, RZ/N1D supports only a single QSPI instance.

> +                               reg = <0x0000000 0x00010000>;
> +                       };
> +                       partition@1 {

partition@10000 (reg address, everywhere)

> +                               /* 64KB */
> +                               label = "qspi0:pkgt";
> +                               reg = <0x0010000 0x00010000>;
> +                       };
> +                       partition@2 {
> +                               /* 512KB */
> +                               label = "qspi0:u-boot";
> +                               reg = <0x0020000 0x00080000>;
> +                       };
> +                       partition@3 {
> +                               /* 64KB */
> +                               label = "qspi0:env";
> +                               reg = <0x00a0000 0x00010000>;
> +                       };
> +                       partition@4 {
> +                               /* 128KB */
> +                               label = "qspi0:dtb";
> +                               reg = <0x00b0000 0x00020000>;
> +                       };
> +                       partition@5 {
> +                               /* 1MB */

MiB (everywhere)

> +                               label = "qspi0:cm3";
> +                               reg = <0x00d0000 0x00100000>;
> +                       };
> +                       partition@6 {
> +                               /* 6MB */
> +                               label = "qspi0:kernel";
> +                               reg = <0x01d0000 0x00600000>;
> +                       };
> +                       partition@7 {
> +                               /* Remaining */
> +                               label = "qspi0:data";
> +                               reg = <0x07d0000 0>;

reg size should be 0x1830000.

> +                       };
> +               };
> +       };
>  };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

