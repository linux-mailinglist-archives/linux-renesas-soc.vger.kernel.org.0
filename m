Return-Path: <linux-renesas-soc+bounces-31774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC7uKLgS82k4xAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:28:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C29B49F3BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9E23300CE50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 08:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0D03BC675;
	Thu, 30 Apr 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeNoGult"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027239E6E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777537718; cv=pass; b=ZP53rgNGKxQO29TEU3tRWWFjUNY2F4b58ECUpfjmw406XA+iyC0to0zd7aj3cK+BozFbI4eo4Q/auUb7Z67XAWX1skVtTwzyK9KhWoHFBObHDDKEwXs9gSAtr2Iru3DiSwj5Welw4ojG9+ooGGFsKzN0r5JY3Ya2omlA9dL7jkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777537718; c=relaxed/simple;
	bh=2/yZgTr4CTD8XHTnwPqdgb+RZUcWn4sw+c+oAJhS7dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUMYEpeeY+1mrQNTrWEUWu32wPtiU7Q26NTMoFNBLpYnPzcmf5OaUWteCyj8jbOGg1Gvf3JgSBI5n3o5ESbJMns8Qx24KgMhpuriETbgFMqchVuNxPB0+mm0Z1+91s9DPvfDCWfnC03yqFy/UaIvgM9EJJB/k64CfYAVPXHTtww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeNoGult; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7645adbdso409216f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 01:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777537715; cv=none;
        d=google.com; s=arc-20240605;
        b=Ahk5qKZuSESb85zC4Jse351O/NaqYA4n2vM1bL1DUZGPCB1u9OEhurXc+dMqVxI5LG
         JPzip8viWTzhMKkvuF14jg+MswUsoH1kMZO+cxhOV1Xc9bFFcDZ2cgaAO5Z+feS29+zQ
         8YSDMEyIF46LRPnazNXZdpcnk74XpEjb5nsJrSPmXeF+6JWWJ+HWbox7KZKQMh1i7WzV
         krH1Ufqy5u2YQpGcZ5i+CMTBAYQF9Ny3nz2Y0w7QBhqcbWkBQgQD8R66xcYjuBYqyRP8
         TvjYCrw2JPl6Ky0TrZUqcqdJa0ha9GFt8xBKGwowLh+X0zL1/iSlq1657c5II6a8or8M
         OSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73zzoZ4sPyqQM1ddXXgHuIWR1EcT9Ao9jm25y+/BQQM=;
        fh=t/hX7cHn83Y1/NSfoTi+2deO75cPRwt2xAyYFA+TvZM=;
        b=la/1MiEZUVpiLmWJdqqIq933SypTSLL9Hz/9Sr/k0s+B4O7wKMBiU4R9s47KsEC0Yi
         ERiKU7jYK+ZMbJ9BUoIuVeXNCoeVl6L6Z1tzf8JJ52mgPZ3H1wUm70fXBEXL5oOPmHrf
         nSICIaG0fXoNoklB04HdHco36FOkbkt5pNOXPPTl0MHNNMA8RIat5PJGVaSzFJHOKQ59
         ZNACBSzTCqyl6HxN3+wInz2gkc0TzbYx0jrjI2btUsEpNtAazsNsQ7wtYneSb3HtUtJb
         j4DQKH1U0I/2YG1LOIvwZN6O+cPXOPCaJGqYCXTdWwKoWJ4x71Tp/cz85uDEbN82Cg7O
         smxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777537715; x=1778142515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73zzoZ4sPyqQM1ddXXgHuIWR1EcT9Ao9jm25y+/BQQM=;
        b=WeNoGultXu/xCS+WjcLGp6tpd7Ne0Xgs+wJv1s+A7xy7N8P93xZ/I8uwxsy5rJq7JU
         QZx8bDTQbZ/aHfDgFT5BbGjkFYzNWwFN8+VchM8XcG7lG8FQ3/USiSeUHRKqKzWCSC2d
         xiXh23cW9PwGfaz4GKiyRYPdilukvxVRdrlqx0wyMWwJU4wwa6NBJOl3tCGzrmqTOWij
         XM8o5BZWvLeZ+KdKmXPvmmSpzvkUQjyZHfHs9YPQPU1yodeKMl6NJ74xJAK6Xet7iCJP
         pM8SHL9L+VollTkb7/AobNLOyvapQJmFZ1oA2nWYnne8P/eAw0jzPbdJhbBicN8fj0n6
         vsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777537715; x=1778142515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=73zzoZ4sPyqQM1ddXXgHuIWR1EcT9Ao9jm25y+/BQQM=;
        b=cLjeMevBXhP8QLtpnyzWnmappfnldpiqw6O2btuVoaYYdnuSKcVusE+uB+cEgBYrGs
         ckqTYfEvd+Ylbhi8Tx+W4A0VOObXSPo43XEAWrOpU9cmjDhVPeg0Y6DCzgD+cTMZMTv2
         oHwDtUvFFWPW3b6J1iyu7g9hp1PkMtbMGQuA3hU3324KNMFzOKfu8jZmjMS5+RP1FN2I
         5Fq9bfyFelDVJlLIyY4QDCMRCh0kq1TGuRiuOS+2sjpwtppAZwyn8Y1RKAX6gqgLP+Ha
         8kV6OScmoSZCrXekLbRoZFhw2jZVVZgFn4UIJ+SVn4wh2yRBuzNfmVvpszGfmxPRgaAO
         iTfw==
X-Forwarded-Encrypted: i=1; AFNElJ/DX8d1aMFFJgVdI0xJ3BUNGG9yuVyvukHZWF0odjnw0/flxTn4+gmWw4IgJrtzifqPy1IxyhrEZDSYpkFaiNuHkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaPRgOWzWYlWxKVt/uscibzMDE7W+G1N1UvqPlUDEZbpWXHbhd
	+vFwTbD0W3avuZ0gN/6t8jcJl/xbmPgVB+5r73Rs7gnbc6+XL6xCqtZCMmRDnVVkqOpqa5/KZ2n
	cXB0m+x62R+nD7aKSxXHcIqIzLt+QpyI=
X-Gm-Gg: AeBDievigKs5P5blzYAcP35mJ3nz3AQuq3TubdGEzF47tCyrSow8ERuy8okLhuiVrKE
	9n9cN1NncG9SnHvaXMmF6GL+NH/t1X6KFAGYj/RS3YvUTs+n07/3QqZ36x6ik5PF8hhJmyHMSBt
	3XJkIgaIVKZBMkfcs0zw7lokwhLg5QNhSkuD/J/DcCR5lNgavaqM/31B1cPVgF1eZsCBZF6VXbq
	q79Fbb5LA8/tfLvWwBlehUkq1n3eJlqPe7aX5WtpFWZXBnhz0+SxyKIh2p0US4WfqnM+pRXu9W5
	VIyfAb21WdAcJdYTGv34+Zwx49TXpKDFOXgb45F2V67QrbYIWhFGPi3g/uP8kozNHB8kQkTlUUN
	ygL57iym/LWUmf0f5
X-Received: by 2002:a05:6000:136c:b0:449:9aee:4581 with SMTP id
 ffacd0b85a97d-4499aee4685mr984254f8f.12.1777537714956; Thu, 30 Apr 2026
 01:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUne5vUermQ7NnN67-QL_PM-SxJQogFpmSVUo1ussohXw@mail.gmail.com>
In-Reply-To: <CAMuHMdUne5vUermQ7NnN67-QL_PM-SxJQogFpmSVUo1ussohXw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Apr 2026 09:28:08 +0100
X-Gm-Features: AVHnY4LhGhTKHDnRjjANWtMgzHHdQKdgB_6XkN5IfVS_13v0QQhibAF2kKLjvfg
Message-ID: <CA+V-a8uGycC4gJ4X=j4mXTuWsRWx7OjtUkg7ttHgNNKHh--g=w@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: renesas: rz-du: Add support for RZ/T2H SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0C29B49F3BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31774-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]

Hi Geert,

On Thu, Apr 30, 2026 at 8:55=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 29 Apr 2026 at 19:00, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
> > supporting resolutions up to WXGA with two RPFs for layer blending.
> > Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
> > DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > @@ -20,6 +20,8 @@
> >  struct device;
> >  struct drm_property;
> >
> > +#define RZG2L_DU_FEATURE_DPIO_OE       BIT(0)  /* Has DPIO output enab=
le control */
>
> Note that this addition conflicts with
>
>     #define RZG2L_DU_FEATURE_SMUX2_DSI_CLK BIT(0) /* Per output mux */
>
> in "[PATCH v6 15/21] drm: renesas: rz-du: Add RZ/G3E support"
> https://lore.kernel.org/11313371ef0b31cb5f014e171ba0d9868eb0710d.17756368=
98.git.tommaso.merciai.xr@bp.renesas.com/
>
Tommaso has kindly agreed to rebase his patches on top of T2H, as the
G3E DU design is still under discussion, and the T2H DU pipeline is
simpler than the G3E one.

Cheers,
Prabhakar

> > +
> >  enum rzg2l_du_output {
> >         RZG2L_DU_OUTPUT_DSI0,
> >         RZG2L_DU_OUTPUT_DPAD0,
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

