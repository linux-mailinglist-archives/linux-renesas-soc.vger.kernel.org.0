Return-Path: <linux-renesas-soc+bounces-27436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF3bEcaId2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:31:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF58A2D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21AA73032056
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C3533F38C;
	Mon, 26 Jan 2026 15:25:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F6433E34C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441158; cv=none; b=js4TQdB7OTXM9wfxq8c+Ms3FbjdZreQVIeGwip/jc8T636B187EIdQXHVYEvdinAmNCar9HdNtgXXXX/u6t89cCuuPqflWcXQ8hhS+kEJAgir/vW1iHGet0rCxvgCfJCCh8iAGqqWfI99iJlAHTqMjarI+6Cvu++JCVlfIzCVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441158; c=relaxed/simple;
	bh=+chqUlgxIxAqqfIFc9NZvOU+i2zlOs4sKoE2dKWsVnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1Pn7xZAqR+/bZzmZfoKfDK5Ay0VNLPFIOiEj0tTnjGCoVHtp+bra1Yj6IL2q/MB5Is/PotFJDNfylHmC9IO377DMQ2+a9Rt22R//6gGQCPDQtfa8DsOKuubSa2IbE91EbMPq2FGx7QhIk4h03nGgNTdltpXDV07k9A7Y5OQrJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56636dc53a6so831778e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441156; x=1770045956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh7PNCBulLknV4S/MmUqHcjYzn9tSl2obqvDW9AgL/U=;
        b=JNxbMVsbNHVsWMTOv6fs7ZDcDeHi/p/qCRu1QkIUn4VKxZzISnfuIGQX2aG5o6GIgl
         HFJllNwepAJ55tV4ps8ZB5TwKhnDDco9mm3XnAbvKKXyhRMcvlGtk3F0v7upXQfzgirR
         Yca5PH1TdJn7L6sN2xjNlFV2fnuXh0d/SG1c8hNDS5IkEaPSA3Ay8HlLPYf/P97rce5l
         Os5oSWwN68rCf8QkHd0Xb1Oj+3nEjEJPfTtwxR904XiHBcSuRUeaxyPEwyc2l4vc+RLx
         6joHXa88D7mas6nx/4AYhXJSAZOMnruwN/ifH4fXJBzM0zx7bAS6MFE8jEz+kRlTD+ki
         MdZw==
X-Forwarded-Encrypted: i=1; AJvYcCXpczz8qTstlDYqP1VW+itle2qZcmoE227gAHN4OgkCEozLpkDCG5Y7i1nrOacmWXTd8bRLIWYxXqm21QGWuSGEwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxElp8PcK1zSJSEKgFWWmZbUUp1Xkz2gY8/w0ls57vZIrBIvtFl
	KJY6XLuz4W8rTUDCMGsHN2/WZ8VRvdY9x2cRzLRiVZKKNhhWk1nhgH3fxKp4/gE1
X-Gm-Gg: AZuq6aI+uzYcYdN/jkf/sLA1Hg096+yiLxWS3Z5z7P0KmsxcDIX9W+zgwnPZyeYaNE6
	tOAADaej/cXiHgml0U8qRa5wozvmnVllA7K2hZkVaOK1RMwrFYp5H3XY90/I2WOugRTcGF1Ll35
	XyB+fUKFbaZU1EZEELG3f9gYrkiv9NRdTlvcFYhIlW8zSfM0EhdlS9b15c3d9R4Rz00FE72uZFk
	+kyqfG5fVHtekoht+tSDq2qh3oTEEF1yn5tncn1WzhiovwfJYpvV9YGRNotIpcwLBfCqudFNOb/
	t1T0rfVwEnLOaqfaIuawyMqoAcSvkXqrT6+DuiHzk9qwUZZhrFdhr5h4jFPOiA/SRuj1BkNTDOs
	kTfqHs48mmo6dNGUlw8HGgVpBb1hnyfmBiMv/0dqN9eycgDBcM/5H1mK0qgMhBP9+RdxBj0ttjV
	8+ftO5zi5UIGPnjE83x0gUl92O5IIAcw2Y47rvfcnDqfjiSXmZ
X-Received: by 2002:a05:6122:240c:b0:563:5f68:7a75 with SMTP id 71dfb90a1353d-5665ca08509mr1206698e0c.20.1769441155686;
        Mon, 26 Jan 2026 07:25:55 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb9bd11sm2019380e0c.21.2026.01.26.07.25.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:25:55 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94240659ceaso1275193241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:25:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9LyYBf3KyO6h7Zdy2A7/qUcDpcwN/Q6ojgbeEkZ7/0FGSc9bHE43HPIm7meZF6959njlhf22udGBKNfKJherQBw==@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5f5764c2db4mr1193845137.21.1769441154202; Mon, 26 Jan 2026
 07:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125190314.26729-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125190314.26729-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:25:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
X-Gm-Features: AZwV_QhokrFly-7I2CTc5dF9CXKTabpeUPSd_ieTfoc7CEZrMJ0H3Q5Y5ctzmCY
Message-ID: <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: r9a09g057: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27436-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCEF58A2D3
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:03, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The r9a09g057_mod_clks array is sorted by CPG_CLKON register number and
> bit position. Move the RTC and RSPI module clock entries to their correct
> position to restore the array sort order.
>
> Fixes: 2efea3b35cc9 ("clk: renesas: r9a09g057: Add entries for RSCIs")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

