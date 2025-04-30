Return-Path: <linux-renesas-soc+bounces-16519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C807AA4DF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 15:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C1FA9C0C44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 13:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BAC25DD10;
	Wed, 30 Apr 2025 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZCBNcDJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075CF25B670
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746021148; cv=none; b=Saur7HlCPYUyj+8/uW5At7laL+lOlmo69SpKpuuqF4Nd0gMU1qxWyBzVMNBg2fghhcdjKogJHtz1CZ8xpWASDDM4Pg4LqFucaEIruYyNqxI2M9S8S3ywOg8JEMK1o492TBFn+4yMcibqjLaDaohLOpz5wbKvyVmPa09vVtd+B9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746021148; c=relaxed/simple;
	bh=Lxvxz/7MXPZmLKIuYhOHmmbd8kWJVwadl9qT+TRj8KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFHsg95YeUjyS8Ix1ZURStM1GVoIPKMnEMBNRMGYpqNOLlH2Z8+L4w5vIhDOltSlG/TXR4u7AWj3saw6XsvTEa3d00gFi0uTUnbs2F1D9ErKlLA8klt0EDXVHj2eSPDRj4/SwUeDca2/+QzCyRq8qAyZR+RxMj4jDdtI2rrt4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZCBNcDJy; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7875670e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746021144; x=1746625944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bptR6X2FP6mphoSdJsDeJ0Nvu/lMa4Cwig/lOeyZQNU=;
        b=ZCBNcDJy4DR4lsEGo/o3GT4cO/tl5TG3nvD9Z3xleNQe3Q3vUVDlcmy1Ok6i5foPcS
         On/gmm/Oz2FGrxY7XAOS7x/MldW7zML7MaB37OHNNJ8NIvIUWixmYrBrNj21Tg9MONYr
         RnO1as66+gs0TwjNz6wc7Jvd2YJhLeoRWmhmkR+lzTBbEj0Pf/nhDSB4QS8slrGvEP03
         +G+LAOUuJYxHofF4uN44YLEX0uRtFeQdskmihqWpXlbHA/Wooyj3WwJFL1yCn6FOoiEy
         PJytTA+iyagUN/M9Sw6QzMtJtd3QMj3+TolpkB6xRqA3ibZ9dPNmrvEqq1e9VuY9T9gH
         qJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746021144; x=1746625944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bptR6X2FP6mphoSdJsDeJ0Nvu/lMa4Cwig/lOeyZQNU=;
        b=Gwg6IUYNLEcdU1TOuAZJEidk37e3zwiLFS4+y8PMVQC2QM0qf2o/Nb/9eVZi1NW8N0
         4pDtcsPcaUF+E9Orz1p0w8btNv5EtFxajHUJSaJzxRU+tzb+sUjLp7xMj2LxZqkyc3Z2
         OfdAHulJMxnY+sZjVDW47I6CYhZD25vrX5vtkgUpPXZoF1BTtlh7wL06mtWjLFWfWIZp
         uM6o+DTBwlRnZQZS2Bm/cyjirKfJNN1Y1q2vbQJ1pG5M4zRmxJkibvF826OYWb3dIsGw
         kCEyAMd+xHGaC231nEKG0ADh4SLXzwNvJIaEpdzTP1gOaYjEy2mqiMSxpIDaP6ioOe7V
         /CsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8UJtiNtVwNIdjpZbtx5pzYLXGCNOc7TOze+ZJ9si7QbZxmjg3b7l32xtxvtzx+AIcBQE1OtN1DtL3h7mWFos6JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHNPS9iVvzPXsnjBYxvm+5bqj8pou8k3k1cIRjm4lZ/g2ophCq
	J7UwMsGRYTzl/oRPUpZWecbKpDcR1Up3O3UWiFifiZHNBiMLRY+7hT7PaRSu/V/LrV8SAKaRbDK
	IlNn45fwfkr8pqDRaNUS1gBw6KjPncl98KdYp61NhqfpuGn68+qI=
X-Gm-Gg: ASbGnctxUB4mkUTpdV2cqdE5QcIkjzb9lRju13g9bIxYOmdlznndW5VQhxdkFlYgJh7
	Innn3qpPTo+AB7hBGjlYAQnocs2/NkYw5j/zKlgBUVQAnPUmP2mU0WW35n7OWmd9dFL7E6wxYas
	R5yMhGRBlqkPllyVm3zXdQLUgADIuhc9T9IZiPNIr5sc1JeV1Arg6AOQGrH6T8K6sc
X-Google-Smtp-Source: AGHT+IGyQiHIWhF80eEOC+6pgdTTn9cHOWztzyXKd7Hn1hMJ1sGS1ScFK8hKa7Xzn645fZbc6UnZ2HhOztB0rWXCHbU=
X-Received: by 2002:a05:6512:681:b0:54a:c4af:29 with SMTP id
 2adb3069b0e04-54ea33bc380mr1250594e87.52.1746021144067; Wed, 30 Apr 2025
 06:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com> <20250430131856.GB25516@pendragon.ideasonboard.com>
In-Reply-To: <20250430131856.GB25516@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 14:52:01 +0100
X-Gm-Features: ATxdqUEUJPqT02hhE_crNuAPw-JTMhsKXzp2oVf3n9xmpn33eFhhZ5g7KLGMb_A
Message-ID: <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent & Niklas

On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund wrote:
> > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> > > frequency and pixel rate") the driver expects two specific
> > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > (222750000, 148500000) operation. The driver fails to probe without
> > > these exact settings.
> > >
> > > Update the example in the bindings to match this to make it easier fo=
r
> > > users to incorporate this sensor in their device tree descriptions
> > > without having to read the driver sources when the driver fails to
> > > probe.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > @@ -136,7 +136,7 @@ examples:
> > >              port {
> > >                  imx290_ep: endpoint {
> > >                      data-lanes =3D <1 2 3 4>;
> > > -                    link-frequencies =3D /bits/ 64 <445500000>;
> > > +                    link-frequencies =3D /bits/ 64 <222750000 148500=
000>;
> > >                      remote-endpoint =3D <&csiphy0_ep>;
> > >                  };
> > >              };
> >
> > I guess the link-frequencies property should gain a rule that it
> > needs two values, too?
>
> The driver doesn't require two frequencies (unless I'm mistaken), it
> could operate with a single one (albeit not in all resolutions), so I
> don't think we should require two frequencies in the bindings.

The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
Add configurable link frequency and pixel rate") and
imx290_check_link_freqs()

However I'd agree that it'd be better to make the driver accept just
the one and make any compensations, rather than amend the binding. I'm
happy to try and find a few minutes to make a patch for that.

My experience of this family of sensors says that we should be able to
run any resolution at any link frequency, but it needs changes to
HBLANK to ensure there is sufficient time per line.
Dropping to the lower link freq for the 720p mode is only because that
is what the datasheet describes for the precanned HD720p. The window
cropping mode lists no such requirement, and yet could produce exactly
that same 720p output.

  Dave

> --
> Regards,
>
> Laurent Pinchart

