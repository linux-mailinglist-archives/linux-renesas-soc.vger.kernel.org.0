Return-Path: <linux-renesas-soc+bounces-12680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED4A20D9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724973A9712
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A019F1D934D;
	Tue, 28 Jan 2025 15:49:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06921D63CF;
	Tue, 28 Jan 2025 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738079354; cv=none; b=rwL9hzKMarsgo98FTS1vgqNNbOVfdQBiet7pHqFOmmDh4iO2FFPBWiLT9zuyuDVtGOFCPuALo2YAqO+MJtN5bDAjjnS2PvSja00ec7uAwVeAKFlcHHlgAijBIoYsBqa5bsGL9yQiUFkdkwp88Pt1ubXvzP4kRlV0dhm9/IPFkAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738079354; c=relaxed/simple;
	bh=42+uUjYeFJz6MS6O0m/KLfOxTcjAGA9oxBEOl33XvDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLOzr0BMw3vB89vcEgIdTRLs9d/rIUYzagJGIuGUhiwB0W/uM99tBosusCKyBgK2jEwvznTtGnajlBWA8R99P6WdxA5x2mxjdEwdfSZ9Nk9qTUEGLNIEkzaSp/tUyyx9OvmIMLhxGU1hnwKW1MhsiwNcPKMB8eJnDxwF8adNFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afe99e5229so1546237137.3;
        Tue, 28 Jan 2025 07:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079350; x=1738684150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMAld+RfqOGdKSX9WF9/UoV2cBHhEYNzKd/z1xnuijM=;
        b=ABt55OpPh43ddSJSMgUEJxak0UP5Huc107PIG9M6E/z5E2lihlD3Kfm8DrKBIMsBgd
         8L59p6BXi0IDKBWWfnsbWQ/PjoSTqB2HhetQF3mogYICLkjn4tU3kwlPry9Re3UKszGY
         IBwicGZduiL+ZrTmt0AwMIMKzyOgq/oIP2atjEsO3zVzS6O6bwpGem73NbWQX7L0aEXE
         YVid5nMMzpP6GcywEjwotFZPZCC2gG6WC5QplixLhZOlwupWbnbxd6lxv6Uk5tUBiZt1
         EC+Q6VQCubhLqbIclLqBXObLCNTcqT+YAIjISC/1y65N43SPbAxdZEmKREwt8a/b01SJ
         9Qkw==
X-Forwarded-Encrypted: i=1; AJvYcCWA1cr/WA6q7+UcbCc5BsbAtkiPQvB/ZRJ54DwHruzVqr7m8eJpXUl/FryvmPQeEEKlQYpwnnlRPKunWqqijfEAr+Q=@vger.kernel.org, AJvYcCXjQPARdrQNpN1UiIhzra8naG+HFEerKAW8OF5Aj4+Ko3iKMi4eqgXX5NG/QRpHrYk9cgQXgfQt27JW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw43x0A1lxoAgd4IG6AeTbgtoAoJZBvyWAsq1Ruw2CNlR0qNiUA
	6mTq2eOgHAxzKPiCP2IJAN+l88NW9ELGxN+hcncjIT4u5y+zLB979k3OvhfK
X-Gm-Gg: ASbGnctm9ITfrJT+ZfFTdltyK9n9LvP0FQ2sT/iu5UKA9X36wClbd0aOaDN35jjS+hu
	p/5DZBTT6hCTz+wfZsECA5Dz5fRdI2iGh1dOPuMmNqTUimjinS1v4745f1+pWMs8jTAZSTaTE0J
	SgY1Pfv1CnBufeJ630zI49Oi6Xs0/NKyoq2qk/Zjc0etPd6cqcbFTG59wqh27+ma42ybhzw/P7H
	ZGNX7TiXnGUJX8XBAZdbDQylYI2rDunKw7GpNVJApk3FWbke6f8EbZPHLHu7uwMwnLU1Xb0HsSG
	DqH0J85bbXtbqODKhmlSI+FNyi5ykKcVb8zJjV/fABFy4JSOCVhMzA==
X-Google-Smtp-Source: AGHT+IG2CnjNt7hul00qFJI43QsWvqc+TvOJ06o2Kirznfct95W6dMBgMinx5HLsEAitHjR6Gg2ofw==
X-Received: by 2002:a05:6102:952:b0:4b6:20a5:2093 with SMTP id ada2fe7eead31-4b690b9a96emr36371486137.4.1738079350318;
        Tue, 28 Jan 2025 07:49:10 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b70996bf94sm2246204137.21.2025.01.28.07.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 07:49:10 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff78a39e1so1764457137.1;
        Tue, 28 Jan 2025 07:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW93V5rmmBZZiRs6b3n+scU1i9caBQVA8fPjaF08lFQYAR+8Qtdnq9iiXGDhbWVZz+qf8zYJVITWPXz@vger.kernel.org, AJvYcCX8w8Oek/WKlSFnAMlBeFsMMzXb42Nl5SFQSKzVCxIXySJ42t3BenTNJHQA211A3hZ6AseOGX+WZTAu8ijz/tagiOs=@vger.kernel.org
X-Received: by 2002:a05:6102:2d0d:b0:4b6:44ff:414e with SMTP id
 ada2fe7eead31-4b690ce4767mr43875902137.17.1738079349728; Tue, 28 Jan 2025
 07:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 16:48:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOWPkf5U3iqafpzMF6FrzqZ4osoFtvgtgSra6VgFzynw@mail.gmail.com>
X-Gm-Features: AWEUYZmPtd6AwEAW3fgdIjoIKhAX8ohawliRkw04WF-Hl1q4kjRyEb43-c5YFu8
Message-ID: <CAMuHMdVOWPkf5U3iqafpzMF6FrzqZ4osoFtvgtgSra6VgFzynw@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable SDHI1 on the RZ/G3E SMARC EVK platform using gpio regulator for
> voltage switching.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -23,9 +53,44 @@ scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;
>         };
> +
> +       sd1-pwr-en {

arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: sd1-pwr-en:
$nodename:0: 'sd1-pwr-en' does not match
'^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
        from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#

> +               gpio-hog;
> +               gpios = <RZG3E_GPIO(1, 6) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "sd1_pwr_en";
> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

