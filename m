Return-Path: <linux-renesas-soc+bounces-8138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A4195CB79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21960286FCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C52F18787D;
	Fri, 23 Aug 2024 11:34:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06D8187872;
	Fri, 23 Aug 2024 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412864; cv=none; b=Y2xedW6mn2xlnvICvc0qESh9gbBt5whl+xsPaPfscAACPuoxmPjCAAU+mjY1PG+2GWUEhIqgY80dkwkzhSomJUKoAzp5B6mHmQwhXFp2oUhoYZf6vNHLpyZUnYGvx1IxrsvcOwpyPrVON9V9GGd0syLCPNX91AN7ri9rpYDRg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412864; c=relaxed/simple;
	bh=hwdZw53aRmWyr02nOJ7UsLzScnq8hEu/dIJyR08ZILU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbuie4q7BatcjpNU+1O6mRjaJnEiICr/wb1OOtRi7a8V67iJx61Mz9Qxl3P2FhanKdL02qYQ6lSAuV1S8b534k0FR7t1yTSmF8+VObBacLFE2cUdYY+R+GiF2rbWdtmKDNWsxZebMOXALdnImgpseLyprX9GsKVj/r6EwizVeHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e162df8bab4so1736560276.0;
        Fri, 23 Aug 2024 04:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724412861; x=1725017661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2cn+9V+XMv8NqXeoQt5WrF+DgwWZxe3WPOmxNdiUeo=;
        b=Sk8C0usIfZyz1R2CRtq+ZY9rhybtHqZG/4omAFoD2J+x4N1MB3Nl/pjyNonfg68siH
         6Z65IuPxI/QTBmLh9J0TT5lW470M6Hcc4u74FQFeRuC5dita4sAP+hRvX8LWVjs1cTH+
         DK3XlaaTPGC+SsxWG+ATrh+uM5FhFdSYaYi/dcoJfl1eooOMO8kabnwpmiQHOMy4J8Ap
         L0NmPKGTKCl4tyzgmYA8sR+5mETmwoFI0r2pJDf7O7BMpufh7INXhpXH6P3AMFLaO4WM
         +JWLJerqu7lTR0Y7S+6+sqXSHlm8tWUjdhlHcDoTNsHzdpUsymvHmTYchOMjNiFkolzy
         Kv3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJbP8cn5dA5e/CgOHDXbrdx8Glhnco66tQ+yHAfaCE4Ki2VYf7O899whtjj8/6t4O4XrtEoIPLwAfdd9Lh@vger.kernel.org, AJvYcCUx2t3aE8445lkni0X0RqLIUzQqyDWVcE6XrZQmHpjf8MaV9oIFDMmmU5nkE+JHRC85NRVBgtam2oCk@vger.kernel.org, AJvYcCXNnPyBM4Nzy4BSmhv+wdYuEDzAvxyMh0L0G/6xBjFvXz5kuw6aolLtKXvYis2mK+VCzIi4ltBCCWR1ST+LkFrDS58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFqh+ao00+p2jkW6TKnp1A8PUHxkk1W8jin4t0scu0V0YlHm1C
	hIRHgeea0BsmoXckW42bg8KI+iQS+n2kLB3Yp3ZLoPkLewYBIiYnFvfo7gOz
X-Google-Smtp-Source: AGHT+IGqpcdYW9sk0ccgn9E6wT69Bm3WtYq1jNx+Cd7Bl9viTiHgtou6Vm6DkjN5aYG3x4VuywkVbQ==
X-Received: by 2002:a05:6902:e04:b0:e16:6785:1a5b with SMTP id 3f1490d57ef6-e17a83d4abemr2155581276.14.1724412860593;
        Fri, 23 Aug 2024 04:34:20 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e43f3afsm622250276.10.2024.08.23.04.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:34:20 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-69df49d92b8so16765677b3.3;
        Fri, 23 Aug 2024 04:34:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUglMYhCWwZ68HQBq3ol3n6NgDoCFBDWZBjF0jKBFO8Af/Z0hldedD8dxKa0KD4bFc+KYNVqOEaZJjOPTwq@vger.kernel.org, AJvYcCUkYCwSKvWtskTHwgFTTEw8e0mJf7bzwxtHsDMqQbQ7a4CHt3ZQsqj8Iz19xrL1DQGUmwQ8lo0qLjs7vOx7aDETtP4=@vger.kernel.org, AJvYcCXEpb2D12pkizz2CEf0mFh/m0IN/f/KOwOSNeego1aPZ7Yb41/adS7HMo5embHobesBIQY7LAg5lVU1@vger.kernel.org
X-Received: by 2002:a05:690c:d85:b0:6be:28ab:d87f with SMTP id
 00721157ae682-6c62538cf94mr22613127b3.2.1724412859901; Fri, 23 Aug 2024
 04:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818172930.121898-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818172930.121898-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:34:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhPNDhtNRGwT8FjFQ-BJvpdFha=3Cz-ZtbkdUSDvHOFA@mail.gmail.com>
Message-ID: <CAMuHMdVhPNDhtNRGwT8FjFQ-BJvpdFha=3Cz-ZtbkdUSDvHOFA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,rpc-if: add
 top-level constraints
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:29=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

