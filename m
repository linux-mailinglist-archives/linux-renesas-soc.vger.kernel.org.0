Return-Path: <linux-renesas-soc+bounces-16020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2FA8A14B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA27D17F034
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FC72973C7;
	Tue, 15 Apr 2025 14:37:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457628BA8D;
	Tue, 15 Apr 2025 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727819; cv=none; b=bctR9USpi5sinruPJbB8cvyOya7rw0X7Rgf1Gj9hX4bCb36F7Cc2WfUGAi7K90BVIkbBPPpZLCjr8moeF2hl7gnIqpdeXWglUL5Zvt4U+2bqLWI/Fm/0vkroo8OyVvp81gldjyZxWclIKXcIWrhEQ6CIFPtW0BZ2GK/q1jlfaNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727819; c=relaxed/simple;
	bh=Ji5SfRR3Uv3KJzD2U0TTyAfdbfyUmA99Hl5QheBCjAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+iy1AlAM1LlY2WWzPx8LUf1gQ7WHv6Jw6u0e//8VUZDnRxDb5OTK/EUaEvQP758s2wXphcs5NQjrmgTtfZVn8fNQITE5M5Us7DgYezVhq7G8XHwZxAZ5fN+8b9h6T+npH6ATTN9x5w6WTDXhaM/Hzt5JJVxWhKJzqLG1DylKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476a1acf61eso52714881cf.1;
        Tue, 15 Apr 2025 07:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727816; x=1745332616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZS0n/wZMm5hPL6O2mTcBHlNaftAntZqWEIIdU5TApo=;
        b=VQhQP/JCT8jcsAyLR03pEXSGZQA03YmxjcDl4kZ7wt4exX/W63Q2fdkeWbt+CmrIFm
         9iNdQvv6/AngXtteBPFcRZAAGquT9L2ptPUM67bhCMiS1APXFJtsT5rRi7avEucuLBy+
         Vrr4q4Dc3UzpVdwNXELvNnzGdbBk8UUmtTmK0sTziwjgMXxepNTpY0CJb8PMgAcerqub
         U9rkPK+oBO+XVakpUEFRQRtmK3OUdv0CIvQ+oxbmcCVU+iLlbOp8nICXi8GKG9RJJ66A
         grxJ6gUebcoXWjGzqOoutZRchuSb564SRc37Fqvb8EP65rec41DYnLZg9Tdpth9gRNIj
         EKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuBfiyFHsbZAM9P4XO6mG++MSi6esgWCH7634e+HpVb3akQCrkFHRrfGLSCgfDdfPMENzYkOWGp3KSN6Bb/CUyOrE=@vger.kernel.org, AJvYcCW42yyaka4JKOmr342uNdX7h1knzxXm0+NLlKqzOUULBvzGF6Vvvwa7XC6EYVbsYvKFHyVgaXlmDmu1@vger.kernel.org, AJvYcCXJlBU0Pj+YGQxJXpE8zNkD9a9QyVf9kwAUTUI8VXXmek/CWhzko11WXmFI7PP+ENUBBTvEmhS9bfVDehMh@vger.kernel.org, AJvYcCXn8zMKtRsxeipN4D6TlvLvgRir1AwgaEfhZdYqT2ocOyRbyB/UkX4ndz/B3HWYrSa79sajE/KzJvto@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmq92U+XbqHLzWkrTRAdT9js92IHuzylNAwe30JSCLxPgrce8+
	eFgK4L5az+GNTV1kTi2Llj6otVR/iW1gJxhpA2M9rzRKN8r6cQ/KyRqpkB6a
X-Gm-Gg: ASbGncuVRp1efE+kUS40MPtRrqWmk86wugVrbcMrBB2mcnXqf8FL/bHhjkmZkQ0y/GH
	cbisdQhZvmcXvD5VAguEsxMo3APvS7IstGd5cJYNbGO6yXc+4NvC9sdnQXNm8aVuv9QuaEleQN4
	h8/R5jPLukleq/r2cuC63dB5vfEMgSTKVkMwrMdTUXRCetOBe+tkK3UqWfLdU+ZE++dJ6uYB2v3
	ZXxBjMz3l8ltsz8MEG3CwV01HbWQxDjQuCyY5P3ZjOU9Vh5QYGLfo+fSqFip6liiYfsazdguLci
	BnP3cAC9ZHnBskL5P/Rb+hujScIIsQsUdaMRnc++WYv8WYQY4zTUiLTJcnJpyYQOhtr41sgPBz3
	IdAqrOrM=
X-Google-Smtp-Source: AGHT+IG5g6+LFRqR9BdCa5/oLDEaE8eRpfd2VrAjwMGAMSc9DPQYwWUD/C8n6ZOP30TmHcOGWXfUtw==
X-Received: by 2002:a05:622a:1a9c:b0:472:bbb:1bab with SMTP id d75a77b69052e-479775607abmr184550261cf.24.1744727815769;
        Tue, 15 Apr 2025 07:36:55 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9cc97sm94113621cf.61.2025.04.15.07.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:36:55 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c55500d08cso497770285a.0;
        Tue, 15 Apr 2025 07:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUinbBBP8gmNmxZVead6Rp9b9HlMnTY0cSfXLB50u2yQme8DIGgjMFAvsNMNTMidZzEwF/jrsSeBdlXgMdGVNCEang=@vger.kernel.org, AJvYcCV27Zh50EQnBxSlgQVtf7Q8C0XaU2fhxgPv01/UjLSpyKKWftW9p59E60zDF8QltCgMsYW880GMI45h5mBi@vger.kernel.org, AJvYcCV4/O064lEFqvX+5keGaYB6bjOLyve2ySGxFX/KzOABPHu4gFliXUq+QwmHgj9iosCpuSi3mgP2/W4A@vger.kernel.org, AJvYcCXCM3vSvpmMHWwpnOjuSvGttrDQ/A9VL1mHv63d8JzqhaCgj3s0tQGVAoDIQXaAmpIa6fMOuJxLn5ae@vger.kernel.org
X-Received: by 2002:a05:620a:3193:b0:7c5:3e22:6167 with SMTP id
 af79cd13be357-7c7af12ecd3mr2473185285a.23.1744727814609; Tue, 15 Apr 2025
 07:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:36:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2RPTv6BYehUj8eaTegKxtDs=CBu=uD=kEmpWVr-jmUA@mail.gmail.com>
X-Gm-Features: ATxdqUGLu4fFd7u_-7milT1WOA_Ck-SWLpt5tzndnkLo9zSlybSNbn0pEbKTbzU
Message-ID: <CAMuHMdW2RPTv6BYehUj8eaTegKxtDs=CBu=uD=kEmpWVr-jmUA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] clk: renesas: r9a09g057: Add clock and reset
 entries for USB2
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for USB2.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

