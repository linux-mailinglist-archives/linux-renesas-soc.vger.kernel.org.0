Return-Path: <linux-renesas-soc+bounces-10734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 175BB9DA9C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 15:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7807B21405
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 14:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FF11FF600;
	Wed, 27 Nov 2024 14:16:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC81FECC8;
	Wed, 27 Nov 2024 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732716973; cv=none; b=IepsErJ/4tkECcUH1Keb2dkVGqGklQRsxVY4SvG5K3+IM9fXP7QIdQ9vlw4cV7pR95fxATnHQz/9eqDKeDJRok0W7KIxdIVX41N2irjFjs1CZc7od/xTl6fF3f6JS6wbn0BfJ6aR6p7SbUi1mjBAc/lUnUlWDiAjZUXa8kBaU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732716973; c=relaxed/simple;
	bh=pqIHHXZd4srGjsi8amMWkPGlughGUTLx9vrbVzfQBxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0vf59aGVltPpBbT/GbN/xkGxbXOVi2UFUA6SYkj9owyPs/NuQFzepfcdKoTjenDuI5nq6ck/3I3xyLmfmt2XEnEl7Te5+5i3BiJHzswOUdK0dvYHlnC2d6aeyoOtZ7CmERwZ+wh1/ACwRLLedbdarpf+flRqIn+FOYkV64QbYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71d4ba17cd2so1749062a34.3;
        Wed, 27 Nov 2024 06:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732716970; x=1733321770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dfIkgsTcA6mxfbjLoofIZRvwxtZ4s0zf1nK43EqhzA=;
        b=QRieyFtt7agW9+tCxL1R5kOhSS6ARJOSJyrqQZOn4vMEGDDd3JmHYnfhjma6wrRHgT
         7qURXwLMpjEUIr7NkXQrAswu+CSvTvid2+DA79tH7G5xMc7+yY+CxoWYgperxVH/M58b
         mIT9Lv+BLei3YwFN6781zLTWbY/WAroyWAtuIam467nLXahx+yfLpOaJ2VFACVCF+PnA
         kB1k1uL4x/wAVhdJwJLMSlEWURByAvz8j7j1TJcq1PWGO3m6vPOKFmqwyxdnf1Int0ll
         2TBSVy2oIkYc3qpuNC0QXmeGNsDajarS3mNKFatul2d05+PMLZqDy+6Z4STdNlKnKOne
         8q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYFHb0S6SguSeiObvhmNj1th1iQp48z5l8QaM1+KjHHwu2laMglpgO3timxEAMrZL9lY0kksznEaYg@vger.kernel.org
X-Gm-Message-State: AOJu0YxXkqE/0fH1wDNvGPX0PrAq9WDrjNbrDgCXqGXMMII12Uq4RQF3
	aWA6KatT/TTVyjs4qGIKNjlONWAtQ1yYUlerQccpcmPA0azL7xyKE62dNHlT3rc=
X-Gm-Gg: ASbGncvZrS4mqyHULGkCz9zXxKPmUcXrz3zBE+C94unY+2nHFHYVHldBLz1mzO1cEwc
	22jUoT3rdyU6iIUI0+bg/Wz0BqkQAVHpWFYFTYTvadXMrJcOo2KA1I4FngEW4a9qw65tYATeKZr
	gne4TqWvex4bfmrYHyTaxVgAK7+ZaC25WDyVefgIynsFbu7FSQpMiMxVKtg4vaNECeao22kpSjq
	QXknuNPuM+oA893H4TWYPtaBcxU9J41MPgso5qPiifJUGaoqB5cJRS2bMxb14tquhnryYvZM577
	GTF4gcNqewCS
X-Google-Smtp-Source: AGHT+IGYCslxhPCfJpElerLoU2pT7If5HDujU8PaWx6JdregbkS5OIITK6Gfm/MwZNWlgrjy6KR9cA==
X-Received: by 2002:a05:6830:7107:b0:718:cc7:c6da with SMTP id 46e09a7af769-71d65cf67ccmr2678823a34.22.1732716970115;
        Wed, 27 Nov 2024 06:16:10 -0800 (PST)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71d532bc530sm1715177a34.52.2024.11.27.06.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 06:16:09 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5f1ecd0d9ecso1464470eaf.1;
        Wed, 27 Nov 2024 06:16:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgH3iG4W4L0+zgHVD38rpQSTDUYiRgUbyae70qRIzaDGUzEPs6NUapfIFTmNh6xiaEcJM4VVJneNjP@vger.kernel.org
X-Received: by 2002:a05:6359:420a:b0:1ca:9793:ed68 with SMTP id
 e5c5f4694b2df-1cab169cfe2mr229843555d.23.1732716969188; Wed, 27 Nov 2024
 06:16:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 15:15:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV08gKBpSswwa1prvohC_+AGceepty=X8=8Q4CChEJOSA@mail.gmail.com>
Message-ID: <CAMuHMdV08gKBpSswwa1prvohC_+AGceepty=X8=8Q4CChEJOSA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 9:54=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Enable I2C1 for the carrier board and the connected power monitor
> ISL28022. Limit the bus speed to the maximum the power monitor supports.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

