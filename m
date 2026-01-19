Return-Path: <linux-renesas-soc+bounces-27054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D02D3AFCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A4A30019FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52B822B5A3;
	Mon, 19 Jan 2026 15:58:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6080A23D7F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838332; cv=none; b=NIsKRI8/u7EwybwaxhjLrbjZLe9KhopqxgfjMMj09WXHoTlKh9oFMx/OpLF1cdywLBslWqbRUE3qDXBLX8mL/FRgha5HuYKZVODNIufLLEAQYvPluI5Y5vQHrZNvarTzlcluxal+b96a2tgvriyjJ6wg0MPqijyCfVlhmFpP6SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838332; c=relaxed/simple;
	bh=19bTvFO2oXBa4nAZxK9G/wlSld0cACHrB0Ghe6tTkDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHbpKNLOOo96QksTE4eqzZ7F5m60H8bVN3JUqtrJlNYZlcZnsZM7hSSWk5eUHedpBjUHBWPfRmRBnaIpOkfeLPy6K5A4N/OCzTTZYseC3IM8UtTLETKNke5imhk2aLlqe5sd9601y7Bz3ZGZSQKF/apJK1HF5dsI7oajk7f9po4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55b219b2242so2775119e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 07:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768838330; x=1769443130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwYpB7OUoD7RGVXAKZghgG2fL8VsvMsrJb3SXVA7oO4=;
        b=MhtLieR/szB1bWlv28A1KZk1Cz0EpBlPqIpPYDN2JZ9ph2ZNpah/lcG6NAf6INlDf1
         ukuZaSRZ6W6MSa1Yc/yM5aE97Gk3T9ESZdF8RPODwzXzGYErG11GoIKYH7ow+dl+y9l+
         wpYmaCiniZHpfm4/9S5VlOd9CBeRkol70cVzsXr87KyyXEJTjO1q+PgY2JGlOachhSHl
         DCP14nDjH62Ax5PKvbPPT3PG/bgycNFSCBrDFB+VIezYUeRahRIwRh0lkz0juLDYHnow
         7uMg2itJQC677q88n539cI0zMdE08b1QC6CY7GGPA+C3vaAblukOAq9oauna+d6oWrKQ
         lrgg==
X-Forwarded-Encrypted: i=1; AJvYcCXtjKrsANwQiB5MKnziZ/pyP1KTRQgESwK31MgsN6gzrzCryFH0l3jnXrheO7bCPQfLjxBKGVQjRY1/Z0GywJSN7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEg6cQ2Wi3htL8h/RtBpNQh3+SCznn689393xj64YgmPPMaHp
	lm2ngpeVhsDAnibu+74k0bxEsnfYCZxhyuM8mef7pT9+tlvaT44HurCh8JbQtepl
X-Gm-Gg: AY/fxX7x8XZnpQiX1+fUV3eNhcVFl1Gr/UMh2jwMtzCLutdVqzsIdQw/G1+3FgIgV98
	LkcdpKL/Fo0z12UgYROe1rPXKvg50JLUDwvHLLAvQeY5iHkkahgMBJ557Y+eVP6+N7LdyWNiURw
	uae1ZoTpJg9Lkuc9QrdvITlCzkVgNZrGggbVtQh4NWzkb0wo5hyZRZOD1hLxWb+8iNTS/ny6o2a
	jZNhQhzz/mnB2jag2S4Fv/KEFXCx8R5Ajmgrb3KPs0zcJrgjbI7AZVqz+Q00kqdULJxJcVxkF7N
	q+FXGepjaqx99747jOY0CoUzzvXvNCD+bMg/UChY3Om4ETySMOprE7K3/e1vVNF0dcxHU1eFaBX
	uTCJPnud8ltU2vLJ5y9UhMV2XysPGzI2JU4fTFNBj5OBl6cqzeR8wqtstN0I4qcABnRDJl68VJS
	FWQINcs2ZwSKas9QTU6NgPcFcQuEd27++loD9vF+Lh1a2Jpnznu5vy
X-Received: by 2002:a05:6122:4685:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-563b63dc48cmr3650788e0c.6.1768838330071;
        Mon, 19 Jan 2026 07:58:50 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6fddedesm2795492e0c.1.2026.01.19.07.58.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:58:49 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56367b39e3eso3832566e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 07:58:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqLeQn11ACNigCVtBFtdg68dPpTmZOXWvocM8em8RUCDdKkvBv/4VGZQ1uZFKaHRaN7dYO35R7AFqXvxUn3+/kRw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e96:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f1923fb2c1mr5628745137.5.1768838329404; Mon, 19 Jan 2026
 07:58:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com> <2b6f19f3-aaf9-4fb7-bef7-f38e19f94351@mailbox.org>
In-Reply-To: <2b6f19f3-aaf9-4fb7-bef7-f38e19f94351@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 16:58:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfinX6K622_ThmX-srfq2Mb3CTHD-LdAR3YgDTZq51oA@mail.gmail.com>
X-Gm-Features: AZwV_QiA0q5O-g1daJUkKfsigh6f9aOP9tnmWWUeAh4TC3ZblJYVL42xTYixBq0
Message-ID: <CAMuHMdUfinX6K622_ThmX-srfq2Mb3CTHD-LdAR3YgDTZq51oA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Describe PCIe/USB3.0 clock generator on R-Car Gen3
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 18 Jan 2026 at 14:54, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/13/26 3:19 PM, Geert Uytterhoeven wrote:
> > I do not know what is the actual issue.  Adding debug prints to
> > rs9_suspend() and rs9_resume() shows these functions are not called,
> > while adding 'status = "disabled"' to the renesas,9fgv0841 clock node
> > in arch/arm64/boot/dts/renesas/salvator-common.dtsi does fix the issue.
> >
> > Perhaps you have pending patches for the rs9 or PCIe drivers?
> > Do you have a clue?
> I believe this one should address the problem:
>
> [PATCH] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
>
> https://lore.kernel.org/linux-clk/20260118025756.96377-1-marek.vasut+renesas@mailbox.org/

Yes it does, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

