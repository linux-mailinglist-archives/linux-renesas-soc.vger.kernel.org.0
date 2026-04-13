Return-Path: <linux-renesas-soc+bounces-31221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJSoM0yR3Gl9TAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 08:46:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BEE3E7E2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 08:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E753016ED0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 06:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A594635DA49;
	Mon, 13 Apr 2026 06:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTyD0M9U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD4201113
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776062736; cv=pass; b=qt8XD8tVmZAemT5ll6CVUefk9YbmAOdHBuvCUrBvD0Pl2lBmBOftiTVlaQaYmjmrbtLQMLv9QLSHfB/ddgwsunzsOfDQDmXyxI1FHAidYGMUkk7iH+BTTDkzJcjGft1tIPkscR4oCWGSHc8PWmtJMedbeKsPUNLxS1zrDuY0BKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776062736; c=relaxed/simple;
	bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBjeQL/UisyREF0h6xE9cDy2qafbw7B5kELqkyDKOZ06TU50pAQ+CpSdI/vF+ZlNqo8dxQt3XEZ0VfVnAI1YRybT9LUcvgNhkqT+RH2FOekF/55H7NYQqnfaJ/5i2tCkv9RpXrwaPARvY6Ol3108oIBnm6Aoc9i7WILa8nVOu8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTyD0M9U; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b2503753efso34266625ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 23:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776062735; cv=none;
        d=google.com; s=arc-20240605;
        b=JcfHkiV2NGvXXNzjnJeNDqWjaCNyGJe89FSN7q0SOxivm/dwSx2Nqj7yYfkS+lTO93
         P2MG2Z1fuGoctsVbbPSIVB9M8yNjz3MQ+zOjy/EhDfatQ84pXwidzbh8A/i0IUTPsbmQ
         4Eri06QXxdp0iE+z7O9WTcpfSkmJPmdp5wSu0WgvbxbgKuutjU6GqiUsQRfQnCbtAJN+
         HuHeEf18gcqAYcP8HM1MaKxUGVuXUjoCOIHlxQS7rKt1aD3vwAEfNYC1MDXUhGMnpV0Y
         Pn8bopImSoLF5ky4tGqJzyymMlhs0MxupEmXkNS6lPTMwiFKpKROTTnQNFnUBRVQ6k+5
         2Q9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        fh=Woh1LYOIlkIjoTu4U9mDh+IBkmdor8TflSKfHWR4iV0=;
        b=B85xQVXG2hm5d20iIoMzYzx4sOiq2uAWByGH2cGSFeoWQpwCsbUwA1UQHhEEQjIvxY
         aeU1VfjCpr5zxGfV74eOplo0zPON+XFEcDwsfEjpHvymVKdqv2ghFpz4XCOzN0XjgFyf
         Uiazk1huJcVH1Ci90IYk9LQiuDjLO3wys49SCaMeclh2BacvRO/vn72OJJOoepbHMCNV
         CPL25IVh9/ykGs7JBUFmhQjsjkNV2CexhtuSpRyEDQPuKk8oMfq21OIWtjQvFrFv2Wq6
         U+QdCZ0yePqHuS1FjoIL7paaRo0mvJCE7AJ0OHcYV+Ld999rG+6RetO0JIxj131FX2BN
         EkCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776062735; x=1776667535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        b=kTyD0M9UYcfkqz1JZ3TsH6AucZW+i3iAqBQIBF05e9eixlZFwzvLZlGP4b/QgRSmhY
         GMY1nYWLFbuJbtcvdqGOLyVjLBetVHL2hZX1/Al9MEGpnFKLzvC3vfaP0lhCBvLzlxOI
         IeW2hoSqUam8hEYPYSYG5e/W3t1oz/R+HBG3kTqtuyVXLXcMvkHXvriCDgk3H9LrMCzc
         D1TOflWzK4rxh0i6FCVlT4dTSFu8AVPjpfLW/cscD9fATFmpaVYA2hdhPD9d7o08cFSp
         KHdDD+eBHIBLY3pAMTi3GTE7qSIJwBrHW8U3ZUHn+H8KX841s2rOgcjHs8X3U616gc1/
         gOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062735; x=1776667535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        b=kw0T0SWA2wUBEZ2G3npCcUL1yZd2XHTwoULJ2buTJ90I4Jw4hE2XHUmKCXX+j3e8ep
         IiBpbGfOs6CYvenRFI1pqsJWdvaXCniwcQvFfJFnBHa0tUoHYlpFFuh7/XWtkHNNoOV8
         ihbmvlL1vl9oubJxXDyghv85Ke9l9hxvpQqYBHto09uPVWmUjVQ25z8xQ/srTI7qlYmU
         LTlJ23SbJE7mdko4dG+18C8X8hQxuwPooPpJrraAE6zmWsK8rrBwZYqjqrLxi03U/g7R
         461ukP93qXUzDk+AYliye2wSsADz70r+8TbLzIDtR7C6nu21IHKXRc9tjWcX/q7zJkP1
         J+dw==
X-Forwarded-Encrypted: i=1; AFNElJ/hEJlhcw5yjXb0u6Vao9UhWJmUBC4TgKfvgWQmXWZciYbLkvMipbPbbWIm7AJR0ByvcIdIu23t1Sbl2f6/7DgrDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1zFPRxPCezUFKMR0uCDDMoF2+T0+7DV5HdIXyG/psX2jg4LiV
	CMXYbaajHPs74KX1RaO8AuNX7hwxOmlOHQYMsbMxqtj8Fyxkai1wAl0nTEcq3WOvHhVmAb0iob1
	8F9Dfr5ewFMRBPZDgRHUthsPferzMj0U=
X-Gm-Gg: AeBDievQO596dlPIbelOpKPByaS15CqEmDA6/Iqryzx919oAzALmHB1bTFwtwOftiqq
	1RgRwY2fehQwk2pHwWR0+58c2RPjrk3qvupkjFDizZMRpBYqKhOEGgcv/daXUoYd9Uf99jBhmZw
	tNM0lHVp1VFoyYtoZD25nO9X4wmN/kzw4pQHus1l23wCq+clx0/VZJS384lHM8X9i9evZ/v6FIu
	ey/fqJC8Hc0Z4zUGAHBmWdL2PrH14CEa7vhh6jaS/fGSnVw1gUlJtywes3pBf5Kz/mhxHnlTxXl
	M8sVWp1ClAAf5HFrG+ciQDLpzs6I15OWTE1Rng==
X-Received: by 2002:a17:903:238e:b0:2b4:5b9e:2f51 with SMTP id
 d9443c01a7336-2b45b9e3d37mr38238145ad.34.1776062731336; Sun, 12 Apr 2026
 23:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
 <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
 <87fr56vu4f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fr56vu4f.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Apr 2026 13:45:19 +0700
X-Gm-Features: AQROBzAGIOgvxWW7TC0q36Dvf8NNepmzIwchUGKpVQO1DIYC6Qea_kbbm6ocZUA
Message-ID: <CAABR9nEqJRoHJuaJGqk=ZpCKi0P5p2V9qJKBPsz7ELkGx8e2Fw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31221-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:url,renesas.com:email]
X-Rspamd-Queue-Id: 30BEE3E7E2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san, Geert,

Thanks for the feedback.

To keep things moving, I will send v2 shortly, focusing on the sequence
reordering and SPU Clock control to fix the system hang, which has been
confirmed to work.
Regarding the fsidiv clock provider, I will prepare it as a separate
patch after
confirmation from Geert, and will consider the appropriate approach for its
implementation.

Best regards,
Phuc

On Wed, Apr 8, 2026 at 1:33=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Bui, Geert
>
> > > Hmm... fsi_dai_trigger() seems strange.
> > > It seems (A) stops clock, and (B) sets register after that.
> > > Is this the reason why you get error ? I think (A) and (B) should be
> > > reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
> > > __fsi_suspend() are also not good.
> > > If so, can you use hw_start/stop() ?
> >
> > Thank you for the guidance. After reordering the sequence and moving th=
e
> > SPU power control to fsi_hw_start/shutdown, the system hang is now reso=
lved.
>
> Nice !
>
> > By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
> > In the legacy implementation, it was handled here:
> > https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
> > Currently, this has not been ported to the Common Clock Framework (CCF)=
 for
> > R8A7740, and it resides in a different register range from the core CPG=
.
> > For v2, would you prefer that I implement a small clock provider for
> > fsidiv within
> > the FSI driver, or should it be added under drivers/clk/renesas/?
>
> I think it should be under drivers/clk/renesas, but Geert ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

