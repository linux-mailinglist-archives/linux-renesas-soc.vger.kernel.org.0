Return-Path: <linux-renesas-soc+bounces-18972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65138AEF8AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 567454468C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24009273D94;
	Tue,  1 Jul 2025 12:34:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FBC1DA60D;
	Tue,  1 Jul 2025 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373296; cv=none; b=dsSOADDEmwKolCnaMpUSFIjeltURiI+d32GJ0pB5BU4BqbHdE+B9uD2TJKdG4zG3ZTTaurAoTC9uiP1jZOXDYiaj3NARaPkkbD1lJ8evD9wvddkvinlQMrNu1wO36RMpeGQBHN0uktKGLf64TLnJ0fFYZvaK5GKNVFuS2Fs+Yc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373296; c=relaxed/simple;
	bh=ICFUXKYUafP1/1JturHMtnA4JMb2JE3kwsh3Po0ZVTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrB6eOzNhOzp9jXsAV5ZQSupgdocrFCMhlW4BbKAb9HXMdJBoaz2klQJcCjwlru54mZjNrCxqY8iDBz2CpTfVKyMOJWoLnU0U6dp0kCpke6pfgcS2insvaP2Vl55gUteqkSPvtqhDtVnDR6E2nLbuFsnPr4r2ILlGxDXBZ7cCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-530d764149eso1779461e0c.1;
        Tue, 01 Jul 2025 05:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373293; x=1751978093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3joGapVMBeb1Qmu4TIfPpqZEnipUNTUgtYPrOMt9N8=;
        b=iycmDgB6XAaffpLkXT4yzYQHZCVbENQNAFMR0INAXXTDhu0jv9MIxjJt70GW9JN598
         ZCNgZ9Tj0DPaAPMAWqXldE5rB9dl+Mgp52XjdGKORIeHYxZ2fIIAvkzWvTGtI+4s+bsQ
         Yz2bdO6bUH60SYM5MPqjX+WLUAzsyrjs2V56OKZqwX5TNg6lUHJjKvClifXOupDRVq+f
         tiRMg30+S+dH6oS75IreuhFwcmEID1Iu/3Pzc59rg1zjE29j3O2PMUrVYK3EZED2mme/
         6qpofyhsCKsKsGOHc3+Q+TdIWWiYaK2B5jGx2Rkett2cqwwkis6MmsBnsLYmTGyRdy9w
         yyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+//Cm7OhZRAAqO6SBeXycHgAmPhBLd8vhz87yBYnIKBorv5erNXiAQjbc8pkbojPDZgFYEwgzvkJj@vger.kernel.org, AJvYcCVOXiOz9GJ7z6RmWzSGf84UuQs5ZjOYpc16pTfc417VsAP6w2SfmTFBJBgsJgH1ia88Bi9SmFkTaI1q@vger.kernel.org, AJvYcCVdQjHtpfNeLaJf//dK+jRXXMGFSfyrtWdKLpgWUgPesQ1KdP2TOCP11qDV6dGo6tbFOMIThaEHTBYGJOXhoLZNJf8=@vger.kernel.org, AJvYcCVtmivU5Jk8eWmMYXFwr99Zb31vUAg8xLRR0QMeR33gR7H1jZSedRDporom064Xd+x/DTutBX4La0qdY703@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaOnytmZQIstljFIRteqiuAlMyr+78DgPsffsN699v+KfLJO2
	tLbsgpJLWJrk3+oSiqaFozjK30cMYD0FlyJElTwi+OaWMqu3/Dg4IfFTLIVtgdn7
X-Gm-Gg: ASbGncvfyKf13hLwocbiNOztsHX4A45PuETmkUwq1YTrFnb4k7G+k/2LY5JOogySH4P
	PHtLH6ldBD+6k0nD8QgpUH4OCF7xLQINqN6oTT2RXQxf2DuOZPdovdFv4ce/SAc8lEDfg+4ex6H
	mm4esRi6zBu32xbggYwt02Qv9vapFnikvrwoU5fMB7FkRuV/e0M7xNjcVxOvc4s/sCsNwmKGOJn
	mHmufRGUCGVDux0kmLwBIut/TtJyK5WzBM9GyvcBoZm4swGc3/Kl6kZUneygxVCfLmWY6f/eX1H
	Zaoe6zQMwX5q3y6oFSh4pxB2djmjCDuPHWkfU9o2tVBk7IZT+j+Z5fAuZR3cwiKgyTY7CHM2IO7
	QAXUv0QWOT+o3lvwXen41OT/C
X-Google-Smtp-Source: AGHT+IGCuNANfbja8v7/8s64OfKpIqGKkB2u0KcJWOGiS2oL8NnA6VwJZZKxKmA6OVaoRPeBtNwmwQ==
X-Received: by 2002:a05:6122:8286:b0:531:3af8:b177 with SMTP id 71dfb90a1353d-5330c0f35e7mr10482185e0c.11.1751373292624;
        Tue, 01 Jul 2025 05:34:52 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53309075b6bsm1684405e0c.8.2025.07.01.05.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:34:52 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-881114808e4so1576384241.3;
        Tue, 01 Jul 2025 05:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdYO4CW96Pc2CXvnJU0RDwTe1UutiLojoVyZDC4lBJklKvSeHblbTcR0yZZeZknETCIDF94yCUkDOtO/6s2eDZtvg=@vger.kernel.org, AJvYcCUtDdxXqjP/8WkwRFeFjFSXU1h298+32SE1E+tGgQ/rQsPxj5iQOcKzhPZbr1Vn1yQ5PHkDFFURfHq6V0oS@vger.kernel.org, AJvYcCVYK9Lyry9lK2pO6ZHzP3/lYKbpoaa4Z2zzkIWHDXpDp3JvI44hyq7wAHfUN2YgZ3jhHRE2hyKnjWm2@vger.kernel.org, AJvYcCW2gD1VuATAaBmieCtw7M1RzX5wwmQGt/pWYxgH2WDtuLcPJSr7QXjWftyzGgbIfS4a+sJ/azvm6h0+@vger.kernel.org
X-Received: by 2002:a05:6122:62ea:b0:531:2f9f:8026 with SMTP id
 71dfb90a1353d-5330be0ce5fmr8767093e0c.1.1751373292080; Tue, 01 Jul 2025
 05:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250627204237.214635-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250627204237.214635-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:34:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpL4gdPB=vEbGiA4neNiUSKdxvKU3AFGVROsdes3VaPA@mail.gmail.com>
X-Gm-Features: Ac12FXyPlnAceDfo3UnraWBEsRKFi4DNjLCe-7IqwHe3URJpvFA2I3hQzMO3OJc
Message-ID: <CAMuHMdVpL4gdPB=vEbGiA4neNiUSKdxvKU3AFGVROsdes3VaPA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: renesas,r9a09g056/57-cpg: Add
 XSPI core clock
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add XSPI core clock definitions to the clock bindings for the Renesas
> R9A09G056 and R9A09G057 SoCs. These clocks IDs are used to support XSPI
> interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will split, and queue in renesas-r9a09g056-dt-binding-defs and
renesas-r9a09g057-dt-binding-defs, to be shared by renesas-clk and
renesas-devel.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

