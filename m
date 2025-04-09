Return-Path: <linux-renesas-soc+bounces-15660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD6CA82425
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1408A427C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B4525E806;
	Wed,  9 Apr 2025 12:04:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97825E827;
	Wed,  9 Apr 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200262; cv=none; b=ieI1b105YV6o30VoYcUpOic00q2Ir1BjjHQ2gBwEMczxvx8YnCg7CMqNVpA4j9f/hazAfTFZxJcFb7J6pMRuesOSL1Q4wuc7TQcP32lk4dU7RsMseJIBYpKouwZnCiBwkkdCKT6YaSegLvC2U/UpvT1cNoer3Pn748AsMjTfYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200262; c=relaxed/simple;
	bh=Zl3/2HsLnkQZhlP77mjqoQWm/HqvOUX4FHRc5EWasKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNSfdPZi6a1RQ05+8St+KdpG1khtbG5w7G/X3nYtOvXz++ZN1jO3BthQposXNoi/cN7bdGWLVv2Zx/QWBAyZJUWqcTgHbrWX51JNUOBzZ+SetZW45kYjVzR5kS3A4cCxC3O+0LIFfbUYwUcy9Z7sL13aGYxP9hkIpL+9H/eSGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c597760323so601829285a.3;
        Wed, 09 Apr 2025 05:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200254; x=1744805054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmzH7vMjvNAAyBuDKK60gCht3yz0VYvg+ozYgMu8Zyg=;
        b=Sn0+zAY/YYSPROAOrr6wceur3xypSgVV1OimsRgdQYzhkcu5OtPGaY3uss9Zj0IGEK
         6r9ERPXgJsP9eLCGR7KPbBbIRsQIeBnDfW/zFdMdKTDyEDpZbsCVBacWvT6U/4lzoZWK
         v78jPR05K1gzNOg0P8ZogPnr5O/Bu6EZgAGfrWEmIX6UB4U5FPzMgnC7ecGAp9RT08DB
         /nd9kmOVhIMv7zP/3en31vIll+thMe5DAxfZcDJqDCVtyA+BEWjDGqP8u/DosAtHg7c0
         YWCsKkQH6sKAdPU1gCYBJeDL8IMBbuN/ET2Ur+aKiLDv4SqUY7lV8QR+G/2qUBuErYNL
         Z6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCV/MKkkDxlAmtXTZNx1cn2uANUMwAsUE9LHCA+Gq7pNq5iahBKIFPHl7pz5RkH5g8U9ArRrexCpau4TIRKAeVGlCMk=@vger.kernel.org, AJvYcCV08QC2sFwHTnja/TupVsaCCZ4OARhWc3kuoshZKvajIvDiRnolW2FLfPvOsSmIoubZsjSYG+zVaGE87xao@vger.kernel.org, AJvYcCVeieWltp4Wogmq2nN/Shh3eE1ensXATuyo88eLVt9TkBiOzrCTihk4HfgVIXVEZ9U1THixorVN9RP+@vger.kernel.org, AJvYcCX+388ViuYEMfMWkt3HgzvRpgx6KY+KHZ8NtFozDxb4VEU8i5XFHKtYDFTPDQl1vj7KBBhCSPZ0tWda@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ2BEyvlSJFcrCP0QkFueHvFk7MoYE0UX3z3w6roMWDZ3V/jBH
	kvy+ZE8umBieL6gfSzxdNW2p2WJDLkIs083u5YozgMLFO7zLj1lycG0OlIjIbd0=
X-Gm-Gg: ASbGncstJHCHguZfbQpihLbBv2eipbVuCNSG0epTZ9K9f9LkknYeuXHMv0k36pv4kQK
	Q9U7s5ZbFwb4N5ylRmqUZIU7Ri1ja9MMKk55/4cd6spG4dtkL+bx6cj8hGJj0WS12VchFCPQV4u
	OWdacwW0oiP7wk+QaC/jDPAi/+Yr2wAl8/Cm79pD1u9LV0tar9cbD95paWCFFc5OtqyV3IW3M9N
	uddCZgfRKiaAv/EwkugZ1uChStEfkN7g1nQUPyXbaP69UFoC33bdNJKWLsA6VVOpTBgMkdqJZql
	yn3nZVRp/13tqW9jiSxdOOzd+6nDn2W5/aKVk6K9xqDVk3fKkU4rVLKkzGZSSviGut/AzflHscb
	beSURvi0=
X-Google-Smtp-Source: AGHT+IGiUx2tIebJJMY7NsYZIENE44uBtP5y4rTW7h5UFICD7WbnXGCkD0zfYxajDSH13n0Tsfx0kA==
X-Received: by 2002:a05:620a:801b:b0:7c5:a513:1ff0 with SMTP id af79cd13be357-7c79cbec027mr402949685a.34.1744200254287;
        Wed, 09 Apr 2025 05:04:14 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a10ba65esm64505985a.28.2025.04.09.05.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:04:13 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5b2472969so657641085a.1;
        Wed, 09 Apr 2025 05:04:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ4XLkWHwEQxPiNIglRBFRdTSIyEFz2Im25C/Yywi2i+qh/nTCZ7DHqzkC1FMJU9ZVpwULmkdxGKZSEGbby/JjLpA=@vger.kernel.org, AJvYcCWqMO9AGAb//GfUQ3z9VRxyA5fhvF2NBf5ZG4MrlUQEGB+9/wJbwuNAiD5nkSDuZKzSM9OejKEfjMfG@vger.kernel.org, AJvYcCXlK0Ynk9gTLVymhqA7l9KaUMYeU+IKVcsuGsDg/OvkZ2iFGtgPgPM3VLWNwxOjiIwzX2/umq82EEnR3vCQ@vger.kernel.org, AJvYcCXpgo5oAxF5rz/efRN+MIWvskUKNMDDgI/yjYGV4OD80d0N15bALKyxSN8yjw4KEC02jQGTqj3Fe88k@vger.kernel.org
X-Received: by 2002:a05:620a:8015:b0:7c5:4bb7:8e45 with SMTP id
 af79cd13be357-7c79cc3735cmr500823285a.40.1744200253727; Wed, 09 Apr 2025
 05:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com> <20250317083213.371614-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250317083213.371614-3-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:04:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYJvStvfM+-kBmRPm=WGK-jdgwRmRq3XCYkArme1qABQ@mail.gmail.com>
X-Gm-Features: ATxdqUGL5Wv9cNxrSU_wKxf8voEFlXfaWsna3HsZsE1FeXTUErHgIxsiXEgoMt0
Message-ID: <CAMuHMdWYJvStvfM+-kBmRPm=WGK-jdgwRmRq3XCYkArme1qABQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rzv2h: Improve rzv2h_ddiv_set_rate()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Pavel Machek <pavel@denx.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Mar 2025 at 09:33, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Remove duplicate code into rzv2h_ddiv_set_rate().
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/cip-dev/Z9QBZo4GgtMjid0v@duo.ucw.cz/
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

