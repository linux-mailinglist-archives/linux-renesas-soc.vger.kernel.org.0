Return-Path: <linux-renesas-soc+bounces-3029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B885D3CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 10:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B158628389A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 09:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EF43D3B7;
	Wed, 21 Feb 2024 09:37:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4883C496;
	Wed, 21 Feb 2024 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708508276; cv=none; b=ewiQvgU9BRnxF9zOWQv1vTPJOJ54Bbg9kVFQL47L9XU97uMPzMSxoKG5w4/UO8yjWKNCtoNHZpwv/sSB8pYi9s3+17qID3+2Qr97AWQyBU8MnW9YProJBqkovlwZoJBMvVD2TRx+LKRPcw30AaowKxBWpuzESYSBhNhbXgd+Y/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708508276; c=relaxed/simple;
	bh=vxEdb4fDXLlgKcxr5wWNQsyVJDFErAasA1jI5h1O60c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YivRwM28+87uWVgCbZbqSO8A+2AkPUYNMK9tO1bjqKDuBBOLDllvhOr5Bd+HMZhhcDvJI2rLomjcGeSq/MS0mciaM2N8FFcVchzYhpyblQrc8JFHfz4RzhOsMPk/GsgnVqXqygZscZqaO2/tkxgCm+T19/j30V/Ms0Q3SyCxLn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6083befe2a7so30683917b3.0;
        Wed, 21 Feb 2024 01:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508272; x=1709113072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTOc5ufmZ/JRdQx/6tbCljAs5aqBkOn4kOQdynUVTFs=;
        b=v+vEYJXFtAirSI6cewwC+th7L7J3FKE9+ILO9Wrlfz3r+b2HaAY/9f5Tfrhwzzu+y5
         UcaqgHIKMdT7gTTrdkGOaZ4kH1TsYUzpKg1ZeV1KuTONdDt9ah/d11zPj0sf0ElBz3wn
         a5dTcbnShPCMWXCTncTnjxVmvc697mipmmb9mGakM6w90ZeCg/4GOWy3FERSitO52K2Q
         eyZMR0KuxJ6L31L4OfJZsIvkLLl2ccun/6MhuMn04r9Tz1Vyu/hNqDjrZzzOiM/3KOh1
         crLEEGJqShtJq5g9VEX+VxUJbEIBfeVKKm8mb5wHLYEIcOqs5ZWbQLRX57le9BAss8Jg
         g03g==
X-Forwarded-Encrypted: i=1; AJvYcCUQNXX072Ta5TsJV9J+Rw8k4whACS+6iBQv+p39BjFL/7cvmPw2HOJbu49vIjgHi756jJ3FVJNybf680VFatpdn22eI4Ty2zeb5kPFarT2KFdgujqGVbJGG9PdwN0n49tAIDS7nYZfBePTZlkvb5eOXmoC50aTiEAV8flHYsCYxrq3G37Ivi/lY/kOcbRm26XMSMnf+1Uxvg78D7E4Vj8rKfgyHbe7wky6uMUK50PE9sMBmVjSMNpWVamB212gDhkLG
X-Gm-Message-State: AOJu0YzWV6RUNFY1vhnMeVINxbGkqzT5BjsqlhhSoCU2r/8MXlpoDEkr
	Jn7IpdPiGPYBqz6AZraa2m/CmMKxpcPG5/k3kyrtQG9jfDD2JcnCr8Sd3dPJfs0=
X-Google-Smtp-Source: AGHT+IHQSNXfMytke8N95SRy8X32kCIyhuwq1sajc8Gn8EhmVB04du5PKNF46oO0ZPBeE4honrzEmw==
X-Received: by 2002:a81:af10:0:b0:608:173e:2486 with SMTP id n16-20020a81af10000000b00608173e2486mr8742725ywh.19.1708508272369;
        Wed, 21 Feb 2024 01:37:52 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id z20-20020a81c214000000b00604a3e9c407sm2435801ywc.41.2024.02.21.01.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:37:52 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso5313342276.0;
        Wed, 21 Feb 2024 01:37:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfbmNzA72Y0Roc0sUlpXXOmA9EsWzkr7jXiTaSEuK+RvHd1VGkbSCFQBQYKHyKFpT+cqS7Qt0Zddm2lg7+ggieNzazo5eeRAV8x+IC0Wvzqyjc0dph/yNjuPZa7al436uat5+xHkRVwiP7yBvRodi6TeAfnPg7746J3FrZQAUBvt3Sab4HCyt9osZO/lr2wb+Msoxy2NiuKSZo7YWh9aayyY7zurd6yozAgTN4GzB7mQAd8N9yIgcmaadgzF8DHVOs
X-Received: by 2002:a25:accb:0:b0:dc7:3165:2db1 with SMTP id
 x11-20020a25accb000000b00dc731652db1mr15173023ybd.49.1708508272053; Wed, 21
 Feb 2024 01:37:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com> <20240221054424.GA12033@lst.de>
In-Reply-To: <20240221054424.GA12033@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Feb 2024 10:37:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVHvgVkZsmbsxkScDq+XzMLTONk3Cwmg2N_Rz_-qqWxw@mail.gmail.com>
Message-ID: <CAMuHMdUVHvgVkZsmbsxkScDq+XzMLTONk3Cwmg2N_Rz_-qqWxw@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, Feb 21, 2024 at 6:44=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> On Tue, Feb 20, 2024 at 11:01:05PM +0100, Geert Uytterhoeven wrote:
> > On Thu, Feb 15, 2024 at 9:16=E2=80=AFAM Christoph Hellwig <hch@lst.de> =
wrote:
> > > Pass the queue limit set at initialization time directly to
> > > blk_mq_alloc_disk instead of updating it right after the allocation.
> > >
> > > This requires refactoring the code a bit so that what was mmc_setup_q=
ueue
> > > before also allocates the gendisk now and actually sets all limits.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
> > queue_limits to blk_mq_alloc_disk") in block/for-next.
> >
> > I have bisected the following failure on White-Hawk (also seen on
> > other R-Car Gen3/4 systems) to this commit:
> >
> >     renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
> > 0x00000000ee140000, max clock rate 200 MHz
> >     mmc0: new HS400 MMC card at address 0001
> >     ------------[ cut here ]------------
> >     WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
> > blk_validate_limits+0x12c/0x1e0
>
> This is:
>
>         if (lim->virt_boundary_mask) {
>                 if (WARN_ON_ONCE(lim->max_segment_size &&
>                                  lim->max_segment_size !=3D UINT_MAX))
>                         return -EINVAL;
>
> so we end up here with both a virt_boundary_mask and a
> max_segment_size set, which is rather bogus.  I think the
> problem is the order of check in the core blk_validate_limits
> that artificially causes this.  Can you try this patch?

Thanks, good thinking, as that fixed the issue for me!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

