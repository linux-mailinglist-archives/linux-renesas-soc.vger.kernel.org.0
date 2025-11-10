Return-Path: <linux-renesas-soc+bounces-24415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74AC475A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 15:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A24718883F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31357314A67;
	Mon, 10 Nov 2025 14:51:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA592F6927
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 14:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786311; cv=none; b=oPaOhdTSfgHxVnXjEmtI4glNl6Bt5L019pTcbrCyLfPce8xKyOfckVzbg6qHs5Jme12iVqYQT6cSqeGhvEJsRSOZ3IKa9wxW4iGAoyb+DCStTWAXtZ8xGZzRyA06rNmIMqKR3xZWrXgx9sn4oaaqbg3JMZtab67WJmG42o8bh3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786311; c=relaxed/simple;
	bh=CCvKEtAI6jJe+wQ+hvQBc+gGA4o7sIkvHAFBhmYQfzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VErR97DaXnbMiJ3Or31r+8hBiwsxn+lIo0nrzqwjlf3wfHDeqTA9eSbhF/AQ9gB0GDnT0+rqq73Z8Scz56CbrbzN+LPkaJLGMoHLQK/g4or1rsTFoq9cV0NOEerd5/9iMn/sTsQWPXQcyledOc7xn/IEiN1A21gslh0xi54+nHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55960aa131dso916811e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786307; x=1763391107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/xU9tR1E4wV7DQk5eCBvIBzhbojswkrBibvtyFHs7k=;
        b=hGfCzbbeBIdhsek9YYNIzl1vrtw9OE3WHGJo9h2Z1XAxM/yr/X+0tg7CnlJFDFJnbc
         mG0q8JQQeUhoBD3OB2vOgSw4PAGw+/NE1PrTXXBa6Gb8+xbbez8fzCxYlJgvyh/EAdIQ
         OPmPUYhbYrAfacorffXhCwMsYgbM2mlZDmxo8W4fB+4X2Ks5XmjaUMyynADA6s5ziiZv
         TkwQ7ftzpNkazXzqfbfXd7hoxLq62YW7DQtNA4IQH0w1Bv2MN9oNLkCJgOA/nErdBTzm
         gtCxRrtv1diC+jfWN33O9k6gU6C0jkNB4p1gthbeQfsjXCBtiD3m4zdDzlN0P6ybJ35Z
         g2/A==
X-Forwarded-Encrypted: i=1; AJvYcCV2O0vkR1lASQ2+qQhx/JZHD2GMJyn2XMWmOu4op7gnR1jYYxgZalsu/sgQ/yaupXK5vTJhxNVmO3u6mVF2dI0RKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI0eUffJheYYgXwRZ/EG2SwMBGk/ne28aJslypTCP9rKkRNPPQ
	xsk5Z5aai0M72qUXdlcoNGbpncl/76NZsvm42QqUnDNHfAbWhLFQ/C5UJ4wRNbLF
X-Gm-Gg: ASbGnctFoQZwbfA+oK7PRGniyVt49y2S70jD7m/o62DFRcUS5MZLIpjk/OcqXydN93o
	hpVxsU+YaYygcJN7XhSS9kLQTQ4vVSKUV1tngkEpEFV4R/GHGOywVd6+Sz9AI4bQgJ1+nrRcFRI
	Z8+QDmN/yAbDesoNZa/nN0V4j2GFz7RMNJobdhhoqoRZCyj2Re9FxaS9H/8MUX6LuzI5QSN1qRY
	bXc32/ZSGTfXU4hlJnzCgQe8cY9B+fv5ZGQ7JhYixA7HiraolgeJzTIUcIPEaOQGG8IlOIZ3YlB
	7CCqLogMd7aopzzi5gJScgUi2MEj4xylaQSXxIAyVPIqM7XqVF4zpXpdil3Bgil37FC9H0uhD5Y
	emQuncB7b7LBwSqjY86x5EsVOFnkd6agQ7fs9BE9Vp2d37YHIRwEtG4a7t7MPMPxsDCZMSYf3Uo
	kOJrDWL/6LgZgTqUqdhxxMz/zL77pGXFmPfz3F5kFdkQ==
X-Google-Smtp-Source: AGHT+IH/XfNHT+9h/EHFE6Br0R70CIVMMC54mi2Px4AFS7cdf30j9WF95YSspPtL36CDCz8MHjscGA==
X-Received: by 2002:a05:6122:218b:b0:558:251:f0e8 with SMTP id 71dfb90a1353d-559b32c645fmr2932506e0c.11.1762786307310;
        Mon, 10 Nov 2025 06:51:47 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559957fb3c1sm7455663e0c.12.2025.11.10.06.51.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:51:46 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55965c96fd7so780722e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:51:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7RjcNF4JxkOwMFCkcltJ0dECc8DmAUWPPXS+mulNcA2LZqQfDIhgPNFHmpiJU8nL059gTbOwUxdcFNcpavgd6rw==@vger.kernel.org
X-Received: by 2002:a05:6102:c90:b0:5dd:b100:47df with SMTP id
 ada2fe7eead31-5ddc467f9cemr2192981137.4.1762786306367; Mon, 10 Nov 2025
 06:51:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028175458.1037397-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028175458.1037397-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 15:51:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURuFbC4U7_G7nfCFubcxj=3MnrFp4S5Ez-pe8bF-MeWg@mail.gmail.com>
X-Gm-Features: AWmQ_bm_zKD22m7Lh9siCarTBK_WgDcNJsSbzh_nmteCRcAMLoqoVhrNrXJOf1Q
Message-ID: <CAMuHMdURuFbC4U7_G7nfCFubcxj=3MnrFp4S5Ez-pe8bF-MeWg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r9a09g087: Add ETHSS node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 18:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add an Ethernet Switch Subsystem (ETHSS) device node to the RZ/N2H
> (R9A09G087) SoC. The ETHSS IP block is responsible for handling MII
> pass-through or conversion to RMII/RGMII.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

