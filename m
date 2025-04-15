Return-Path: <linux-renesas-soc+bounces-16021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6963A8A152
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0E31902226
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCF72957C7;
	Tue, 15 Apr 2025 14:37:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132F31F542A;
	Tue, 15 Apr 2025 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727835; cv=none; b=nK++ybV7X6d+hSSaxtcd83xb4skXqAJ941qnw5VaudGEwEcbtbdo2u3risJCVE3vKXibNgBDI6dxxgcO1avwulnPz8PQChx3o2F3zFzWiaceW/ffajmVyyqFUH4dWaUFd9M34iigybDOGdt54DoEb70+JNnJIBYzJtH+rxeQ5Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727835; c=relaxed/simple;
	bh=v+5nPIaVw4dIfMohDVDgmLZ9z/YWY11lJq5+q+6e/XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVDswWwMDRFYrs9RbSw6J10XjNIjEX96bXgfdWJ+CR4947ZdkOTQgoUs2za2iFWN2LSsaRDaawRMsj49aBULGus1atgeVWCVzMfHrjGtKMw42MLkqlNKxpZsGk1aDmutI7H/fndrCEqIt9Um0xqqCqKkR/YvJPxV+AQ7TAGrJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c559b3eb0bso248600985a.1;
        Tue, 15 Apr 2025 07:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727831; x=1745332631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndn02FsK8/Eesm/o3Ea8LatTEFSj3YZKBnO8xo3WNRQ=;
        b=Th4oFhgCv2vTdJKx5PAdBPkTZtJYOQPeMgR6dJiDQM5s+0YuFTTfI3L2Fyeh/BJRHy
         616xuduCID4LZ6vrlAFrH3AzU7NdCXaEvTMF793i8n7KTKTZwADVIuvitd55GhJ/7BYy
         qxQoQ5U/QDM9dFMeG826wVwgBCRThvTaBkTZNF7+LcOrUa1iOkd/uH9xt4ZtQ5NBkj1s
         dJUJj/bKcDugvZ567zT9RUNoCBc397W1mFdScgIWWpibCL/RBD686NUBVwxjtP8fqBAU
         l3oFEe1CnNXdD690OYjvG59aITuePvy2htXH7ogvg5KHNvX1HuM3vWoNN4+gbLNnC9uO
         kiEw==
X-Forwarded-Encrypted: i=1; AJvYcCU0atZMsH6FmI/dXaaKmJYEbj7Zngk7ieeiJ5Ivns2UaHOfgf8LdIjEdAMpiDRfE8+1dGJ2sFS9sXSPKeNzUqVP1/0=@vger.kernel.org, AJvYcCVLy49zl6rQfpsDAMPygWUSabBcR/+M31HFYw6WrXchPLisc+TUta5/2TJ87+9xx3gJM5/PGVM2pSnJ@vger.kernel.org, AJvYcCVh0/Hm3kaV1CGZ1WIw/U/LAjN2WXxCN6kR3UbFdqWuma+dZzUO5qFzOWRarP3/mzEkOxPJ87VOmQO376q8@vger.kernel.org, AJvYcCWI8cqAvzwvsY1syjPIe8XRp84tYVHFv7CxX225swqLygZ2G1RqiXVMnmIK3ElHSymrhNVywa8DUAZX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx53REs7A28H+hLs7zyYmLGY5+se1CWqtZsSNZDTqRhZqWQewSR
	bigjlu58auRoHum1kEGAv8mV5GDON7PQThA3REx8jXg08Rt3lwqpa/NtuH79
X-Gm-Gg: ASbGncvpenD9gWYpIeW9z+S8l5PCp2E4ZFtbkMLQr8XQ22lfS8KACYZ0WfOckKWcfHi
	atKiUEIm+PdFzf/dvJ9DnHyWOvv5ME3qpENIxcaXTg11xep+PNDLbE4dtX7RoNazDTPtjAdocFI
	LYsMFgGKdW8WEj6nNlyvN5qreKSRohwfaML4pYlP+JzVm9NAf5YR7dlqhPFz7D4GPtC3/QnpwhM
	epPMWMXMgZ+6DEiW8pkPEMqcPPyAmI1/3FccQthUVQkoCGSDNJ2fD8UJy/3S2ujSKfLJoMsifm5
	M8M6QtDiJFw2ABe2hdJry5lpWdIXEvbbEhC6qiWZTHG7QJaBeK1EoKJqGto/+skAsoGvVx5QcX2
	XsuC3NxA=
X-Google-Smtp-Source: AGHT+IEysmQyX0FskRPHlfgO+VP2EHxEwUbWVgvIYMbzTnK2xZGvfpaK10sKAtCciR0bpbnlG1aa0Q==
X-Received: by 2002:a05:620a:2894:b0:7c5:6ef2:2767 with SMTP id af79cd13be357-7c7af0b8e8emr2379830685a.2.1744727831267;
        Tue, 15 Apr 2025 07:37:11 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a1c772sm919161085a.115.2025.04.15.07.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:37:10 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c08f9d0ef3so334626085a.2;
        Tue, 15 Apr 2025 07:37:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0i2lHmnBJwOyJQVjAqORoAjK96jwNDNR7EEAn+/XNkNYqx+N4XCwviUfTKH8ejSoKW3kshFfTp6Hv@vger.kernel.org, AJvYcCVy/5A433YebF7WS6n9F54PjoL3OSsNeQb0x0zwF40z9EeJahV87ii8peUrtqlkOyURnElUET1oixw/@vger.kernel.org, AJvYcCW6nINOkh5bzTlF6evkZoSMaqYF1Q0A0jt8Zda/j+pGkH3Rfift9/1DBl6MSgM2AlKE5SD7b9lGXzloComC@vger.kernel.org, AJvYcCWgV0eWUPD+jK6SKYK67UdnPR50zPAwYyQAV+mtQoVwZa+rEe7PVvZyLwhj8GM4i4GX9BCppRuBQYvrDpGZMjEiNEE=@vger.kernel.org
X-Received: by 2002:a05:620a:2551:b0:7c5:59a6:bae6 with SMTP id
 af79cd13be357-7c7af0b986bmr2471959685a.3.1744727830360; Tue, 15 Apr 2025
 07:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:36:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDDBS1POX3AmvTLWBbYcpXjnZm6sNqRpKfghF4uPGsUA@mail.gmail.com>
X-Gm-Features: ATxdqUH5Nfk6EW6k8yol2jY5nLSm1u8ViA4knYi9nabGyPXVfselxPiovvadZ9E
Message-ID: <CAMuHMdXDDBS1POX3AmvTLWBbYcpXjnZm6sNqRpKfghF4uPGsUA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GBETH instances. Include core clocks for
> PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> used as clock sources for the GBETH IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] = {
>         {0, 0},
>  };
>
> +static const struct clk_div_table dtable_2_100[] = {
> +       {0, 2},
> +       {1, 10},
> +       {2, 100},
> +       {0, 0},
> +};
> +
> +/* Mux clock tables */
> +static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0-rxc-rxclk" };
> +static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0-txc-txclk" };
> +static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1-rxc-rxclk" };
> +static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1-txc-txclk" };

The "et[01]-[rt]xc-[rt]xclk" clocks are not created by this driver.
IIUIC, they are actually Ethernet PHY signals.
How is this supposed to work?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

