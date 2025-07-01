Return-Path: <linux-renesas-soc+bounces-18967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E7AEF7D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85713AE761
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED102270ECF;
	Tue,  1 Jul 2025 12:07:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271BD26B97F;
	Tue,  1 Jul 2025 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371654; cv=none; b=RTlA12cDA3U5vK8kZzoPn/oWUIBAqMgiX6j2HZi3AUyUJVUBqLehfFvYV8lT27L2gA4eTh6AtIzjqEvqiFc64QISJn5uQCOz6HNVmZyeaJyT5749EtjhVgT/Vt6/PshynVCR90w2Ao+aKNHTAX3HTl1JNW3mP/5dtEGbKq/f5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371654; c=relaxed/simple;
	bh=XGST3wr7iVgLwBhs0x/QleYk1S88h1v1ZOObVkwGAQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+4zyOHUFaSstbjElODJuxa3oE1MM9XGQumtK3qKn2Tkgppy0M7kV89tPn78Oeo0UOttp7p2ZDziw44OSnwLD/VZi3gsOjzrSRauBE4Kp6DuHOHuonMGiwPoJqMgrWDXa4nkhCCKPbd8EurzkolVQqXzfA2bUwm75FwAKqdORWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fada2dd785so40146916d6.2;
        Tue, 01 Jul 2025 05:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371651; x=1751976451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBi1azPO7hUkur2yGpBD5HIE+HCtFCCLXIiOeZ0Dla0=;
        b=HkV+dNeNjhwPl21pHIPam8FW5VEjXoKgfssFTuu9ylNqcGIMCJFZwcTmhyx28dSfiV
         kCXwI3G6RLbbaDqOUKSD/asjKdL6i/5scTiwSVfrY02JQ5nkiaBMUeU3dZ08CWgkI1vN
         pvArmBBgN5M4jQbqkxlK3Hwfr9bIMaQXUtxGKmLNns3U9OwMpso0CQK9oW3KrOBlgkIa
         rLfC0H59luLF2bn/OAjuMWsWSCv44pdM0HBn7mdUGgbn06zh197equp1xXcfEyCyfMZu
         ZVfbrb9K8znsYhN1l7LRc6NvmxaIn4a1VG/LqYGWAN9oVe2SAFoyaxLtXHsxF3jeu9Ig
         wotQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfsav+zQHG6HXmK+mFvbDwwBl/SQ/Fw97dhtbbKaB+cBtfkjjbJKifPVIU3aIqvn3PUUmTyYWVhcRHrCjC@vger.kernel.org, AJvYcCVVOFFkUb9UZO+TqGQ/Lgu1JIoBqvdT2urVb7LZQH5V1Ym7KFZh+/RsbgCdklv2zDZpJ+RhxQvhAaZT@vger.kernel.org, AJvYcCX66VzrHEl6LXHylYxj5z7VRmz416vFQ9594Gt5E98x2t4v6qwoCgCXRXLkWQrDpRpV88QAEkRLevR47wdnxekf2vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRJBqsSyjK5kZD9iMhVH57d7LJK7b7pN/+KdSEfppAvWZNzpM
	pnK4mythSvWh0cWfKNvU6hVcN5v+mbcoCkQPWfgQI6B4SiD2SRJIu4lP0TzT+8AB
X-Gm-Gg: ASbGncuQAGGIXHSJkEmr45zYNn7JeQvzJF7+HCaxFNOOB6Im8ykGWxIMUu8U8WyGJr3
	PEuzKKuejsh5u2Bv0XuULLWSVwNERjHE1zxXEXmbEPtEYTDudpltsQNQYq7OEWwTbrHjNifNKgL
	lxDjr/jO3GP5lPvMkWVtSDhVxu+MmHpVQGez0mWGyScGyUlVbVTkKV+E7CPpVlWt7PgWeb+LgzG
	fvDerbF/kuNnOmMuG3SNBk+cOkyGyzxJmsCLm7KNfJ9rjXttSWuoTxsk0s/IAfzt7NRvhTFip6X
	eDDW6vHyVpu2toaUZX2aBUrvlHcygMHdCGtCme4iIn325gU4WBweIOs1tvkkjCb0HOoPhMuAwPT
	Hu0nk9mXVNN6DnJxXQAc7v8Vn1CAn75F+A+bXxAc=
X-Google-Smtp-Source: AGHT+IGzTZV3hNSgLIQzl3Z4zs/2VIujms4pHTVj4WSxmKaWwm9OmryyQal43qV6atyZCdUBuMzW3w==
X-Received: by 2002:a05:6214:2aa1:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-6fffdcff5c9mr224046646d6.11.1751371651236;
        Tue, 01 Jul 2025 05:07:31 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm83445156d6.103.2025.07.01.05.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:07:30 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d3e7503333so456094185a.3;
        Tue, 01 Jul 2025 05:07:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXK6iZHgqPbZ97iFdr98ynwg8CnBrH+r3ZdJCWO/ol4LEh5qjO2VDz7Wr35/LdyfF+b0tYbuOgxfR3@vger.kernel.org, AJvYcCUdits5J/Iq43J1P2Ky6CKHyO/dFIIRPLj1tDBLKO0XdFgnMQy2uBxI3TitYl2HcYzskgcWU3Hi7anTL0qgBgr+v3E=@vger.kernel.org, AJvYcCXsQZ1Jpp68RuEdSIYMjBBlOcBcbkhgZw5t7UEV0VuRafnfysy2eIMfbs7HhHQugOR8ywrShLh/FjeZ9gKA@vger.kernel.org
X-Received: by 2002:a05:620a:8015:b0:7d0:a0f2:e6b1 with SMTP id
 af79cd13be357-7d443969746mr2276471785a.32.1751371650122; Tue, 01 Jul 2025
 05:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250624174033.475401-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250624174033.475401-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:07:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtdFqqbArLb=uGRSGY2b-gmH8sPoCzw+4LJ-4UHA0t+w@mail.gmail.com>
X-Gm-Features: Ac12FXzhvXr_q6i48RmjcywN2HbyRepIy66tV5-4603YOboIAQwFqOZCkfgM7VM
Message-ID: <CAMuHMdXtdFqqbArLb=uGRSGY2b-gmH8sPoCzw+4LJ-4UHA0t+w@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g056: Add XSPI node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 24 Jun 2025 at 19:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add XSPI node to RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -208,6 +208,29 @@ sys: system-controller@10430000 {
>                         resets = <&cpg 0x30>;
>                 };
>
> +               xspi: spi@11030000 {
> +                       compatible = "renesas,r9a09g056-xspi", "renesas,r9a09g047-xspi";
> +                       reg = <0 0x11030000 0 0x10000>,
> +                             <0 0x20000000 0 0x10000000>;
> +                       reg-names = "regs", "dirmap";
> +                       interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "pulse", "err_pulse";
> +                       clocks = <&cpg CPG_MOD 0x9f>,
> +                                <&cpg CPG_MOD 0xa0>,
> +                                <&cpg CPG_CORE R9A09G056_SPI_CLK_SPI>,
> +                                <&cpg CPG_MOD 0xa1>;
> +                       clock-names = "ahb", "axi", "spi", "spix2";
> +                       assigned-clocks = <&cpg CPG_CORE R9A09G056_SPI_CLK_SPI>;
> +                       assigned-clock-rates = <133333334>;

Do you need these two properties?
If yes, perhaps they should be moved to the board part?

> +                       resets = <&cpg 0xa3>, <&cpg 0xa4>;
> +                       reset-names = "hresetn", "aresetn";
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
>                 ostm0: timer@11800000 {
>                         compatible = "renesas,r9a09g056-ostm", "renesas,ostm";
>                         reg = <0x0 0x11800000 0x0 0x1000>;

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

