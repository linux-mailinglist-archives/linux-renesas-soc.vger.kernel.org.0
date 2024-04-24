Return-Path: <linux-renesas-soc+bounces-4893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36A8B0DE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 17:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFB7CB29E02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 15:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA74915EFAD;
	Wed, 24 Apr 2024 15:18:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C5115ECC1;
	Wed, 24 Apr 2024 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713971907; cv=none; b=ACY69O0t2SM9/jVnHJf3Fswoff+8TiMylEMxumIAemf6ut5hVBBeHEzOW2PZGhIxMa/SuZl03Q60S69DpxuE/Yp30qQmOtjcOGk2DT5TMZzPJq20D7uMIpc0x6BhRxXMuK3DIwOdOeXBjIuyXeJ9gtGMsq5q8wexA29k4y5CaUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713971907; c=relaxed/simple;
	bh=bnhphAm6zhNDVzfxC/1dDfXSqIf3i0rLm86SRDsEyJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7jFAANvHfqpkRan/FcJfHq+8YTUgBPnSykYVKV6XH0/0NMvjkDONGwK2gGsMSaL8COkehJOQHdNpE+Nn/yDPrOlgkCCc9vg9pyqC301r1T+ddevJTEgM/YQWmJ3YwdEhtjp6DtrUPviNfBRunul6Ki0MzVMh1Dio6dDr9pjhYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61500da846fso47756047b3.1;
        Wed, 24 Apr 2024 08:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713971904; x=1714576704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o82wBBP7bxXXggrt8LbGr/5/eA1GfirSCOilCtZtYrw=;
        b=PiS8KFIFfEZRIQcmpWZwDEnZl3RMqvkoFvWHBwDLy02axcLAZ/E2H9WrTIhi01aGb2
         imYR8Ji2ek25juIH1JIBaigxQzssqf0qXYlhD7WUo320oYYf2P7AUCtD7UKwp5X9wf6G
         cbGPpXUlwexqBYTFCZGy/7ZvbMSDA8tXAtc4eu/Yg8F2HxA3fkVPBsxMr9vaHQp8GDGP
         xMu4KwMMLK30CrPaTkjClur6kBK1vVeYJ9+1XqMC4JyMEeAHTU1WHVMd/IQWm4MkUTmL
         kn1cmhQOr/kHOdMVU7pmndYCAoG60e/jwFLUTfzvNi4nUlAU/+yfbAofoCjb7p+BArGh
         Me9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVNiE82wVZEJrXdSnf54pirlnI0xqEiETBQo/+8fr7xhnxjdpRHBrm7RG+1DGPfUqny2Q9RzJEtufZ6AkMowRGRxS/g1F2PfPNvABiO+w7N25J2jojJXI3JZr5V+Ig6QsGY2NwIJ8uKOO7qLvc
X-Gm-Message-State: AOJu0YxLikOkn0omdDQ+LrJSeGwdhWXUVizbPzy/cjhk/n7zRSgccYOe
	sQr73NUQ+SMoORVbG29iSD+ePR1r/3L466mpmL2x0hRMFGXrXdVn6AbNW5UeJfA=
X-Google-Smtp-Source: AGHT+IFvhPRkXFnfwFQ/khPnMIZx6JVRCqGrrSrJ/H17pNDnDAdYH/6KsmjoO/mZvMkP7qSuNNfM2Q==
X-Received: by 2002:a05:690c:74c6:b0:609:bfdf:8a32 with SMTP id jw6-20020a05690c74c600b00609bfdf8a32mr3062320ywb.44.1713971904197;
        Wed, 24 Apr 2024 08:18:24 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id n3-20020a81bd43000000b0061b221afbe1sm2858701ywk.105.2024.04.24.08.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 08:18:24 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6153d85053aso56125077b3.0;
        Wed, 24 Apr 2024 08:18:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKe0suIdBpdD2fxIINbU1UF9t+23TtRQVFiBTCkj/dV9P2djJLhiJ04MOoVhWgJzbzWMpH7PnWmqPux+pwtFv0ijbUHMea0pJmtuf54ztUWwu1W1zaTBRhDDNvuRmxP086yhwcZWvs9j/8xqly
X-Received: by 2002:a25:c78e:0:b0:de1:dcc:2a8b with SMTP id
 w136-20020a25c78e000000b00de10dcc2a8bmr2947467ybe.59.1713971903735; Wed, 24
 Apr 2024 08:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se> <20240413141806.300989-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240413141806.300989-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Apr 2024 17:18:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQTkYxF4X5wocZ83PM-6GtjYx2MGuEw-gjnFJatAA2fw@mail.gmail.com>
Message-ID: <CAMuHMdXQTkYxF4X5wocZ83PM-6GtjYx2MGuEw-gjnFJatAA2fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a779g0: Use MDIO node for
 all AVB devices
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2024 at 4:19=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Switch from defining the PHY inside the AVB node itself and create a
> dedicated MDIO node for AVB0, the only AVB describing a PHY. This is
> needed as adding PHYs to AVB1 and AVB2 will require setting MDIO bus
> parapets and thus requires a dedicated node.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v2
> - New in v2.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
As this has a hard dependency on commit 2c60c4c008d4b05b ("ravb: Add
support for an optional MDIO mode") in net-next, this is postponed
to v6.11.

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

