Return-Path: <linux-renesas-soc+bounces-15142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E55EDA76572
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D565188980D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5AD1D89FD;
	Mon, 31 Mar 2025 12:12:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096701BC073
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423141; cv=none; b=A0HtSHH9cR2ysou1+lH4WPgj4O6AwDWbUSLKwy6KPdgrd7FGEaTSsr/Tpz/xnWVTlGqdI84GA4SjndNYirtC8mQGVpLZp8Ub8zTDVlObp9S9SH/bweGT5EP2tuTMSovYchii+Gl/ajhPBK8Kyc+Ejnx5R2JBnQ+ua+8GYS4E7Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423141; c=relaxed/simple;
	bh=QVT0SHUQ2hNWKctaY9sqGpJTjP0v7SO0UuaqjOC3kTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5dYxBVDbMf01g87I91lPCvR7E4OLnsC6olhC0ciX5enAlPMCpip8CbgQQnNnBNC7B9Z4ICQW0CtYhSCODbAi6pgmnHL0GNExw3dI9QypkZk0YtcoJn3JJ7bKq4XT6ZbLwG+C8sItjdqNLIPyUxxi7YZbQJNO15uYvEYJ5plFzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5262475372eso471333e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423138; x=1744027938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMuBszkaWUgkZfKnW7gk/Ik87DfWRBIB5YM2M9VW4kw=;
        b=LlIbYgluUfLF9sVBKJ6ULIN8bhjp5j23cBcojvvH/GzFc392fMdtBDERl8o4Rpqzc/
         TM8RvUZbrBlCY1k4qwK5istNKk7DN+pyW0AmiNnH+eKV41hK+8wnzjF9YEszJrEAKlE0
         dLCFYX1ls9cg4AU5x+5SlwpWE1TOlZbnNlSvk9N58wcsM2uWlbmekIDmUy9a+WFIvOUe
         MlOvImBJv7yCW8FaXgqq8hcyjJs//tIW3kp2+g5/uD7Ir5ARGZ8Tm8H/DPnauWwcN62d
         S+lf7g4qOI35ixexK+m8Cfor0GQFoniiSWUFxM5Y+/GrJ6m5o2sqgYr0+ICN5lqtkqjg
         ZU6w==
X-Forwarded-Encrypted: i=1; AJvYcCXl10pNqX6FepH7HlCJ8ZLKf99CgQ1x6aKPv0CLM1d0igKgHLok9sz1VDVExdtBemYUn4Grg0CW3MJNAjYBb8UU0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+xi1xpBLJIGYufo+A1xuM5etZ6dNAIymc14m49gLZWz3EBTd
	t0Nbh4VSPwPI2GT1IOQEFFGD58deeeplnhqyhqYTNCYLhT/kvKRf4Ytg+mjD
X-Gm-Gg: ASbGncsNVM/v7zxrLvBkUboE3YeGPcaBTXiwXGSuGnIGss2phWnlCyu1W//M6SgQeSI
	nzN7a2jK5TICfxtjR40+zZjBjKYTyvadsbzglj+fnoA5c21hcpR4iYSQQBqgM9UbIMMn6s0tUFj
	drPs3owIFaIE7rRypKx/KSpLFKSsmIFuqN4vXErlJRt9E9cSfyfJPeO/eY2K+bxEKdHr8a6Giug
	yLuZVBJ5zHQvB6Zh8S9juLkM89J47Ly5Dga5GJ93yGUe5M2b8FSbe3loLpYW9sXN+tKM7z+2fDR
	/0SPpMhOxQPo56ucwkTVgau1XqeEK2NVDsQVEMWqiKye44vXM7fiXBqHHNbOQujwOZX28kH47uD
	z3PmmWp8=
X-Google-Smtp-Source: AGHT+IGqHFsxqCLLIhrmeMd8diaqf0sNUnnWwaCpwWaSvl03p2BXpgWrSfg0QjhoZO/7zXAZ7M+kKA==
X-Received: by 2002:a05:6122:3c8b:b0:523:9ee7:7f8e with SMTP id 71dfb90a1353d-5261d36a655mr5131458e0c.4.1743423138484;
        Mon, 31 Mar 2025 05:12:18 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260eab3031sm1511687e0c.33.2025.03.31.05.12.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:12:18 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86b31db3c3bso1775452241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:12:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9Z1IdCMHUhCFU0/J4+gfh2Eddaax5/y+sRDg9Q8p/j4/oHQu0/HJIuLdQmQs52VYi7HHaVUkvuVNiuZgmIUyPPA==@vger.kernel.org
X-Received: by 2002:a05:6102:26d6:b0:4bb:cdc0:5dd7 with SMTP id
 ada2fe7eead31-4c6d39609b1mr4578795137.16.1743423137956; Mon, 31 Mar 2025
 05:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com> <20250311113620.4312-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:12:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHgsVoxWgZggaVD=xGuG00_wGS-=XBZWSAJY7bTBZeLQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpzgUsrunoyLs5o4IluZ9b4Brq7xk-BtSMRvSKhmGoQFT0rBdSCqVq_L9o
Message-ID: <CAMuHMdUHgsVoxWgZggaVD=xGuG00_wGS-=XBZWSAJY7bTBZeLQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] memory: renesas-rpc-if: Move rpc-if reg definitions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Move rpc-if reg definitions to a header file for the preparation of adding
> support for RZ/G3E XSPI that has different register definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

