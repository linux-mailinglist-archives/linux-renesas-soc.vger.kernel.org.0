Return-Path: <linux-renesas-soc+bounces-32822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NDjG4d3DGqihwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:45:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E89580C4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C29FE30AB83C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF014DC52C;
	Tue, 19 May 2026 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TigZf9yW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D76192D97
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201616; cv=pass; b=twiM64zHA0hC9q9IBkRrf5h0umlu068TfG4uDg6a4RORpUeH962u9SAO7RdSEGLG/fuIrQ9pLj1zDx1G+tGfSrNx0cG6UbtE9xox1VZ5jmLp+VP+q1TIt32uwtecU09ljdcamfYowqVkmyKOjMPZLXkiobjQG4claLjLJnO6CFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201616; c=relaxed/simple;
	bh=mKNJGtr3yWibnoSdxnmBVT/wVtCQ3PzhjynqR7ll3rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cN96QWq2Du3+CtXvxi4q1+tLfJBRxM5dtAURQd3zUR8wv6PltP7c/2oUZk0jpp2y5rhpS5hLifGQll1DYB/4egXGtIs08BsiWBPY1fBa42WMWburdQhKzi6GW9W7URDkX3k+dCwlc1X2V1YE9MlfSCx6tJFCdIoTHjulmWaCz/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TigZf9yW; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d734223e4so2345571f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779201612; cv=none;
        d=google.com; s=arc-20240605;
        b=h6F17taIufiFhV/wfSLerMff84mctEzGJnqqilnExAfToHOjqFNvYIB2aq782bTq/G
         bizvPoKawQ/nHC6ZYzJ5+mrsGDZ4Qb4QzL9cTyPNzucQ3wcYG7uhJ8+TfDEIX+wTWY6x
         FNpTGcgz+cggmz9XnEW92FgPWg5eT7LkA6vnVOUsxa1wDGCe52xkloSnADTrCFk3bKH/
         +un+cp1NtK+gyS6KiGvryYU8HIiyefRbyTuuqeFNVWZm4PLdQL0QQKkz7KYTBM8tFc1U
         hslJuCQQ+2JpC1cdjlIi01GQjgyT3CqrAoaTNsE692t9BpiCaRxc4laa1zelsLrYJaeo
         +j9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OmyzMyEm/LGiksBOL5pvZw6xuB+Es7o+zSzCGxEqtw=;
        fh=4yHsLQxE1QlG6+VP4WQAq9MH/DXuyrsIJxcXRQKdQAA=;
        b=EULFHvS3pYXwH7iLnTf80FwL6n1xTu2o15QHR8K63kHb079i6MwNi5OyeGtC/V9Viy
         Df+XGhybJj0i+PtYtOx60tJ3ocvEwEHRtBNkbutfBfVT49pjptka07GbNHxUF0BMjWXo
         a8XkssEJk3lXsRPpNrG7XAONSGbQH4cD5GtKgD8aZUZNqQJUJkBySb0Bgp7AKwzvAw44
         r9OATf76K1AHDL+uqU8QQCeL9KHY9WkNEIEIZ0FBrV02PceUiCPXRT7wHSt862NfjsSu
         7T0SVvyExH1WLFjpor6RGHq52axNdZFIZTNp0cq2Jdv8oMmryJschSQ7xbcbURDptgaW
         jrzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779201612; x=1779806412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OmyzMyEm/LGiksBOL5pvZw6xuB+Es7o+zSzCGxEqtw=;
        b=TigZf9yWHnLF8kUvfK5iLuJKCKcDdRlg2TMbhiwgqi3F4DrMd9M/U/GN2KqznWJv6m
         z1/P/Dc4ko4YtoJ23CtIzgBtg2Q5Evo4jBSEfoj7RNolbH2iBllVU1FXacyPOKTZ0Wtd
         jXjd5zQ28zKjpVPYN2hbK+5kV5e501NRDvos0THhLlnXFQL7aHuV/zS3NGgq5GDPIxzC
         pLH5wrOQ3kx3OMU3sYMLDxyNATVx+TShc+SEAdtg1Bs3mQ5f6ytTzOb/HcNPyl/vjHM+
         42knd499w7MnNu947k6aMY6MGaqlXKSAuewwCMcgjndnSSYKiV1QRHExCMLdma+jDvfI
         Q7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201612; x=1779806412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OmyzMyEm/LGiksBOL5pvZw6xuB+Es7o+zSzCGxEqtw=;
        b=YIWVWkyebpe9BwaVb7sl8MFZZhVvnoeUdKVW7AKEtuQWSKpfdtbfReag++kTwpRabc
         3JElDHg1VJn5caSbIi54XSwJEO3GCtWC/oo2kEfhTYoXV4856rNK77BC53HD7RyJ7u+j
         bjk9W6ArwqlKnGhzDVVoYNy83kB4xcTdRcMebV+BB6bFdS+tUGxOISg+JWHBjmIr7FhS
         r0sQeLXZivx8/1R/WeSXGvJU8SWGSgGTDq/P6gYfnPcWlMSDtBt3RNxN54cqw1nQCp6M
         wqun1WZSN2eXuMMZfdZSkqNHaFrS5O9hETSkyOOuRUuTsdUgOMATdGUqVbt8JiVC23LT
         eYFg==
X-Forwarded-Encrypted: i=1; AFNElJ/gTC2P1UST1Q0T4907cfIOLRUobijktiknIg0L0OuZJKL+ANv3yPgUhR4gT3wkihlOPQmJQTXbEzrHAhdMbgadHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQ+s5iNXHup4dXi09tqxq6PRcqw0BVkz05hyCztvRq30I/6ga
	G9QWffVeh3/RymTQQvYhA3yo7yFtLAIDMr4o31gIxVFeswvA/8hShCcRuiRrSjhnevz5BNFhfVT
	3H7vyjdgP+S9PZGMMnflIG9Jq3p+bm08=
X-Gm-Gg: Acq92OFhE0znFSx6/oS50u2LD5mbUnUoIV1gS167hD4zALKRpMA2GVtazgNFQ1HnPST
	dLf5TIWjL8MbW/9fvTVsVTg229yesz7SgX3JB5y88YDMJ4yFOx5/gjAq8mFr1CyP78TFPYzW1PJ
	PZjxSgxojUKBxovxLR2JEIXZeL3yk+chlqaGaMpqltI8pefCpm3jJ/VMY3LW9EkFQlPTHljmw9G
	XocjdbihU1ZSjVr5heyVPhSa9SoHi0H0l/bhLaDUKc4wd7MBqV8BZpulbACHHTT0j3wMZc7tnuh
	f+bNDsHX95cvyBYFONEFVxfTIlzumw8rzbL1PEaGTIBqGCt+N0+ogpSp+RzM/EIJGvzv
X-Received: by 2002:a5d:5850:0:b0:452:f380:5508 with SMTP id
 ffacd0b85a97d-45e5b681925mr31609485f8f.0.1779201611516; Tue, 19 May 2026
 07:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346174DD5FFD70AB39F570086022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v_gmPEcWgFsC3Kv4X_M_qzbVHeEY=EmzdYxzy+PkyB-Q@mail.gmail.com> <TY3PR01MB11346178F22560ED8A8A38DBD86032@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346178F22560ED8A8A38DBD86032@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 15:39:44 +0100
X-Gm-Features: AVHnY4LmRnxW-jhziRMaTvD5C7T7dWBrBp1GfrKUh4KZMXnga4r65Ov9CP8dIJo
Message-ID: <CA+V-a8sfvB5uEr8x6FkzxY2LcnUhyFfWRx9aLN2aFoyZ0CQt+Q@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-32822-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 16E89580C4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Mon, May 18, 2026 at 8:12=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 17 May 2026 21:30
> > Subject: Re: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic =
to per-output clock limits
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Sun, May 17, 2026 at 6:59=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 12 May 2026 15:41
> > > > Subject: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic
> > > > to per-output clock limits
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Move pixel clock validation from a fixed encoder check to per-outpu=
t
> > > > constraints stored in rzg2l_du_output_routing.
> > > >
> > > > Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5
> > > > MHz upper limit specifically for DPAD0. This approach cannot scale
> > > > across the RZ DU family because pixel clock limits vary per SoC and=
 per output interface.
> > > >
> > > > Add mode_clock_min and mode_clock_max fields to
> > > > rzg2l_du_output_routing so that clock constraints are expressed at
> > > > the granularity of individual output interfaces rather than globall=
y
> > > > per SoC. Update
> > > > rzg2l_du_encoder_mode_valid() to look up the routing entry for the
> > > > active output and return MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the
> > > > pixel clock falls outside the declared range. A value of 0 for eith=
er field means no bound is
> > enforced in that direction.
> > > >
> > > > Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875=
 MHz minimum and 83.5 MHz
> > maximum.
> > > > RZ/G2L and RZ/G2LC (R9A07G044) share the same DPAD0 pixel clock lim=
its.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v2->v3:
> > > > - Moved clock limits from device_info to output_routing to allow
> > > >   per-output constraints.
> > > > - Updated commit message to reflect the change in approach.
> > > >
> > > > v1->v2:
> > > > - Dropped storing info pointer in struct rzg2l_du_encoder as it's n=
ot needed.
> > > > ---
> > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 4 ++++
> > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
> > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
> > > >  3 files changed, 13 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_du_drv.c index
> > > > 0fef33a5a089..d1bc205eb5f8 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > @@ -33,6 +33,8 @@ static const struct rzg2l_du_device_info rzg2l_du=
_r9a07g043u_info =3D {
> > > >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> > > >                       .possible_outputs =3D BIT(0),
> > > >                       .port =3D 0,
> > > > +                     .mode_clock_min =3D 20875,
> > > > +                     .mode_clock_max =3D 83500,
> > > >               },
> > > >       },
> > > >  };
> > > > @@ -47,6 +49,8 @@ static const struct rzg2l_du_device_info rzg2l_du=
_r9a07g044_info =3D {
> > > >               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> > > >                       .possible_outputs =3D BIT(0),
> > > >                       .port =3D 1,
> > > > +                     .mode_clock_min =3D 20875,
> > > > +                     .mode_clock_max =3D 83500,
> > > >               }
> > > >       }
> > > >  };
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_du_drv.h index
> > > > 58806c2a8f2b..307ae70dd382 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > @@ -30,6 +30,8 @@ enum rzg2l_du_output {
> > > >   * struct rzg2l_du_output_routing - Output routing specification
> > > >   * @possible_outputs: bitmask of possible outputs
> > > >   * @port: device tree port number corresponding to this output
> > > > route
> > > > + * @mode_clock_min: minimum pixel clock in kHz
> > > > + * @mode_clock_max: maximum pixel clock in kHz
> > > >   *
> > > >   * The DU has 2 possible outputs (DPAD0, DSI0). Output routing dat=
a
> > > >   * specify the valid SoC outputs, which CRTC can drive the output,
> > > > and the type @@ -38,6 +40,8 @@ enum rzg2l_du_output {  struct rzg2l=
_du_output_routing {
> > > >       unsigned int possible_outputs;
> > > >       unsigned int port;
> > > > +     int mode_clock_min;
> > > > +     int mode_clock_max;
> > > >  };
> > > >
> > > >  /*
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_du_encoder.c index
> > > > 0e567b57a408..4af2ae09ff39 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > > @@ -50,8 +50,12 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *=
encoder,
> > > >                           const struct drm_display_mode *mode)  {
> > > >       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> > > > +     struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->bas=
e.dev);
> > > > +     const struct rzg2l_du_output_routing *route =3D
> > > > +&rcdu->info->routes[renc->output];
> > > >
> > > > -     if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock =
> 83500)
> > >
> > > Please retain the check for DPAD output, to avoid checking the same f=
or DSI and LVDS.
> > >
> > This patch checks only for pads that have added constraints.
>
> It will lead to two checks route->mode_clock_min and route->mode_clock_ma=
x.
>
> Whereas by checking
>
> if (renc->output !=3D RZG2L_DU_OUTPUT_DPAD0) is a single check and it is =
meant
> for skipping DSI and LVDS as the respective encoder drivers do have mode_=
valid().
>
Ok, I will move the constraints out for per pad and make it global and
add a check for RZG2L_DU_OUTPUT_DPAD0.

Cheers,
Prabhakar

