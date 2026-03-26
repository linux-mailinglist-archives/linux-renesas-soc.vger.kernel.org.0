Return-Path: <linux-renesas-soc+bounces-30318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MgCiCjD/xGkz5gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:41:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F649332771
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7BC3304E199
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CA4347FEC;
	Thu, 26 Mar 2026 09:39:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE620F067
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517994; cv=none; b=V/Nk27/F2bLUqhT6Bpf3mnRkFs1T3WyjEql4iBRYOVLL2NYkFTkMfAI4hPvTJpj3pdip8aA0HIP/TFgCqj8tWH/xkkPbC7gGHPCI887VCt/zhVBJFPZ3GAT877In9zPpt5TsrGCatnR7uDUGMWBBuBi8lvuRKcOfVQSsUVy7kQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517994; c=relaxed/simple;
	bh=NHnYSCMjp5Qx3uMp5MnlrpoU7A33CYHQ5+y0W37sU9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJGlRjQuFSas+bK5TyCwdMLeSKIeQoiDCDaGzob0cJ2Swfcu7qGUA1cDBtoShECoiKzJIrwtFsb53sb2cl04rdGxf9sXsfRChrFv/4YXKnMoXNl/VSbYKDjsCbNe+VRHEdO9dbECcHY9rG0BFmg1RiTOcrh8RdMCh1vDpS2+v8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56ce07a54e8so570098e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517992; x=1775122792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXnNgBS8N4ydCp7t00RsBmSBBKjjNhTVmD71YiQWvSU=;
        b=ia7hTZYlMEfYykosEJpZrO6+rE/u5XjoC3DhWgUDLojF1dHw1p4A1YxrRL84HhDHxk
         LpqpPTGEE8Nqy8XXGpeYq/vJNag1Ch4SQG479f0JWGfHaZeqkg1fk6ISjgudbMmDVo08
         IX/qH6DfpZr/3aWpOtF4OhN255hC+he204/k9vcK6WfPc10FEo2e/lbkuRBaZW4SERxP
         9aazD5f9mdF5f4ncMLC7UIwjOj3jFnCspb8gUZkVh8oycl45hoU2cvXKQmoaJ6bvHjuA
         LiTLV1pN3YFB9X32Px3K7/Po2+0hrWQSCWbVJWH03HFVC//OgvqE006ThxVs+uqz0grr
         QroQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdNZGgmQ2Tti7oGGZ3AH2NdLQLW1tccztSZVbpNgq9O7Fmkqvyb+X5ZUJa6iTZ+2egsf9Z4jhrBVcHzadN+FoAng==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu/mQ+PyOHkwqQDOEANaVd3ao6FhIEoBQfdvQMxpaZjaO8rw2f
	dId+A3F1l25iMGctx/PJfojlyikpk/HPXyXXT7eczGeij2oVQA53KQ50fWuVUkzNQ/c=
X-Gm-Gg: ATEYQzzoOxmYgY2KZ42mNBdjKOuLWTtgJFX2e6XOHFVjcb5GrvohL4sMfZld9XmPZ1w
	wXCuW0yHp/se7pqIxuquSZ/CWSYKGzb5l23k+WJRvgJtvu1w6IslJpLA1YsdE626cv4ItveNPoZ
	D5BXOzMSDcJDUZZEXnvrg7hZPTc9gkeEiMkbpCTZcf11wPQa0LfDJFHlWZV5RjnhvwwMZ5ICDzc
	zkIehlOVhEYa964OrW3ZE5bdrtyXl0kkTzZGFxyc1RlGziJZm9IzBo9/LGTfz4UN1xSvsVlohrN
	PB1NqzvGSPbMb29Ra9Xawzrn657j9p2gKJe8HRMeREZPCOlHaJdddRpma/WPB2JNvc93yHGUpRc
	iNBc1kvOR2fIQ485/x+M39D0EtmTLOK0sxqEGq5GoQVGRi9X/EBjIbo35MIkpNAUJ0zyDQWoLcz
	b1JqqppWHDfJ7MrSC6rsA4c+W1W5/e+4lyhrAMjavwoq3AEekbMHC/J8N2TOi4JeKu
X-Received: by 2002:a05:6122:1da4:b0:56b:8023:b898 with SMTP id 71dfb90a1353d-56d21f366e3mr4002363e0c.1.1774517992172;
        Thu, 26 Mar 2026 02:39:52 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c2afdcsm3348193e0c.8.2026.03.26.02.39.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:51 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56d357797acso427512e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcmq0OTH3d75bjL6z+/PGovwacdbyrphycxuyxXILQpW1ghhWaPoNhsrCjB70gJ9j9q89/tDgI12wS/HFi36mEpw==@vger.kernel.org
X-Received: by 2002:a05:6122:a22:b0:56c:c76f:1bb0 with SMTP id
 71dfb90a1353d-56d2207b027mr3161587e0c.9.1774517991567; Thu, 26 Mar 2026
 02:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com> <20260203131048.421708-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203131048.421708-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:39:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEW0+qFTG_VikJ3YnA13+ki5uzA0w4HC=13DOwKEJgDQ@mail.gmail.com>
X-Gm-Features: AQROBzAkkx7uK68_pBJG5VkSb1IDNDxV2iKw2QNetnGau0d1sNmy4UGKBV4TPp4
Message-ID: <CAMuHMdUEW0+qFTG_VikJ3YnA13+ki5uzA0w4HC=13DOwKEJgDQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: rzg3l-smarc-som: Enable
 eth1 (GBETH1) interface
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30318-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,0.0.0.7:email]
X-Rspamd-Queue-Id: 8F649332771
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 3 Feb 2026 at 14:10, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Gigabit Ethernet Interface (GBETH1) populated on the RZ/G3L
> SMARC EVK. Also add pincontrol definitions for GBETH{0,1}.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

> @@ -53,3 +69,79 @@ phy0: ethernet-phy@7 {
>                 txd3-skew-psec = <0>;
>         };
>  };
> +
> +&mdio1 {
> +       phy1: ethernet-phy@7 {
> +               compatible = "ethernet-phy-id0022.1640",
> +                            "ethernet-phy-ieee802.3-c22";

Drop the latter?

> +               reg = <7>;
> +               rxc-skew-psec = <1400>;
> +               txc-skew-psec = <1400>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;

txen-skew-psec?

> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};
> +
> +&pinctrl {
> +       eth0_pins: eth0 {
> +               txc {
> +                       pinmux = <RZG3L_PORT_PINMUX(B, 1, 1)>;  /* ETH0_TXC_REF_CLK */
> +                       power-source = <1800>;
> +                       output-enable;
> +                       drive-strength-microamp = <5200>;
> +               };
> +
> +               ctrl {
> +                       pinmux = <RZG3L_PORT_PINMUX(A, 1, 1)>, /* MDC */
> +                                <RZG3L_PORT_PINMUX(A, 0, 1)>, /* MDIO */
> +                                <RZG3L_PORT_PINMUX(C, 2, 1)>, /* PHY_INTR */
> +                                <RZG3L_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
> +                                <RZG3L_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
> +                                <RZG3L_PORT_PINMUX(B, 0, 1)>, /* RXC */
> +                                <RZG3L_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
> +                                <RZG3L_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
> +                                <RZG3L_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
> +                                <RZG3L_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
> +                                power-source = <1800>;
> +               };
> +       };

Please spin adding EHT0 pin control off into a separate patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

