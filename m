Return-Path: <linux-renesas-soc+bounces-32276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAeEIl20/WkXhwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:01:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A0D4F4A77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4534F301E741
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 10:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A891B3CD8C1;
	Fri,  8 May 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlE/lom5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A802F8EB2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234446; cv=pass; b=ciJ/Hu+8rh8oP+D224CiOHKPj1Yp2uwNjsopG23SCv56WQn2LFcNl23Bh24yN5UW4pbvfxU2IwiomGyzGZFwqtNFp3WjuInxeEg2oa6gRbjq7KRrKDcRU6R+AhbRxekXfUYM/A612AW71ooDSam+yNtSeRCeCahF/2NAFNhn8us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234446; c=relaxed/simple;
	bh=m0x77AzGjGh0isowfSdBEMq0CPkAgUrYvNRavBNdh2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la4iYzERgdG2W79LdFybmbNluaMJp0wnhPm71BXODmo1iLOkfeBvaCtK3WZsDzi9fF4jAxLqoVht76eTzOzDoCCy9n3LmlU+EQ8AJbbt1hewoJLvUgV/DWYTPVCOo2kUK3gh98T/VhBkHRuPPFblCM2DnwvMYT+s6DizSSuFGtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlE/lom5; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1106225f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 03:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778234442; cv=none;
        d=google.com; s=arc-20240605;
        b=BVwwcISCLG+31H1oI6xo+kHgLFdalx+z6sraWId6ZAeXvC6RKlvuT4/8EgohqU9OCZ
         hem9jcn0ACrPXCq+EwWMpgTsIUft18FvhwAGyFES+ipQsIL59QeoMJVrG5Td+ds/gkhG
         n5IA2hbso0k3Zx2rZSP6aBjjfiIiNXKesC1881ig1/yuopjwKMv1dYDO31Tkzmj9DPAg
         YllmFRiFIuD97FVIUlX3cNLhgZ3KSI6HmNNufKXvUdBW+4+TKXlBPddoK0McS58l5HTb
         NTdvQNuha4p0HpsYq4TO9i+zcnpxktMI52L8S+AK2WUMBfXd6NXAisrcPruKET0KkdNe
         YlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u+geW7HzvpvuwmCodYfbhbpyQH/Dv/H3RYeFTEhDvMY=;
        fh=A5y6GS0z9bJr+sot5pSxt2dM76KBFhId1XbfFQmYFQ4=;
        b=jfWkvaSRzBdcCA9uqznWVIhxPrWuYGpkALKsE3xz0jYSqBCQ+BPXr/eoE4q6089aN9
         LkteFbmPi+pMfIxK6YzNfVoeFb99u5THJlZiYvZOovbGU6sBI3qRARvdyzI5U8BYjRng
         MisJF36pWX7n0AbnEfEF6wl+QwHvAxiGCdPq01hL+qD7I4KF1Ju/aKw7FyMTO2lsdqYE
         NEIjarvebzWr3I2AF3fBdFVYFWhDm3Zcnsz1U8Futk9TJxtBhQe+AQKUFlV+tvDiBlaH
         klyH3mdMspg3RinB3IUftxKE/bWMyNporqFzld5l3Y7MWby2gMBbHhnvAvdhTO7FpRKK
         Y/DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778234442; x=1778839242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+geW7HzvpvuwmCodYfbhbpyQH/Dv/H3RYeFTEhDvMY=;
        b=KlE/lom5IRyPonrqxV45mZiuDRdla2MN9mU/YtiQhTwxPdnuUPsZREoZ2RZ5Q9n9tV
         adBD6ziAvdQjFmHmC9nWNqDev+5YrTJ3Pp3naoq0n9MZQ4AXgvF3+pGZ9hSV6s1Cp+Zr
         QcdcVKmp09ZUMZ5sJQMtmWyi23DGibz7X2F791MdMgHc9SPlV8nrz+EarTyAi/TbuIf0
         Vb39AnRr9nu+W05+mQOO5O2lBhsgVm+CUriu1eQOdX2+pjt+JYhOeyOoBOSv2E0QPW59
         4uqbn+03cl+0Cr5dVbhqQ2rinzao16naIS8ev0x3hycozekXvKCT9z3482yvIzfLnHvG
         VoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234442; x=1778839242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+geW7HzvpvuwmCodYfbhbpyQH/Dv/H3RYeFTEhDvMY=;
        b=j9m4yGSBt+i16AUMrAd3VMqAfLCtNcD2OXS1vv+fKSpXeY41S5ylydbudZoAPGijaE
         Z8AjpzRa6h1WQMQ+6ZqMo4wM7vr+TBfO/2joMLsXwUgz+zSxkpaJFBLGIjwWB5opwwNr
         BtTXnmxI3wtpEghlGQ3pu8a1NTVx3Xg6VFvmjKoagp/jQ8LKj/f7v4eeNQHieRqYWbsY
         zS1zSAR31sJdpqbIN2N5tPSAAG4pvIAj1pMM7AEJvnV3wZ0TY9sZ1MjSuASJ2m6bYO7V
         s4eMaIP3sTZ1aG7zVWD6UQDYKK7slPuyKWArkFKTZsls2BBOipbMJvNvf61wYMo/+82J
         QFgw==
X-Forwarded-Encrypted: i=1; AFNElJ8lZEAuDfSx0gJWbxL+QxjTJ84q8ATvBL//34OSirOQ5ok/MpiG8zEsaJ9fDnYnJGG8ewE+wuZaWBelv8m29ZLgEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIsNjvGXEa3D6t8dLOE7W9y3gcGxkLFK8rtVCso3Jw7qwgKsTY
	ePNH3xVkTQRTSdvZf6ok0yPbox2p5wY/bsitdCiQUobnYEjikChFhhhnF1FTV/eSWz29vvOiWPW
	H3koWItO0V3CN/WAhkCqanwVpXVnlnTQ=
X-Gm-Gg: Acq92OG/aSRYDaWI61/7P4uJDglKX5lYewYeGHpFKqVWeAx/nfx40fSTdp67mKkBYX6
	7/cRBzYpwvbO1WpAsQgRlR2kA1tuvELMl2qIy7FoRZBsMDHfJM4nif5H5hqEk93NPKEQVDuRkow
	U2g4rmX5G1YB0+Q3+oMFYvYtA4zQr8pLcGgUMncPCJX2q9nN7Q3X/y/76pnQSDYlzNDZXBU4m2o
	t4fqD5JH1d/1xwwvxy7Tip4/UJPOwTEqbswZzA6ywNoOhqw7xvvqSKfl7HSZIQ4jnNbJUURRuhn
	aGPoS/83g5427NiYeaqFpdDZvkpo+0vKZEXzlRtRKX+axjRkbNJKPGhr2wvVc/GjzjUGXFfVfQx
	GDCnE
X-Received: by 2002:a5d:5f90:0:b0:448:7049:a6c9 with SMTP id
 ffacd0b85a97d-4515b056c3emr18956040f8f.5.1778234441801; Fri, 08 May 2026
 03:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506201400.GC1652535@killaraus.ideasonboard.com>
In-Reply-To: <20260506201400.GC1652535@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 May 2026 11:00:15 +0100
X-Gm-Features: AVHnY4LP8csuKz7LBRlHomSywlqEiEgGQCH4EJ0easAGNDrVsix2yt5Y_eKl99w
Message-ID: <CA+V-a8u_74SmeAKAXUqSKyWvp41pJavd_b_ESUOozCnrifBEpA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm: renesas: rz-du: Move mode_valid logic to per-SoC
 clock limits
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
X-Rspamd-Queue-Id: 72A0D4F4A77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32276-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Laurent,

Thank you for the review.

On Wed, May 6, 2026 at 9:14=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 29, 2026 at 06:00:11PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per SoC
> > constraints stored in rzg2l_du_device_info.
> >
> > Pixel clock limits differ across SoCs in the RZ DU family and cannot be
> > expressed by a single shared rule. For example, RZ/G2UL (R9A07G043U)
> > limits the DPAD0 pixel clock to 83.5 MHz, while other SoCs such as
> > RZ/T2H require a wider operating range.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to
> > describe the supported pixel clock range for each SoC. Update
> > rzg2l_du_encoder_mode_valid() to return MODE_CLOCK_LOW when the pixel
> > clock falls below mode_clock_min and MODE_CLOCK_HIGH when it exceeds
> > mode_clock_max.
> >
> > Set the pixel clock limits for RZ/G2UL(R9A07G043U) to 20.875MHz minimum
> > and 83.5MHz maximum.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 2 ++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h | 2 ++
> >  4 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu=
/drm/renesas/rz-du/rzg2l_du_drv.c
> > index 0fef33a5a089..3b7162c6e1f4 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > @@ -35,6 +35,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a=
07g043u_info =3D {
> >                       .port =3D 0,
> >               },
> >       },
> > +     .mode_clock_min =3D 20875,
> > +     .mode_clock_max =3D 83500,
> >  };
> >
> >  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu=
/drm/renesas/rz-du/rzg2l_du_drv.h
> > index 58806c2a8f2b..885558eb9547 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > @@ -44,10 +44,14 @@ struct rzg2l_du_output_routing {
> >   * struct rzg2l_du_device_info - DU model-specific information
> >   * @channels_mask: bit mask of available DU channels
> >   * @routes: array of CRTC to output routes, indexed by output (RZG2L_D=
U_OUTPUT_*)
> > + * @mode_clock_min: minimum pixel clock in kHz
> > + * @mode_clock_max: maximum pixel clock in kHz
> >   */
> >  struct rzg2l_du_device_info {
> >       unsigned int channels_mask;
> >       struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> > +     u32 mode_clock_min;
> > +     u32 mode_clock_max;
> >  };
> >
> >  #define RZG2L_DU_MAX_CRTCS           1
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers=
/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > index d53068733c66..ad02efec1c23 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > @@ -50,8 +50,11 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *enco=
der,
> >                           const struct drm_display_mode *mode)
> >  {
> >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > +     const struct rzg2l_du_device_info *info =3D renc->info;
>
> You could use
>
>         struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->base.de=
v);
>         const struct rzg2l_du_device_info *info =3D rcdu->info;
>
> and avoid the info pointer in struct rzg2l_du_encoder. Up to you.
>
Agreed, I will drop the info pointer for now.

> >
> > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
> > +     if (info->mode_clock_min && mode->clock < info->mode_clock_min)
> > +             return MODE_CLOCK_LOW;
> > +     if (info->mode_clock_max && mode->clock > info->mode_clock_max)
> >               return MODE_CLOCK_HIGH;
>
> The new check now applies to all outputs, not just the DPAD0 output. Is
> that intentional ?
>
The RZ/G2UL SoC only supports DPAD0 so the check is redundant.

> >
> >       return MODE_OK;
> > @@ -107,6 +110,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *=
rcdu,
> >       if (IS_ERR(renc))
> >               return PTR_ERR(renc);
> >
> > +     renc->info =3D rcdu->info;
> >       renc->output =3D output;
> >       drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_func=
s);
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h b/drivers=
/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > index 3e430c1f6132..39a1d178b856 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > @@ -14,10 +14,12 @@
> >  #include <linux/container_of.h>
> >
> >  struct rzg2l_du_device;
> > +struct rzg2l_du_device_info;
> >
> >  struct rzg2l_du_encoder {
> >       struct drm_encoder base;
> >       enum rzg2l_du_output output;
> > +     const struct rzg2l_du_device_info *info;
>
> If you want to keep a pointer here to avoid going through
> to_rzg2l_du_device(), I would store a backpointer to rzg2l_du_device
> instead of just an info pointer, it could come handy in other places.
>
As agreed above I will drop this pointer for now.

Cheers,
Prabhakar

