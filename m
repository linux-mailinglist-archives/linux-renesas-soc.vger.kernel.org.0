Return-Path: <linux-renesas-soc+bounces-6327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D87690A816
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 10:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CDC01F21C7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 08:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F031862AE;
	Mon, 17 Jun 2024 08:05:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD96A48;
	Mon, 17 Jun 2024 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718611539; cv=none; b=BPLHEAV4rMlt7xtOdaha6EIH5Ax+yGtJ2ecmNjW98CzA8D7aaKJMGfqX4E2ZL9LNgbpdOAQrXtXi0ZzXWMA/Al0FjgaqSUJs17TpkmVbnwgTW2DUrc7BtBQ30lXdD4wdwKr6Ndw5R7PrB4pq/XeSAho+AXnbvKYJgVOjDaFNlHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718611539; c=relaxed/simple;
	bh=OjsLavVhJ3gnb4N+l8jSUFK7ZC6Q3rgbMegsvQY3ang=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBLAhX72lzB+T5nNNJMPMV1Y3aO6NiXktivSPWprwuJ6udI0zdYYs/0vNvrJ3E+JRuQ8Q8c73qUCwQiLCX9GnmTGssjgci61IBVHB8mtpFsLB0h+drCVE5BUPlrYgE8T/WltXQ3Un5YfCyU3QHDsgFCi9d0aOExHEwkrdV13fWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-632597a42b8so25786097b3.3;
        Mon, 17 Jun 2024 01:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718611536; x=1719216336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUXvmmVuBcx3SnmccNhTKf6C2uYuISFtiAnpe9jq8rA=;
        b=dcUguoWtJFnkuKBeHaE0vQgk8cRM0zOC0eJDZ5l42uSYLqJioL7w6DKZO/T9NFUDM+
         cKgC4kb+Vx/GvNOyPMXKtl2+G1U2LrSFYF7SpP0147LcaWHisEFSWdJOFM4TYuDQSj3a
         aKmK57wK5YP1euUhDVW48szCQjS12SV8dVnM4/n1gTuj42jeQr5m2yPKEGGaiE58r26h
         6FI5I4MW9Jty8DQuWhrXCkszh4ozGasrTrKxPij8VntzRY6LHRu9CNByMB0Ie0gBv0H6
         9S7IBmEdASHCqGRjl9z7Ar6ZodtHnlX6qJL9qxA5y7pACLveOW2lhNatSEUy7hqKGLYS
         02KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwkqlPuF2w652j9vBkzSEATeKk6pLDphCKYcaL0qMkFJ1uVXZCa7/zcSIdCFbIxfUarOWuJjS/WCzHc+zIbnrVkmW18jZppAx1Cv2K1vRyp/462H0I6hTUGNHubpf7iZpeq9RHxxMdFDJTSlGX8Kd4WEHoiEHHFh9+br+7/TTUPD/QFqtjohCm7bmVblIttk9TyMTVHRNG+3bW7x4HxN//lfnh9qVr
X-Gm-Message-State: AOJu0YxMa04DnUFMjUYTwIwU540sJFOSRIwR0HUH5tT+2y9TE+CeDes7
	9x8XCTRtWcGgbVfC/+U5rvn7Wb64akvxjrrcBviWp5ZiuCByyCMhDofzGCdA
X-Google-Smtp-Source: AGHT+IEV1SBGzmazgVCaR2E8ldAUYNAUrioR1l1bB1V6sD8xEIQSAUqKZ2W1oNGgFabPhYTsKvxn3A==
X-Received: by 2002:a81:a0c1:0:b0:62c:e82c:398a with SMTP id 00721157ae682-63874659785mr6715797b3.2.1718611535675;
        Mon, 17 Jun 2024 01:05:35 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631183d7eeesm13410507b3.16.2024.06.17.01.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 01:05:35 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-632750bf73bso23885267b3.2;
        Mon, 17 Jun 2024 01:05:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUr7JKzB8zzKH+fH9uqi60DG2q45eRTDQudu7G7EZfTiZZe+ukPeoUrTgFSZWln6vPMNJLllzIOUFKPw+96QqBD8eaWmW6Lq+cI8InMRGQg4AhnTujI0fBA7Fxh4bDO5zKgl4Xp91etMR13Mk7nyp+Af1Vv2PwtFXKyET+7xQVaLVIvip8OEexuSSswP3UROACaZllgJMy8Eo8zrS+788tGgxzwqQwC
X-Received: by 2002:a81:5b56:0:b0:61b:bd7f:c9f5 with SMTP id
 00721157ae682-63222758bb7mr91352297b3.4.1718611534205; Mon, 17 Jun 2024
 01:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240610233221.242749-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240610233221.242749-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 10:05:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9xahD_t6ZKpSJ2K_S1QMjW5Cd90DR8XpOhbs6E8KhoA@mail.gmail.com>
Message-ID: <CAMuHMdX9xahD_t6ZKpSJ2K_S1QMjW5Cd90DR8XpOhbs6E8KhoA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] dt-bindings: clock: Add R9A09G057 core clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 1:32=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator core clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Dropped the module clocks and just added the core clocks
>
> Note the core clocks are the once which are listed as part

s/the once/a subset of the ones/

> of section 4.4.2 which cannot be controlled by CLKON register.

and we can add more when needed ("append only").

> +++ b/include/dt-bindings/clock/r9a09g057-cpg.h

With the "renesas," prefix added:
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

