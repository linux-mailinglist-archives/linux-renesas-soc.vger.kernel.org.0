Return-Path: <linux-renesas-soc+bounces-33424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mfUJDZHNHmo8VQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:33:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84262E0C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:33:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB7243008E37
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 12:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861213CC7F4;
	Tue,  2 Jun 2026 12:26:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433D394EA6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 12:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403168; cv=none; b=FwBzbrusSVrUJ23uv7iRdwL8F5YWpTzWcMznx+SNINhSc1qNyvrZwEitlMaGWazIAHihVk3MZ+t6fN6w2ap84/9m55lGghV34UM5OvACWNaz/1rHcNK2gbaRWT8f9+IYnYOWFg0hb+frWeeQabPf+9gRbGbpz9RGVLnwq2D6pHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403168; c=relaxed/simple;
	bh=yZrsiKkWX0EECfYTapxvcjsipztJnn0uzVrHen9gyZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fg0LDJWeiZDfFgmftN5JgN4+3ocAxMF4DfQBJ8OG3ArXxW/Ist2UWq9wcm5DX4LXg+gvk5t2jExFUBgdiHekjS7qZc1rxpaXVIlgJNp9ArPuHXG3skAwMajkO/BilETkrFEwuhbP75UaXNdhh/ltLzh5CqynXJDipl0YCMa22YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59ebb89109aso1898051e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 05:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403166; x=1781007966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yje/uCQ3JOvtCThivl9d4zrcz9CsxYx9GC9XDEjIo+0=;
        b=DJzPV+4hh6L3q1hIfy+A2hn8HwornlvBNzOJxLRsHoUy7eKCyJmSKEb0EjizIVVDJo
         1z6NmHvZC+iXt8gtJ+yaFrDRGjIXsxKnHEn5K4Llm/bT9DNsiarema/rTpq9xj+TqeJ5
         2uMGIpbjtF4RJ3LhTjpvHtzIyeOgBBT1yVEcu7KQXOhyXjtP45YBJ4xWLmm/YQqCQnZJ
         jWIPGRs4CaF9oLqUo4WI6KQXh6KeaqzUPY/O29DfWaL5W2Cke2w3TH+b9VVtnQ0907qA
         BUEGupHlnfS38NrNagHd8K85iCBaW5MIaQwASUZXMsKscZX8aDo/QeKynFwirHzn2Edv
         JiMg==
X-Gm-Message-State: AOJu0Yz9yLMoxODNkeLR92C7g+xmKKbX5v3AEzh3tkGzFaY8CHxGIKoW
	CgHVpXLo6QRbF8cGKCieL9bXs+ymbRWbQ+i5o8H46cqT/19oZC0tOIkI+fNrQMUe4iY=
X-Gm-Gg: Acq92OHUO0ju+wcmZ/AF8whzxh2k7J/dD5BKlfMgTooPwATLFnxQeDrVe9ZSUMELqm0
	G9GUKfNFutbePjLE8JZbexbosmrO8e3ycIyRKxjFXLCUTUVoKhyy5ruRWyEQW8P3WCQG08zvYKc
	XGKezCFOvgb3D16E6yOoG3dx7YAX66ZuoK7GlLP9HfhBPEHaxy5vRKBSkuZ1TPZD1zLmyawDu4e
	acPtjHvzzHG8FmeoXtw2H+hu7AzZLYo//3sGyF/+TRbNF+pfg+zX3gBlL11rZrLAxdYyfNj+UZl
	1tcw9Nize/3bCcVUC+Zq5SK/V6SZ85Rz1mmDR9qwJvUPKqRXd9AUl1Y0JpuE1IvC9HlLY/xrLYk
	IeOyffWDSBfeuFC77i0BaMuo6vUElFvizQNXNf/VxXWVD/c6j7/mJKBaZ9arIf19NQdtFjkdDpD
	HOdx3Nip2sl24jLiKxrRLbUMp3k2FP9/ir1uYmbsBzRKCfxLufxK32NmbapJhijKnVCYvyC/W+4
	DkpFQdeJynahA==
X-Received: by 2002:a05:6122:348a:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-59bf201ae84mr7750859e0c.6.1780403166081;
        Tue, 02 Jun 2026 05:26:06 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d3c9649asm9948891e0c.1.2026.06.02.05.26.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:26:04 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59aaca022easo2901250e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 05:26:03 -0700 (PDT)
X-Received: by 2002:a05:6122:46a3:b0:56b:579c:82e with SMTP id
 71dfb90a1353d-59bf1a40ae2mr7324776e0c.5.1780403163126; Tue, 02 Jun 2026
 05:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530080340.24715-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com> <ah64Y3fuO2ofgsDG@ninjato>
In-Reply-To: <ah64Y3fuO2ofgsDG@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 14:25:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBfaxdK+Ov7xSVK+TfD0rbrOwVg-a_+mMHhU9wfE5_7g@mail.gmail.com>
X-Gm-Features: AVHnY4Ih0OfMn_vpjjCTbwfXWwgSar0-zdZtmXFYlFh9TbZJ143ij1eRV8CzZVw
Message-ID: <CAMuHMdWBfaxdK+Ov7xSVK+TfD0rbrOwVg-a_+mMHhU9wfE5_7g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: renesas: r8a779g0: add MFIS node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33424-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA84262E0C7

Hi Wolfram,

On Tue, 2 Jun 2026 at 13:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +               mfis: system-controller@e6260000 {
> > > +                       compatible = "renesas,r8a779g0-mfis";
> > > +                       reg = <0 0xe6260000 0 0xf000>;
> >
> > Why 0xf000 and not 0x10000?
>
> The sheet listing the memory map has a "MFI - Region 14" entry for
> 0xe626e000, but no region 15 for 0xe626f000. I thought I play safe.

Indeed...

However, according to attachment R-CarV4H_UM_018_AXI-bus_D_r1p30.xlsx,
MFI14 applies to MFIS H'E626_E000 - H'E626_FFFF, thus covers 8 KiB,
i.e. double of the other regions.

> Can change if you want...

Yes please.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

