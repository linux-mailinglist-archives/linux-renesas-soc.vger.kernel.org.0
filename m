Return-Path: <linux-renesas-soc+bounces-13141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD42A34B75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 18:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89ACC160524
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 17:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C7B1632DD;
	Thu, 13 Feb 2025 17:10:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA128A2A5;
	Thu, 13 Feb 2025 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739466615; cv=none; b=hxdd1FGQ3waZUEEJ/Z3JXRpta/aqYzkrnJZn1GatzL/kgoo/Pt/QFJqUG2+m3qm0uepzA6laBJRKHn9FO1dnHx8voF6lAe9cKFf2VDeoXhUKqapAUMDb3kQuWQYHJStVTkLqWaVViln3ANGtjdts0ytZ6YdDTJPXpVveZ29+hWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739466615; c=relaxed/simple;
	bh=tRx2GSmvzwQ/gwoMBVPqmD2Y+O1nxBGjLSn4/EPSSBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRt/VNktn+LzscHeRcm9ZgHiawNTDo1+N4mF821/rhizygSW8QPx9j7kA/ffZygv6cCGtFiOmVmqd5aSHJ+WG8OLjg5tVe6i60zLXGHSGRTl94zkdYwPQGEg2hJDSPfGm+0YrmyQHNRpkMEghnypeWPkNSpb3QwS7696izml68c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-471bc8eaf3fso9299031cf.2;
        Thu, 13 Feb 2025 09:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466612; x=1740071412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ie3JzpPwAcx/4geWAE6zYb8hiTtsdSbYIX5JhTMAO3Q=;
        b=FlhvyLVZWeFtGm8QShS+qgurbf0NlEiQvGy2RMsSafUuGmEJGEr26XLt9S9JUPsLU4
         12UsqCqDYrTiBdKpC67vp/8ZLaZ4a2QdaOpR4vNXP4WQ2bjvc02ec7x3muwCKod0M6QK
         tmqjO6ZCtG7PToiq4N+Lxtg5z3hUv9jgTTJkJnLxpjicI1mr2PizlfGbJAyr5gnczofg
         fdyYmo1JTPh6Snt23vPKgKGhASRu19g9n+Se9iwelHAnj5qT4zqf5gAOZZ/oWAqfqpTd
         QpaEmPAFCMaaBqQimKwM3Y514iaJAg0jTQJsC1ZdjfxfiGgEcLnzXDxnLjv00mGnbNb6
         UP8A==
X-Forwarded-Encrypted: i=1; AJvYcCW4O7gEDNlDvCfuchznR0C7xOYzzQharj1fB79l1JEL62E/1VRKgjXDHNVh2VHiBPmEbe8VswGZu59u@vger.kernel.org, AJvYcCWcH/DzZHQx6BtsA+bHOS/KxFFeLHJGTAFy/SzvbAcRRGsz0f0O0QSXBchcCBTcqQrRjKD29IuFNZ80czOnp5FZ2xA=@vger.kernel.org, AJvYcCWzKrLvYc4dG1IAKjkfvnJrEm1oEWqpuNLKHyKwILmB3tEZPUZOKYuUEPA1E828hw3bYZaevxNnZVMAIfqu@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGY+J0r7QVC6FHo1Ox9p2Tp80ytBa/Z3c6FsrIrEiA/k/QKA0
	XfegpOL7SusbN9H6oyiRIY3Sbvbj4xZWqSCS8Ikk7xL6YWZwXTAr4i1oWh6fCfE=
X-Gm-Gg: ASbGncuVY9y2IpURVR7tE52Nj0hg+YMcOWNMTED3EEj4ajTCD1+asKNAD8qUnBggBCT
	C+CxN5bz/bTIZehpFUfpWPkCH7agVMTNtMoyx79xlNqkjV/V33Mb2fnaaCf+OL/dXfZJ6C9u49j
	m2yTuZkH0Cf1qIwxZI6sW3o5TeEHd7FAbbhNoMjCFF9RgRFejEIbL4KbKVCJK6utb0EffyccUbZ
	g9f3DniiqcqlgBpNuUGHm+eZCeRCXBN9MVhRv9XUJdrBLVqWYlEj85h/s9g9yFIrHTysSv5zON7
	TwT7K2gWtLo3vn0mjEXLxDATUdAdR7bGW8BtcfV8LTCfoHySS/7koA==
X-Google-Smtp-Source: AGHT+IGqWJk4LT025H18ztYXMwx9HfiJ8qA0uwiIg83SFrNYbd/Z6MksArOwzaNZveg5DHeCSYJPfw==
X-Received: by 2002:a05:622a:2292:b0:467:5014:8bd9 with SMTP id d75a77b69052e-471afe4c80cmr117106841cf.23.1739466611785;
        Thu, 13 Feb 2025 09:10:11 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d785c09sm11612326d6.36.2025.02.13.09.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:10:11 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso10087656d6.0;
        Thu, 13 Feb 2025 09:10:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKCbiDjsVgDWfkEFP1eo1a82N+g/qWw2DyEQefFw+lB1Odo8KLuNfioasoxPhAxKB6eL6hheHBR2fSqTDI@vger.kernel.org, AJvYcCVXFy4eL7KsoVZiy2puXzUfpgwxuNn4Mdu7/BlsbMUkwf0HiUGnlm05Ulq9LSeKsVqCJSBnPUQ44SyQ@vger.kernel.org, AJvYcCXiHunHu/azapnlCJBXQEMuz+GrNx8d+HgGDjlSIvtSjLK8h4vpe60XAZWqdik9/Fi5VlCeF73muUHQB6MgE7mi+wU=@vger.kernel.org
X-Received: by 2002:a05:6214:c2e:b0:6d8:a8e1:b57b with SMTP id
 6a1803df08f44-6e46edb2ea2mr147644036d6.36.1739466611109; Thu, 13 Feb 2025
 09:10:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org> <20250209180616.160253-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 18:09:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUC1F02oQ1pKZr5HY0sdKOFEQe8EcsccHZw1NcrRkdwsw@mail.gmail.com>
X-Gm-Features: AWEUYZlXRfidZ9xD_oiptzCynSGorb02SKh9tpjqSsp_85FHqgD9O05IG1SQrx0
Message-ID: <CAMuHMdUC1F02oQ1pKZr5HY0sdKOFEQe8EcsccHZw1NcrRkdwsw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add boot phase tags marking to
 Renesas RZ/G2
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 9 Feb 2025 at 19:06, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas RZ/G2 SoC.
>
> All SoC require CPG clock and its input clock, RST Reset, PFC pin control and
> PRR ID register access during all stages of the boot process, those are marked
> using bootph-all property, and so is the SoC bus node which contains these IP.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 1 +
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi           | 8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi           | 8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts     | 1 +
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi           | 7 +++++++
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi           | 8 ++++++++

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

>  arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi    | 1 +

I will drop this part, as it is not related to RZ/G2, but belongs to
the RZ/G2L family, for which I expect a (larger) separate patch ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

