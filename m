Return-Path: <linux-renesas-soc+bounces-9516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179D992B28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70A711C20BE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A9E1D2215;
	Mon,  7 Oct 2024 12:11:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917818B483;
	Mon,  7 Oct 2024 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303107; cv=none; b=cZlcLo/IdTXB9JwxxETY647x2aJfKmqt2K9tJOvxy68SKfOMhrnJ5Nme0NHtal5Vt8422SWIVHOqhjvb5AylY60GV+4k8Wjx1ixiTwuu/swHQweh0wdGR9GYBcFWvZu+BMjRAXPmYd586XW7xty5XUtKqCje3NoKa6ZVZoUaMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303107; c=relaxed/simple;
	bh=hjsAVcqmqqdLHFbzTmYuIhUjB8PxqxLmKX3Au0tyLFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LF7gXitWwqfxUuj/6uXtXubN3zGTD9NtSYOW0ZoTKd/R5TFslcjhCjpO+GW0dK0BloBkkLLmAwQWQ4zwRtabtJjVZzX3fU5qu6/MSIbOeo8/8E++xH7C8Gpv7pn3+pOdNXqjA9EEzanZbmsQOJa6gKtPpE9KYrs/nUVASgyKhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11884097b3.3;
        Mon, 07 Oct 2024 05:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303103; x=1728907903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpiBUq04Dm+hijVqTOu3uyVD8U1/9dPTQc7Ed99SVnM=;
        b=PTN8vguqi1rw4Gs5qWpETgjcoa7STwYuSBOSeXUdcN76m9GheHWszT8VIqT5xfD0li
         uQDiReyX7J92845dmYMXGPcPg64ztt1Fq2i+1ezVL/tg1bABLebGgFBLeYQAuAA6mFWZ
         aHHKfro9aMXfxUttl/V103yrysOnVwuP54pmtFFcXm5qDXoLFuMcrSN2ecIREs6alEnq
         MJqwPApqhz0jdXDxd5LKSXkBYnxYwz7qafAosuJDL5QyTm5cmdLosr/pLu9stBWAqYcl
         sJ5n3dKwNuTr6RalI3ZOJNHTg90qjnGkxCl/oR2uoM5n7E29bz1dRwgHuLTin5TIvzEf
         4+tw==
X-Forwarded-Encrypted: i=1; AJvYcCUSmoTekWPBmIR9wzLKV9YU9PX+aoSVrK+dMGDl99y8x+7VyqDB+nLw8Fc313C8ijbCoTdyNuxx/Sae@vger.kernel.org, AJvYcCWdQQD8mTrQI6j2kTgdFtOUmgeje44rzzG+dGmEb2Cl9C2Nf9MR3fdCcMuOevTnTU3pCzy9N5q728RpJlCkx1KAeqg=@vger.kernel.org, AJvYcCX8jlObPk3enVOgWPfhLstffaOXVvdaav2vDdbx+Ktu5zmf0VcazDg5dwWv852f41pZBmxjjETtve0QftSG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjyl8XOkYCLQVkqgDkyX/2wlX8vGFO8IV+D2IlnLLMu8xRhzp0
	F4KLoiZJ8vkDl1Ul7skO4XlsdmrQ5k7CwHV3iTKj9Kzy93VEw1CMr63NAjav
X-Google-Smtp-Source: AGHT+IHY4TbYjl4pvBVgfHxyk+JP7LX5/wgtBiM22KnuvhAWkpi0FbJrre25DfB8Tmoxfxo/4FrLGw==
X-Received: by 2002:a05:690c:4a83:b0:6e3:b8f:59d1 with SMTP id 00721157ae682-6e30b8f5d5emr954017b3.31.1728303103514;
        Mon, 07 Oct 2024 05:11:43 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d93848cesm10228417b3.58.2024.10.07.05.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:11:42 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11883127b3.3;
        Mon, 07 Oct 2024 05:11:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUq7cP6UyHFNgl8b2CuXqxLmUikEQfVTQT7ZxZmxcgQiozBqJo4J7k2a39ugjzxN4Q66d4mAXsZf1XoXPMpm1t0jrI=@vger.kernel.org, AJvYcCUynxuDnPp92f+0W8qfGkTsUGLX3VOyd7vmnY/bWsXLeofvCEfUG3DamERulcpPdjEGFmPuwPKE0lqZ@vger.kernel.org, AJvYcCVWHc+8YozHVGHjPd8YZFxKnMEX1cxzOlHL0rko/Z61iTRc0qdzSvY5NYAYr1QzRy0aBBOqMst5jbet5vof@vger.kernel.org
X-Received: by 2002:a05:690c:2e90:b0:6dd:ba22:d946 with SMTP id
 00721157ae682-6e2c7017d04mr73653377b3.13.1728303102493; Mon, 07 Oct 2024
 05:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927201313.624762-1-sean.anderson@linux.dev> <20240927201313.624762-2-sean.anderson@linux.dev>
In-Reply-To: <20240927201313.624762-2-sean.anderson@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:11:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyPWt7bjwkVreRj-U6KUAt5p48CnF=E7ZeUpbTuyJS5Q@mail.gmail.com>
Message-ID: <CAMuHMdUyPWt7bjwkVreRj-U6KUAt5p48CnF=E7ZeUpbTuyJS5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: salvator-x: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 10:13=E2=80=AFPM Sean Anderson <sean.anderson@linux=
.dev> wrote:
> Add SD/OE pin properties to the devicetree so that Linux can configure
> the pin without relying on the OTP. This matches the register
> configuration reported by Geert [1] as well as his analysis of the
> schematic.
>
> [1] https://lore.kernel.org/linux-arm-kernel/CAMuHMdUmf=3DBYrVWGDp4kjLGK=
=3D66HSMJbHuMvne-xGLkTYnGv2g@mail.gmail.com/
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

