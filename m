Return-Path: <linux-renesas-soc+bounces-31348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QInyL8ne4WklzQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:18:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A8417D5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A92031E34A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 07:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF778372B5A;
	Fri, 17 Apr 2026 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRl73Ztf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6071344D95
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409902; cv=pass; b=Z4vPZxnkjpxaKRiUFp/QZxgFB/Nyi22yupwupk1b6yBKz4gTptBY4qasvpd8jLv2Xq2TRV17dfrLKAkaKdhAWCj53vIhQj904v2Akg2wntX7VhOwsnne5Jpz1TsbUrrNyh3OjmIeUoAuUnYUcNT5qAXpBt1TJFboshMS7Oy0OvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409902; c=relaxed/simple;
	bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah+f5/NfPRh67YXGrrO4ZaQKA5pMd+KNUPlRasb2qb9r1JiDoscdnaDKetrsfjHp9XoCcKFE3JkM7qWP6T99OkAhItxvP4mY8le1ilA2uxO9OIlRGY5nYoy1HO8NxaRGi113yfCM0RNQ1jWh7vavFuY2gZcbp9ndc58mB2SFvug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRl73Ztf; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so453904a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 00:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776409901; cv=none;
        d=google.com; s=arc-20240605;
        b=YNZnOI6CZRoz5XTG8r99x6yW06MMygUBVve7tIDFcs7ValzRPPMR8zxJ1svQmEzr6o
         /66XwpksHm++gxKklKG6Sz5W9BTYaAkkULqa12VA24Z8ufeWeYw0eyKWAWzLUJ394xUs
         70Kh+quSazvHC+2swyUfOTIDy8pfHBlXwOChXEfp9IbkDhhJLZwAm8Q5+HPbRytqIzUl
         kDKKscSZA3B82HSRiJ/QVDZkfPG1WbNsmsYlVQXZHaE7D+pnqBxdhLWAqZkdacyL+eWm
         9w16vtwx2iDYtz5Wy0QzWl3xr9bkD8OqxrzYEnIsMBr4OSuFgFNGwAXHVGg9pG7+HBT3
         Eo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        fh=v1lkWW4MuDXoCT2KYX+esS5ygvOkErSOOC5FfkPMb6k=;
        b=DfZbHlk1cagFFg2bFrCzWj8Y9aRRcl/8HQ5U2RF75QCkLhtUxs/9iMW6if1vQKNN/6
         gdKwSz18N4DUK2/q8vUlj3O3Oj0STvlEhvY02eKgj3YujdXgDDI+fTntGxHc3nrng8Gw
         32cwG7YLFT+DsjSmz2r/kLEBGQzNslgHw+HiCGEPvns96/+1aKAOzMjD+44cgTi8Hzx+
         afNobm1CZdb2wf5eFvDmLqjyjHsLKOAPM+g1Mw27muLaopqeCPJYKgiRmaHsrzxH/Wta
         r3hg5klM2Q19IOvBeOhBRxqTHbX3SqbToa24wr43HJ9B6v5qiGfV6VqrYrmUIpYAEtnn
         9Ahg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409901; x=1777014701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        b=lRl73Ztf6vQ+dPDOijkfogT4WK+g9JIxcMkPxmJoY/YNnPqKSm263lgh0BspbfHV4y
         CEG0X5E+FTiKT0FK2r3oCYyJFS2EH8MQIA8cbJ1/+jMsnHLitDUfqrbQtjlYzQp8ZhaJ
         24Jaa2iqS/+FkS/bwyMFT/1+eQHcktkSq3J/yHZPLZy1ps5KQzAq/jD1bYHyWBDACC7l
         I8FJnTP2r8NcjJK3GHA2jsmgdZqNNRL+zSe3EfKjpfrJl9mxDNva+W2Ny1pCuQkmZnEG
         4dWut37vCCRklixj+rUfNe2sUN7UC2KZOgWXe3/D8AGPacVuwgVOaJeBN+tHFN0tmTY7
         D93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409901; x=1777014701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        b=qUW22c9exo24Tv8wknLikZO7o2Zx1WcyQHpWqXmNHeH0ojrBXpeNZxOAEQfUrHgId0
         AI91QsYPf2lOyk6uvT58zzvPAp16MgZQ9CBQmrsBdP683qpTFYSWEqfne4cPV/u6tFoj
         OF/HpBDR2HipBA4cYSGExldIID0tE1Iy7/RjaB67s+UiSMa/q+vn+/0L5Ma6m5tVWTyN
         hdpLjbYFCuEAh8DxDw8MqIIeZEozQJlpSOzqovQO+r3Yrl0BmsBbU50Lq9vS5ct0yk05
         HQNrS1x5RopAQ49PVQFl0lpQTnareBfJx72uDobESwpo1bJeYJkfVc1ZtJ6PekOvZl+T
         LP4g==
X-Forwarded-Encrypted: i=1; AFNElJ+wno84zel7QqTWZ9WGb9Fjz9yMcAI+3LSkLHGBInPOD3Hk5l7KYagMQeKROwtU8t4CUyJnumNekszg0P7xK9qkGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwxNIIAcMv9qaI3DNsqMe+JpS4AHqIn3//u4Aj5GjRDOkaJEq1
	x4EOJjKpaQ2tgO++o/SiRuWSuac+m/lJLNkrUq5cEBnDVcE1Bp9TrEl5QRXwEJk/mBcL9TOrQhv
	k5Xftg1kjFomFDY0Es35b7l6SyXqapTo=
X-Gm-Gg: AeBDiesQLzpqogQf2qAx/dqWPHGBo/j7HggMyAZP8JgZTyTJgdWt0HGjyHDXgphPbFH
	S3Zs5V/g8uTFjgAJ7fgRVOXI3Bq0B+hbFAemfxchVVLISJBnx3tnWcqbWa53MU6KpXeVkxAXxXL
	EP9/8X8AT5Xj+jNszqM6WH/WDcNn5i3SETAVB+UAhWb1m2r8biO3NFEjCmHCuE2/BbK6rbK2ri7
	9FCg6i/qxzyuNpojx5NIYm2GTfC5b/ihIsITNyOB6XaqrsKXJlaXBF4r9ugsSqCwWi9n48zpKYt
	tnr613scMXv9xzRQG1i0q11JiMjbpR9LhhPiCqTTiUgax4ea
X-Received: by 2002:a17:903:1988:b0:2b4:5cea:f618 with SMTP id
 d9443c01a7336-2b5f9e7823fmr16651795ad.3.1776409900985; Fri, 17 Apr 2026
 00:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-3-phucduc.bui@gmail.com>
 <87tstepes7.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
 <87pl3yzabq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pl3yzabq.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 14:11:29 +0700
X-Gm-Features: AQROBzDizsepmDX0MeErlaHCs1gi7_m9r-_da5ZnWboWUDc9-Dlr4ZBcUowHw4U
Message-ID: <CAABR9nGdBVaidxSoPHjXSFZxuiN2-194DKqB-d=__awc1qGGrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31348-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 303A8417D5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san,

> > I d> Since fsi_hw_startup() and fsi_hw_shutdown() are called from fsi_d=
ai_trigger(),
> > I think this runs in an atomic context, but please correct me if I'm wr=
ong.
> > If so, is it safe to call clk_prepare_enable() under guard(spinlock_irq=
save)?
> > Since clk_prepare() can sleep, I=E2=80=99m wondering if this could pote=
ntially
> > cause a "scheduling while atomic" issue.
> >
> > Would it make more sense to move clk_prepare() to init time (in new
> > fsi_clk_init() ),
> > and only use clk_enable() / clk_disable() in the trigger path?
>
> I don't remember detail of SH-Mobile clock driver, but yes.

Thank you. I will update it in the next version.

Best Regards,
Phuc

