Return-Path: <linux-renesas-soc+bounces-32256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJh4OyG2/GnVSwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 17:56:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F04EB930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 17:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DF3230068CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 15:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6332D77E6;
	Thu,  7 May 2026 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpPOEKhk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F823BED55
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169372; cv=pass; b=c6GtQ01KZ/8FLVMSJhvxSAYfEEA+b+fYPsOGe/08AytiyhD67D+PZwo7leShjL+12mj5qA0XkQiefc7SN5B2mDYQL6hlzMtiIcZ9KkocKU32UADhkE9dhBvI9+zdHEF882g7mY88tbie/tT0mFeUqfQZL43gz31XkCV5C8+Ak1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169372; c=relaxed/simple;
	bh=pzVUaiZiI462LSeAjzmpXCABHbm2I68wOvx3INAMRKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YweTWxBG9pWO0qayggaS6nh26MvdverqNZwFjUAOPEOyKVR2kxrEhXeMkrZCtfr8K484ajiHqvkAUjxbyrrIKtsAbeCLkOScdV6MoX48msx4IzArf9Fjo+6Li3YAp8d9mWKf6iEoI+5i/Pt21GBMVhVxOLys5D2Q28b4A1mFW2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpPOEKhk; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bad54961385so167590466b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 08:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778169369; cv=none;
        d=google.com; s=arc-20240605;
        b=jtVOhM1TgSx8/70cBc470plCz4yLrIP4109S020cLgk/SQrKSm3PgzmpS3cndkGF2m
         bH34UOEpn95FaCOagTQNDqhyMxo7DhXTrSbVcLuqha8z6zH5mKUE5gD5ovPy8FJeJD/a
         a8GxY4Jy9n/pPrPcHmO3otn2o1QcggbUhdGgTNABGh78pt+tCGZhMEQhtSf8aaaA4lUW
         Vt1FsjYI87Ru9sytq1vSOQIcEBs/zf9qik/+HXaNg42gWLkwmFX4SGbUyULWDo+tGGDV
         p+4kWR2J6DERlJMADtjOaiVhY9wldyJ/KCV/3IONEos0VNU77yIcegUC4f71UbsYBcH7
         7u9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tZnLb1HQGSLjbJmS8evDaKXMNv8pyjgwaBOs2Nqrmp0=;
        fh=7YTHO18lhQ5DQh2+Ngj9vG6sJG3oyLylokpdmM1hFb4=;
        b=MuLRu2/xeu6HJNwpRu0bcEVe7LdJ7dFJgyLSHtUjc5AdtC6PstL0UHqCiIH1w1ClsK
         CC4i6XZUjoOTaBWDHxo2AW5K3u3DHcXXinloOYjnAXq6FVBhb9RD1wRk/oC98yFASWlX
         FE+olXgcVHyNdQTaYb8yarvw6GeNwAoYGijP/2CJCFW6DrG/XJQocALf22L0xKGI3rg+
         6jDzmYnpDHFiROVWL6WCZxCvo1ZOTYBJoCIL55JmBVAx5wOEikMyrcj1ak+7Lsd3sWdp
         TSAlCG7hjoHELxK7qkYFO+1l/kZRpHp95VIVJP6Ia3Bl50crn8Hvc5P8eYfVxL+K7FqW
         ho9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169369; x=1778774169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZnLb1HQGSLjbJmS8evDaKXMNv8pyjgwaBOs2Nqrmp0=;
        b=JpPOEKhkJThWK+T/4GtR3HqRYy+3d8Yn49pi79Afi3Nmi6CJ2cRklk4YCbCoFbAH9k
         QSTWKEihHHx7pqR9vCmf+tB8fEJ8ILPBLIzLjdlEFxFVomqyQH8p5l/EQLh56gZh3NSH
         kwB/NTjRbCuDCKAh9npf9SN5g4+pobJB0j+AK4cXGHAWkA8T2IyRg6JUbi8ny1CYiCrC
         qKhcJTwKim067Z8FcLuojlmVrCTramYvA/MgLawg9XKkUwralCwzeNIdtUwmhKv9IH9e
         Pz/g3YJVB4TYdUnjHM2lKtX1ve8lEAH6wtG0bKWxN3vh8tWDQikI00O/XXIHdmXrHhov
         3Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169369; x=1778774169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tZnLb1HQGSLjbJmS8evDaKXMNv8pyjgwaBOs2Nqrmp0=;
        b=raLgg7S98Pmfn4aCyOpgawWcumkEFt7rbvbWKz3KOGBw5YtRho1Lyq1d6QfG0vWOc8
         XfJ04Zt0VPOdnf8CrkcNwZtFnJWfUC2Ujd16iqHBrwRgUYMW5pdR/FGZiao4nGph0fI+
         oMUfJAQOD5ShzTbLimhQfdNHkhgA5gZUl95TtpqTrR/XDo3RCTX4Gq7I8uumn2q2SLsT
         OslM3jc0HEULJGr6Xp+gn783t71kMrZSAp5s1xDdH5qQSTQgFQ/Q3OgkN6pvL8iZV6vu
         3TvR0xyRydW0Jb4PpfQYTJnGAPmlRWZFfACKx/2/TOR9Gq0+vAVenzmCQKNQKiZhKApi
         voTg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z9kegqU4to4S5mwSh3gqumwaGAGAxoxH0zEEhMiRUSmCq0E3CJHb8Au6+l2nJMzbWdO8WX7V5YaXBtJs1MD152Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUTVKqFnVtkU8JQ9wRDHCHomaOKE1hYrenHmequpNIzEBzVVc
	i4M078aA9MlFfg58JjN+3yFAALYQtw6P/7HYxJop4g1QGLXRp+0er8sk9pxQT5qAHV7QRwKbFaF
	obX0eh1sQrgouuS59ARPHboRi0GbEdxU=
X-Gm-Gg: AeBDiesQq9WOZ4zRQs90DDm8ojtlqsFBxtx8wJtOTjPZJEUXrhH1lJvHsSqb8LQHxs0
	3hpQLiJnEQT2MQuuASxLfY0ZgdfCwFRJU/VoEA5z9nELiWKzO2zkv6qAlvrGjB0zvvukxa5XovL
	+qDM1/Y99D9DTQByMq5ktX8URGwF7317lGT2lfUG52102hbaoywSEJ63c056p7kYkXkdpNvB8fv
	GMM8NianCN+sYaTLmHbEoNhwP7p+8/p6WGJkpCegMLS3HlmKdwpWv91/fGoYz53fPTtAnoPEsGJ
	qF5CBOglkcaLi5vVt73k6LVOhq40OzZOhww1MbRrpjZsBRPgkbV+Csus3mZcX+lUU3xLUg==
X-Received: by 2002:a17:907:26c1:b0:bc9:ef67:3ea9 with SMTP id
 a640c23a62f3a-bc9ef673eeemr134499366b.37.1778169368665; Thu, 07 May 2026
 08:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506124643.128021-1-geert+renesas@glider.be>
In-Reply-To: <20260506124643.128021-1-geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 16:55:41 +0100
X-Gm-Features: AVHnY4J3gSuHJu_9IGGrqCXhoyZ3XPxDCslG6bnaa_Q7FaNolHXC1lQvxolbGqU
Message-ID: <CA+V-a8uO2L-Ha49+PxRV49Y5RWzvaVA1PGwigtcwPQS51u=+hA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Remove plat_sci_port.flags
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 876F04EB930
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32256-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 1:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The last setter of p->flags was removed in commit 37744feebc086908
> ("sh: remove sh5 support") in v5.8.
>
> Link: https://lore.kernel.org/CAMuHMdXs94k3-7YD-yO7p2=3D+u8waYGAz8mpP5LDb=
Mf3szt4V-w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  include/linux/serial_sci.h  | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 6c819b6b24258d36..a35230d57540384c 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3369,7 +3369,7 @@ static int sci_init_single(struct platform_device *=
dev,
>         }
>
>         port->type              =3D SCI_PUBLIC_PORT_ID(p->type);
> -       port->flags             =3D UPF_FIXED_PORT | UPF_BOOT_AUTOCONF | =
p->flags;
> +       port->flags             =3D UPF_FIXED_PORT | UPF_BOOT_AUTOCONF;
>         port->fifosize          =3D sci_port->params->fifosize;
>
>         if (p->type =3D=3D PORT_SCI && !dev->dev.of_node) {
> diff --git a/include/linux/serial_sci.h b/include/linux/serial_sci.h
> index 0f2f50b8d28e2743..36c795d61f7e8457 100644
> --- a/include/linux/serial_sci.h
> +++ b/include/linux/serial_sci.h
> @@ -51,7 +51,6 @@ struct plat_sci_port_ops {
>   */
>  struct plat_sci_port {
>         unsigned int    type;                   /* SCI / SCIF / IRDA / HS=
CIF */
> -       upf_t           flags;                  /* UPF_* flags */
>
>         unsigned int    sampling_rate;
>         unsigned int    scscr;                  /* SCSCR initialization *=
/
> --
> 2.43.0
>
>

