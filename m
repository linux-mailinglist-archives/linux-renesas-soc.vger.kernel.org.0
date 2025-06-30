Return-Path: <linux-renesas-soc+bounces-18911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB3AED6BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 10:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7354C171195
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 08:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D409221540;
	Mon, 30 Jun 2025 08:10:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E201FDE19;
	Mon, 30 Jun 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271027; cv=none; b=UDFb0Hk73fkZ3eP8OR2Hol7jATtMZ+cmWAlYHuzmaBlxwWB5w6K9UsrJkCA6uQ4BRsviPYY7rETBmGNNWYu7ZoJU4HDadACCE8zGRm6XZW/glgHQF0Y3JgjaqZKt0FbDDvdwyW/1oT5g0MX5LXk1kr3ibKq1Ah+reJBPP4Qi54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271027; c=relaxed/simple;
	bh=ACyEtedJQN9adbT8PK7pTRH/MEBWCFwTLbGwY55xdQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQCZueNDaYLnTpZw/zsTaz1LSBW49fXIE176MkDDEg08AFberM/fvtf59IYu+sL4ly9Tsj4xH3rVDQBBcbgFimVGQzI1+SM1sbhz1hflmq2WkmwBO5v11NjngGz6XJ1YF3VH9019Xfs8eMeQPRhoN3d9TzNNg9DrweNtNjHliJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52b2290e292so628267e0c.3;
        Mon, 30 Jun 2025 01:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271023; x=1751875823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAUbYQgCBvK7JEgyODcc/KlrsJuYVSDEAJvWh0l/+n8=;
        b=ucoNQMXGN14K2JRXMCalxEMwzHcA18TXI9RksMQjbpw6DjZXdsGvNB29vngfUYCr/S
         m52Mp+VBf+NxtELOQzcwwuI9ii7uhB7yfFqM1jA9K0+zJAuqfkTKodv5nfGdI+4wiRHO
         FvkSE83fqQGH+JRN9pMV3pxX3NdRV5j5Rxgcq8wbpUaVQofpV3IBAvV8pKIDTF7Z/e+6
         /ifSjPL2vw1OBqsh7WwioXi2xD4hmEwwEQPNHDgAQ9kWD1w+VPsGOWnP9SYNMDoz4K0Z
         Bx7kVhXhFBx2rJB3sS/hUofJPWDYnr1KUdOXP4o1Mlmecul4PTJOry5WZBokY7medviX
         EsKw==
X-Forwarded-Encrypted: i=1; AJvYcCUD7LgU28Q/rA8ikBHIXVnqW6w16NQu85welMK5uq2X9yJgRxv/cNH20b8otYwU8t9/4rQzSsfXcklfpawH@vger.kernel.org, AJvYcCUpHTCUfNytWFIl2GIxU7CZY0nzr9oi5g5B8jLpy5dr8YY3RURLClNvqoK/FmqSTHNUz0Mq6ysqFUzb@vger.kernel.org, AJvYcCV6byNcQWb4EmR2YBwMaLRRB+y7EljbHHAkitBdVCaQG0B9iwo4MfkHOmbf+m7noD0Ipj8D8ZWcSXPDF6aAXRcne70=@vger.kernel.org, AJvYcCWpwjbblQZ/6s4S6kcdCY0ULTXOPWicaT6IpUaFv7Kr7pVS8lTBhBCYEsCc8muRXrrqObNgZHPpAesYftet@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVqhwQ5pPbML0+lWr0+hKgJPQtlJSM3SlVBiIel2YXXHDR5Iq
	QvHkgAo1qb26CKvs26vOidZrEXKN7sDXVg2NA5Lr0psOWeIhcm/5rrH9hDHf9gpv
X-Gm-Gg: ASbGncuohFM6njLhK8P0ANztniNFBMp02EniXCyxONnbT3NJGSyoM+cI0NeAfofRtuo
	m0Si2LzURJaEK0kD2j0/Dchqcsf2lcvnm/XgODKvd6EFo7LiBVouUKoP3lZYCQjNDxI3BODD/Fm
	MYkRMbfxZunONyTNLBvDStwyGXPouGPUxHjndLAam72tD80c80hHq+XxcZkPgSHT/oHZNsjDnbu
	cPJ5N7vpeJkyoYSa2IhI1QOOyo+Z7E4sgyIXDrJ6oXsDM20s3MEnyWSwWcRHLt1PBiunaiX7IWi
	v2KFlMvRgSuCyHtHdzc8hf5h/uN2Lpx/8enDQ41Tr2QL4Y3pa0QR++uqkcGq85NX7sE0rNkf4eg
	W1GyKktTLI/hUVLTa65yYRP6mCelKVNHYnws=
X-Google-Smtp-Source: AGHT+IFWbxN0PuogijM+xHkhr2170OLU4Y9Gv9xlp1sCPcBAxvV7cGAkRykBDm0KqqlDiARpruJzfQ==
X-Received: by 2002:a05:6122:4b8e:b0:531:394a:23f3 with SMTP id 71dfb90a1353d-5330c0ac26bmr6624478e0c.10.1751271022769;
        Mon, 30 Jun 2025 01:10:22 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533090c4ffasm1259809e0c.21.2025.06.30.01.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:10:22 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f2a0825e1so79123241.2;
        Mon, 30 Jun 2025 01:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4oUstK3Uy6v30+rqE9y9xHqWybYvMbolG78+pXu93Xe/QlUV1kw0KcDTBVXqDltxO4uNNOTIZEWiX@vger.kernel.org, AJvYcCVbQxi2WWOlhF3fR9zPfD68NGHbEaqbkQeDtZhipVandmb6J1DngxV5M1nTXdlG0HP/kBDUByb3XD9o4QTG1VJauiw=@vger.kernel.org, AJvYcCVt3A1YQxCYL575xAT5Kc0bAdktnJOrO+1xkHWhFsIesNvmiG/rW3njX81bgDts7OEatAeHL0oskYsLVzSH@vger.kernel.org, AJvYcCW/teQi+we5AdmqzkskQTF6Qp+bZ5dxbbQHkCsD5E3C8Hww01r4zpmsaCjVK2YpD+yxaX9ni7ohyNgnM6U5@vger.kernel.org
X-Received: by 2002:a05:6102:4191:b0:4e5:9149:7cb3 with SMTP id
 ada2fe7eead31-4ee4f898756mr6918832137.13.1751271020851; Mon, 30 Jun 2025
 01:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250628115715.102338-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250628115715.102338-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jun 2025 10:10:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrkcxr+_jcr-F76cOg+rie3c2FcrEpfrH36kKJFhF9vw@mail.gmail.com>
X-Gm-Features: Ac12FXyCUS8uvBsxLH0f1gwEm2lN8MbGes0fkeB8CSkLC3wJgivMPCQxX9_kM60
Message-ID: <CAMuHMdUrkcxr+_jcr-F76cOg+rie3c2FcrEpfrH36kKJFhF9vw@mail.gmail.com>
Subject: Re: [PATCH v13 1/5] dt-bindings: serial: renesas,rsci: Add optional
 secondary clock input
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Sat, 28 Jun 2025 at 13:57, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Update the RSCI binding to support an optional secondary clock input on
> the RZ/T2H SoC. At boot, the RSCI operates using the default synchronous
> clock (PCLKM core clock), which is enabled by the bootloader. However, to
> support a wider range of baud rates, the hardware also requires an
> asynchronous external clock input. Clock selection is controlled
> internally by the CCR3 register in the RSCI block.
>
> Due to an incomplete understanding of the hardware, the original binding
> defined only a single clock ("fck"), which is insufficient to describe the
> full capabilities of the RSCI on RZ/T2H. This update corrects the binding
> by allowing up to three clocks and defining the `clock-names` as
> "operation", "bus", and optionally "sck" for the asynchronous clock input.
>
> This is an ABI change, as it modifies the expected number and names of
> clocks. However, since there are no in-kernel consumers of this binding
> yet, the change is considered safe and non-disruptive.
>
> Also remove the unneeded `serial0` alias from the DTS example and use
> the R9A09G077_CLK_PCLKM macro for core clock.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v12->v13:
> - Rebased on latest linux-next.
> - Updated commit message to clarify the ABI change.

Thanks for the update!

> - Used `R9A09G077_CLK_PCLKM` macro for core clock

Unfortunately include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
is not yet upstream, so you cannot use its definitions yet outside
renesas-clk.

> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml

> @@ -63,12 +68,8 @@ unevaluatedProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> -
> -    aliases {
> -        serial0 = &sci0;
> -    };
>
>      sci0: serial@80005000 {
>          compatible = "renesas,r9a09g077-rsci";
> @@ -78,7 +79,7 @@ examples:
>                       <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-names = "eri", "rxi", "txi", "tei";
> -        clocks = <&cpg CPG_MOD 108>;
> -        clock-names = "fck";
> +        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
> +        clock-names = "operation", "bus";
>          power-domains = <&cpg>;
>      };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

