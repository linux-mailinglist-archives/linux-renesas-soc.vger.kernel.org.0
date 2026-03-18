Return-Path: <linux-renesas-soc+bounces-29816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL87GaIBu2mreAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 20:48:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9E2C22D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 20:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B9453087C59
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 19:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA9D36A038;
	Wed, 18 Mar 2026 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwIFsXDZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B30C3F65E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863226; cv=pass; b=ifjF4Dy4cZl74nmjGq01kJfo5sRX0YmNQQvad68tDM8Gb5xlr+rsHb+5zXAEY9h/bwBZ2pK2JAq7u2VHB6IZrGrgJA+YpC3R9Ppvepqn9vwMXfxR7XQSQLW2utcsd4MmiXvLqBbq7OPfl5qJqBB5QmMwKJSgqSpqpj42E+gf2fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863226; c=relaxed/simple;
	bh=wdw7cbek1kXD1UoVWXdD4fCHrDKGOkOz00GR1xyGDLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEl3Tq40IsvyjPCtWBGkSXvX6YhWDtTFIGh30I3GzQxrkLyA4Tv6I7HuhwDoWYsEeho4LOvJM4gHyjAoGR0F+PrKJItQMqJuGhN6vYiXc/jVeOEv7E81hch9/VhLqJUWYFkfaYlH0hU9gAGYhBqOtEbUBUqaWCfmECwtrzKrO8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwIFsXDZ; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so2706285e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773863223; cv=none;
        d=google.com; s=arc-20240605;
        b=Qati0P013gEAwMV8ht3dKvVsR8942wK2R1Gbs3P63vyECiHm7ea9EHEmYTVNCdYvUD
         di5LasmzFXS0kx+VQMGkB2nmO5x+EtmXbyo4Rjk+9U+VZ3ke3yrfibRhcubqT/Nbl4Ij
         jiXVAqjZn/IwEnWf87kWy02wksfqALGcp9knmksWOkHBKCgHRiRKcjJdStCinY0A8eTc
         eKbTq3OdiXglrAXBmS5F3AOt4Kj1kdE0b+UGR9tnr3uogv1Er43wWWxqcn3oLeLQc2o6
         pYUDksbCwRkoDwLqNt7EQWxNdhEk4MeivU7fck126e/zDo4/2aCt5hgn6Q+d93819ku2
         eGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zZ+yvFyJb7pO8tRyYufwJywFQ3yWc3oSOzzyu5XObJ4=;
        fh=E4XnS96kJMOF0aYy69kOepO52QDPPQKA8AaozGuJ4/4=;
        b=BUXIgAVQlXfeBFr+Rk5ZPXhUCqvZxdZcW6U3GmSaouBMbz1uVBoAoVnbE4kaKwiOX+
         tM8XaKAJSXLhSMq80MBd6o4wO0EvUPCH7ltKY3zhr7yLGFZJZDcIYbtvcdKQ1e2flpBU
         uP7TdsJ/fv30nxDPALDN0ZfN6M99ccSzahX4vkpRKJJLF3AYnDdeP50KqdMn3NbSntii
         TfIcvfJGUrmz07wsuzM+u96JbdsdCj2+M7OrEZ0QSuzaXOND7LLIwKAWGsIzkMu0MXII
         1LEW8Nz6cqksjRZcf7KmHLOeRFW3jx38CmUoR+E1oF508znZEV8nSYOxwf+FM7huzAeG
         qhYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773863223; x=1774468023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ+yvFyJb7pO8tRyYufwJywFQ3yWc3oSOzzyu5XObJ4=;
        b=jwIFsXDZd1icPQSx9k+rMnIhbs8Fp+hOelEKXuTbd67mwsRptHVAdPebIVmZ/uHwYz
         FsTj/IrQXeZ359BBmie+HkXpVa1KqzqD7n0JJT8sIz1iBAGFGSKLB8dIk5W9njBrxvPX
         WlGcttiCWKD+9SDMzv+0C9+58Z15z9ujpUZPYtdQMP/k91hBfDURu9wIjXVtcsdo+weD
         Eq9MpFk9Ro2c2/rGHerpj+QyOVHPqX84UCVtVPna6K7MelEbfqWf/3e8UVzRNG+97W8+
         yND1GqI5580aAASkNeo0l3PNkSWjneJAjdTCBMfTDWQ8hrXafNxRCyagnlSqCAJS2+1p
         /Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773863223; x=1774468023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZ+yvFyJb7pO8tRyYufwJywFQ3yWc3oSOzzyu5XObJ4=;
        b=CUkfufddtXhJUOw3PhCSjoQ8Oe1mxaKQJ4pZriTtnYGgkAoOPrYqSwCyDaoM5PcQUc
         1FCAgw3BlaSpdzTOwps2sA2zH1UPt25Gz9n9Azu6aa2bTAxP8Qb88iFIf5HpwL/xfNp5
         5x3EqZTuBiBTWt3GyNFdUfEkhHIrL3i42vt7fAsf2QW8PXMhxqvClQAgFY6h2TZULzfK
         jehUoFsq6UXC4BvHWKLV/cvOtWHvtohq7ZczWHZWXvbn8OciWvEJCIp0I27Vy7kjw68/
         uqfkRUy9taS/k1oZfxQbEG7j9FHyPAFMdMaMS58XUf7BwF0OhFNoHipe6SDnW8t3y/zX
         BjvA==
X-Forwarded-Encrypted: i=1; AJvYcCVEgnnarf1JbyhBpqmRHlFGDzz5wAYwDjSRgHMR1zPbkJlktdUD5F6JSoQrC8yafEUQabjHpWv8YBAp7p2jU8iXrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70xxneMMjU/BoomRAk61hLgSepyOEXmRtBHnCi5+JsuVIYzsb
	8vCzvHXcyDRH1m+izgwHVswDLqxXPGd2QCwh9EzKTHg3Ssi6nx5CXXlFPirsmAebkd5w/lglnSu
	wTTwV06Op1awJDyyi3SBIuuqK4wDiYVE=
X-Gm-Gg: ATEYQzx8dN2x/m0UDeSnL2eUdIwgc6/wPzO6+x/+CU9jDOL8kBTGDMtt6n9DcPjO8uh
	NlbmhDxXh7FZNwGmyx+Mh2obH7J7mRC5tUPR6NXg+6O4nZEaOs9bPmML6Z0ppxqOzlxkKBW+s7Z
	HyPMxRS4u9RGjueiNe67dXvWbjBeQJjudlk0P+v9ipwx/lNle+NLKGUtojv9uwU7SUHgKasjRTZ
	YOu3Lu7ySMUb9aj4xYbZ3wPMNWMN3svx/xqLh6OJjEbFjlfuTP8un/KE9wWGpCvpl/MUEtXjld6
	+HSQ3bolIjgCuS6a9RaeosMILiD8aqngXVoqkilaiqmlfiQD2nyQib7ArP+/m3O52mxwE8mwXir
	hCw==
X-Received: by 2002:a05:6000:2004:b0:43b:5094:a9bf with SMTP id
 ffacd0b85a97d-43b527c4f31mr8413523f8f.29.1773863223212; Wed, 18 Mar 2026
 12:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318124450.163471-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260318163451.GA45978@bhelgaas>
In-Reply-To: <20260318163451.GA45978@bhelgaas>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Mar 2026 19:46:37 +0000
X-Gm-Features: AaiRm53vsowSxkB5--4HeT_RVVv_RKIJ1zLa_k6p-WVMbxRBxgyHI8U3GVl43Nw
Message-ID: <CA+V-a8sTKuPnNs-shtDAt=J4n2naBoEhsTsck5-ZfJqt7wwRuA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: pci: renesas,r9a08g045-pcie: Add RZ/V2N support
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29816-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.730];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BFE9E2C22D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn,

Thank you for the review.

On Wed, Mar 18, 2026 at 4:34=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> Conventional capitalization for subject lines here is:
>
>   dt-bindings: PCI: renesas,r9a08g045-pcie: Add ...
>
Ok.

> You can easily see this with:
>
>   git log --oneline --no-merges Documentation/devicetree/bindings/pci/
>
Ok, I will make a note of it.

> On Wed, Mar 18, 2026 at 12:44:46PM +0000, Prabhakar wrote:
> > ...
>
> > @@ -152,6 +158,7 @@ patternProperties:
> >          enum:
> >            - 0x0033
> >            - 0x0039
> > +          - 0x003B
>
> Other constants in this file use lower-case hex.
Agreed, I will switch to lowercase.

Cheers,
Prabhakar

