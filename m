Return-Path: <linux-renesas-soc+bounces-20708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C6B2C5D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE801188EBAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6343732BF53;
	Tue, 19 Aug 2025 13:35:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC1C1DE89B;
	Tue, 19 Aug 2025 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610533; cv=none; b=Y/ms27VDMfK6RKrXm0k2Uyk6dcfqwdoR5KBoEwOKOCrpSrCcoMuWQ/p6ORTw6fSanDNxQ+LaKd61DosatCG+l8dgjYaDzMDDFOVKgrKCNpeaHgHHaVbEpEbDzYiYvsmclG/qfMF/dUz87hbk4XYzNCxyTlxzBp2TRRwUYrGhjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610533; c=relaxed/simple;
	bh=Tyi+9xAvn7s603CkCspL7WeonMXBBF4+oUpFz03xEFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxqfJ7ktglPe4E3VfMEtbK16zDf4weAE64mOga2Vjb/D4/i2cybaVzruT+GpZqpWQhWTkh2DuYLR8ivQS0Vwgk/4+E502g3/u5AbjY9w6nAITvDy1HguijPsoGs7JALZDJVWLj6+eWvNXIQD4cnrOWiKN/upw9iHkJpiUXtQhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-53b1737b9c8so1872137e0c.1;
        Tue, 19 Aug 2025 06:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610530; x=1756215330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1ytin5hrxcri6pw5X6iglo9ZKpWYXx35SDdHDKMJW4=;
        b=UDcFMOML/nkvusHy0InbVlQAw9Q+ytTiIT/eAMtXancxSC97NxW7QnLSRd2xhTK8zv
         KpCaBOJKwwqbTnbaONF7Y6+o1FDiZUwSIm01zN8tvaYGdfJGyQi7xQDaGoNOZk3/kIwC
         4JUVZlGFKJ3pQUXFlv57fhtckdLndFzMwBzSZ82fQIeq9PqD0WAh/rxNkCiDYbYOb4KF
         xV9i8beDZcpn9F64sJUVXh2rCcka9RsYQkWkXbq20NB1mEd4Yl2F1XkW37o/aEA2C1f5
         HBeDj8P5beHNY+WUFHvyyf4+zwsDVkmibSZhSEWFR2JXfH3N6U6ht0cW0WFnAp2Qp3ld
         LVAg==
X-Forwarded-Encrypted: i=1; AJvYcCVAWq4x5FFcdM8xgNM7tSIXFDK/mBXwL5MX7TJhssqRjGqc+zjLRJ+KePB51PB+huPIKRlZvKlJ8Q3/@vger.kernel.org, AJvYcCVstBluuM4RRz57LolJNIwQPOCNUMfAmbWijjuRZbwSk5C9ObXuxZvgYnD47ghqGE2C2o8MGNODXwuODFz1wFvDLDc=@vger.kernel.org, AJvYcCXyMTjLEVViYMLCBUt2TZk8ju/QxgCpkPY3V3Qw4XHNLqlho9Pv/Spd+b3ZWuO3qU+T9vdgKS4Fk0EMWby0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz63zyENIMpT90vvgbidE6WaLj9JWG2wEVpkDqnyxFRVyXDD7aC
	/YN4joIi/FhMp2ML0lCdSSe7xFu0Rjz/4PtSUDV0KDkd7gA88KxUDkFvaSY97JG5
X-Gm-Gg: ASbGnctSxqRzyM5+C2BC7AU6U2IigDi/iPzqemo0ZOoFjAyTHIY28WkDBbye4pT1cJ0
	vqsz9ZnSoWW/hVqKrObnfe8Pi3XQ/9oPHOnoD8LSp9nTnLa0MVTj+FNzkIfNn/4ZRzEfN1z/tRx
	C3nJHbt1r4NZSc12aJDIBTGk4UvZMi2ncPkNJJh37XP3ECfxEQIudX59bARDnru+q1PVy2Ddqw8
	F3v802BDOZm+J5unz4+ebXsPER61p6d4qAlBrRB8J0owIDzSd6+7Nn7UGwYnWOy/wRw0FU9opOX
	DI+6EZVt+lH7cNopPisBFDX+S1l1hXaW2QJo7NADDIsY1kB6ou1/PYnlBy70pnoF2jQQ0mp1yN+
	go2UIkh2LbzJL0zuP0GGRcJ9yUFl6Z+2EQ2EebrKqJdARANBHNVT/FgP8ecAeMb2di+2unCk=
X-Google-Smtp-Source: AGHT+IGWyfDwQ+96wKxTQr9utqVdQCN2iJmx1eYyW3YRbf5uvslyHGw9mu0DlKyDe4q1YfryX8LCNw==
X-Received: by 2002:a05:6122:90f:b0:531:3af8:b177 with SMTP id 71dfb90a1353d-53b5d48183cmr998129e0c.11.1755610530362;
        Tue, 19 Aug 2025 06:35:30 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd5514csm2558205e0c.6.2025.08.19.06.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:35:29 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-890190c6165so1634883241.2;
        Tue, 19 Aug 2025 06:35:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD2Uw05Icnkc7StcQuffuYw4a+Wqccx34yquxcdaLrxc2u3M8e/EuzYAOI/QdeKSxd6xUBpp2Nn2po05qUavipdJA=@vger.kernel.org, AJvYcCVReUkRZFNndwXRcNSIX8REDiPBDk0pv9ZSrodgdcrSnkgv45rQFiC27ZYMUpTbJnG2r9gFwLiqxD26JNKB@vger.kernel.org, AJvYcCWHo7kJ03EizdMKNuNLCf918wg1+c1gkadOQ6eSVnu3b0NSjdjE07dQ4A9CuXmiitjjSL2SVZEeF5CC@vger.kernel.org
X-Received: by 2002:a05:6102:1449:10b0:51a:44a:95c4 with SMTP id
 ada2fe7eead31-51a045a26admr93014137.21.1755610529255; Tue, 19 Aug 2025
 06:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819131619.86396-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131619.86396-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:35:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNig2sVKQ5SdLMDjtog-PxUh+tscMqOF_K-iNSgoWgOg@mail.gmail.com>
X-Gm-Features: Ac12FXx9MbvFi1UoawwCV3F-hJ1gP4_2ncCWbFcegaVoU6xZisrREmDwKB6IPGo
Message-ID: <CAMuHMdXNig2sVKQ5SdLMDjtog-PxUh+tscMqOF_K-iNSgoWgOg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 15:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> The DTS code coding style expects exactly one space around '='
> character.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

