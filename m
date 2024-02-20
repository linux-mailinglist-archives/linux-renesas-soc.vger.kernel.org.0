Return-Path: <linux-renesas-soc+bounces-3021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4B85CA88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 23:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491B31F249FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 22:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D2741AAC;
	Tue, 20 Feb 2024 22:14:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A4152DE5;
	Tue, 20 Feb 2024 22:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708467291; cv=none; b=aBNU+dE3yGOsFnGpFwzQYx8fvxsXWZCZ/CkCQTyW/Wrv0QPYpQw+dzIMfPEpJAzKFPLqIieJwWIqujdvxYpZHlOjJeRp36Y5MoT6U8jR33XoXPpUtA+RNLBOhJiHRatpywj2KSm14R8fc7s9yU7dAlAtOzsRpR0lJOq2ZvJwrLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708467291; c=relaxed/simple;
	bh=kyMtWsfSgdpau1e5ToBBhdptWKENTkw4oiSVi57bDpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMgGlpDXfWjqhBCptwJW9DTxWXgrrnQ2Ld1EiBDsIc2nMh2kwDqi7Ujmi4HpOFVxc5fPgYPFtLbh2nHsDisG8ptqY5y2Clk5wFLixWr89vVuds0D3At6JTfL950KkkHUvtypsDdDcD8EMT40H9EgaLTv2gqGM5WuNVH9OMk9pQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-607d8506099so58234627b3.0;
        Tue, 20 Feb 2024 14:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708467286; x=1709072086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0sB+Uiin6bmBbq+Qb6Q+WVmjY3s6JQXioTdgYqZKu0=;
        b=Y7tX49qcODt1qF8bBkXr3qR0mTQUkVmA3IuObbmbYSYfTqyQnodMJP0rXaO3JkdvGw
         E7gfBnyVEr356Y9PA2FVGzgc4WllBuyG1ZalIxa6+EJoAmnnsbK9x5STnvkw8iEW4QyW
         X7lpoZJYVYmRQ8NQFtjsVWvzRyfUd3FW6MUXjtXTk15ZYSMvb29yKf0O6ihcomeQjW0j
         in6Ir0ZrrV5jt9uLNYqnLstaWJ3WJmTncgQIY0a2AisYujGMj2MWifnpD82Raar5p/33
         4ISTeLObmuvu46pRoEpmkLiLI8UrgFHdDzrlmH20/OLvS9b/vxNp2m7hkZ9yD9BUHxoV
         VMhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp51uhrHnX0dFk7ux8LDo+udYwqZHhiWJvAY8wZmkkiZDfwV29SHjpDIs9qQeP2BTmhwG1WVA9A9bsgNKp7PSnx1QqU5cRWahfZIU5EGok9WiWKct3rnjUK/a+ivBbBpZbLqSZcI5uroceZ7Y+Nw3cesWiLp5NrMLtvf9VtLRWOBFdoPmWIysEYaJYoRvtiMl0DNUzVWVCltmRNSRwx3Yq/cTrmJpGZTES5D9oAvrQ2FsgwwwRq3j7ad/krTkZMOss
X-Gm-Message-State: AOJu0YwL5JRSCmjwIgBkxdjBFVRnYdsspMzY2jCiqFwl7TmYHwdKBprr
	dygBqRuZuG9fMDBSGreqCU8Sc+216XnRhEY4zp4daWgf95JdfW+mLfxRwA8+9IM=
X-Google-Smtp-Source: AGHT+IGScBFQNoxwojt1rpNef6f+FULwBcrM3p0m36rgvi0XZV/vECulKPjo7xUkKKJRFn6kw0oUdw==
X-Received: by 2002:a05:690c:fce:b0:608:16d7:c235 with SMTP id dg14-20020a05690c0fce00b0060816d7c235mr9509215ywb.35.1708467285814;
        Tue, 20 Feb 2024 14:14:45 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bx15-20020a05690c080f00b006082aec5cbbsm1240694ywb.132.2024.02.20.14.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 14:14:44 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-607d8506099so58233917b3.0;
        Tue, 20 Feb 2024 14:14:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXHRE5Rnv6mMI7fpu7OlJwsvBYiJ3o6gKzInGU847jJ1CCWEpELJKGN17ll4oSfNp8b5yTbPG5joWxAhzNJtVJouQj2u4SFyIUWEUVdwfq7ertUH0nqGuz9/X9XL9qDlDmULGd2PBZK/JyqUtCwOG1ljuUwGjDb0RIAJkzxIwoA4PG3OvpzGqAQs/CwaTIHZqYr7a1USU6xwNCjbq1k+R8OSNzNaL1dFwoVPIRch6Mcv7sMw/L3A+oHwKFYhZmUG+o
X-Received: by 2002:a0d:cb8c:0:b0:608:7bb8:9fb6 with SMTP id
 n134-20020a0dcb8c000000b006087bb89fb6mr417604ywd.32.1708467284625; Tue, 20
 Feb 2024 14:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
 <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
In-Reply-To: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 23:14:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwP747E4YaON9-YmGB6w=Aa6VgACRWX_QmYfTSB5RUKA@mail.gmail.com>
Message-ID: <CAMuHMdXwP747E4YaON9-YmGB6w=Aa6VgACRWX_QmYfTSB5RUKA@mail.gmail.com>
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

On Tue, Feb 20, 2024 at 11:01=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Feb 15, 2024 at 9:16=E2=80=AFAM Christoph Hellwig <hch@lst.de> wr=
ote:
> > Pass the queue limit set at initialization time directly to
> > blk_mq_alloc_disk instead of updating it right after the allocation.
> >
> > This requires refactoring the code a bit so that what was mmc_setup_que=
ue
> > before also allocates the gendisk now and actually sets all limits.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
> queue_limits to blk_mq_alloc_disk") in block/for-next.
>
> I have bisected the following failure on White-Hawk (also seen on
> other R-Car Gen3/4 systems) to this commit:
>
>     renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
> 0x00000000ee140000, max clock rate 200 MHz
>     mmc0: new HS400 MMC card at address 0001
>     ------------[ cut here ]------------
>     WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
> blk_validate_limits+0x12c/0x1e0

Actual capacity should be:

mmc0: new HS400 MMC card at address 0001
mmcblk0: mmc0:0001 G1M15L 29.6 GiB
mmcblk0boot0: mmc0:0001 G1M15L 31.5 MiB
mmcblk0boot1: mmc0:0001 G1M15L 31.5 MiB
mmcblk0rpmb: mmc0:0001 G1M15L 4.00 MiB, chardev (245:0)

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

