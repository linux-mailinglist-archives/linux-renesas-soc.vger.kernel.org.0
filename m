Return-Path: <linux-renesas-soc+bounces-9112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A87988295
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 12:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C492811F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 10:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D6F17DFFB;
	Fri, 27 Sep 2024 10:34:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E213698F;
	Fri, 27 Sep 2024 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433289; cv=none; b=b3l96Ukkeo+50xqZEpl7g6xY1UH80rpYh6GfE7bhE4C9hilgvOBJvYEUGUJwaP4KwRDlmboi05mYJPv0kVzYOSD3AyG88+fYr8uKEgMm9op4UAIIbm4HyqjyK5F2i2awUQR8zA7eZVFSCHJkYWlDfdzBJvkt/JUwXq3zA199g1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433289; c=relaxed/simple;
	bh=yN6gDElavrQJa7jwQTTWC8l8VBpAN1vAQwopGHRGBtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9bfqLZOWCPDnxNz8kosVixErITKA7it0VOKY2bjmQshyRJaXne2cNBMjDRP1Hiu2teto1yE/OKirp6sjmVdfZjmNFTvIl3Z8+mbW+omIohZ60CGeu0UtyKjzhKyR3OnbayW+Bur4ezX+Ap5RFQGGWY9JgzVAziukFjsDGnFsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e260b747fdcso27591276.3;
        Fri, 27 Sep 2024 03:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433286; x=1728038086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfEy+XIoNPLi46QPJiSDBu8Up9CfRlcO2gPqP6NKrqE=;
        b=Eb/FKvQjuUagLJTBlTFF795nHWCack4kbjmuc0KVwWe/Spm6XgbiHpAN66w3p1g1Ew
         oFtbySicE5IXKD4eeuE2v9mU4ZUBbUFzHjI92m26z5hvAVXxKe7VOld+kxepU8HXy+dG
         77sUkynkv6nIJ2G6JcIH3dLGM3Evf69gaswggeJoRlr+yvlITGtRNsytkS09T7e/RqV2
         GBQV6nmgnW5R3AHPIm3Zoo7JepZXjntFUBdR1GWYzUvQYDpkN3C8ryz9wEnuGj4/qO2P
         WQISrRnEoyjIm3+/63VuIPuL2nBC5HxVF6Qjd9VjTvybWn1JsW15fi79Y4nh6yi6sSBf
         BTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8rTSlRVB9VPXVmOmxjM3+zfWhTApMljkWPCUIycIZ9hv7YGCsfEw3oKNbFpzVzmn74Cmzzq9t43GbZEut@vger.kernel.org, AJvYcCWYANWoEkrPBpAFJc15Dfgs9K6trd1yMynKYMCFVMybPv26wHMV1OiCLMXfuNuiB9K7GDGwI60L1Qi+@vger.kernel.org, AJvYcCWyLNklcdPDE3rOFWBxsWjFL8xhDApwmfnTNjJOFxeq8Re2GqXaiO1IeKJLLvyHIBXwNoMFa7NbPonbEovIBeIkcco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8MoQJehR6LsqpLd9Xv4PUkUts0IsTDMUSqBIHyZ31sk7Ldm2
	3gQjd8oUyAsb5bpq909vBma8MuZkspRd6iDMazCFptGlede/2IksZUV/Xwee
X-Google-Smtp-Source: AGHT+IEeLv7VNb+fvKNMiIE4FVk25QMA/omWWMIhimr3XlfjVfTMsthKvkjxQO4AJ4V1l563vCjaAw==
X-Received: by 2002:a25:d851:0:b0:e25:c6aa:fe33 with SMTP id 3f1490d57ef6-e2604cf551fmr1648723276.37.1727433285770;
        Fri, 27 Sep 2024 03:34:45 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e3ef9e8csm378432276.2.2024.09.27.03.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:34:44 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6dfff346a83so17401957b3.2;
        Fri, 27 Sep 2024 03:34:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpO5Rs7qqNuYLsf2yjH7aD91Ov0dhW+frSN/+vNhSEg0nuok1Ouvm1lxUxTNLaVD3DJ7a3Pft+Wqx5/KO9c0jOxDs=@vger.kernel.org, AJvYcCVN/PTmO6T00en7/B3svDAVAZNZvlUqgpAIw1hVZQWTpTIceNINbJ11pVRSH3jUcsGPtZtPRHFBcqYFUrnB@vger.kernel.org, AJvYcCWJ2dRvhTR5jcTOBmlc/Z8s8MSGVWFeq19ci5MsqM2eEZPvQ/7fVoGkFQXC2GPwBvy5kQ7cCF4jdut/@vger.kernel.org
X-Received: by 2002:a05:690c:498a:b0:6db:3b2f:a1eb with SMTP id
 00721157ae682-6e2475855cemr24823757b3.26.1727433284441; Fri, 27 Sep 2024
 03:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev> <20240926180903.479895-2-sean.anderson@linux.dev>
In-Reply-To: <20240926180903.479895-2-sean.anderson@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 12:34:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUz2boLeoaynsHHM_26XqNFCJhTLYx9+zEHCG+ZMRwKVg@mail.gmail.com>
Message-ID: <CAMuHMdUz2boLeoaynsHHM_26XqNFCJhTLYx9+zEHCG+ZMRwKVg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: salvator-xs: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Thu, Sep 26, 2024 at 8:09=E2=80=AFPM Sean Anderson <sean.anderson@linux.=
dev> wrote:
> Add SD/OE pin properties to the devicetree so that Linux can configure
> the pin without relying on the OTP. This matches the register
> configuration reported by Geert [1], as well as my inspection of the
> schematic (which shows the SD/OE pin permanently tied high).
>
> [1] https://lore.kernel.org/linux-clk/CAMuHMdW9LMuQLuPEF-Fcs1E6Q7dDzY17VZ=
qu4awKDj5WSTRt=3DA@mail.gmail.com/
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

There is no change in the output of

    grep 10: /sys/kernel/debug/regmap/*-006a/registers

before/after this patch, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, I applied the same patch to salvator-x.dtsi, and that seems to be
fine, too.

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

