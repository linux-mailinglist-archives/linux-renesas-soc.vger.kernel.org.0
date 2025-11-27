Return-Path: <linux-renesas-soc+bounces-25288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E98BBC8F7C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 873623545C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2B52D0620;
	Thu, 27 Nov 2025 16:20:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2B22C2346
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260427; cv=none; b=VAXtuC/aoKM3akoF+k2WOyVfzjcVDTQPX2Ol5ywOTkQaK2F5MbBI7KOZQucNlDrb3DaRLgSXrj/MAIJVBDcmW9SA8wAvyiYAcX74lJQT6FWVXEEYxTBYzB5xec6L3gYKcLb9pyCV5jF7OVly+LSHkRWtr4oHzmcYXbSV0I8NrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260427; c=relaxed/simple;
	bh=4rtfzK78cXnQXXn5kiIBDF25UMoQQqWt2h3HDykkAF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYCsHbINTI0kKL36BFDlGpEdaqe1MKNq/IEp4RzN8oUHiawisrMTETrJnE2R0ZuH2hgrG8bOPtNEY3JdeilqLK5mMCKh+0txbRW01to9c7aRSnyQxmuUU4ABNyOwbpEGNRB553pUbD0GR5TqGuoHATaCzW7cCxjtxiYc0lPdHdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-935134ef989so581777241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260424; x=1764865224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpFIA721TFdBgfKpmAY4zHoBkrJAMnblEWl8naPJ3qM=;
        b=AXhRrG1lrlQxAmaf8SSw4OJgzeRUuTfRaZaRUWToTbfYyIXOsZERyyqytk+d836n3U
         imHwOqhmRlxJ8mIUUhaPgz3+bT8U9f9s/8clS1qLpLWZBDoCmDYPryDEzROIM3uLbz93
         j1TU3z7f3HO0vEj3+FoiO76iUp9AkCjz/FLYk6AuMBC69O8qoi489/AXh7413nwUN2gZ
         9OGwZvW1G6L+978nECbd6hDuS62/2B+8KU5sC/OC/7oLy+uis4nfPLIBt+QPh5BRUP/8
         1penJhTyo9KfewMKTexSwF3o98xkKF34Ept6zDDFeFpTWt1mnbWRtB0+x0aGohsXxnq7
         LWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1sbgM2QV3AtuHC2gAu+hUsgekDrn9/eY+Bd+3lqaTLVPJosVcX9EjCldcReR3k05kLENxqe8iZDbM7trilL+fnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhaA2KbZW5mwvtSQFTgynIGYD1LdsBR/rMhzJDKmu19KWzxZyo
	OYWMK234QxwyIBZGJ9njbj5Z87hopj9clTjV1SJWPIVwV1BM2JJxkkgey/3kZ5ob
X-Gm-Gg: ASbGncu2D0xrcQlB5i0KOPJH3l7teIKQfs2m9RbFkveAuGKujnvUoQYOlaIyU68JZaJ
	GaQsGs3pjflgvoq20vU1ZfNP5O+D1JeFBt0k7SaXRQ/xpS8H3fhyl+TyTKfDWfslcDEZZTQK4wB
	6L4TYo10fN4wG6GEChInzehZEvE9wF22NvuUwnIOahn/jOpy+htz9IcYf/i7kxnR95WdJUTejMA
	Msf5fYb0BAVs/vAnajpNueac2NeyJaNoouYJTpnH5oKGMAcv0VWxB1UKZrGoVUuPFY3gMvrTO/Q
	VOlyDlwSfmqrmi9t6id3wLlEbpL1ckhH5q5orfmZQdFWi3KgxFvnHRdcRdxSwGFLcx/RrP4N7pT
	bf0nItZSePPigz0y4tUpqgwGaBv0Kx/mRN1Dbwewn7waPoxk1EHFJ84liE2rWykdkXX8CmFY9W8
	ufkNGeP/ptjhx7F64jt6c54OhIHhE0QcxT2831czQfVp1XSav6yONzmBlTdwM=
X-Google-Smtp-Source: AGHT+IEEIh3uoQXtCyvLbZFWh5yXG8rmu6bUmWyQxN4+id5Z6czu0B3Ky24dvRBOUE/nEkNBhIbytA==
X-Received: by 2002:a05:6102:54a6:b0:5de:736:71d9 with SMTP id ada2fe7eead31-5e1de273d4emr9364642137.28.1764260424188;
        Thu, 27 Nov 2025 08:20:24 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d91777csm651922137.1.2025.11.27.08.20.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:20:23 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9371aca0a4dso588888241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVde3eI5HtwMNb2wZiIknA6aG8vGpVXoMAALCdL+lDwy8TDO8i9CGrHT9aVoH+LABKpvCgwn1aWT/6I7F95NvAmbQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3909:b0:5db:f615:1821 with SMTP id
 ada2fe7eead31-5e1de088006mr8004050137.10.1764260422540; Thu, 27 Nov 2025
 08:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125221420.288809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125221420.288809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:20:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtAxDq9MH0zR1keWnJ1nLaqTUDAVwuN-ngTJw9UbLVLA@mail.gmail.com>
X-Gm-Features: AWmQ_bmc9OUlv9NMena3T4POG5OSA6IiYFHh0B_sZxbPumfQc2XjQuB_ds2kumk
Message-ID: <CAMuHMdXtAxDq9MH0zR1keWnJ1nLaqTUDAVwuN-ngTJw9UbLVLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g056: Add entries for the DMACs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 23:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the DMAC IPs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

