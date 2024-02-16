Return-Path: <linux-renesas-soc+bounces-2910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FE3857FD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 15:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66223289C3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 14:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D492712F361;
	Fri, 16 Feb 2024 14:56:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC29C5465D;
	Fri, 16 Feb 2024 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095400; cv=none; b=UJi23vnWtSEH9JY1reVr92+Ulu/WYbNyqxyMyWF4LEbKSPtR7E4gxeyukfvU6N0fIjD6kzpkRC72gc1hf4CyjaigrSo9VlRS6Tx2bD5pj/+7r8R7CTl2eR5/3yeI3586wPm8pckjZAnWJ/61iVVeha7vwB3RfRxS/21pQCnNEfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095400; c=relaxed/simple;
	bh=Uior+WG3rFR4UxSLj3zlRId/6zrUf17Q6pSvbFYclcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7rBmFr6xCEn0QiHmVKUQy9Pf31p0FNaBAbF4ZMmtRmSciOYx+ki0rqmLnm+28nYkkQxQztBon6TmsoN0nPYcmlW6GTjSBLdHGzFSC/syCqijT11QRuzvVqlLXWT+NZ3b/Qc5XE4JtfsP8V8FxUB7jh0G0SVI8N3vsalFFf0QgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6079d44b02bso7427107b3.3;
        Fri, 16 Feb 2024 06:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708095397; x=1708700197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APYb67gscWkkX4dNxvGxqbnC2pw2iJ5UGI7dq9JE+04=;
        b=H14KcAUy+uzJVHXphyZ1pu5POtFMQGC6ztnviPAtrxUhAk4NEbXSbX+78VHbX8CUe6
         YeU9kr4Bg8j3t12x0s9dWNyp6rRqWtyWohdOb2zLWN3qy0k8yxG4I0LRWX80IIbcuEpG
         /buzAmtCFRE7OhfTWAUOZtU/BdmYU+NyyzYr0UJZZFvA0XNZ4KK8QHbBht0OAQ45hdlL
         OoC6v+1aSnyDYKJ3Q4qF/RsiYJFRW+KcmexwLVywFy0V7gHktJarTg+nr/6x0xJHEf97
         KLsAUAYyV7prCkg+Dn9WKC2yz1sEpHStx0Ehh9m4jmJu8AeG1e/IkWswxaBXbAzMDFiY
         nItw==
X-Forwarded-Encrypted: i=1; AJvYcCVLqmJ89bgT7rDn0vwDIMKic8rxzUkeaHPJgpFv6Fb7VWIvsf/xxaRWq3zneeksZR68a1+g4X8LwSBvk6xoHvhf1t3U8dZ5yOCUxpQvLZi1vwTWW2kAAFY3WtzAKYMYTky7vttZ7BgdQBzQ0Nty
X-Gm-Message-State: AOJu0YwOexxvmyGOKmrj3Z3U2c+T3+2jz0ACvgnjTiBi534hO0LSfaPe
	rhES6a591RRIdejC7dDCxr0a+XcbmGIkRp/kcv7IyHJqDPIEBUXEuwMUnpTrIQg=
X-Google-Smtp-Source: AGHT+IH3UMb0LV5sGTEMmtRvFPE1IdRqqRr3jHtwUl3iVQA5bTd5UGYDXgXaxgzC6ASiy3cosOLZuQ==
X-Received: by 2002:a81:9817:0:b0:607:87cd:9394 with SMTP id p23-20020a819817000000b0060787cd9394mr4786525ywg.11.1708095396788;
        Fri, 16 Feb 2024 06:56:36 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id j64-20020a0de043000000b00607ef065781sm371764ywe.138.2024.02.16.06.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:56:36 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc742543119so908940276.0;
        Fri, 16 Feb 2024 06:56:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZX1xJUj7dlluoLW0X8YPhpPTwzbJSLRJjj+VVykdmnaW5JAT4skbo/0+24r8sh1Dw+HMQdmv000dDQkhlRmwn0p/B9k0HEfnSG4O4kaBjilDI2QpN8uLaa38mMNWI753d1nRe1GIRSnTNXB7q
X-Received: by 2002:a25:4c84:0:b0:dcd:4276:9fc9 with SMTP id
 z126-20020a254c84000000b00dcd42769fc9mr4413677yba.0.1708095396195; Fri, 16
 Feb 2024 06:56:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213224259.2967533-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240213224259.2967533-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:56:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0vstcxrG_J9BoVKLtkWRKvAmSq3TDKzxjofyJzjK52w@mail.gmail.com>
Message-ID: <CAMuHMdX0vstcxrG_J9BoVKLtkWRKvAmSq3TDKzxjofyJzjK52w@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: renesas: Document preferred compatible naming
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 11:43=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v3
> - Add missing minItems.

Thanks, works better now: "make dtbs_check" flags the addition of
my bogus test properties to DTS.
It doesn't flag my bogus test properties in actual DT bindings, but I guess
that is expected behavior.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.9.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

