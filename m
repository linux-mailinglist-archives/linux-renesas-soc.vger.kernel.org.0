Return-Path: <linux-renesas-soc+bounces-8163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B795CE08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 15:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DF42B248E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DC0185920;
	Fri, 23 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVMaZvok"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10881186E42;
	Fri, 23 Aug 2024 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420058; cv=none; b=mvC6amqcfCVeP9d9Vw6d5TCLH308WyKlySpGnd7hXmpq41YZx33xLIgZ2KfRbsYzzCplg1bLW6yxTEjmeLwSdRGitUYOB8yDqLRD420F88R8BAn69zOajyqu+TMub7G9Z5LdIrN6HJsoBQPERHMkwbVOHZoaKxLyV9N175hauPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420058; c=relaxed/simple;
	bh=1V8EaxQnaBDXe1y+LWTn8riTWK3pRHcJdVTal1134ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUqUlhLUXfRZ+SsnB+NsvLp9lcanGAhG92erf7mGjY/ik+9l4qVQNiYY8B7bdTaSc1LVmjSi0r6mphj5EDcasp+PREkzDXZjefGKubxkABAuMDcRohorUs6t322NQLhYoDKmPfgVZLsj3C7hU84Z+xVmOxJtpCC44XRS/2W9mKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVMaZvok; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70930972e19so985171a34.3;
        Fri, 23 Aug 2024 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724420056; x=1725024856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V8EaxQnaBDXe1y+LWTn8riTWK3pRHcJdVTal1134ZQ=;
        b=ZVMaZvokKY3DTNy9XwsmCpskNdcaa08+1NFKOWo17PUG8hQ+ybqx/Ce+HYZ0ezig+q
         bIrbuqOF/4JxbnkKimv0Epg4nj2SX9AttCcAhPLytypyN8onVqGMaBNdmLtqoNjru05h
         RqNnA/g2ISmm9HP3cnUjNxG7oPxysLc2Osx1eqwSubVuRaEYWrMw4tmVGcWaoXkCIoU2
         W+ejdTa2BtlW7YeKZt/r2SRT6eWSuKhU+Eh/yvZrvNcEgYonDjX1W1IHDgEVQVUF7JQn
         XqOwFudmzDSVuTCU5bVer4cj3rYfUn7rgb1n7Yl5wi0QA2eQgTv0S8VKyCBlRzWBaw4y
         OGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724420056; x=1725024856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V8EaxQnaBDXe1y+LWTn8riTWK3pRHcJdVTal1134ZQ=;
        b=eGANfe5fmoWu7ZHOYFUUqIFmz6zUb5G7pVcw/fIykeeZLepBVI8t0ekcx1mZBKzcbH
         k7eNV6yf9tDwn3j/9ntehIlq4HAChOZf94h0Ryi8xLi6UeOGg3Eb3o2fbErtiDjmR9dL
         se8Pccfx3Z7rNfLtdk8gJB6qnKUX7JBYkU/XPHXv8Q20xuBSXQeDeXuW2RrH1pHLM4qc
         jAthNhgKer+widPY4CRx9z7QOE3OoAuz3Y58ntIsiuaDM50K+hPUcSdcTHfcni1u5+cr
         lE8rqTJ8tPTIT2K+n3gD9RrQbUlDO2yUEY9iDGjC6g3UK+aIn+iS1NWilf55iGaOrpGs
         Ad8A==
X-Forwarded-Encrypted: i=1; AJvYcCUMuFBSMQQvUQqj+ZPx0jhA2KRYSLkJR4k67HBc/9UzDSpqG6bTrzE0fAui4kQ0gZ7SS9Y097XAvj1aquk=@vger.kernel.org, AJvYcCWKsDOJp12qogzH3q+hoPsrSuzMtgAoc0tXgkfwDP7aca6vCYgiz8tmy306Lbdm4F2CEYe36KgHJHv2CUGaexWibxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi+aDl5/JsXn7iy5ifRjzUArjp8Gge2ejwlI732P0tpX6cQLFc
	5r17rjApCYhVBytNjBGKDRypm4jt9smrsl6TfwWOIjdmVpHRN39HwT2RP6+dawQfF1xqcUuU3b+
	fJDeEm5qe9wq64Xk45J4/Ytk1FWc=
X-Google-Smtp-Source: AGHT+IHbB5QRyvqlUtV21r1qprqllwzE0VQOI/2Y41jOQUP1AWcLr4N5vjCpGEffzRdSyH8EHf8rKDZSpOoXYyLScOQ=
X-Received: by 2002:a05:6358:52d0:b0:1ad:d28:976e with SMTP id
 e5c5f4694b2df-1b5c22ebb82mr261068655d.28.1724420055873; Fri, 23 Aug 2024
 06:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240626055108.GA10453@pendragon.ideasonboard.com>
In-Reply-To: <20240626055108.GA10453@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Aug 2024 14:33:49 +0100
Message-ID: <CA+V-a8tcWVTzDgBMhn8aQaX934MKwOePp3PhMF4TcXqBK2nhAA@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Wed, Jun 26, 2024 at 6:51=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Jun 25, 2024 at 01:32:44PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > All the RZ/G2L DU specific components are located under the rz-du folde=
r,
> > so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
> > keeping it in the rcar-du folder. This change improves the organization
> > and modularity of the driver configuration by grouping related settings=
 together.
>
> I was thinking the same the other day. Thanks for beating me at sending
> a patch :-)
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Do you or Biju has committer rights to drm-misc to push this patch ?
>
We dont, can you please queue this patch via your tree?

Cheers,
Prabhakar

