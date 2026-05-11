Return-Path: <linux-renesas-soc+bounces-32366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFFRAw6uAWrXiAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:23:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E850BD38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06057300342C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2665F345CCA;
	Mon, 11 May 2026 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffeeMbcB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E259E376BE8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494986; cv=pass; b=oHr1zLyNM6j37+LZLFcCUKKcwNLmXSdJ3mjGwS8uRvBK0q96tQue0J+8pWju1qzL83rmGkEOMll6fhyAzgbg36RvapaZ2ZcYBpCFDI9Ty5MIm+bqAkP7iVsb4x793HYCAje02AhZp8wrJAyB5xm7jVPWQApeeoYFIwayZYJvtqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494986; c=relaxed/simple;
	bh=xXjo6IWfCz/xy4VI8+IePoDrGofTt+dOYDT8TY3Agwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx7SVxAWzq/WMeV9cfuDNvb2lSHZqedkWuGpzzZeAzdQr+H4sTzuBev3vRDZ8qB335/TeNHaXMeSfpnnw/4gtV+bAUqRXL4VfdOyqE8A3YypvI52sGqD4eL+XhqpVkl3hSCa6mbME0NWUvp0HX1vxVxJYybjklWVlbmQa0j6fjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffeeMbcB; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so2355681a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 03:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778494984; cv=none;
        d=google.com; s=arc-20240605;
        b=dcynG++HcM/HoZ9QMkGhQeGgaicLF5uJe839P8oxH7QJHvj6i2wbOi2BjXh+K7YNdH
         EOjRPGXsfvPlkaj57UigTyC/8KnQiol/hxWaqkH7LMjakB2fvu/bVje1rLr0JaGXHxLY
         euav26KJnU2k6HkiS9KemENZPvaT/9UY8FXGA2KcCvkmCl40WDvH7PPZkfAZnCN0DG1K
         mA8IVoytyFGYs+7bRT36GXU6gsb77wnUye4+NvjkU1OqKNVMs05xBulPZP1nOGYgmBhk
         FovPznzclMc7EpTY8/pb+EFnvAGLnYzyzDOUrpAeHL59pwkb61nLfxrwwO22/kzLrnzj
         edWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        fh=vmLwFekCepsuCDo+luOQQvt/yffz2TBHLE1SPOmLnhk=;
        b=BUQKmm7bdGCnFdNeLtefkZUznRdLzOf2ulDVQqy3N9OCGn+3tBd1TxCBeulpMA+zEp
         FSAY78x/kGB/8FqSWIB9IvlKtd5Qh6jY25IF7MT7arNoH3xlbhMpf4IjJwogG37Voepj
         YOXqa6yFv5hVVjRxC32wiIYX46R5AYGOPvXV3ivPGYHrbxo5KpR1GptkolI5Sc/aEJ20
         T8rgiSm9Nqeo7ilpgXM4CdONqVS7VYJGUVO0onZ0sSFvuvd077hDDoh0iW1agCnUN58g
         L+G1mV00xdV7JzLZjNNnqw4Qk8ML8pWc8uivL/VAKYtxM9B3m6MhEagBkV3CySOpxXCh
         n44A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778494984; x=1779099784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        b=ffeeMbcBye+XbIdAqackXrlwO3lnbT5Nw4xtXd4rRWKnFfRK/AO9bJvKYlpvZ9eE1D
         ozO8LcXfY30TijrXbiz9P4AD77OZZGK+t6Ig2EL1+gnZBJK09wBtbxQc+899bb3jK0NL
         gWa0sgK2+egOsycEs+1bxtKd+1aIbEVxqLSt0PwtgbPBTOq89ETyrD42xw3szoZq8iJe
         Y784dP4fYbebecbLTYLjBGvxrItNseXOGnf7nAoRjHskklV/I2ZhpEc1a/TA/JLaKXfn
         HVu4AdQWQpJPkTioMqH9BuEe7LqEwzPqk2kNIbA8BavYoDxZotfoUysT7QKPeacQ1jx9
         ZqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494984; x=1779099784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        b=pgkCXNsvOwzBG0SzmgDKMopy9fO4EvJa133EcSfu3NarArmao0hSKxg6WgomCCNMA2
         WPJklmS+cRQ8AHI8pm6E+i78dhhE/Rf44aKGFaFpF3QcnCRu4swNXy5fPS/FhQmAynjF
         3Av9GFYtmdM0laNTKT1eU/OwNaYvNn5Q1LmA2sUgkJv7KwIcpu3VdaOla5T7slvd6qQ2
         7LpEWZiyWZQAEyx2bp0cCdK6Pps5Fl4rN3z6XzwkctObSc4slofN9mSD9LhUfcCa0Bs3
         xLIj8uvAbmIyiyrDTS8XefsCur5GtS2ev3CpKTBX5n/qJGD/ORczeMpoP7ajZU54z1lA
         5KNA==
X-Forwarded-Encrypted: i=1; AFNElJ9B8agmqOv0iVwBYqrwGwM2+4jubP5foeMsIHcH15Y/uZG7XMygQuqtejiQ2apnvlJ2tdCWQ4zobYCSlA4YgmuKGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5kjbw5q8Xv4HLSkkqzlbfcuu5ba4kSbJUHNsCWaj0UhBYf4A1
	EiOhHcieNBCU2KaJ22KgzEvU9t2FJjLiWNE/IAHmUC+vZsGoXw3xGx4eS9kMeGng3/hf4/yx+wg
	fVgzRe9ls3Qmx+4KOqMhTC6rf31tthd4=
X-Gm-Gg: Acq92OHNCM6q8UpR7zj2Ydr6uDfJsxKIP9lYdqS14tcLMLSWGK4IVpKsMy70A2cn1kt
	fEKYN7JFJI+geNscnJtsCxm4ooQfZQ9pydgCC3fhAVlolkecCq4hIjx882xNCUwymtrn2a0CmfY
	KPELKHOdtJWTga+HeoubeyKVAyEi5Mo9O3a8JUbsKtrMRlPcEob93MfvXBFaESqf69Ftildiw6E
	8Fo9/IR7cuHXQ/RuExOnjGkf5k6HT7sFtEPkUwmavOD3aVuQv9aGE9nc7i+0fgebd0duRXs+aVV
	NxRPfuJqm4O8jqk/a8MZVJQbdTZfYwtHL7ES2wvslMW1rjiF
X-Received: by 2002:a17:90b:5484:b0:35e:3afb:a3ff with SMTP id
 98e67ed59e1d1-365ab9b8beemr23214081a91.3.1778494984218; Mon, 11 May 2026
 03:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-10-phucduc.bui@gmail.com> <877bpan1l6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bpan1l6.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:22:52 +0700
X-Gm-Features: AVHnY4KeZdeHiYzmKMhvfxrwvLSvsF523Nansp1muFCl-srjK4towjDma_7cf9k
Message-ID: <CAABR9nGTnDQHceDT5=Q49WwLf9EPc52TQSKe=PrF7B2jxsrTSQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] ASoC: renesas: fsi: Use clock prepare handling
 in startup/shutdown
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7E3E850BD38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32366-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,

> fsi->clock.count check can be done on fsi_clk_[un]prepare() ?

Thank you. I will move:

  if (clock->count != 0)
      return 0;

to the beginning of the fsi_clk_[un]prepare() functions to make the
code cleaner and more compact.

Best regards,
Phuc

