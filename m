Return-Path: <linux-renesas-soc+bounces-32261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI+zAv29/GnSTAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:29:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5DC4EC39F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AD113006B4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 16:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9978C39F193;
	Thu,  7 May 2026 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWhRo7nl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196FE31353C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171168; cv=pass; b=czdCXk+0KY4S0HBmH2wSloelWd8Uq5zY5phX2M3jcz3sVbsiWswskcD8b1WWMQtXKeQOCR5EgRYa2g39n7hhyXkGzkgTaw0jWE31Jsdh+Lm6XKeyxoIl8qqxWfKtPQQBdiG/pprBl6eKQQMTQ2QOcbqwLZmr2DYprHsrK5HqVy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171168; c=relaxed/simple;
	bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBlU//VU4ooqCEbA5aSQC19iH9/E+a7oo0OG/3yJtnxv9yCrxQkymvlkgrI923s9iWgi6Ipp5/F1IqL8/cMmnmKCADeS+wnsYgjpvF45Fv6GHyUBJMhrbwxvGiw7XBwCIGlUaIisXPkp5tSLCHrsB7wGNb5PzRkP0xJFLam9F7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWhRo7nl; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so6914835e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 09:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778171165; cv=none;
        d=google.com; s=arc-20240605;
        b=YikL/LcZ9p2RDBBGHXFN/XIcv3ZenMFQ0XKjXByAfRjtkADbB9RCk+lCorVs62gIKW
         mutAgoPGNmjjKcVP6OQI60887jebSbIb62aMx6PGuXjueSIUSOHf/vql3Rmkukh2FeMa
         eHhI2RZVnRyQfi4Pyvwsa3zg4RzNc/ufhLhT8JdnWsUPfgPJEpaHpUTDxHn22uV4IPS2
         GVqo6tzEHm5DRCrAaFOMs9QJxDTUJfiiJVOjcPJBnErQymx/XySf8+/wFxZFryTO/5ee
         MXgQ55ewFp+MfLvH0jU4iizehZWCNo0af66vd3LfslAm2CyxrqngZyq6X3wvPMo5HodL
         QGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
        fh=bq7ivktXGlB//Llhp0uuMutjm9gfA8uY9NycMgwihLY=;
        b=aiyptXy2Sh4hKo1aozfYMeeBbfU9xrTh8DmQfdl+Dj7SwRKQwV32iRN8tkgS2LH3X/
         sSozOKU1Pi6PpRIeGF7Iv5EExiQs66KMYOAkM2hio7siElJmcpDUFEvOB7ziNa4AY6KT
         U2gKazOOc3GssSEEazIi73hGiktn/032MguAivO6FGls9tkoc78ieqkW6xxzOIcEuQ9M
         6AN8Jew6RLpWQQUlM7v8WjmWjYSJ4LPHPqNfTOzpIuUVn/NsfB6aoy1yCLkJTM0OC7mY
         zrF2hEJPPIBbb/++dyIIN5ZMwHOnJf+lLyw2uEQ6VbnxhmuRkFh244QY+5RqfyQ/L2Sz
         H/GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778171165; x=1778775965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
        b=QWhRo7nlanh63aQrdcptKhtbqHChOXNiWce4lgF4p9EiJSmvaecbBMtLoqKFJpg36q
         sWbShc0OX1O+GqbdildFa7tp4SSlvx6pdqu/JpAXfsuK7oYsGa3xRmUt5Lyx2OJdEHaM
         jsTfUOUK9gkruraxaQSHPO0KYLu6jeAQxOwb2nIeaI4iTeXbJg3duv8I2jXuaI/Pvgqp
         kchZlOSZpROSp60T1dUh1cKpFizG5oxBxMK7U6Fdb/d0ciO06QuVawBuLmtUMtF0z7io
         yFz42IAOigasD2ewr+fQ4soZ2CVY3Q2yNMqye9YuQRSIaT5Hb+G6ZAKhOU7so9i9C7bW
         njzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171165; x=1778775965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
        b=MqV6PbpRAidqpZmoanPV7bZjoMg2jbxqnhV17SjSHPVAFv9zEXWzc+Gi0aE9kZFrH7
         OfgdiUuSP/9koU1pAG1OEPAR9D5PBZHPvVM3SiP6K534+DLKFYf/Qv727cWpSMuWIQCY
         wr+2dIcSuLV0Ybn1HsXeu37FVuhzj3bWXIMJh37XiT4u8ShskFRsm6Kr3DEswbdizL5m
         FStWX9DWz3Wyl2SSVgeFFTQrqo6LVN3gRA5KL0r9+Q90DoQPOnj3VCKkoZFFfjsskkd0
         U6PyiP0yMcMVubwFMsAfFXIDG2ht1zi1BjX0C+saR5eeD2ZCScz0kKxJC86paoJLLToJ
         2veQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ca3h8CRpE2NMSvm+B7QNxTWUi2uZoHA32dNmtIIS406R3l8KMDxktKmWUc0qvcH+qPrSS/IBABmQGTqr3W9oNGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymw0JmFZEWu6nxfJbUsrhSyMyAxjkRN7wqXtybptb5Qdpx/TOQ
	vtd59MOmmNn8bLZAWWWkn0dHVKeT49T0FafxxK45EVLYVRdF+SA5rygOSITybUoP7m06X/7aT4G
	mKAX1G/AeFUJLP0a943n5YDWrtzF2Iis=
X-Gm-Gg: AeBDietzNlFPSp1nKpQtH3DvLqqmslH8oD7++MUo7NvEJL8aEkH1AmSKVhknj4SZZ/Z
	Y6i72+gVcRyh+ZVzts3c8kl0H61QvWQOV0iGYkkKmRlT/qJCmYAhbxWkOq46MKwUMmMDokm+//G
	/coFNF0tigCABHtttBrGHrb6sCB6NyiwV8rrIIigHxAY+GglrbnbcntRtFZ+uutBPOVgQ0wRQtl
	pBbsVUBZjz5Ls7HZN5FmXTWXpW94lbaWXewQpUHHZ8ZgfHzTEF+XfdDIejlUeoPSGhZrJL9iOyW
	SJJlb25dJ1SDoVXQpvV7JaXz0vzQzSh41gLGpFcBRQeMHdD+02KRiQ2HhHyjoe500OBIW8AddSM
	xO31I
X-Received: by 2002:a05:600c:3548:b0:48a:7aad:4425 with SMTP id
 5b1f17b1804b1-48e51e097fcmr139299195e9.3.1778171165189; Thu, 07 May 2026
 09:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506200826.GB1652535@killaraus.ideasonboard.com>
In-Reply-To: <20260506200826.GB1652535@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:25:38 +0100
X-Gm-Features: AVHnY4J0DaxPufqdFXqftS14umWBtVlA89V6qUT2eHHlB5Fn79fAtb5gBsvy_HQ
Message-ID: <CA+V-a8vKuDzJ-ZCZFohDm2nTur4wvnQEQnZsZc0OUaJh=MwVSA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm: renesas: rz-du: Make DU reset control optional
 for RZ/T2H support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5E5DC4EC39F
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32261-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Laurent,

Thank you for the review.

On Wed, May 6, 2026 at 9:08=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 29, 2026 at 06:00:10PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the DU CRTC initialisation to request the reset control using
> > devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block d=
oes
> > not expose a reset line, and treating the reset as mandatory prevents t=
he
> > driver from probing on those platforms.
>
> This assume a device tree compliant with the bindings. In case of a
> non-compliant device tree on platforms other than RZ/T2H, the driver may
> silently fail to work as it won't complain about the lack of reset. I
> think that's acceptable, as the reset should be specified in the SoC's
> .dtsi. If if was the responsibility of board DT authors I would be a bit
> more concerned.
>
I agree. Since the reset is expected to be defined in the SoC-level
.dtsi and dtbs checks do complain if it is missed.

Cheers,
Prabhakar

