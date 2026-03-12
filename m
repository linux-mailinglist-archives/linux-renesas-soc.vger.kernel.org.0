Return-Path: <linux-renesas-soc+bounces-29272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDuPOLOnsmnwOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:46:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2562713EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41E063094F8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 11:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537A7390CB7;
	Thu, 12 Mar 2026 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1h/q5jO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1AB3B775C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315783; cv=pass; b=MZV0Z88CRJnk22UofKdMctwXYnJw3F0B1l834/gdO68wu3TBHM4mUZEOVUNZYi8hXVghR+kDYUDYlxyjdTHwhjcY7t0v2d1QC+x4H9dprXhcAZaA8/4QgW+9xJaNw14VBq2opN9ryjyiVM8ZsPH8FDQOPKsqrHbIpyRVrWYLfss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315783; c=relaxed/simple;
	bh=RsAdZW+SNrysKlGF0KYpi9oK13tnuvg/Wgv68rH1S9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUHc+fC7RrTcSqOLismm8MIvHpEw5qf0Un5FGKu/xazo+X4ySFMQi9f2weXhZXghJD/VVzjBo9gkI4WbkLP/otC2K7T/af2EDcA3ng3xRgMCCRpyndQlR5xQ5zigHv6AFGIXa/gpad27X5ZUN+FHayqtq+sehCYDQE9gfJ3jyqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1h/q5jO; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4327790c4e9so715619f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 04:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773315780; cv=none;
        d=google.com; s=arc-20240605;
        b=RU65FlweUWmjFgWfZCJmxvZpLi3tpRfjgjEoIzpWjJ5G95tHoC4i4uHbHurjLDL0o7
         D0GxJtqQkOacN7ksO8Z/5ycFV+vy5rLybc0st7X6E4J6BYDlYLdMmBrnnrUlONjxEx6o
         tP3Z8YIuO/TiZopaRVKb6XzbkuYKGHXCohY2a6JGjl6NJ2/lVWWXbYsuXwaf1/Ts/l/I
         IBtRbs31BDbYnFqIyPKzy1HveumGDDM0sxHa9AiJ+kl0i65xKjxbvORKfcsKCYwiNZxM
         S1CGbOp0R1Cw9ChmPmwT8SIkkxyZqdBpL1rrZ2/KaCSoL2pYIihhGnBbh/nAC7hg5Mc8
         xWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHVMKXPO7fhC3aitzZrQw9ifuMfBk3M50PCScMu19BE=;
        fh=ccx/tVLEap7CGl1SbOHR6uuWKixCkhu7tKmjiWrbCow=;
        b=PIxPigY6FocDjt31Y8nCGFHHppy7eaN0pw9eemImk07a26AD8dDDHSBapyWpI9Om+X
         yUXP2Ld6UN8qwSKYsqHlzSftWzwuDtCvfRk+lzhM8n6JF6kqT/K+mAWjA9qgMKGC0FUt
         +EX6LDQ/+bvLJr/1PatB7WryZ67dhsbK5fj6YT1IHZjYyxA15wtdCKm3fGhG8WRmxuKy
         Ov1PLdz/hai9kr/s+xLieHj0tyzDDLFNPXhMfaUL4NhYt/2dRvOrutKp1+1KqsZ34stR
         s39MkItRSB97cWki5djN56V3ASDUxLGNuyflE9oNguIEI81mrvSBZDumLB0bFv/D/TOC
         cf7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773315780; x=1773920580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHVMKXPO7fhC3aitzZrQw9ifuMfBk3M50PCScMu19BE=;
        b=S1h/q5jOCVmiLqHqHkIGTdcwQZST/B8kO+UgK27OMk9n9KUaCRpB8+WMVortuM2jhl
         oEgzIrhIg/L0aDeFwJjSKDaSS+rV89hqt0EpnsyUBCUGP+x8uX6ki7UF8I8mfGGgDQbF
         MKpS2PMQYjETDJKo8orRfDfDvVxQJTnFIIbTEk8OU5UAyyYVVyl4ipIiCF6ejdckFV5Q
         11mp+GZWjVDGNMWfbrtbRFA7/wbB9pjuh7w7A7fkd5nylsmTY7/911LJ6fNGmGGYg5wP
         OvHA7E+IhSh+GYKA1+2t3/2V7TO+ZjRmoH6AJDk+12sIn5o43YTWJAnXKmv6YKtqS42R
         JEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315780; x=1773920580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHVMKXPO7fhC3aitzZrQw9ifuMfBk3M50PCScMu19BE=;
        b=V3W1XS5tgIfRn6wfSn9prQStiHCSFvOht2REZNvinLLDPV8JoLEmJ8NwFYukaPLYOt
         sLgxCE3MxythtSbY1N9n4BeTx7lj2YQsPl4X5tbncpx0pj541lW2sheDY3FggUGiPNEb
         giYkKvB18qlF5DSIq6Ergo9jBTxfGogM4u34afWeO2zHxq3TWelTZNYgT5be/rHyRFYe
         Q1oP+SmVCqJiBGLJC294oG1N/WzVk4YZS8HzIAMpD5qHyVRZYq1HvHrdUorqEFCpq0Tl
         ullUPMRkgGCPwViH3U+aZ/5IbXbIThBDyWsB85hM9FBsObDWu2sVax0gEjD6LYrw01bE
         B0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUCz1QkUaEyZFW3EjjsOFG1et88A32gJ5/Ox4eupLQStRbZR4uAR4BYFln7ni7tyzyA4FG3sakfWQP/W2t5JA7eag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/tb/ERSduzD27jddW6RGo4IDJR55g+uYxV0huf4QAttgH+WIA
	TVl6GOdWQwmJRtQ/0ZiDrkk339wToFTtGDOBhlswGsBh7mOC52wsBTGmvLNfdez+3dAYRBnQC6u
	mxvfVxXagGYdvlb0fPmqAYst1UXdxHkQ=
X-Gm-Gg: ATEYQzzI2IfvNJ9ToVDqyizBB/HgfOrZKg8/9ftYX7ztncmQMloXdCwmHuiTn7oHmAe
	Ow1TH0DOTpM2AH9BValN0eYtNJeTlRzF6JKD4akdeuPrjnWLq5EphOPuaqsun3gDsXo2R5si8e+
	0kJ6GJmPiDPL92mRgzoRWAh56mfexq2qnSbUibqPUS7ZlLbk+B0o7CJhTgaHsh2RqAtmvI3mTrH
	3mDMnzXLZDHNkwmCa0JuEHR0G5HfJVdVI9VsAJCGpKUlMLLJEWzIYO7uu7NQXiawxtvDxOT8EdL
	TK2AYt65A7etT2ThglSxLI4oxD/7+FTkDfgpbJhfHfh4ahbID5z0+za2vDfUfQrd/O8sFg==
X-Received: by 2002:a05:6000:18a9:b0:439:ba4d:bf53 with SMTP id
 ffacd0b85a97d-439f8423d74mr10803375f8f.52.1773315780042; Thu, 12 Mar 2026
 04:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
In-Reply-To: <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 Mar 2026 11:42:34 +0000
X-Gm-Features: AaiRm51_ssk7vGH1f9YJGjAo91zvg5snVrOTShKiwdxkIaJ0-47Q0oGg_3OsmGM
Message-ID: <CA+V-a8sqDAdJMGhjFi-HsdEvHj=6FaquyLhFvLUwXVp7Jk0j9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29272-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E2562713EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Tue, Mar 3, 2026 at 1:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Oct 2025 at 21:11, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H al=
lows
> > configuring pin properties through the DRCTLm (I/O Buffer Function
> > Switching) registers, including:
> > - Drive strength (low/middle/high/ultra high)
> > - Pull-up/pull-down/no-bias configuration (3 options: no pull, pull-up,
> >   pull-down)
> > - Schmitt trigger control (enable/disable)
> > - Slew rate control (2 options: slow/fast)
> >
> > The drive strength configuration uses four discrete levels (low, middle=
,
> > high, ultra high) rather than the standard milliamp values. To properly
> > represent this hardware behavior, implement a custom device-tree bindin=
g
> > parameter "renesas,drive-strength" that accepts values 0-3 correspondin=
g
> > to these discrete levels.
> >
> > The DRCTLm registers are accessed in 32-bit mode, with each port split
> > into two halves (bits 0-3 and bits 4-7) requiring separate register
> > offsets.
> >
> > Implement pinconf_ops to support:
> > - Getting/setting individual pin configurations
> > - Getting/setting pin group configurations
> > - Standard properties: bias-disable, bias-pull-up, bias-pull-down,
> >   input-schmitt-enable, slew-rate
> > - Custom property: renesas,drive-strength
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Just a minor drive-by comment for a patch that is still WIP...
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
>
> > +static void rzt2h_drctl_rmw(struct rzt2h_pinctrl *pctrl, unsigned int =
pin,
> > +                           u32 mask, u32 val)
> > +{
> > +       u32 port =3D RZT2H_PIN_ID_TO_PORT(pin);
> > +       u8 bit =3D RZT2H_PIN_ID_TO_PIN(pin);
> > +       u32 offset =3D DRCTL(port);
> > +       unsigned long flags;
> > +       u32 drctl;
> > +
> > +       /* Access DRCTLm register in 32-bit mode */
> > +       if (bit >=3D 4)
> > +               offset +=3D 4;
> > +
> > +       spin_lock_irqsave(&pctrl->lock, flags);
>
> Please use "guard(spinlock_irqsave)(&pctrl->lock);" instead, to match
> the style of the rest of the file.
>
Agreed.

> Note that that will become "raw_spinlock_irqsave" soon, due to
> "[PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context".
>
Thanks for the heads up.

Cheers,
Prabhakar

