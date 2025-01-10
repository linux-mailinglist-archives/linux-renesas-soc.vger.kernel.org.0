Return-Path: <linux-renesas-soc+bounces-12035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C6A08E46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 11:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36301188B43F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8002020B1E9;
	Fri, 10 Jan 2025 10:44:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B9204F78;
	Fri, 10 Jan 2025 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505876; cv=none; b=NTUZEPlLxUsKejIbr1UQdrVG0nnjlv+5PhLIMrsOz5eH5yrQF1k9gBE8wai0y8QrhRKCPGMukNsCT+9OO1zpuqZ784uw9KnOickYdPEf85Ziklzg7x2X2jBxB0e74788jeu9uU448IXgob2l8bdQqMKNAhNYL0T8IW7X/Skwqqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505876; c=relaxed/simple;
	bh=agf3JJiKSC8MxHetChU3HW7eXxz7CS18nBBAODmF0WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jd8SXh3g/skN89pxKrZSNCUA/7rVQ0g5lKNbzOlQn9mvDUTW4I04lRfFw83YOZ0INf8SIUlWbgG0qZxfbuDo4eZDMHNISjRS5GVI3m1czKeEPydvtas80QnyvfxcIVmj6BiMGWlEVMMkxhdAgWEmHLn9BMwupDRVBmZhraMfy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5188b485988so659616e0c.3;
        Fri, 10 Jan 2025 02:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505873; x=1737110673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IYn6iBv9GOoqMFkjA5sik9PJFgMGjrOTjphc5t3Ols=;
        b=oWGxPqUdFo5zTaerPGJ/puhT5Dl0m/0fwt25tHJ27JVix9sePod+OgDYNZ3w5CphOM
         2icDQr9/76D4AKLXPA0abqTg7D1pSeINoPwtXlvOgCnv75PbYWeUweLqv5QwPO8FYj+2
         LnNbxf8sWMyT9wz195QShZVlL97KQPIbtIOkOhFpAW0la3CkPGcfksm7X13MW4929vVq
         GzcBfsQLWr8Yax+TJDD3xRGQklK3T6MvC1q0ookFf3N4hWRsEgtgqQxmpQA6eXGQ2enu
         tl3rJfq5wnhlvO4Wk5DojZ4dgxL9RhhU90OdBDGiaY8yjw7ReKbb5Sw01VvFYSOAb1+2
         TK7A==
X-Forwarded-Encrypted: i=1; AJvYcCUcfa8adFdHfz/0chxNcrFH+DT8CQ0MFr4UKB2Au7KMe4mN5T9oV08PLIWCYFtS0l/GZCNtCdm9576V34YzbNnLmYc=@vger.kernel.org, AJvYcCVaMg7MXeFrko5dqJs6cMc0xMiLDpEa4RZcPDczl36PRxyF+Yshsp8uhivJxXLnui/RbeMQq7Uynim/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw0cpI1CQWcCLnIBPHn755FPsB8xo67JWRDEBcOgMI5d/M/0id
	HSKwY4avISs8+NOFtOMBIEqDi+ZFqGmvueYSMiGT5M7MMWJq/QbULan6571n
X-Gm-Gg: ASbGncuZmxEO5ouvl+xDUk+CZfWQ9B0i0knMvRXY0Cnhg3Eo1AoloTrUYmE6N8sDcYI
	I/lpJTbIQsBZX9DSbdNyWt0ISDlZ3wrQvcT/hXl9hcFDMTNXs+hwuvrbZ4KMDg6d4R1kxqFscwe
	B7zsTrAfCKmLe2H9MgyvyM5wwVIFU5GbEjRDD0qFS/fUMpU3l0p27bCcZvRosPyow+asVwopW6y
	CPJzqBwVufsqTjDnTWup4sKo0tF1lThm29JXCnE0MZ2ks9JD7e6+w3c75d0lwiHPRKpvVeIOXYS
	+bJyFM5IEYlKyGH1x6k=
X-Google-Smtp-Source: AGHT+IEfIkrUDhbxYcWw6TEELi/HXe5rGJcVq4n15p/vc9rBeZ821lc0G2Uk3KhdJDDGSppBFkvRZA==
X-Received: by 2002:a05:6122:2090:b0:50a:b728:5199 with SMTP id 71dfb90a1353d-51c6c50fa92mr8085518e0c.7.1736505873382;
        Fri, 10 Jan 2025 02:44:33 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fbfe3c4sm1875812e0c.30.2025.01.10.02.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:44:33 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afecb2731dso614552137.3;
        Fri, 10 Jan 2025 02:44:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW819tCypPpYRHs9Ljg92Tr441U65PWs9Ht8kSFeM7YxUjTDWzvmi6qT2SpdB1KyXTQ59QXDts28icanJBEoGYmIVg=@vger.kernel.org, AJvYcCXXuRomwE8btUgV4+imE5V7os9kZ3MvceBa3I2x8n4tNNAKkGYco5MbTHBj3nfVCKbW8PtZrW5WWEJv@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:4b2:5ca2:48fe with SMTP id
 ada2fe7eead31-4b3d0f46233mr9566816137.15.1736505872977; Fri, 10 Jan 2025
 02:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se> <20250109125433.2402045-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250109125433.2402045-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 11:44:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1D=o8aaPOAQLPEZw-Y-9MVzzCRGEykEU=39CYeuRW2A@mail.gmail.com>
X-Gm-Features: AbW1kvYCqigC3XlGv0JVomwandFA-1Z9Tg4OytZYJQlp5liP5Abo3oer5hvxW_k
Message-ID: <CAMuHMdW1D=o8aaPOAQLPEZw-Y-9MVzzCRGEykEU=39CYeuRW2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add FCPVX instances
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Jan 9, 2025 at 1:55=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the FCPVX instances on R-Car V3U.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -2890,6 +2890,42 @@ port@1 {
>                         };
>                 };
>
> +               fcpvx0: fcp@fedb0000 {

I think it makes sense to move these next to the existing fcp nodes.
If you agree, I can do that while applying.

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

