Return-Path: <linux-renesas-soc+bounces-30548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HXLM3KWyGm3ngUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 05:03:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39253350855
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 05:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EB8C301DCF6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 02:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0112248B3;
	Sun, 29 Mar 2026 02:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOmBNb2m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDEB21FF2E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 02:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774753184; cv=pass; b=sSHo25p3VeqPmRs5UYDPYx57+2xk1hy3WzztggIVH1NlxnnXgavGv9Fg9++SUJ93NvkSlAyibwkulmTXtFXVFnXSKlC3lVRnV9E8ZZOhxFVhnNm9hiMng6JVpM/eyZjGaa9aKIamLnemwH+zjGCGBSCw46SAupRn/Erj2uJyZx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774753184; c=relaxed/simple;
	bh=oeNehwa1EeZJyigbXHU4X4E2N3zajGz8/K1EHAM/4vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOqnyTeCFb7ojOpm918FRUUMFo0qWlXGLzDwiq8rfwvkwVL3WEPAEUBTCRbq/OSUs+wMui0H8S9N8A6Nf9ClWUaREQYTyvKvOA0EbFTkY/CU5/tjezrTkvJB1fRCgwjCTDNfI0I4FhRpcp+SofyeXWmEksxzJjuL511mnzCI/ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOmBNb2m; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439d8df7620so2368626f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 19:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774753182; cv=none;
        d=google.com; s=arc-20240605;
        b=PM6TEFuC+cGvZncXyTd2brX1d7QtvjdEMa1iyYKaB9PlNfOyaqhah2j1W0Jk2iqRJi
         0pvm2VDP2HfOL8chjBCbZ9j8/ZtCxSYUiXQD9jqQo7S1LU/K9j/gQhjRtMhRSEo+mMFJ
         YrfD0r+EHGzKxgRqL9+YiHnJeKxShe1gu8u1X3ivhyED/Eg0m/c3cWrHOdfcNcSM17O6
         k+gYCGbxte/KXDgaqQvkpg2m4zvYOmu15jY7N4adqqHc4HniEVBceqaqRZ16v+xvddr3
         5+jDbVCvDOGTi1fqEfjKQWpEHh2alJZrcVKLtZUBy9ZV2ma7Q3iNWDyU0aX+ZwUu/SqV
         xalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oxd9DxtljOO+GpoWdMwRVjRD9w3+k7pr8qjVOaGmgQs=;
        fh=O8ZRDtYhxA8yP6OMln20rLRFyEK2xX7/HFJUBkyoSxs=;
        b=K1TyB4GypEG1DZQQrzb2Q9kIakDBhki0JjWXCUkLTp+YB00FEQGli6hMPjbtReZgVO
         5SGY+F4wgGZojpwveszzwiceZYKCBz+WAiPs1qa+9QKDzRtqVBdONUCSq21xCwiHDUh+
         QjNxrM1AzSjKXPnC/pdv2VZ+VUpC8UgMRubKJeuw8cI+3++depDFOPNJW8SfGlBbUOpX
         cCQeGKlD6Z/uv9TsFj1YRjZNAIU6AHuFTYCnvCu+MhAAPYllN1iUWZmatPGhOZuIPk+a
         Vo+uw5qYiy6L1wVc3LgNj9u0tTpKNRpMMJlRPCH4mgY59MZNUwZNOopa77nQ4PW/TtTo
         bpZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774753182; x=1775357982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oxd9DxtljOO+GpoWdMwRVjRD9w3+k7pr8qjVOaGmgQs=;
        b=TOmBNb2mbS+sDIkGhl6xsFHDjSi5CLuvhmQjeiz2nu0WwVM4/p8S9zTnaUcko9lFyW
         6gqXUfWVHuW2JbGv2lX6y/jXjSust+m24CaV1okB7x3zrN7XYg/5h7yw9eZWcX09mPcD
         yNg7Z3F1XLSvZPHdF05P7B3bUKT7f1cahyWV9mHbs+YAaSM2z9EW3vtmcYjKj84NEIBH
         vrK5Teq/bhmhht4Z6GiQfC2akeH6TeDhhV4AbovoP9wUWg+zBuRXzZ7qJf0+q6aYTpNF
         FtPZ41je5ktGPzcJX4nho44NM10g+QTkai8t1pentd4Jwymd5MOGnxVyT7huoPAzNs6o
         S0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774753182; x=1775357982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oxd9DxtljOO+GpoWdMwRVjRD9w3+k7pr8qjVOaGmgQs=;
        b=TZ8uevrCuNmkQ9IAKuweL58o2ouLvQ3gLmS2X228wNT21fs0ONqFSkyPTgDvc6YNFu
         pvXkKB5B7iNirs7EfNGMV4fC9zybIeUbYftl06kuvRTyj5CnL5eOt1aNNNOv6N7AJ3Ur
         x6WQxN8GfoGCqi6CKmnYmlrFH15rzY0tq6fO3gKcVtQt5JNcNx/ZbYjBBuiJH6MYpBU0
         4bj3Phkx1QSjnEtzhOa3eD/a+sr0syPyspyBu83+nLHfaOKBfVAVSaFnTlkrGOKCm9WX
         xx5YzTszZUo5vnyOjFBrUyFKIYJibxp82imNgjAM8oIAbPsIDUfE34pZ/O0RTbgWaydE
         0onA==
X-Forwarded-Encrypted: i=1; AJvYcCUeH1QuQ/ujaSJ81p+WGjbp25DC/MqUSBwUVPMa7n9lTbWe5Tu0j9HY9IeaEmVwW9bqd/BIAt6gA8mGVeHl/SqFTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHumYybqw/b0dty3vz/g64wLm700fshmVsM8kS0jdmskbxgO3i
	gxShzjgitQ6znSiopAjYc2g/POqy4cO6eqPNVmUC1HDCURMKLRQNAu41DqCPSPOQt1BOnDJxDbM
	Ja/8sVu5gKQFqDzLNXIG0/V2g8NdaS7M=
X-Gm-Gg: ATEYQzyCSuQd1tXE0cbRh43nnKVVU7wp1AflqH27yucm/FhAOLkgKpvbCEuVUpz65RW
	QAuwGpaIHjcfA54vb0zNskiYoOHqpua+0csoLesP6BiandX1LpdyFJkwEKoHjSZ8YIZgLCDdL61
	FFxsh0Gmb+XUoKg8rtQfd2VhnSQ52AF9R418wY1K6UgQ3/p3lJa0En2JdFj/TyBhkHtQuf1wrWX
	wiRYQoqOcHqp/EwfqKT2APrHamov+pn8kAyVmu/kF6X/o5v85jthjr4xR3UG7TcHbXHHvTBCHiV
	aVYVUNXW4bL8i0X7hxAYJoF1z62Yv5VU+DCkOrBscUIL2O7UrcO1LQPI2mT3hFlVx3VeBA==
X-Received: by 2002:a5d:588f:0:b0:439:c299:4d8f with SMTP id
 ffacd0b85a97d-43b9e9e8e37mr13378617f8f.17.1774753181546; Sat, 28 Mar 2026
 19:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260328132902.776757-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <f8369ece-ff7e-438d-84b5-0e924597246d@windriver.com>
In-Reply-To: <f8369ece-ff7e-438d-84b5-0e924597246d@windriver.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 Mar 2026 03:59:14 +0100
X-Gm-Features: AQROBzBQCBDvKqbYB7uBkl8X4GJECz9QPVb6ro2KqB5gY6h5wABEHX4uLTzZcNQ
Message-ID: <CA+V-a8v2v02Ka3GsE0psSkhT7KUMRf-ot5103B2ZQkcpSKWbEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: ov5645: Convert to CCI register access helpers
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30548-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 39253350855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xiaolei,

Thank you for the review.

On Sat, Mar 28, 2026 at 3:41=E2=80=AFPM xiaolei wang <xiaolei.wang@windrive=
r.com> wrote:
>
> Hi Prabhakar,
>
> Thanks for the update.
>
> On 3/28/26 21:29, Prabhakar wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Convert the ov5645 driver to use the V4L2 CCI register access helpers
> > and regmap infrastructure instead of the custom I2C register access
> > implementation.
> >
> > Keep ov5645_set_register_array() as ov5645_global_init_setting requires
> > a delay between specific register writes, which cannot be expressed
> > through the generic CCI multi-write helper.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
> > - Fixed checkpatch warnings limiting to 80 characters per line.
> > ---
> >   drivers/media/i2c/Kconfig  |   1 +
> >   drivers/media/i2c/ov5645.c | 907 ++++++++++++++++++------------------=
-
> >   2 files changed, 435 insertions(+), 473 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 20482be35f26..8d7dafba85ca 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -533,6 +533,7 @@ config VIDEO_OV5640
> >   config VIDEO_OV5645
> >          tristate "OmniVision OV5645 sensor support"
> >          depends on OF
> > +       select V4L2_CCI_I2C
> >          help
> >            This is a Video4Linux2 sensor driver for the OmniVision
> >            OV5645 camera.
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index df9001fce44d..1cfccbdf1406 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -25,40 +25,42 @@
> >   #include <linux/of.h>
> >   #include <linux/of_graph.h>
> >   #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> >   #include <media/mipi-csi2.h>
> > +#include <media/v4l2-cci.h>
> >   #include <media/v4l2-ctrls.h>
> >   #include <media/v4l2-fwnode.h>
> >   #include <media/v4l2-subdev.h>
> >
> > -#define OV5645_SYSTEM_CTRL0            0x3008
> > +#define OV5645_SYSTEM_CTRL0            CCI_REG8(0x3008)
> >   #define                OV5645_SYSTEM_CTRL0_START       0x02
> >   #define                OV5645_SYSTEM_CTRL0_STOP        0x42
> > -#define OV5645_CHIP_ID_HIGH            0x300a
> > +#define OV5645_CHIP_ID_HIGH            CCI_REG8(0x300a)
> >   #define                OV5645_CHIP_ID_HIGH_BYTE        0x56
> > -#define OV5645_CHIP_ID_LOW             0x300b
> > +#define OV5645_CHIP_ID_LOW             CCI_REG8(0x300b)
> Since 0x300a and 0x300b are contiguous, you could simplify this to a
> single CCI_REG16 read:
>
>      #define OV5645_CHIP_ID        CCI_REG16(0x300a)
>
>      #define OV5645_CHIP_ID_VALUE    0x5645
>
Agreed, I will update it as described above and post a new version.

Cheers,
Prabhakar

