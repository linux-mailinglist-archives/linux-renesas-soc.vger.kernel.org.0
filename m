Return-Path: <linux-renesas-soc+bounces-24999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65000C7AE02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2A66F35DE3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6F92135CE;
	Fri, 21 Nov 2025 16:36:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D72BE7A7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742981; cv=none; b=Dlv9o1OUIJqbKF7OYqN5B3blqYnmi3oPle8PVcqAtz/wfAdOiP9ap0tZvLP+yElnKCsbz6hasZJOkyX3qPWDtJrIZ9gFMO9LWTQWb0Nb2nKI9U4FNKB/ORmpemdaIx62STReimTPrgg/s7bdGLR8TtwYMoY7AkcOoWIebRWFM+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742981; c=relaxed/simple;
	bh=lhJnTFSYaqFxGiDJ66CKnPLw5yyRjVIh8xHdvbto7PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rufrC3/7eO9n3d4WYfs4vszLsLpSUwZWdOVByqvGY+EyxdEJOylmw2f8QiPwCPspCvp2LeVHT0SA5HYyTECzsl4/gag654Vj2xxvi4ARLZK9XxDTiaKAv0tUgCZjcvUoTbkxKrBYGWOhp5PYBvD67WO1j2Oz6QUSg8X+cCwd4LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-45034dbaaabso936998b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742979; x=1764347779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12RgMynb+6XJB9cmwgvbL3fWVOlbNJIbw6uaCnaFT2M=;
        b=tz3h/ZpSuuE8cK+5U2nCJ7HPmhFTAl1+I2W7VEIMRJ9kZ61qfQY1UEa16lNNloANFI
         FU0pJmj/SbEsCDVLaNzwpv6k8GX14JOZYQojUg7XvuTwg7bVWevBVBpTJe4lzu8Rd1tU
         p1dMVLT+K0HSu67qbBBJ+41aDef76armswG9zH36hzcQnSqhTSe78BhXO9UB3bJkbBMV
         InLe9HTEZUA7PFLJwXEhT1CezP6ZZNBqSDUhYuXjtbIph+IIMj74Rhk3PYo3ZXxi4zFd
         Ng8NGJ/RZV3PrirUlOzuUwkeVCzKBrU+lhGzeYuH6V9w89zFVB7qQTeIq7Ua2nnzyAtK
         Xldw==
X-Forwarded-Encrypted: i=1; AJvYcCWtGeHsgN6Z2YwRwo7byxsH+HEU4GOhX0/if93wLz5P+C1PO4+s9gAkwDzsi6IVnXhOebqSmkDJ/tD5lXWa//YBkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1WK7oQ0Em0PSSHtc+IQDln6yjweLZnVPnb9MIw43rOBAVKtLW
	nqZBbnp53tQdwbRQvGFDq+LYXhpVmQ5JN13GgdjrNg+ECqk1twfSFCezk6WpBUEn
X-Gm-Gg: ASbGncs3kea9bOggmD7bMVzco8O1Tc1ueJb7SaGNIt81g3wjzkcYIuA7EgYV+o64mQj
	VgKX6OFNmgvu4f31jTtFLuLzu3ucw88E24pZ1wKSD6QxB00clzrpiUrJc+KuCocyKgD3vu63m8d
	HhZO5l+/MakDSD8S7aCLwmZiQNVu2w+sgpRCSU5k2zrqa9U+67vWYOauDi4Xg8pdv70CClpVkXn
	GXNykDK8EiYDrkcgS8XqMN1DsJ3VR0/o1Rlx27zAHWhcac//j+EuvLqWkOTpHZ/kshE07aeMMnw
	EXK801srHNR/DioidqXn1KH/UKJDD5EKc/pOv7N828l7gsgKBCDDbMBTCW+VGnMMWzUqRhw1s3p
	TFRWLfmFZ/x2kWIrXmXH1BchAmq1t5cbzSSpGnpqfsdHvvfHzP83w15E/zpYOiXPjljn3s12ola
	vT3p0Lz+RAmL5pCKn98Bk7Z0Y2iDytEwXXs+1caGeW+4HFPpL9
X-Google-Smtp-Source: AGHT+IENbLSuP/FeZsEysZq4ILEfBDeM03I68aVklHNEr5QqOgtuyHaNEj++rZ4WYFkZS+t7LcDcvg==
X-Received: by 2002:a05:6808:c2d8:b0:44d:c08a:e039 with SMTP id 5614622812f47-4511290e08dmr1427305b6e.10.1763742979379;
        Fri, 21 Nov 2025 08:36:19 -0800 (PST)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-450fffedd51sm1751571b6e.22.2025.11.21.08.36.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 08:36:19 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3ec314aaae5so1396717fac.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/RHIgjfCVUauChyZCjxl3K1ujppEYn/hTNUq1+jb+1HlCLbDBN6cKxjtB6K4NR7MIwGf7f9fLPFrGtczxn2MZcw==@vger.kernel.org
X-Received: by 2002:a05:6102:5983:b0:5e1:839b:4540 with SMTP id
 ada2fe7eead31-5e1de40c294mr825277137.44.1763742667723; Fri, 21 Nov 2025
 08:31:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 17:30:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURoSs2O5GW_0n9PbWsPwSM+eNueB10scJR=NP5_z+_aw@mail.gmail.com>
X-Gm-Features: AWmQ_blt3ZYDDqvSHDPvJqY1vebthbmFWNaVCZaKS4zbbEcf1TD9lOCuzfAaaBU
Message-ID: <CAMuHMdURoSs2O5GW_0n9PbWsPwSM+eNueB10scJR=NP5_z+_aw@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] serial: sh-sci: Make sci_scbrr_calc() public
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Make the function sci_scbrr_calc() public for code reuse to support RZ/G3E
> RSCI IP.
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

