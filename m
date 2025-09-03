Return-Path: <linux-renesas-soc+bounces-21285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3DB42352
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 16:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1BD7BE172
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 14:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67705311C33;
	Wed,  3 Sep 2025 14:06:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15EB3112D3;
	Wed,  3 Sep 2025 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908398; cv=none; b=IL0e5AKGNAWuV/qGQSPPKWb5MJlBfdsX6gpXblff2hi3zxJN+q9EScMT8GXLApXoQGJ6U46ZhrWD+Ax7dDO95L/ACJZSG9d/K/gFfEMt/2lGETNOSdCJ8wS+ok1HJatMqngnf4959SWHsNKvxG4P8Z7oTAV0S5BJp2WJIrXGSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908398; c=relaxed/simple;
	bh=R+oegdrig9NI1wlUpA4J1TzKNG85+kKuCAw4NvNUkD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl+3ucWPTDfZRc6Xwg11wTMkTu0K9mcq3je03vLJeILBDob58thy0c8J8mwFGVC5SnDfGaRM3Zl66k6w4HlK2e7b35Bhq/Z+o01oA32aQptBdLpHxnoH5YUktOpuLGbi+02ca+ZCEnx5QapxA/0LlGYfs87Aahg2uIbmlvUZM7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-544af5b745cso2275815e0c.0;
        Wed, 03 Sep 2025 07:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908396; x=1757513196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEa/xlIqNaJxbnsyQnbxr3RYm+/G4v1dUI/tOUK8/dU=;
        b=ohUCpUXk7UYnFA7RLlyL8oMjhUPZDl4tr/doow60/KFN0QT9OySmXFsX6++hvMouG7
         t9lunBdtQ+NL1RHqihCzgjOtbHHhnwdbwjB+T8yqoIXLY+6G4GJVV921sdUuRFlzEkN3
         EZmm87IJqjrnqEZQnETRS5U40YuDMcoqmrT1jMcaR2y6Gor8GW2rrrAKU0eBwAwsT7mT
         yie/U4/l9VA5fW1Peix86lHprXESucAg6ivs4+/i5mGTveucstNq5gKzMusjIrSzGjCb
         c2WZ25WR7dpX/sf0EkiF6hRdYUtcVkOYaWbolMPsItA6YgKtjEb6ej3UvfdRsQ64j91l
         rbKA==
X-Forwarded-Encrypted: i=1; AJvYcCVK0KIe3bmoJmRReszTFsmF7TT2qW0JwLM/NyGplBBwmN8g4SwSApCqgQd7aun2JrFakdkeJn3jgvWV@vger.kernel.org, AJvYcCXFhB3c0gkn8dtJfUiFwPE5m8ouR/EKOcUqAIfB2G63bfprNNuaCNXW2UBjyc4CECFZf0WxT+e1v8XrOPKryFXPjOs=@vger.kernel.org, AJvYcCXbIIaAcjr6++SSbTOSRyAE4I34x9uivDF75R24TCGi/mCNBz9Jlbxk8BDFC7Ntk0Txl2WGS9e/jR0+Vjzw@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYVuZltfQdnLonCklF+1Wi+9eZlk0j2QZ4tK8n7CoBUkwafCO
	mqrQYPJndmE+ts9XMA2sHIkn2KU8gNboPgN0lXkIWRIJIZRNDpxjiwPXZUq4Rhsr
X-Gm-Gg: ASbGncs6JbCurKDfHws98sKtX6iz8pNFm3GKaRtnLu/S8shKCKahGeQVyI6LeGw/Ffv
	JcHFgrQypVc19WT6+hnC6Bch3uQVBdan2kXRVXiN6iAuRBgHdYcQcgPD+J8wuI03+492M8WsxgC
	jX/6xmXYxxH7On0OYqkUBatMQ6vuWALeCvFenQF0SYihYYrIrfWwhvcav3xiJ9kk9/+VyUUNvRt
	Nzbs5+C6aiTGmkMVfFplcSDcOCpfY9AonNqd8aJ9ul9oNsALpKHbigmqXSCRUdq8NXbeU+Q2RTk
	AcOCc/LVnFOIqm8PrFf96gauki/xDdQ1xmoVLsop3QHRKwkI+5mOstZDao6YqhkIPCKaBPBBTts
	G814xCSHRD10lcsx1XLwmL5dMydtbbEFLj4pSOvoeAelxecjHK1Kv0g9RQZhxyvbJrPDq+Go=
X-Google-Smtp-Source: AGHT+IFha99fbYv7iB0T/Vc5C70rUq37greHZHQ2uNsJymJfDJCqJZE/23ur0YiM0Qz+G49Bw1twmg==
X-Received: by 2002:a05:6122:1789:b0:530:5308:42ec with SMTP id 71dfb90a1353d-544a0192267mr5274979e0c.8.1756908393958;
        Wed, 03 Sep 2025 07:06:33 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912c6d3bsm6928366e0c.6.2025.09.03.07.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:06:33 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-529f4770585so3516038137.1;
        Wed, 03 Sep 2025 07:06:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUYz8uBlXUUAc/w5YTCdXVliPcU0AHWUF0YLhl9xCNHCp8Nc355FMU5bXQSsgy5zdlF9XANubFX0LRZ+Lah6KwBus=@vger.kernel.org, AJvYcCWXESGpbqr98AftdwLq8zd3IZef+JT1ZIapGj+M7nNCaTuzAmUGr3+SyFwtUHiPpYZG5RPWclhOJHKn@vger.kernel.org, AJvYcCWozSfAyl8zCXn2qKwvTwCsNpofcfHSPBx4A55OShN8j7sPHqgjfvGJfj+OpIuZOXO14ippfp8hT1u31b7V@vger.kernel.org
X-Received: by 2002:a67:e707:0:b0:52a:5fc6:e50 with SMTP id
 ada2fe7eead31-52b1bd35203mr5661566137.30.1756908392815; Wed, 03 Sep 2025
 07:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250821161946.1096033-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250821161946.1096033-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 16:06:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxDcunZcqg65O3Ap9usJUTPnYh34AUk0pmB-pFqesHGw@mail.gmail.com>
X-Gm-Features: Ac12FXzz9f6CU21COVuAICkFyE89VdTMB85kiDxU_owDPJDzcY9Xq-V_nPalX74
Message-ID: <CAMuHMdVxDcunZcqg65O3Ap9usJUTPnYh34AUk0pmB-pFqesHGw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a09g087: Add USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add EHCI, OHCI, PHY and HSUSB nodes to RZ/N2H (R9A09G087) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi

> +               hsusb: usb@92041000 {
> +                       compatible = "renesas,usbhs-r9a09g087", "renesas,usbhs-r9a09g077";
> +                       reg = <0 0x92041000 0 0x10000>;

"0x1000", as the region starting at 0x92043000 is marked reserved?
I can fix that while applying.

> +                       interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 408>;
> +                       phys = <&usb2_phy 3>;
> +                       phy-names = "usb";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 sdhi0: mmc@92080000  {
>                         compatible = "renesas,sdhi-r9a09g087",
>                                      "renesas,sdhi-r9a09g057";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

