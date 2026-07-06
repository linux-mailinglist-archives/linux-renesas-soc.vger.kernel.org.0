Return-Path: <linux-renesas-soc+bounces-34781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zOuaJej6S2oFeAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 20:58:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24203714BD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 20:58:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D2DB+V1p;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6151830B9465
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 18:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B453CF68F;
	Mon,  6 Jul 2026 18:51:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DFB3C3786
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 18:51:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363905; cv=pass; b=CfFXz5blp6gRSxgfIgUkzXAQ2JvUCVcka0yHAGnH/xcpQRiR5/1eWcwHVk4pW0WaW/Wu7dSebtWGC2RGTj0FMcU4TLgtiOyj6xMKlT/Yeu97ltQtyDvu6yzfqjIyktZ/8X2Mvtd/35y9A6uZ2nwjUJOjr38ByO34XIxaEVVA1es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363905; c=relaxed/simple;
	bh=fCdq0lYopj7korz3DO/dq32zkKygeRyx2BE0Wg8f5OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXUfCblQI/FBb7gRp90SamBoc7k4dgPzjxajVFvEgton8TDJKoSjdCn6z1mMnRgGYl4VLeBttaFGs28pBVB+3LbSpC3JD7bKo6LnZI81f2RlWU2XPz/yPGA9oaoAz++iN9YpgzKxFm/2Bcbg5oea8HgkA1J8X5Yjyz37UnhUPJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2DB+V1p; arc=pass smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c733f15aso33846785e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 11:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783363900; cv=none;
        d=google.com; s=arc-20260327;
        b=XEMG7mxjF0pUlAqepZ6/rpI8et3mYacyNF9sUEaIC7PIE0Mh04KVibWMhG2xr0B6y+
         i60eoBamYpl1m1A455A29MuaOMWOOv171HIATnCcjLa+U9fw+ka2msidNRabqcmWBO13
         FU65dMG3IgLYdmgmMqI2ZjBDXBl7kj5sGlJT89/Miqepw7gtB254TSRaeQAMCkiQ8N71
         iyu7Imd0IScwUIv+J7loSsoY0dLLl5qhvB/Up99nQt/S7jODN5+CLjvjgVnkAqwolQNS
         reIVTHHq6qhkctXXW4tJDNHVTMKrb4KO38Cm74thoxK4obD3RRflL/sd2WYI838v5yRO
         bA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CSAQ86wMiX5Gp6AT84n1QfYe5hGWs1YjlnFkunec7Q=;
        fh=K9ZAJS95V0DZ0OSkws4gVjfC0hxDZ1TIh9hXK4vLIus=;
        b=FAgtRsgmoLqwC5jHa3M8saACtIY1ExFRRSg0gFzQNYjZEKdpNY+ysPfuq1BHXGEDui
         LNQh3A9AtiusHhl1strnrCmdOgtdgZrYwm4+ritYqtwuUCUfmkWCZZCIMuDKJXR8qUK3
         5zI+unLShV6m9cQeO/IAMiZeTUG85jVBUmjrdR5opdsTzUHqSYO6KaTi6OZ1EHGZDAMs
         nJCVHoCTEUxB78jBKjMdBb+AAlR+vH8iCWpeDzLb2GDkXbgm8JLrCbKiOXGwm5d4dXwW
         Cn6tEU+HcA31Ow7tSSLKgJ/QQGeIRBpUm7CZAPZO8JKVvOA4BTYGoC+LDGh5YkUpoeno
         cWFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783363900; x=1783968700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CSAQ86wMiX5Gp6AT84n1QfYe5hGWs1YjlnFkunec7Q=;
        b=D2DB+V1pu9VZk76gbHmhZs2FWtDSxbjxD+6jk2xSBrzpA7nzl8bqO0aKfE4303aiaz
         3D9r+dis1GGFTHWYfnRfvnZGWQX3jYP0+iqKGWsYowGxafGoUOqWh2NhTNgUJ8H6vXqP
         qfQTFVBcm2UYE/nTJyTm2/E6kr68K1nIhPsZ3wR6ePFV66jqa+sEWwqvItsKYgr4Zv63
         Ik6JoFB8JxYhhN4mwBlNM9lFOUINzhgYN+Zy7g/HpON63rEZ0hiuzuUaB/sRfM6OkYfT
         bnO8xc+NI6TuiuRQui6d+XcjupSpez2q5AjaYtWi0i8+Khha5e5GhyB3lirnGjubuYto
         Tnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363900; x=1783968700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CSAQ86wMiX5Gp6AT84n1QfYe5hGWs1YjlnFkunec7Q=;
        b=V5U9wGfA/pZ2AVIJ6NxIK9jriZ/80/Zg8xAuju8G4H570xLn8QcTY2t57Mgt4w4zPV
         +CqM9rN7ZPY1cB9QNGx208milqoMHie1xzSNZTTcRsBVY3HdhhKlDQ6zidoIVofGUeFr
         Qly+4o+vUa9JV0Mh7NHph8TeCQ/f8eJg/ByBXCq/GkgtRP4PQPEg2A9TkULvZK9QDBIw
         POeuDvVOOZ5d6odKNOrB/iGtrCh6QY8dwV/s/Hi+Y5PLCj4IIZjfOU97XMldnqkpN6TP
         IpNzLde69WutX/2/cMdfkOLwM0r5xoenHhBt7MYTHsDDRG9SxSLbcVcaGkw9UnMwlteY
         7Zpw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+0yj4KVBliblFR6zWFGuhDN/r+UKrNLYnLUNAB+W5u6LWGHfkvgCZv2ftq9Dy87s5ynO3eWPWO1NKJN5sIMn+kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmt0Uhcn7PbZnKNeLURmc5YtVTOp8J46k5p5CZTFYbQ4inMk1p
	T7XD4zeJ0usWBNJWXYFgRTgmrZvlPcFZPDUf+1cxw58mxwzPJttVupoV6Nv+86vaY7sogWs5xXk
	y/TKKmMX/MFqbAzz85faau8HiYqJeo8M=
X-Gm-Gg: AfdE7cmRZpCMQ/BGddOnOeJg6suHqbFHM5ozJ9l3ry9GNis/+RmHFs18KurxtFfvnWM
	UgomAiDbtvPl7EZP7yW8eVPKsfAdhGj0Ve2G6M9k2O34ywjwRvJ5gbQG9cauK5c9BjBtw88JprN
	JyYQmQNMh3FXoH83SqVWhO2y/Unhu9Cq9faaDKy6mIatEcpyk7m4pnCItJd3AOXWaSZPKktQXgL
	+3StEEs5w1GxL8vZWkL3ej2ljhS1lr4yg5sKWg9iiTbTQUaqrLD07UoOfTG2LjOCQtR4pg1irYN
	E8Dy6MfRgBW0dB3ZvfnHChlNil1I2jaAn0Ew/PtUkBdWR6u8Um4N4Ni50g==
X-Received: by 2002:a05:600c:4f84:b0:492:5030:5e7b with SMTP id
 5b1f17b1804b1-493df06a26emr18953135e9.10.1783363900368; Mon, 06 Jul 2026
 11:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
In-Reply-To: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 6 Jul 2026 19:51:13 +0100
X-Gm-Features: AVVi8CdhZOFc6S2n05FV9nlTvx9urpSzJPBcWirnqMlmue__2oziyda_FreEG6M
Message-ID: <CA+V-a8vxjms+yqzO_sfFo19nMAuhZ5aFSuBsy1Hm+0PLFio3KA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34781-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24203714BD2

Hi Geert,

Thank you for the review.

On Mon, Jul 6, 2026 at 11:08=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
> >
> > The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> > low-power management and access control. These blocks are defined as ch=
ild
> > nodes within the Clock Pulse Generator (CPG) address space in the devic=
e
> > tree. Implement support for creating regmaps for these SYSC blocks.
> >
> > Register the regmap using of_syscon_register_regmap() against the CPG
> > device node so that consumers can access SYSC registers via the existin=
g
> > syscon phandle.
> >
> > Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> > initialization of the SYSC regmap.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Made use of for_each_child_of_node_scoped
> > - Moved sysc_init() to the end of the probe function
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > +static int r9a09g077_sysc_init(struct device *dev)
> > +{
> > +       struct device_node *child, *np =3D dev->of_node;
>
> error: unused variable =E2=80=98child=E2=80=99 [-Werror=3Dunused-variable=
]
>
Oops, I will fix this in the next version.

> No need to resend yet.
>
OK, I will wait for the review of the other patches too.

Cheers,
Prabhakar

