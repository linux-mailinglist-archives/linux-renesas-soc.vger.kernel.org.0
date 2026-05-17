Return-Path: <linux-renesas-soc+bounces-32729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPJUKYQlCmqyxAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 22:31:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E56563C53
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 22:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16C2301174E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 20:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFFA2E6CC0;
	Sun, 17 May 2026 20:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fv5b/zMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803FA2236E3
	for <linux-renesas-soc@vger.kernel.org>; Sun, 17 May 2026 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779049857; cv=pass; b=lhwDid0li3F4gj/9Q1YuFXNZVDRrGvseLYMkgPuGYaI72sk/6Vq1J+wjZMTMtDTzkMrqyKO9Zgot2fCqB0UD61ciYsl55jlKQK+CcUsff2F+7eUwbxToR5mNLUp4Gf8l9+ACgdovNn9RbGdVYjBEIuRExZpf3UzdhevDdA9uKKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779049857; c=relaxed/simple;
	bh=50C7JM4Fkn1oeuiBJSXgulYieHOs0OaBMs+8C//qUxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ni89CPzanNuNRinusS+yQVz7uzJOohcPUSc2zFuc+f2aUptiDO/Y3Mz7GKwG0UcDe8cQ5KEDqtzq1pYZCrulkOKZPutndyhjB+zWntFFnnQ17zj7bR+m6mMr3XglmNefm6jnliVGzQGAZQXW6SMXtCF/ZY2uDCEvtBPQ3xHeEyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fv5b/zMw; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so18187675e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 May 2026 13:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779049854; cv=none;
        d=google.com; s=arc-20240605;
        b=UkBMLso2W4W2+yx6kayoRMosANmX9UTh4vzt68/1O6chtPpwp59eSKQoZV+YxDpj71
         gHbNi/GyH5WySrya0srKt6pQydwnt4URAJ9kJ0MKNLUqpNX/Nd1XvR8WMrl181wsaAWv
         zupk41XI3bDMczf6TvKij8kCgKo45DMVnfekXVriONsqFXZ9PNugvLLudkOGdKd0ClEn
         UgGTWg9M4+R0lZP/bozNfe8DzwQDsBPZwLxejZL85pTSTuHoHC7b3jN1GUya8UYrPkKu
         sGCO7KBtBDD3Aqm3bhJSDtStTGZ1O2xCY2/73wCu+7IGQka7m04+VrYFwcXFipb/Dz5K
         zljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m5W2yksOeDngCRoP0/L217ADV5Bob6V0u6vG3fCF/SQ=;
        fh=7jO2cCt2yzqgL6g56GrFVkzKfHK2LVXEHJ9ovCkHbYc=;
        b=Uza73M/ha0L0yB2m5tHnSNLhuT2OuJh5O52Z4QLXKsqTXCTp7gjwcw6g9SfF1EBkF8
         MpFMIjv4khkNVRf4KiZARHrJSQOyUZH1mqr3IhSGMD9jRfm6TkRp4Vb38IL1esH3FZ2U
         PNrzmF3VYp0wFSEvvLID/uSYnOSJmzyvVPgnJaYLW7qm9paTOa9HYq5pD/05xeBTZvt0
         Gkxtgj9u8kdpFUqJI9iamolqK8YT233mfoNGsRcdC8WmMWtHttHxeF5lsCycMPzWbQUk
         wrnaxbT8uXaYu1ma8ulq/8Dbn1b349Xdx/A2wzp6JwhlHx81f5dqmP4zjCNarF0FNpq6
         FhoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779049854; x=1779654654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5W2yksOeDngCRoP0/L217ADV5Bob6V0u6vG3fCF/SQ=;
        b=fv5b/zMw3ZkJz83Vu9XsS9My5k2TmQpz521lVaHHMmxvg5BpCHX+Iq410ijt2s8oir
         1o+nMcUOAfiAyEh+8tYVs6+yInHfLYhWiSFdBqvO6sgxQADqi5A83NOokQ9Rq4W4s/Nj
         E+V9EpPN0Izvyl9r0UR22/koStBuC/r1wxDD1t+iyfXJqVA5LNU5fMPckbIZxm0o47EC
         d2o685E74CR/u+L5zTelk1iIzPlDln6nlQB8wDrdeCzZlL4ChEgkK4LAFkFW+syWxpqP
         Ogi0hRm6zmJVQs2euaFp/ylAzuiNaMCNtHTFMhdNsTnQ1PgEcPXpYkttdk/aqgBWWiwf
         cYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779049854; x=1779654654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5W2yksOeDngCRoP0/L217ADV5Bob6V0u6vG3fCF/SQ=;
        b=Dl3hpjYsYbFe8/RZeG0h8LMtYW+QUwO36fETWLqvGIEiZC5lNl80ALLP13v5430ZHR
         YTi1vlEnqPEIwYLNcvLKTlQNjRFfwHiD3LsKjj6E1P71IlTaqmze/ZZJGcNIYP8Lkb27
         K3SoKwGsQybo6o9ie011YBPFYs+o3gtFW3YjUnw9lSe2z43cP9gmQzip8NaJUoTc8wS8
         fgtYAyKNqSvVOZqVAgkfxBXp9VLAETSVo1hOTfz73a0g1GRKKLaxYdckShN+WOOahhPT
         8bP0+QBdX71A1AwcrcNBU6QKt4CyH+8dFSt3aFJT+23l5vsM5lpkxraZ1kba/GJ7weFh
         FP8A==
X-Forwarded-Encrypted: i=1; AFNElJ852fSwnlQ7/bSZdq4PAtkYKn0iHA3MTZ1P0JwzFbVJ809mfJxASnT/MqR+BlFV+Hpt7fiBlae4w1o+AGcn6iQyDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuRJ/7VEBvT1T5M4ZpM6QZQvTeVmsRr4mGcnZ73fySAd8DZAE
	x/teO5lINpBwJkwPsjn3SVrSwIs1oHF3j29HEapMSaZvw50r27Inc3rkrdN4hhaG7r0s8IgVQlc
	3+SgEF5nxjXzO3AdmXfjFaKgyHWWHMIg=
X-Gm-Gg: Acq92OHF2E0kxRK6xvbs1x0szNp46l2/cUmuSDnrNJwbJ+KInfUiY/DYgYsXo0tl/Qu
	+MmTIH5nSkhqf7si/t5l5QAm7H/ec/SmVdQpRUvtnnuCqu9Otf+XlPqnjxUvICdNgbUXOrSGvMe
	lI0+Z7ZoyJyUcoyDVLSWSYv+jMglWzbRF9guElVa2uwLQW25izkqF+rzAmFTCxLatIZYj3wg3JF
	7CmNKZIdsNEGA/3ct7hber3KFHJ09dQlZ9HlXhThEI96LdCxgW/Umf9LMlgaRObLcV/JxlQGByA
	x3R4GaMFVTvHZwiG0nuZ7G42l3YuDJDU47GWpOyN1MQHwwz5dzFxL955sAXqfPG00vayJPz0nDt
	lXLw=
X-Received: by 2002:a05:600c:4e02:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-48fe6322416mr195114775e9.18.1779049853553; Sun, 17 May 2026
 13:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346174DD5FFD70AB39F570086022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346174DD5FFD70AB39F570086022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 17 May 2026 21:30:26 +0100
X-Gm-Features: AVHnY4L4Iw5hWO4PauuBTrDRjWPhgs5UmEFDfgWOBP_KZfNbj_cxu6qjfmeyJWg
Message-ID: <CA+V-a8v_gmPEcWgFsC3Kv4X_M_qzbVHeEY=EmzdYxzy+PkyB-Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-output clock limits
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 02E56563C53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32729-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Biju,

Thank you for the review.

On Sun, May 17, 2026 at 6:59=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 12 May 2026 15:41
> > Subject: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to p=
er-output clock limits
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per-output co=
nstraints stored in
> > rzg2l_du_output_routing.
> >
> > Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5 MHz=
 upper limit specifically for
> > DPAD0. This approach cannot scale across the RZ DU family because pixel=
 clock limits vary per SoC and
> > per output interface.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_output_routing=
 so that clock constraints are
> > expressed at the granularity of individual output interfaces rather tha=
n globally per SoC. Update
> > rzg2l_du_encoder_mode_valid() to look up the routing entry for the acti=
ve output and return
> > MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the pixel clock falls outside th=
e declared range. A value of 0
> > for either field means no bound is enforced in that direction.
> >
> > Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875 MHz=
 minimum and 83.5 MHz maximum.
> > RZ/G2L and RZ/G2LC (R9A07G044) share the same DPAD0 pixel clock limits.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Moved clock limits from device_info to output_routing to allow
> >   per-output constraints.
> > - Updated commit message to reflect the change in approach.
> >
> > v1->v2:
> > - Dropped storing info pointer in struct rzg2l_du_encoder as it's not n=
eeded.
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
> >  3 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu=
/drm/renesas/rz-
> > du/rzg2l_du_drv.c
> > index 0fef33a5a089..d1bc205eb5f8 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > @@ -33,6 +33,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a=
07g043u_info =3D {
> >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> >                       .possible_outputs =3D BIT(0),
> >                       .port =3D 0,
> > +                     .mode_clock_min =3D 20875,
> > +                     .mode_clock_max =3D 83500,
> >               },
> >       },
> >  };
> > @@ -47,6 +49,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a=
07g044_info =3D {
> >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> >                       .possible_outputs =3D BIT(0),
> >                       .port =3D 1,
> > +                     .mode_clock_min =3D 20875,
> > +                     .mode_clock_max =3D 83500,
> >               }
> >       }
> >  };
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu=
/drm/renesas/rz-
> > du/rzg2l_du_drv.h
> > index 58806c2a8f2b..307ae70dd382 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > @@ -30,6 +30,8 @@ enum rzg2l_du_output {
> >   * struct rzg2l_du_output_routing - Output routing specification
> >   * @possible_outputs: bitmask of possible outputs
> >   * @port: device tree port number corresponding to this output route
> > + * @mode_clock_min: minimum pixel clock in kHz
> > + * @mode_clock_max: maximum pixel clock in kHz
> >   *
> >   * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
> >   * specify the valid SoC outputs, which CRTC can drive the output, and=
 the type @@ -38,6 +40,8 @@ enum
> > rzg2l_du_output {  struct rzg2l_du_output_routing {
> >       unsigned int possible_outputs;
> >       unsigned int port;
> > +     int mode_clock_min;
> > +     int mode_clock_max;
> >  };
> >
> >  /*
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers=
/gpu/drm/renesas/rz-
> > du/rzg2l_du_encoder.c
> > index 0e567b57a408..4af2ae09ff39 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > @@ -50,8 +50,12 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *enco=
der,
> >                           const struct drm_display_mode *mode)  {
> >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > +     struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->base.de=
v);
> > +     const struct rzg2l_du_output_routing *route =3D
> > +&rcdu->info->routes[renc->output];
> >
> > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
>
> Please retain the check for DPAD output, to avoid checking the same for D=
SI and LVDS.
>
This patch checks only for pads that have added constraints.

Cheers,
Prabhakar

