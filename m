Return-Path: <linux-renesas-soc+bounces-26531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8AD0AD81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 16:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE1293016BAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 15:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A670633C528;
	Fri,  9 Jan 2026 15:18:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3900311C38
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767971922; cv=none; b=UTXo/fGk6fzzl0zlNzTPEbDymn/33bN2EFMig2jKied9vKwlAnlHlDotpmP4GaP+7IGTRKOXeclqApcEFCieUMmRrcgkzuVXXID2hOZHh38QsjNkrCZr1GjoXpYyI+6ElJKUxtetdU8dLOd+BSKXK75NfDx1PbYcAcCa4V/oeqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767971922; c=relaxed/simple;
	bh=3+GVatq95mGfhRDIL1n8peJUE+WZ/+efS6KSkq5pqSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5db530tmy37r8IDfMW4e2P6Db9N2wPUoN/sPgYqW3VzMzhRRzZQ4pfmwBnCrHsEQ8ZoNs8ZKPVmmnlgmgTZDBXTguDeFJUOZ6fk6DzxlM+1rrzdtaWyb0GovtfAiEKhOVfF/plbIOn/7TNBRz/IDMS7bmPJsvYyojiHdekkiy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5635e6b80easo528773e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 07:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971919; x=1768576719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VEXlTg9IM4gHcSL1lBsklgg3f6DVIwXgyPnVvXxnYs=;
        b=TOdWakMo3cc/Fvn5wZG5ggfq3LG+FhoJuli4uxQ3Q/pjK5DeDS81m6hTSp714BUdaU
         HOZOhenRxPb5g4HJASQf943nTARUoXa8zeHZOfLckquZJhQvzbD3ElWAPXNRGzhlVdw0
         fzyMOcB7Q9jYAkminUzmrZjPvhruwVtTIgdMxPQ+t0Rwq8bpRzOdenvBs/qYlReMY+oa
         kCHUS95yI4Xi75QDe5OcI97tf8juS1MQW19Hwba2LQWZtZowMOH3o2Uqy7P1Z0Dlkgft
         p8r18csjOkueBI6Sb2HpiYVKUFAAVTTcqcts6notbwjcUT2z6RaPOu03+UIevWy9twn7
         on7w==
X-Forwarded-Encrypted: i=1; AJvYcCWHAg9tgMVzgXskbTYC3BVy7nFS2uKziQh4gVGixDsbz1eDPUGs82tBHcPD+AKjUAPFQ03ZJRnGWHljbPzBBo8ZQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHBAVtIGhAnlX5ikXt30rYwK4dfpDvbiwjjmPCzT1NY7MjZ38
	BZxdPjtOpFiafbEeCeuOV9D2F7XuqU+rfrd76xQcDe94UhGps58cW+81oJdaJnh5
X-Gm-Gg: AY/fxX5V/vdzIOi67Mb/N3nmZ+JBfKPajgU5Ro8q1dzCIBajL31UK+HAF+ZLnuA6hL0
	K0LXraoJKtVpKGl09Awc5UnjWP1TRHEM5dB5AIXXGZhmE+EHQDLWVJ7+ARCHAMORUhtOXjtc5ZY
	N4OoOuQH8TUroOiQjXqe3Tp4vNgtqLylALfirtKxFGwSJLW+vNzzhYI7pJm8f2EmolQPP3K74rP
	StSTgh7lADbNDVKf5FN6icugM2oeAjRBOT28fdsb0nLQoJ3b9WhCJM0TuHg7MSwY0VI8CU7WeO8
	Su0hp7B91wltwZQCqh4iZoc4Ttpz+jZSvqevEXn8dVUs08KugaZATB6c4mGA3FMIBHSXNsKnJe3
	sKZt4SZS9/COfvTF/vEsUB72KA2ij+xa8dSk4UutkuM4KGXIhTbX3Ixl4X/jdL+aX6U8QR6lB1u
	t2O1/V6UGoTl0Hn8njst6S9ti73AR/8IO8tPNpKQwrlIC9ayLeI7Y7
X-Google-Smtp-Source: AGHT+IFEU6C1QgILQDuz4Ky8p2B2xZqV7NezwTwLIdrwDCm46fdBV2maOFQ8YQFdGVADbbO03q1h0w==
X-Received: by 2002:a05:6122:221d:b0:563:4416:a0aa with SMTP id 71dfb90a1353d-56347ffba03mr3616029e0c.21.1767971918788;
        Fri, 09 Jan 2026 07:18:38 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122ad97esm9030816241.3.2026.01.09.07.18.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:18:38 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5635e6b80easo528761e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 07:18:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQMMugd04NXGX/xvc/PMVurgnVw/laraf/HDo8cNBZ2xFlmSKwB+qdgBEDdBptUVhOVMk39jkn99J0FeRNkPlT0A==@vger.kernel.org
X-Received: by 2002:a05:6122:221d:b0:563:4416:a0aa with SMTP id
 71dfb90a1353d-56347ffba03mr3615981e0c.21.1767971917718; Fri, 09 Jan 2026
 07:18:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223152358.152533-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152358.152533-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 16:18:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX17mPy0__1Q=zDbfSTOJFO9jBCx7hFV=fSCRAi=o_sEw@mail.gmail.com>
X-Gm-Features: AZwV_QiaPop4qGDHo4cMfNY7dies9ybxnNdVPjRUz8BtpnuQV3yBnZnNV76_TJ0
Message-ID: <CAMuHMdX17mPy0__1Q=zDbfSTOJFO9jBCx7hFV=fSCRAi=o_sEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: Use hyphen in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 23 Dec 2025 at 16:24, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch!

>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts   | 4 ++--
>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts   | 4 ++--
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ++--
>  arch/arm64/boot/dts/renesas/ulcb.dtsi            | 2 +-
>  5 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Is there any specific reason you didn't fix the remaining ones?

$ git grep  -e  '[a-zA-Z0-9-]*_[a-zA-Z0-9-]*@' HEAD --
arch/arm64/boot/dts/renesas
arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi:
versaclock5: versaclock_som@6a {
arch/arm64/boot/dts/renesas/condor-common.dtsi:
cert_header_sa3@c0000 {
arch/arm64/boot/dts/renesas/condor-common.dtsi:
cert_header_sa6@180000 {
arch/arm64/boot/dts/renesas/draak.dtsi:
cert_header_sa6@180000 {
arch/arm64/boot/dts/renesas/ebisu.dtsi:
cert_header_sa6@180000 {
arch/arm64/boot/dts/renesas/hihope-rev4.dtsi:      cs2000: clk_multiplier@4f {

No worries, will queue in renesas-devel for v6.20, with those fixed, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

