Return-Path: <linux-renesas-soc+bounces-31699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJodEi2E8GmsUQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:55:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2407481FA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 11:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A14D530364A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9258A3D88E2;
	Tue, 28 Apr 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMo4D1EG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3242BE65F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369897; cv=pass; b=Y9ETJ/Vzb0jjqCut+fY5vRzk4w5P52T0YcjyUMRP+de9qQfD7gSv8pKQJlyvBhHC0zPa7OxfR0Kcp+gTct1RJoCgKAFa+w5bWmaIik9QZWEYAn7DUBpzywSzUocqkn8Bfag2vYYnOmWHmdy8lNwowkQdv+Od1Ona3alScROiLDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369897; c=relaxed/simple;
	bh=HHZLOZVqGTiLtGbnjw/B+krnfDHc/n5BAtW1E2tz/DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvFqnNCnnFQk/wopoH+i+uQ30Sg81ysCY1IdWm/pLrsAamzmEU2624zaz5GlbKgRx0mWl0s1MeNfsHTWsTIXlVMFwm4e1xV/mAO1VgM1uMpzyf72+Vdz1SAoGOp+DL+GVowrrMiPvadw4+cM5U0OGeFQiNauqlYzOoQFcwBawBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMo4D1EG; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d64313c39so8689462f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 02:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369894; cv=none;
        d=google.com; s=arc-20240605;
        b=fIXt1Y2D2/fTr2CxZAPQukkpUj3yRX3Ph2FB9RZIMKn4OSxTEf9m///TM4knZ2I0wC
         3ygIiWkSRgfbuOl3ZrSp8hWRdSMKLFHb00Nr7xjzeHodtsTQNn6jAWD6ujpHBaoKDU0+
         L5m9Ed+Q/PSvfNIekM3kVgMbEahCpL6M9UGs2Wnm22cYSnZi+pNcl+cfpeSk3snJvece
         Jn0TtAS1LH2zg7KyU6g9rKYk/09Te4iO9oC31/oKyJKNSKxCb6qhiKn4NNd4fgwWLdUA
         NO7V3Uw7zfTEFFtzpgEYIG2fq4eWgRnP1Vu3R30HFEym0zTd7Lx9bfCIXHC1w1ZyuZH6
         6pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agvhiAexccbYaKkjsA4uW5TI1LE0/88pcpNfbT7Pcsk=;
        fh=RxTZw0n6AqnHgdPHr/jWkUL5KOVyeI9lgKqr37korPk=;
        b=AYdsr/9h6Qf6bw8M0NoeyqyiVSFmNriFUVMnDkF5LmTsFzDp2lWF7tIleq6XUYSjIz
         Nm+hpXaLm8CJH+rBsE9jhH7hhBUkcfi9bjhLzeuiTHfpeRkH3h48G8gbK/jGSgEqkf6r
         nifHtZ/hMU0F10mKJrvVg6Gey3Er4IFzwPM6DFWfNnGS/zFpmdH3E9acZAccG93cX/9v
         tj1GLrVXZH9ILGcp3XeefxEZ3EheYqEnjM1qCYqTfFn/06dC5eGNpZYf+KPC4FjuiFUO
         Y7uR7eJqMdLGrn9VrGpZzxQG0MN9YSSXWSHqlGfNsaMGkt4h2Qh2AIPEpqhvWpmmonSu
         glmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369894; x=1777974694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agvhiAexccbYaKkjsA4uW5TI1LE0/88pcpNfbT7Pcsk=;
        b=cMo4D1EGB4IQ5QyKDWbQgF/UHOZda9TPb6zDbur6vpZMiObQYe5jf/HONu2IyzamDo
         mZVgywHH3W9xG+sKZpb693N8WklrM89236TahYnD6FAxQjqIftjdiA2zj3IU/k9HP966
         SaEOXf4e38ZSsLSb6M5RAEeDyDQIs15TvHH6wKvzoTCDI4peji7JC/U5y1257z5a9A3t
         Ac4tRrKG52rVnyWuIwbiKgLprw9YJX3GY/5NkqDay32Mm1LlQ4V7gvdXirt78Cvp7U3e
         lh6pagwZdai8nuJMQXQZ1XWBSkvHp1p4UyXaI/UfpA2txycbIS2TtPr/SViK5QHR1+oc
         Cmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369894; x=1777974694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agvhiAexccbYaKkjsA4uW5TI1LE0/88pcpNfbT7Pcsk=;
        b=YL+37LpjLeZqwXuFj5m2shz7TsMDvHNJEae1VtKB/jnmyNcNCYSaraPqQDUC3xCOcU
         EHF2e/ec5lg8Chffy13bF9iaklIGXpJr4W7EIq0A7UCoJ0UY3FXizaGtUzzN4vJhow43
         6Ae9+rWujpH/1dFXWPFuCF4tvY/gA6CAeK5xsQP5vYRcx7TTEnMC23sxJlBU9tVSh2iw
         UhCtoXLjB2SeuJtVxjwTRQcM/hayzdEM76pID1Bm1RmFGsMVGHNLikjg67Wt6Ho+SH/R
         vUu5aTn/IRYjjWN+13FekkT5s0XW23Z3PjW8LISAOCkIc/MuTNTM7vFOiEsml9Zo+oGK
         rpIw==
X-Forwarded-Encrypted: i=1; AFNElJ8SwaLM6gX4CgGuGp8fDu+11ZC+Z+dnyyK7JIPIzAiitICOOKipqWPQ3xsCC1o0+WVcKPne5JQoX/+k2e9v0BEezg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeB5lHuTNHtfBXwXjGuMSEIZ4tzQS/E3ccd0p2frhXTymQ7O1
	SaCmvXbXJgbaWa3ZpwjHcdMyC8GLTeV/i7svQo+LLU78YzTz7AWLMLEVcdvhhpIhaNXfKw5YH9q
	MXiz7efkGg9SeSXpogIR6GLNKOHlArqp+iHnm
X-Gm-Gg: AeBDiet6389W5OSK2sYvSdkjRn5L1CSmaXuucazqbzZtDBNRHFrNd7J5ZW2cVS9y5a4
	ABsxU10gl2P+6na8KvA5EIqm6YPsjMhzj0RKls3nt9Oj3mAkfQx7wOzIvorfBUk+6MdmjhdCT4I
	Dve3UCZvK8Eq4ry4/u/QGHDITKxMO8DeR+6zuaX5vd/GwwK0Ni37qnOfC7eF0jUlnTrRocinRx1
	BzGhAhipVdfbC285w997lB4Dj8XGqJaQYgU5TFGa7rzx09R9XL0IL6ReVEn9bRpfBcUwC1ZwcNT
	9pkj0TuRAVYy2nGA7Wk1ySRkhwrc2oDvW+xmz4URS3p9bBfynUoZaduwf3ZfvGHPDfrwwxwcjov
	bmIWO
X-Received: by 2002:a05:6000:2509:b0:43e:a69b:d818 with SMTP id
 ffacd0b85a97d-4464a071087mr4410646f8f.38.1777369894124; Tue, 28 Apr 2026
 02:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
 <CA+V-a8uL7PAkSSvK+Qj3N3Z9LXe_B-nGJdfn9qG9rA6sXo34aQ@mail.gmail.com> <20260428093400.GB4076452@killaraus.ideasonboard.com>
In-Reply-To: <20260428093400.GB4076452@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Apr 2026 10:51:07 +0100
X-Gm-Features: AVHnY4Lm1pvgMBk2LeiHjbEbvN42F7IkxdYjzZ_hmgHgnOaYeHd_8dlUgAElh7M
Message-ID: <CA+V-a8sTfb-ed9PiPEyk-XFR+mtSzydddS7BM-MV5+DWq6zZ3g@mail.gmail.com>
Subject: Re: [PATCH] Revert "media: renesas: vsp1: brx: Fix format propagation"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B2407481FA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31699-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,kms-test-plane-position.py:url,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Laurent,

On Tue, Apr 28, 2026 at 10:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 10:03:00AM +0100, Lad, Prabhakar wrote:
> > On Sat, Apr 25, 2026 at 10:50=E2=80=AFPM Laurent Pinchart wrote:
> > >
> > > This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.
> > >
> > > The change to format propagation in the BRx broke configuration of th=
e
> > > DRM pipeline. Revert it to fix the regression.
> > >
> > > The original commit was meant to fix a v4l2-compliance failure, with =
no
> > > known userspace applications being affected beside test tools. Revert=
ing
> > > is the simplest option, a more comprehensive fix can be developed (an=
d
> > > tested more thoroughly) later.
> > >
> > > Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Closes: https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9C=
UPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
> > > Fixes: 937f3e6b51f1 ("media: renesas: vsp1: brx: Fix format propagati=
on")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboar=
d.com>
> > > ---
> > > This is a fix for a v7.1 regression.
> > >
> > > Prabhakar, I have test this on R-Car Gen3 with
> > > kms-test-plane-position.py and it fixes the regression I reproduced. =
The
> > > symptoms were not identical to the ones you reported on RZ/V2H, so I
> > > would appreciated if you could confirm that the patch fixes the
> > > regression for you too.
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
> > >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thank you. I however noticed that this revert introduces a vsp-tests
> failure :-( I'll post a v2 that reverts a second patch as well.
>
Aha on the V2H the VSP doesn't create a media pipeline so I didn't
trigger the vsp-tests.

Cheers,
Prabhakar


> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers=
/media/platform/renesas/vsp1/vsp1_brx.c
> > > index b1a2c68e9944..9d93cb8b8e82 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > @@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *s=
ubdev,
> > >                 compose->height =3D format->height;
> > >         }
> > >
> > > -       /*
> > > -        * Propagate the format code to all pads, and the whole forma=
t to the
> > > -        * source pad.
> > > -        */
> > > +       /* Propagate the format code to all pads. */
> > >         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
> > >                 unsigned int i;
> > >
> > > -               for (i =3D 0; i < brx->entity.source_pad; ++i) {
> > > +               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
> > >                         format =3D v4l2_subdev_state_get_format(state=
, i);
> > >                         format->code =3D fmt->format.code;
> > >                 }
> > > -
> > > -               format =3D v4l2_subdev_state_get_format(state, i);
> > > -               *format =3D fmt->format;
> > >         }
> > >
> > >  done:
>
> --
> Regards,
>
> Laurent Pinchart

