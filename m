Return-Path: <linux-renesas-soc+bounces-5939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7F8FFC63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 08:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C689B23C0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 06:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E95215250B;
	Fri,  7 Jun 2024 06:45:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A61152DFA;
	Fri,  7 Jun 2024 06:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717742716; cv=none; b=pN8ERn3Ddw+0/gUIJ5f3cUS+1hgdDNz6i6+TQ/z0LNgqWolOZR2O7YkTGg5pvBhNZDFFuGtnTq6UknkexkEZsL9W6z5vEHoJdhkFGMaPBz+8gjrXuFspwJCqpcK+WWbJApkRcgX3dUPH4QcOgIZbSgg3KWYO73nIhdC5kJBZugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717742716; c=relaxed/simple;
	bh=Tt7wGf5r6A1DPuCwWsNDsJsIUsvg2BAR4XeRT1ZxDmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZgdo3B21ejdV5VCrEXKwWn8h7Cme0Qt+JYoqJ+u2UItZWdYuG0HqVGM4sP9Jstiri7nrQhasLzoM2cf+HuuaKE57AbVrw4CW1Hjf6+oWC7i9X7MCiVe2NvIEvMO3VgIKRNeja+4Qjzu6IKyF+8KDQnO0txhjDqI8zXXqD5AiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62c5fd61d2bso18495977b3.3;
        Thu, 06 Jun 2024 23:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717742712; x=1718347512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0nm6W6z+nWCGtg8+ffUSCXn9uQtiMrDI0bjCGFBxfM=;
        b=BLXfiDz6KZgedNGkJL8IsXcb5xn5xQYQd+nP2toe2puOPBvKcVJT/ROWWWC6SlyWlZ
         uiG5Vae1/UOuAPqFl6nryQGK0PaZaMTMGHH/ey47iiuhJxSfl5l4lhZNcXl4ewGEaaIH
         etjuPQl992OjeDkJI0h3PaDPqG9EzFFVmHL5Z0BxSvAciSyppsoYyI3dDNZBNkqbKbYM
         H0NpC+Rzw5hEPONuYYEAyGFZZnvv42MdN0df4jwxKZBKLV9ejI3muLpCw/R7B+s7aHHm
         5W9lrotdidDW6R3lROtFT0mqpO+Qso3g54Go9y5YhzMYFhV813NbG40vOAvmavt1zloE
         8ZPg==
X-Forwarded-Encrypted: i=1; AJvYcCVeASZryJfrimXF/xY/q3wPnaIw44eN4pAGZrE5sXsYwFeEbhN5Kcz3fu/Tw5IT4RTlZsVaCuRT7z5IVbbNe00a040AXGd4sXOH
X-Gm-Message-State: AOJu0Ywj5LJQuxW2Kz4dyurOU/rjw4c2GzbnJzSdnssxYheJDfuVWbIp
	zauvyH56BfREQ1Df2bDsanKw02+8tKukbX/v8ZKFd0ZYdJsVbBsq0uYdkInQ
X-Google-Smtp-Source: AGHT+IEGGIK48sAA/8KQ3Vl0DHPc8Yr5+DJNZJZCJewgpyzTP3rvp9lwCHGo7V+NqOZlpiW7YQKNBQ==
X-Received: by 2002:a81:a08d:0:b0:61b:3345:a3f9 with SMTP id 00721157ae682-62cd560c896mr15867947b3.31.1717742712476;
        Thu, 06 Jun 2024 23:45:12 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccace6404sm5655037b3.32.2024.06.06.23.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:45:12 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfaf512483dso696771276.1;
        Thu, 06 Jun 2024 23:45:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXU/U+Q0gwyaZNsFUE1/sOVJXLTZR2PVijQZoQdBP+EtuHrdx9ia+8GYVc3VzBN0m7ITivpUPd8eUk4zZxWiWLxD/TQ7rcCT7Uy
X-Received: by 2002:a25:bd0:0:b0:dfa:ff6f:b54b with SMTP id
 3f1490d57ef6-dfaff6fc4b3mr517285276.7.1717742711459; Thu, 06 Jun 2024
 23:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606170858.1694652-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240606170858.1694652-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Jun 2024 08:44:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqgHRT+__7o9wXCw6zxwZS7CP=z8Q3J3JQg8eMp30CFQ@mail.gmail.com>
Message-ID: <CAMuHMdXqgHRT+__7o9wXCw6zxwZS7CP=z8Q3J3JQg8eMp30CFQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a779h0: Add VIN clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 7:09=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the VIN module clocks, which are used by the VIN modules on the
> Renesas R-Car V4M (R8A779H0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Fix names for first 8 VIN clocks, should be vin0[0-7] not vin[0-7].
> - Fix parent clock to S0D4_VIO.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.11.

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

