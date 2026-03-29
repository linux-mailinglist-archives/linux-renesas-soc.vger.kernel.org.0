Return-Path: <linux-renesas-soc+bounces-30547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPsfOJGVyGm3ngUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 04:59:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8E3507D0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 04:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 926F33023538
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 02:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF442475CB;
	Sun, 29 Mar 2026 02:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjlHrrNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467941DDC3F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 02:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774753018; cv=pass; b=MuK+6Eh7TObHyxZHzgr9uqahefVWeun12POrkZAuoIf3dQ/KFY4fO7bShtFcaJvcERBEzvHZevhUujJpBxQYO4z3RfWc4yWYmMVB4k8kGlZy8lFu1qM3CKDt2ZMB0hhvdTb7YxSuRdSdxUPULMVe1rcadujAsmkPqbB2QBehKUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774753018; c=relaxed/simple;
	bh=h2DicfNpPExxcHWS80zvda7VTpsNVBUd9eE8bZPt/ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=in65DzLp+briQuDOo4G2M1UprctARp6c4U7eVCUmNtg0at1hlAMOB+bTmnrKLbXT6i4SQunYBnY6ki41ZIbyiTQ1/jWHtICPnPKzWQ4Yd/mS5eMsIWjstDYLlIv9uy8eX33PXliyMqSkm3TdVgbjyzClAQ5IhbmCqQWIiRXZvs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjlHrrNP; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439bcec8613so2425032f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 19:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774753015; cv=none;
        d=google.com; s=arc-20240605;
        b=T4t3b5Qq/n5fRfY+2KWgk7kYuFngBsQJK1FP6E3TolBm9IqGMuV81K94npIXc4wXvu
         d26ZxM2Cd1Z+s8Ralk618L9HnGDLQQ5WtajfCOQL9/lghdDiNdzJwNJpWe1jEOQkK39w
         00Dx4ncnvN2zaKmbm6ifk8ur6Ij1J16+wQqC3OH3PonZ3Y8FzqGikl2qpFMHI0boa/vQ
         3XeamuH39so7vGNDi3zbLtSIvmEfqVrPqFbStK78S9jVIYx7C5dgKQRPMQ+Im0lshj83
         EUol6Wzncrfdr34jCv/EJ9sHoVAhRRnLDRhQj+LKhNADXHqDFn21FXbTVr422w0xwc3M
         nQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wpb8nwujEKpsfmT5yQ3f8kjOQr6IpjYfWqzW1WbGY+Y=;
        fh=Xo/c0RZa8Q4x1kA0wc0dBtHualTBICxFrn9erRsyFys=;
        b=OgXXCMsdQvanQmZ4M/ZVA8pfcqViHVCbDMuTwCNkmrvtQ7+DE8wKmbdx9wb6bVhjUH
         C1bUcNjAsnIbKS5QpluJhzshaLoP95sR6HQQUL5q3+/g25oIOB52PYKC0vDr08/rSmBT
         yUlgnm815OyuwRNOVEwcA6fUVb9bqYSaB6bJTkEsoE+l1E7b3E4hFwsiayTfjeH1XJ7R
         60FQQG2hJuWB5Y4dljaD+pzYchQsTVO96ZnPLwlMhJWAOYzKEaIWGmKeyxybK4w7aGrK
         nFtYr/VgZie80qxcRkSPf72TUM2Sm5oW+exTq5gFzKg/G00WIG/3c9HkEeaiFoYJQQi5
         7hqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774753015; x=1775357815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpb8nwujEKpsfmT5yQ3f8kjOQr6IpjYfWqzW1WbGY+Y=;
        b=UjlHrrNPMQkEMEAdgKWIR0gAtfqE+r/ivCXBJ2MSb3a6WhlrroACXjgPcOuiotUMd4
         1yailhfgUbO/2DDi694R1LXdVC1ovhfwMgMa9GIBc8CZJ51YL5klhXy9v46PrHUmxc93
         9RMhg8oRO9VYH96t9/JXs9V+ncZohaST31gOWXdt8d27NdstYTQZipbvcUBtAzuLxak6
         jnUaOb1sscj/jhyYvC4ncZ0xz/QKyvSITpy4VKKmZhaoIExkMEgoXpW63nrQaOU3xFAJ
         sXlFeZiHmutOpV25JedRuThUBop5Gb9NbJyiqO2uoF3/sL9YDDjziAq+t0ZydaQMnMEl
         V9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774753015; x=1775357815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wpb8nwujEKpsfmT5yQ3f8kjOQr6IpjYfWqzW1WbGY+Y=;
        b=cGwxVlRRSURm26+710ejqSb0xRAdYoV9dgmDClp35BdQ1zLWWKMZe4Nzzn9tYZ9Rfv
         QEYM8juhQL+hLGpgQtIttCwF0Ds1SFq6ojJ+f+PqONeO2JMHIOtyU9sEh7UFQLNvHiiw
         SeB1cNE4PzzmNuAXMHq/TKkWzWXbmmxHWQwTTAjEJCaqkBDIIKPfB3aPFFC2tabcEbqL
         K6lwyRET+zVwzGC06RikrBS/W/NzQxaWm5V5nf4zD/lYH3eTtps688TrEii/WSUCF1T4
         91tdZHE2g2/2tFjaa7ZyNlN9wifVt9q7JdgbYQaYGOw3054uyChhZwdt//txrgJ00mk/
         T6EA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+etZbQmuamu3AAHDWXMPgGkNjmwBf0Bex3MjwEubfNqZUGx6eqrvvEwgmgttgvX2sLM9qNIP0jyyizQpSAuYEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7JBkv8r1Ga3E3CIIVdbxK5IcJnWC0N1UKnOkYjjjRbJMHiIeJ
	jFLDbZGtaJ8wonutRKmAe9gc0BZ5UbDpVKTRZnJK+cgKaWyDUQvnvUnXscrvu/6+9nwCT4RnKYw
	VclqpIfsMFCFB3+YPyyi8vT8hfctJ2yA=
X-Gm-Gg: ATEYQzxxMs+ejDlpykm1jFH1leHDYCIvumAT4Wq1yCVFwTg3WR25G9PjzsLnbUnPUfs
	VvD1RsgiGr8m4TmThr86A8jpW+BgJJvO1ZPGGKbP6GeFUGCsKNnQjGpjoO6dvXz4hBAtygxusJH
	RfvfW6S6H5QW3tlxnOZH8pdUu16kxEshEZNNMS7STX6wsnDtGIWZ3P6RT37hJfRyfP8DjWMuAiU
	5vIjajVXRu2eZRj1s7JbXf9lQPV9fR4oVlhKeHk6BlmYo836FRxs3S2d/0d4H+fWgUfj4EF0/lY
	B6DcF0Vo1SboR2PydRGa6IQUVhRO7kptBWUm2+qQa9GJA6t/09iu1phHK0OA/j+jCgt0HQ==
X-Received: by 2002:a05:6000:2c06:b0:43b:8766:600c with SMTP id
 ffacd0b85a97d-43b9ea762f0mr13084257f8f.46.1774753014417; Sat, 28 Mar 2026
 19:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260328132902.776757-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <acfe0wCdyX20In8I@kekkonen.localdomain>
In-Reply-To: <acfe0wCdyX20In8I@kekkonen.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 Mar 2026 03:56:28 +0100
X-Gm-Features: AQROBzDKCKhU_V9-7RKZCTg9yXbm7ZKHc3jtnV0RRErPnQzQkJSteI-yL8BFEeI
Message-ID: <CA+V-a8swD0OLWTWM9-_esJ5=rsv7=i4BvrHwgEOGK2NNS1azkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: i2c: ov5645: Report streams using frame descriptors
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-30547-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 81B8E3507D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On Sat, Mar 28, 2026 at 1:59=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> On Sat, Mar 28, 2026 at 01:29:01PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement the .get_frame_desc() subdev operation to report information
> > about streams to the connected CSI-2 receiver. This is required to let
> > the CSI-2 receiver driver know about virtual channels and data types fo=
r
> > each stream.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> > ---
> > Changes since v3 [0],
> > - Added a macro for the source pad index.
> > - Updated ov5645_init_state() to use the new macro.
> >
> > [0] https://lore.kernel.org/all/20241018153230.235647-9-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
> >
> > Hi Laurent,
> >
> > Ive restored your RB tag with the above changes. Please let me know if
> > you have any further comments.
> > Cheers,
> > Prabhakar
> > ---
> >  drivers/media/i2c/ov5645.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index b10d408034a1..df9001fce44d 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> > @@ -68,6 +69,8 @@ static const char * const ov5645_supply_name[] =3D {
> >
> >  #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
> >
> > +#define OV5645_PAD_SOURCE    0
> > +
> >  struct reg_value {
> >       u16 reg;
> >       u8 val;
> > @@ -817,6 +820,29 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops =
=3D {
> >       .s_ctrl =3D ov5645_s_ctrl,
> >  };
> >
> > +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int =
pad,
> > +                              struct v4l2_mbus_frame_desc *fd)
> > +{
> > +     struct v4l2_subdev_state *state;
> > +     u32 code;
> > +
> > +     state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > +     code =3D v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0=
)->code;
> > +     v4l2_subdev_unlock_state(state);
> > +
> > +     fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +     fd->num_entries =3D 1;
> > +
> > +     memset(fd->entry, 0, sizeof(fd->entry));
> > +
> > +     fd->entry[0].pixelcode =3D code;
> > +     fd->entry[0].stream =3D 0;
> > +     fd->entry[0].bus.csi2.vc =3D 0;
> > +     fd->entry[0].bus.csi2.dt =3D MIPI_CSI2_DT_YUV422_8B;
>
> Instead of doing this, could you use my patch here
> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=3Dmetadata&i=
d=3D56eaab0eed55e5e777344e0b3973d8072786dd98>?
>
> Every caller needs to be changed, too, but there are less than ten so
> that's a non-issue.
>
Thats neat, sure I'll switch it to the new API. Has the patch not been
posted yet (I couldn't find it on lore)?

Cheers,
Prabhakar


> > +
> > +     return 0;
> > +}
> > +
> >  static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
> >                                struct v4l2_subdev_state *sd_state,
> >                                struct v4l2_subdev_mbus_code_enum *code)
>
> --
> Regards,
>
> Sakari Ailus

