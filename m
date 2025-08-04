Return-Path: <linux-renesas-soc+bounces-19958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF7B19EF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 11:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663F73A32C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 09:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9164B23817F;
	Mon,  4 Aug 2025 09:43:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E361A9B24;
	Mon,  4 Aug 2025 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754300628; cv=none; b=paFiC6rx1roydpfajlbo0HoLJI7H58TMeFBDmn0aMOAlqKFcQwv/YuFgZ9q9XDmWGMfjWZoS7FnyN+E6aiP6FZHJbuOBo4L8HC/DBLdyuLOCT2m1vmhMvUhWOuAEylHEnZpCzHU9iCDZ9zvqjtDQpbPhe4y8Wi9TyuIAtAx0rgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754300628; c=relaxed/simple;
	bh=y9pLkhgt0Ccizs4s5RJxxqcp0C15RftzX1SgoTjSq/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kk5JI6SuE7pxP9mQn+5FsbPzzKopY2lgKfYDABea1d1GXfd1VqvWy3sIsITMyEWlyZ+LPms/wPaIzddYINMqZR17SrKa/qPo2EPd9nBMJGptgaiWwVyZBZbZEs9swKvGuaSCX9SnjuRl0w2+fMUk/YaM0njGXMjzbaSQWrNPvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4fc19b5fd8cso1228521137.2;
        Mon, 04 Aug 2025 02:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300625; x=1754905425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZIKIYY7AIN8Z9JlJH05Fdqi4ZKB0z+Tx/3HxshEMac=;
        b=Rabu/SmoRvFkpsFJIVW0AEXuNfVfd+Wq1a5Hmy8wkPm/fBYrxzZVpXkx3oF2JXrR1d
         IjoIKR8bJR0qvDCJWuXuokKpg+Xb12ArLxJVqb+R6azThZajn+9PndyKJ+Hee9A+7dmY
         Sl59k/2ekFtcXezXjRn9XFLbHXQ6i2Oj74poE9crYt7wk5ZbjW0aZg/wWA+BCVNz7kP0
         3uefueZ4w5MTHHL7V1YoJtDXWcDs63lJE8UOyL4Uz/mWx2jaW3LvmmsjbUxI6FSh8OPg
         luIRDaDNPig0woW1B/4kC3Tt1bjIWTu/3Q3LrIkNNqvQDXUkDhjwsnoZkGrUlhpW42dk
         ebqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1hXXIMuzmA+5BZPgLNingyIqvC3CA8pGfFp9j3jGc+uvHKlLIcLMRvaPcVX42NZVQxlQItLslmpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKg6i0rdVpU9qRJBevQpxMK81I3Asy4rp/0i6al0epdfiYvHn
	B0OvvMBlm7YQU1U6o6RErHHKxXCJQQejZlC77xoagS5q9fFmHYHw+dYxsx8EOZF+
X-Gm-Gg: ASbGncvPeVP/GCDjhFing0UJAbhWXyBlPisTygQ0cmP3gh3KxLDtAbQ1bHE5a1tw5wr
	tpKTWOIguCGyIWMasPo6ZODc2CO2YsBwQFtvVoKeZhm6LgoCdF+FaebQAjTu2rE0+Em9KWVFb0Q
	8KOPCBj8KMA2sgS7h+SwJ7G2PoVjH923u+0oactpB7gQTS/y9lXAkzildDixms9njuVtv1lVnUj
	hEtgoIM0H2yV26wRpMxhN9GY6f7AJNM7jCWeYrjPRhEi9HMf0YgjjgvwXx4shjiPxnnbK1yBg4j
	jxUj0+y+1MMavqKsVWS1O+E2SAQ+FesP24jMqL4P06YhvddvN518XXnWbHPpho70cUDCtb2JQz0
	F6/XtZrCa0LrzfUmZgaddTOmS2ulA/5Hw3imjYVqCupGgMIFmFP59I9Lwl7ms
X-Google-Smtp-Source: AGHT+IHV3pv4ldLxywKWQesm4cKoLWNP9BK/Wo82a8II5PsaCnM62SgWAEX45w9W0M/UsUabscG3jg==
X-Received: by 2002:a05:6102:2ad0:b0:4f9:d929:8558 with SMTP id ada2fe7eead31-4fdc24525f3mr2906070137.10.1754300625492;
        Mon, 04 Aug 2025 02:43:45 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d46bc95sm2405923137.16.2025.08.04.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 02:43:45 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4fc19b5fd8cso1228517137.2;
        Mon, 04 Aug 2025 02:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgm/aQCB5D99pe4Lk1wU77orr1ZXhJMVfi8W2G0WFMEZ/SwdUkDzGwbJPvXKhVjB6qIoDawMzHCXI=@vger.kernel.org
X-Received: by 2002:a05:6102:41a3:b0:4f1:2ec7:af39 with SMTP id
 ada2fe7eead31-4fdc430d567mr2793624137.18.1754300624870; Mon, 04 Aug 2025
 02:43:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630192438.38311-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250630192438.38311-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Aug 2025 11:43:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNuVe4Q3KeJHj0_Y0PToT-GFbY3mDuFAjCXL96ujaakA@mail.gmail.com>
X-Gm-Features: Ac12FXxgd396bzMWiVDTULyH8NxGcjzhcQjt067ARxaBXu756pUckz4gxzAP61E
Message-ID: <CAMuHMdXNuVe4Q3KeJHj0_Y0PToT-GFbY3mDuFAjCXL96ujaakA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g045: Add I3C clocks and resets
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 21:24, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Extracted from the BSP driver and rebased.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since RFC:
> * seperated from larger series
> * refactored because pm_domain-array is gone now
> * rebased to renesas-drivers as of today

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

