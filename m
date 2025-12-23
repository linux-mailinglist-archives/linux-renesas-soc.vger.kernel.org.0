Return-Path: <linux-renesas-soc+bounces-26065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C70CD9805
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1E3D30019C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E513A2BE65B;
	Tue, 23 Dec 2025 13:52:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05973285CB4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497955; cv=none; b=Tgyw8UHvl8fWNC2UFnUaNI1aCFIl1SsL27zhfwEWnMyyGIsWwDpsHcMIdMqo1iXI9cdXAT07/OXJerLHtJci48pTiaW8kDLTP/oWWM2n5DwXjJESMETMFpWOvnIy5jFt2hnlSpo12yU5ye5SSTTH+sFljv3W32I4ngzsfOb3KSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497955; c=relaxed/simple;
	bh=HEgGdhmdotY8pA3QPNPd/lQh91weDglMrwRgI5eq5nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5vmCwRXyIP/PfOrLsPNJ1anytcgOKo56OShyQNZeKZrYosNPq+55CP2qQamzknKY1zTB6dQXB4VgI1zAGehfJFbbVy7JD6krHH5RUp6dZbcwsiXMRo0RgfwExnFswcIk67WhaLk1mYyQVZmnPTZtasj+ycYu2fRCIYy7KKncgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b804646c718so424345566b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766497952; x=1767102752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC2xhS+OSrcNsNoLm9/J2+cVx6ikhb0ktmaIYIIBhdU=;
        b=NTMu5KEkEA8ZUSPyaGEOMuS4MFraBM4IBYgfcyZqnNDAgmfIUZ0KSEKr3+Lf81dbk/
         jobDjzmPXXdx4FFhR/vfA4rHyZxin9L1QhjX29eRCLq5X843jhGfGAYax2sIDQ3VAGYo
         KYaLUESkFxSRolGn1JpPzekIw7oBXEP8Y/psuEcNwACfiTgXPgoakKOl3Kwv4H+3BOOd
         9V2ha5Vo9oafdxgJheVx9oEqGRV4htkboE1vyNes0dOWCi7fX7MawRNxSoTTS9fjgIsG
         jleBtnie4j9hOzc2QvHXbWBVInI82TNmEoxJT8KPtDNfF0BzwBvO8snrMtMCr/vCk3Bg
         yxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA66Zgl03RQIwpp+Xt1k8lpZ2sHTxDAU5PJ4DNz9SeckHtKBIBpAO/HRzgzfDUd6WreVH7NyHtptUIRNKXY2RBpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCM4ju/vv4GeqZkYEq7r7MIlnBqITCsaUxMXB73GVx9KGDbt4
	FaqZu13dLustC4ROW24XlFj7aaf/WByyDtfrKHu8Immdq7laq/BjMdZsXBwHjo+lbY4=
X-Gm-Gg: AY/fxX79djnWvvtfIJ/VjAbXGcKDtXITkrQ7xtUtLJyRA9M7IU3mm0QCnz2MW6DWBhO
	llDw/+OeZp/YYjQ1A6875eTlhKLGzvpX+SigEsYn9huLrYXF/WmrMQWuZPeXK67Yed/egwQC4RV
	solHVIrXdC95WOJZuIFcPhlMAlQ4vRkyB15lCqoV+NxnJ5eRZ0ci+ZHwbMGnT4goKq7A5yghTcl
	LT+N7s9MfR63BggBJIZUHXE1xhzsoRBfkMqeFL/HfbgHBBaqrywUeL3LiLNAwvSLGRWyHjKQosh
	PjKGakV8cfb6jFAhZxSdVh68Ly0apX6r6aOT+QmuqV/6Hcv6wW++AiVvtkYFIs9/Hvmqu1J0Ctd
	DwgWqwhOOghurWao+3g7fngcDBXzb7I3Wp/b6mK0w4acfB1MjxSofqfZ2KbTXmB1gWb78NGlVXI
	A9bOBMezqq9aQTV4JDjOxs3Y3HAshMLhif+POkEoxR6S698e92
X-Google-Smtp-Source: AGHT+IGu4KjZ6MzehonYlj1D6vF1S7rprWhSupO57ZygmCEfLbeCyzXx+ePpHNjzRVq9Y+txs3aNOw==
X-Received: by 2002:a17:907:2da8:b0:b76:f090:7779 with SMTP id a640c23a62f3a-b8037155210mr1458338066b.33.1766497952104;
        Tue, 23 Dec 2025 05:52:32 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm1462171166b.49.2025.12.23.05.52.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:52:29 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b7b737eddso5859320a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:52:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5chp3ecx4h4iqBUYtAarbDT9OQ1vUcjp2sE5W570esxVlz2GwTGBQ4rExwUDM6Sibgn/8I8wu/+BRkhZoPSSAMw==@vger.kernel.org
X-Received: by 2002:a05:6402:1474:b0:64b:588b:4375 with SMTP id
 4fb4d7f45d1cf-64b8eb62574mr14209973a12.2.1766497949108; Tue, 23 Dec 2025
 05:52:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201124911.572395-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201124911.572395-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201124911.572395-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOC1Zzvd_sbSfBVUMTVwA9NWy3-4ziP=ePxppsbMwRZQ@mail.gmail.com>
X-Gm-Features: AQt7F2qacHBfJ6E_bDNJY66lCMzd1HRJB8iFpiFIGp6HnGDNM9Z8L7u2p_OLyUI
Message-ID: <CAMuHMdWOC1Zzvd_sbSfBVUMTVwA9NWy3-4ziP=ePxppsbMwRZQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r9a09g077: add DMAC support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Dec 2025 at 13:53, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) SoC has three instances of the DMAC IP.
>
> Add support for them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

