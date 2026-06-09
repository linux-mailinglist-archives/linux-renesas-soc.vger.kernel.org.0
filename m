Return-Path: <linux-renesas-soc+bounces-33731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TQcWEM7MJ2rJ2QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 10:20:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B865DAF6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 10:20:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="IX7/i9jG";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36A643053DEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 08:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862F23ED5A7;
	Tue,  9 Jun 2026 08:12:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F27E3ECBFB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 08:12:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992724; cv=pass; b=Jw4fI3AB+uEr1fMg9P0K1t1eig0aGGa+GvgKdERI5LNhy1ItzYBZr+QpDJcMcSwcUGzI7DQ8qgonoZL95tOkeyOdtFTQz4zMOeE06mcHlQ4G/5igTQJ5vM9F1D+npqs34XP6i2g42dudqWHjbcvkVg9WDKuCP3rBO60b9cMZIjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992724; c=relaxed/simple;
	bh=AhsPNfeCJ9V0MojTT9laWo25XjBvnNJFVFJi677eOj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWvkdojBbHDmMbo353ocYEkpLMDv57rBS4z6dfpXCTjzM0cfUXJZIa6HXBEg8K9Yc6rtQUNeIzvOJmi0FHVetNa7lm1/8fwOcVwNAqtZBdJtVg61g39sHL8Ti8fGQa0upzLT64z7PBhbaFNKrtSxROptqCa/UzCsX9+RP3zx7nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX7/i9jG; arc=pass smtp.client-ip=209.85.215.182
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso2530551a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 01:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780992723; cv=none;
        d=google.com; s=arc-20240605;
        b=QXZGSml1m6FR6jzDfe7ZWrE9uRVMsu2bmiXOEkhl5C/Ug1Z+1K4isR3O9OqBqR10O6
         0mQ7qlc/UrSu3ra70eg5nwQHSeVNqdsXURSRQmby3/hCuB7IPvs1Fb4ELgnPz92Bxizg
         iajJNQkrOgJL57h6fceaM/90tJAMpA+DVeYPorh6taRR+d6RRDGAtGa2yjuSw6L/a9p1
         1vsheohu4EMhc2jUlo7CTZ5K2q3nNgJ7vi58oxjgKH2ojdgnkWFOPcBbm6jrJj9/4Cw+
         UrsXaIz9H5flIHApynZslY7oXZFypdUM3dZREPZssoY0Tch0Y8Y/aMw3J79i7BuRWoKk
         I0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IPFHCJ5rJwgEVLo96ifIMbncAZkuI8Dm8EuKwFx00SI=;
        fh=X+iop1B2ryjZXHCwgORMz32VxXHZzEGytNixX5xg34s=;
        b=L2zXz+01cMCVwTwGMsCrxKSuNWCkw7Jv4Vw8T6Jf4zr4K36PPXhmHhybjZj0HMpsJm
         zcH4O6VZlI7jOvZ3o0+w5nIP71MWJxfOZ6GMMAb4/4XMcKWsFsptybYqgS5ZAYtDS/j/
         ueuJn1zbXUVhHZxefETBqGtlfFAHN+Dacx6nNGBTo8y6UJo8tRdP0p/bebg5LgCH/v8a
         dqdYUwRSNssqAe5CFiMYlfKNC6WnoPHguPvZ8fWNHR+c9DhMatApfBuQSAHLIpTrW3DF
         gMUSrb8HK4TQGkTVzJBy9aUsCpUsoVP37h6uE4ygz1K8O8tI1EwmkrYwYzSodPAfUGlw
         PqBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780992723; x=1781597523; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IPFHCJ5rJwgEVLo96ifIMbncAZkuI8Dm8EuKwFx00SI=;
        b=IX7/i9jGv8/XlnB1SaApdOLNbvz1pfm+yIU5tcZq74wbZEOVu83VvygBB2xeJEY9Ll
         n8K+BpHEDCPVRTRRNZUc6seOwNUt6SYpBKjJVKLLuiGDnb0AUSnrrpTaICEMmSBer6hK
         ZnrQTbdjbJpZEum+VBDokQWQfyo0uUdEU5C4SuDdVPAwHgRlI5hsvwKa8q4im85vukDV
         WGNqmYsFbTqCJAewONRsUZZQ/68MS7y+zIjHWDUKQXiV/l7fAhMBeJN/2eVQWShPbCXa
         GGV9GMDFDyge1MU6w2cMDNYQ+V8+5jpIum18+VHkAVSJ1ksE1BKUpCO3wwJjgFsBTwdd
         0e2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992723; x=1781597523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPFHCJ5rJwgEVLo96ifIMbncAZkuI8Dm8EuKwFx00SI=;
        b=pyJDYm94RSUIVE36KTSz3WB3HnzYJBL/u2iOecbJiAjTlJgbcu1cDlCxDasWTXD+LF
         JgTsgRqbXbrXDAPiNwV8TuZEgFgmaFD01i1AT+IZtby5v8UQmzoDWdZkV4mQr84zDQ1i
         g+VAuDN5NBbyvw0CmAm0NiG9YeEYNAK7jqVTDdezWnsLM7T/grcr1Ok5nuKDwU2SM8gG
         hSJLBrbKsMv1KLpy2BmucGHtOT31m+t/gMgcW9JAU/RbQvPC+AZRg/87WyMElQ0Kqma7
         p2Lsjd/kiw0FbtkVuAhxv4nTWScG9M4MlTkoJ9o/jhaMEKaRZkP5gOgXKn9dfuaRHGue
         teEw==
X-Forwarded-Encrypted: i=1; AFNElJ86V8Io7zNVFK0lYthjKmU3t85AZoGqug54qKFcr7rvInlYAfuOdL6lgSD9y/wgZqz3PGL+hJJbpHt+Z4JZsePv3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPgYfjggIOugxYQlY8JN6sLNbRrePYETNoBGdI8O+mOF9c6oX
	ijy2fRH4VEbqxIW+AWYuw7uq3JisJ5IY5ISU8xx+lZubJzKuEE2T+TePw5JoJv3JwSKRtrDOsfX
	nMvHZ+KkP/7EjyMNTSSpYl/dkg7SLs+8=
X-Gm-Gg: Acq92OGpgb+JsDu7vizwTw99IFRvC1oliWof9Iv3yLo2wujMtUVU8bLOahvTOep5SqG
	AWSkDxJ0hmY3ZzgulW7LDLuEqIY9P6gmfbqzJXxJVvKtruYSuj9HTdVRvyXz1+Btfq5ZhqSI6cU
	6SbU0DgdgHkdWVfjtMrJ5j6RzukNcHlL44qvvgdqjiDo6Vdm/0t68S45LZXTcYYPgcKsGvWIREl
	33Cryt6ZZJLCke3GJ013wWH5uui83FkjlZNPPhbCRZe54i6RN2JOLmXCHXmeaSsyEVtqXn0MWd7
	C94IZaQgiRtOWsoDQ0OuHv827NjTRyHbP5yE6twXu6EqQnmIhiXkjw6wlGQ=
X-Received: by 2002:a05:6a21:a8d:b0:3a2:c9a1:2c26 with SMTP id
 adf61e73a8af0-3b4d39f348bmr17130674637.7.1780992722861; Tue, 09 Jun 2026
 01:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll>
In-Reply-To: <20260609-nimble-guillemot-of-karma-bef5f1@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 15:11:51 +0700
X-Gm-Features: AVVi8CeUKRnlxvhT2K6w3TvQNEVCC1-hs1J00Q_rHp-PFlql8hF1iJ-ZDEJDD2g
Message-ID: <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33731-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B3B865DAF6

Hi Krzysztof,

Thank you for your reviews.

> > +      properties:
> > +        clock-names:
> > +          minItems: 2
> > +          uniqueItems: true
>
> You don't need this, it's by default.
>

Could you clarify which part you are referring to?
Are you referring to the "uniqueItems: true" property or another
constraint in this block?


> > +          items:
> > +            - const: fck
> > +            - const: spu
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
> > +            - enum: [icka, ickb, diva, divb, xcka, xckb]
>
> Are all optional in the board design? I cannot find answers to that in
> commit msg, but it is important - you need to explain WHY you are doing
> this and WHY such different way.
>

For r8a7740, "fck" and "spu" are required. The SPU clock must be enabled
to access the FSI registers because the FSI block is located behind the
SPU bus.
The remaining clocks (icka/b, diva/b and xcka/b) are not always required.
Their presence depends on the clock topology used by each FSI port.
In the previous discussion I described the supported clock configurations:
https://lore.kernel.org/all/CAABR9nEhOTz1-0NmCMTbz=-+782Pto0yovSQhBXrXqhLwMg80Q@mail.gmail.com/
The hardware supports several valid configurations, for example:
 - FSIA/FSIB slave: only fck and spu are needed.
 - FSI master using an internal clock: ickx and divx are used.
 - FSI master using an external clock: ickx and xckx are used.

Therefore, while fck and spu are mandatory on r8a7740, the other clocks
depend on the selected master/slave configuration and clock source, so
not all of them are expected to be present in every DT.

Best regards,
Phuc

