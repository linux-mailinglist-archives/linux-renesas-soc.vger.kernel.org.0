Return-Path: <linux-renesas-soc+bounces-24912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B807C78AEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A379343EAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEC62F49ED;
	Fri, 21 Nov 2025 11:08:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE81527B358
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723305; cv=none; b=fqglZfajdIF7Jblei/v5WvUHaJDFinb8Vdhq/Q+efgANsD3cyLds+aOEDPEObje7ATmuhcC7RsKMGdG5iHQWn7fJOpktNE/lA3xL40B8WJyDUfB+WYAxvS8V6hgMAfQYiSH7r4+HmNic6tcSV+qub2Jc6mpTBPnO1ffjMdIivLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723305; c=relaxed/simple;
	bh=lhjh2LMQtplN5PbrfBoNy8Am6IisO8ndBVlW+XHl/Kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyGUopDAqc5t1YtXqygxI6w76z8/UIgQXFiCiEaSVzrTb5WAc+uoA9S88K9/uh/p29iwDanYtcLshW22mC0e8iII02mmnjIZ08uwFkYQetSiRp1kR+yur3rWhGaRGHPXz2jDNKm543wJciSUKSYTYnrYjUn6/UMCu9Strc6aaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b09d690dcso628090e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763723302; x=1764328102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6C10540oJIBgBZAD7smcrJ/23zk12hUyvYhHZYCZ5Ys=;
        b=DKwKyXhvBmEpc97nLhfkMfoFUvqeOksXvnwKS/9qI0AoeuXqoCaPEqWlh5JePznm7V
         xs73E9WBeC2e24a4WSQqBeefzME7t7i4eopNaK6Ibbkwqg3NIUzfjUc3rG8b3f69vx3z
         4+F87/+zV9ykGmLOJiZMdW9dt3+rPErXLlSwGogfG1PjF2QXB7hqlZUu+l/JnB7Vme6d
         osUadqIlaIWO7yXO5T310SFANdfmIXJTfPVC7WZAJdiP/MaJgkbqeT6RuredkKphSksR
         GJmytMfkXkFsQ8zY7MgcPYLjvaGEHpBv8w+U+Dn3XDA6qhJCMFfVqEqPlAMt4NB2UBs0
         k6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW+bYTd+R0BQcRxGdFDK3sAKi91SYOk/oWj06/E6eBUKJv36w2YJSKha0iSdDP5uILMHFd/+J40shMgLmo98Ic9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuWP8tIiJ4tjgRy2Uu04/YpRWfZOd+Z06j0QlXXfzmlBYne1WY
	cLu7i1he6+0GvyRn7Xpb56zY6T9xxraZqHNUaLo6CRpblDPAd0w/Wm+zy492pj0D
X-Gm-Gg: ASbGnctqoegyC4qzEFbGXAPG675GNSqg4lUNKZc1t0k5huq5AeV1+ipVAuLVBqPHf0v
	K2kd+qIaO2rJ854EogTsliME7+XGwsHCrE5vTJu6J+uCcESIKkzMVWNdYFQI4AVyI2NQN4nl7e7
	2eLGPoSGMYnxB+gu9FtLRCuE9Z08yWh8TrLhzrcd1l9SjGJ1a4qJRQQciUljZAWv9OfFInhBt4b
	AFvW4cTUY2UeT7qV8/68JTA063Zzb2J5cAsNKB5J0Z61Q2MOo0RnxZ8vE51N8faXOprsVC7HOcc
	4kaDL8Und9uMfaOXwcM7FdryWBNoNCFZG8FoTi5kRMlcnDMyTwQlY68ADFmgYGMhPzAcCMP6vT6
	yoAFlChUYmU43GfIOYVK/XoHfv7nXaZsarToWy8kJuhkb0AjYe42KZ8fk4mMkMagHu/Ejxa4M5B
	+LtgS2lzVEXcAuEuD4FDiru+4ug7ojvQ0XxiMHM+OmNijz/drz
X-Google-Smtp-Source: AGHT+IGuz0qzSK0IqmUsEK11jsq7pYoe/WVr6OQzOVEEHAS/rBKcta4AS9E2oVCDgq98BLmVHxDopQ==
X-Received: by 2002:a05:6122:4696:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-55b8d6b1fc2mr528407e0c.4.1763723302340;
        Fri, 21 Nov 2025 03:08:22 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b806c3b4asm2101024e0c.0.2025.11.21.03.08.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:08:21 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9372149216bso1175821241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:08:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2AwVaDMw940lqDbQMhL5P7FDww2r1E9weAfXkkZgJgK+vvkW3rrc6IWw69LWvqBMMeg2HmALhqpROZ0cltILFCQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3f4d:b0:5db:25b5:9b4f with SMTP id
 ada2fe7eead31-5e1de396e6amr495946137.26.1763723301428; Fri, 21 Nov 2025
 03:08:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com> <20251010-kakip_dts-v1-1-64f798ad43c9@ideasonboard.com>
In-Reply-To: <20251010-kakip_dts-v1-1-64f798ad43c9@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 12:08:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnwDIiJeuhqmzUxwprZB8_pFywEdtxsj34DqffzmCdoEYSocQxOmPBXGTU
Message-ID: <CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 10 Oct 2025 at 12:51, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1298,6 +1298,58 @@ queue3 {
>                                 };
>                         };
>                 };
> +
> +               ivc: isp-input@16040000 {
> +                       compatible = "renesas,r9a09g057-ivc";
> +                       reg = <0 0x16040000 0 0x230>;

Size should be 0x10000, according to Table 1.8-1 ("Detailed Address Space").

> +

Please no empty lines between properties (everywhere)

> +                       clocks = <&cpg CPG_MOD 0xe3>,
> +                                <&cpg CPG_MOD 0xe4>,
> +                                <&cpg CPG_MOD 0xe5>;

Fits on two lines.

> +                       clock-names = "reg", "axi", "isp";
> +
> +                       power-domains = <&cpg>;
> +
> +                       resets = <&cpg 0xd4>,
> +                                <&cpg 0xd1>,
> +                                <&cpg 0xd3>;

Fits on a single line.

> +                       reset-names = "reg", "axi", "isp";
> +
> +                       interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +
> +                       status = "disabled";
> +
> +                       port {
> +                               ivc_out: endpoint {
> +                                       remote-endpoint = <&isp_in>;
> +                               };
> +                       };
> +               };
> +
> +               isp: isp@16080000 {
> +                       compatible = "arm,mali-c55";
> +                       reg = <0 0x16080000 0 0x200000>;

Size should be 0x80000, according to Table 1.8-1 ("Detailed Address Space").
Or is GPV_VIDEO0 part of the ISP?

> +
> +                       clocks = <&cpg CPG_MOD 0xe2>,
> +                                <&cpg CPG_MOD 0xe4>,
> +                                <&cpg CPG_MOD 0xe5>;

Fits on two lines.

> +                       clock-names = "vclk", "aclk", "hclk";
> +
> +                       resets = <&cpg 0xd2>,
> +                                <&cpg 0xd1>,
> +                                <&cpg 0xd3>;

Fits on a single line.

> +                       reset-names = "vresetn", "aresetn", "hresetn";
> +
> +                       interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;

According to Table 4.6-23 ("List of Input Events"), the ISP has 6 interrupts.
One of them is used by the ivc above.  Do you know what is the purpose
of the four other interrupts, and if they should be listed here or elsewhere?

> +
> +                       status = "disabled";
> +
> +                       port {
> +                               isp_in: endpoint {
> +                                       remote-endpoint = <&ivc_out>;
> +                               };
> +                       };
> +               };
>         };
>
>         stmmac_axi_setup: stmmac-axi-config {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

