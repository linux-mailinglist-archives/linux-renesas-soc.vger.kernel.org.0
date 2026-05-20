Return-Path: <linux-renesas-soc+bounces-32850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vPM/MUNuDWp9xQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:18:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 862DF5898E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40255303BE92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 08:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B84E3B7B66;
	Wed, 20 May 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmjCkO18"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B686A3B774B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264859; cv=pass; b=IMqwGR658PfWL3lmwzAICyf8GbQsz4NtaxbofsUh85aqJT/AL5a2N/xrPMo64EaztK756/elIhh6WzQbORkxM/T16olRcMhz+/2jx8ypWZYCkaj7DoGjUmd4afoHTUUxNja4UFn3Wnjzx3s8UPRTxgHtWBy94HvAsc2BXsZ3qtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264859; c=relaxed/simple;
	bh=mdrmSpedq9SgiBqKaKec57wdbb3zVbrGvOqWd3NWfWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQsUaxtrT0JaUx8g/UDG9IXSxYbqM8DokoWbRxgcIJZDKcHidFIzRz600Yhmhzb4YhMnVUyw4urF7h4EFvZiFbNETGnQ6BapLLlVeipneC/OPy7LbKZU5a5+19pfpTskGXLJ18GAh101ThKe7acF3mkxp15xTR/ZJ8tWMzmcR68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmjCkO18; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d734223e4so2885148f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 01:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779264856; cv=none;
        d=google.com; s=arc-20240605;
        b=U75Sw1PKnMTVfypwLDEm890gKmPB+VTG9oeXCcxqxrve1XN7t22+k+AYnzqtVVvru/
         D5QXwXur7f0geuZmjrv4diCShr7gfeYDoFlvoDqHSx03BGR2CBCNRlgKJvjyM2Keryvq
         BFKqR5d2EQeP/H0Bn6Z/iGd6tfauYyDZB5Ep6/A0/6g+xlhvUqM4QrTmaZYnA1TcVF/B
         N/BJkTmXClTbQsbRWPPit79WLB0Vqxm6eCGr71Dx9oFPXwyz0aNG0ofEEPBkdhBV73f7
         xfU9Q1YEuTH3zoqDyQIUtOgJgqv8z1FuVgHJvgD/vtFsmQ6CdXXAfc6L9ajFdsxMBUh4
         WPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouGZIX16N7k23aqaPlMKraG3urpO1iCAJlk835dT/hs=;
        fh=N8Y4VIOS4xr3Ym28SfWOWP1KP+za/c/GimQSrwzq++M=;
        b=S/9rpQFAOBHJJ6l56zxL3IvP5fEPWJ4F0mOCeQnP8ko0bsyvre6Uw837GekGeJD6K/
         8oGNppwStNbIv6/67TepzMQjIiD2JGiAr32EYYz/AVIZoceRqGXnvhwYktVjlsRQ2f3H
         7UH/U1heZEY6YOLSJiTl2cfB3xL8tPmI5O+DdWubk+nwk6w8z18nrhlx6MehfK9WVFBe
         28sju9gwtOP8U2EO9GsL42+KQoQ7TqIZnZMWkuiPhu0amTLRyZ52PmmifGWtVyrl8Mqx
         SZjjZd3izZsE63sDES/vv7stYMXsnNUf3Ds9Zt+cOH2bUgbWiaJkkLymrLUEqUg78PvF
         u6OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779264856; x=1779869656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouGZIX16N7k23aqaPlMKraG3urpO1iCAJlk835dT/hs=;
        b=WmjCkO18LM5CRsgeWKHleFPa9WNuHelluCUvGppK2LvTY6jT6Fz/RENPjD4CjOXWcQ
         O/+31Q/I8fyr1jzdvHFKXGaAe3HjuW0GhDU/2l7kCmZPr6ur/6AmPdORjO2ZuyfkZI/r
         UKpyW6r+4Xcch+07pEEHLeFSX6pxROOb5VEh2vk0sykeWSAAEVznceb9APhFCuK5jJEh
         QTTIP55EkvKELbk83L2JWJ7LR8qultHwvcSg40mRVHXoFW8WFggn5eA84ax8aqbLEGxN
         rsfShSVhlTY3m6AW1tpzVv+ry7sETvw1ehWPn4KPDG+eAOss9s4spU2jhLWljEpvJpAj
         twUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264856; x=1779869656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ouGZIX16N7k23aqaPlMKraG3urpO1iCAJlk835dT/hs=;
        b=XM+N+lh4H4Pkviucw3yWhqCNzuUj5pU7sk4wu9LhawhQeqsiI8dRK57lZ8n6MSEC1q
         LsT+WLNoAV/Q5wiZUN35YmEO9VAcpDXztepnVUmrgl9Im+4bV1zRl/Ab+UO/bR9Nlnci
         eToZTpWnGdl+sahSIJfKHx0gWtnP8fa5U/Xs3c+Jj+bEWEOjJYfuMGL/n+CH32u9BOs+
         TMgn3geSp5qE78PPNqhZeYqR2/sQwSRytnFkuGFjfOX0CYiv0ikoaUg4OEBRDTjC1pIH
         yvXMMocw2OLEpARtwdlVaF0VlP1ueDEr7ZjBsfhOtJbto6pT9QLzrnMBXYRwBqUU/UGd
         n5Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8kb8ugrU+oMexZ4iOi1GPTe3d4iYrbMYhQziaizyRh4OwmTOqaUitU4+PfQf5KTeQ2ly/AiawLRPBV3fpR6BbUyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgOuT4IaUQNHRlxwAqXOZUn9wcLtQfTu9a4JEH5Xin+8Nf2lT
	FI+qdvBB/4yLyjXivL1v+rRSIA3F3p1GsVzei77eejT4YoY498bNo5Krd9S4vBCDZlOCPamk0Rr
	H/pakj8UxuPwFdizpJu1OlmmKqePJGOk=
X-Gm-Gg: Acq92OFsfumSBCNmQgw8FBrT4ZpnUAfIX8cy6NrQ4fLnIqdJe554mB+30wOEevJEj2f
	jh+8s/n9b73dQGbZs5Ebp/qQ1MW8SsLa/F1RPS4yh5/uXEi+jLtJPdARE6aSq7m/1l03LOPvMV7
	yMgsAQizfDrdPNrIC5WA3pO1rHz8RGqd5TTinQNY3vclSiHQVv7GdLALu8bmXTOa2dyKCC0TBv3
	OoAeWZdF1bpJ+KI3NXqx0m6eBLVUGtfmDNaacIc9zuLaKH6rly+zxJF3CKbsudVE91GToeuUKn/
	S+DASbSoVP4OuyPrD6vyDuxv0e0i6aAxaRpeQzfGBliiKnZy1F2HyI7cFsYszFBPfhWI1g==
X-Received: by 2002:a05:6000:402c:b0:453:9897:76aa with SMTP id
 ffacd0b85a97d-45d93eccfbfmr43930776f8f.21.1779264855863; Wed, 20 May 2026
 01:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260519160825.4082566-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346AD5B7CDBB72EC8FEA16686012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346AD5B7CDBB72EC8FEA16686012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 May 2026 09:13:49 +0100
X-Gm-Features: AVHnY4K6O83Oaua7x5OeGyEOVQr-EpCuxk3Ub_S6X1YfPWB6IzfjGTmlm_zyy3E
Message-ID: <CA+V-a8uReGLazx5xPfCG+EfSeT_zDy-xfq8Et2pEkmgOKT+8QA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32850-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 862DF5898E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

Thank you for the review.

On Wed, May 20, 2026 at 6:36=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 19 May 2026 17:08
> > Subject: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to p=
er-SoC clock limits
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per SoC const=
raints stored in
> > rzg2l_du_device_info.
> >
> > Pixel clock limits differ across SoCs in the RZ DU family and cannot be=
 expressed by a single shared
> > rule. For example, RZ/G2UL and RZ/G2L limit the DPAD0 pixel clock to a =
narrow window, while other SoCs
> > such as RZ/T2H require a wider operating range.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to=
 describe the supported pixel
> > clock range for each SoC. Update
> > rzg2l_du_encoder_mode_valid() to check these bounds when evaluating
> > DPAD0 outputs, returning MODE_CLOCK_LOW when the pixel clock falls belo=
w mode_clock_min and
> > MODE_CLOCK_HIGH when it exceeds mode_clock_max.
> >
> > Populate the pixel clock limits for both the RZ/G2UL (R9A07G043U) and R=
Z/G2L (R9A07G044) variants to a
> > minimum of 20875 kHz and a maximum of
> > 83500 kHz.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - Dropped per pad limits
> > - Updated commit message to reflect the change in approach.
> >
> > v2->v3:
> > - Moved clock limits from device_info to output_routing to allow
> >   per-output constraints.
> > - Updated commit message to reflect the change in approach.
> >
> > v1->v2:
> > - Dropped storing info pointer in struct rzg2l_du_encoder as it's not n=
eeded.
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 6 +++++-
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 9 ++++++++-
> >  3 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu=
/drm/renesas/rz-
> > du/rzg2l_du_drv.c
> > index 0fef33a5a089..1e4b9f38c55b 100644
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
> >  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {=
 @@ -48,7 +50,9 @@ static const
> > struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {
> >                       .possible_outputs =3D BIT(0),
> >                       .port =3D 1,
> >               }
> > -     }
> > +     },
> > +     .mode_clock_min =3D 20875,
> > +     .mode_clock_max =3D 83500,
> >  };
> >
> >  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info =3D {=
 diff --git
> > a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesa=
s/rz-du/rzg2l_du_drv.h
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
/gpu/drm/renesas/rz-
> > du/rzg2l_du_encoder.c
> > index 0e567b57a408..56220139a149 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > @@ -50,8 +50,15 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *enco=
der,
> >                           const struct drm_display_mode *mode)  {
> >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > +     struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->base.de=
v);
> > +     const struct rzg2l_du_device_info *info =3D rcdu->info;
> >
> > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
> > +     if (renc->output !=3D RZG2L_DU_OUTPUT_DPAD0)
> > +             return MODE_OK;
> > +
> > +     if (info->mode_clock_min && mode->clock < info->mode_clock_min)
>
> I will avoid checking the first part as it is mandatory for SoCs with DPI=
 support
> and DPI check above make sure that this part of the code is reachable onl=
y for DPI
> output.
>
Will you fix up while applying or shall I send a new version?

Cheers,
Prabhakar
> > +             return MODE_CLOCK_LOW;
> > +     if (info->mode_clock_max && mode->clock > info->mode_clock_max)
>
> Same here.
>
> Cheers,
> Biju
>
> >               return MODE_CLOCK_HIGH;
> >
> >       return MODE_OK;
> > --
> > 2.54.0
>

