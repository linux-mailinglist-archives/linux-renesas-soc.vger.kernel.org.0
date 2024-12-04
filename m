Return-Path: <linux-renesas-soc+bounces-10901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2F9E3B3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E239B23CAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 13:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE94418BC19;
	Wed,  4 Dec 2024 13:09:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9E1746E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733317771; cv=none; b=bREyPT83NxDJns33WmX9PsN+QKrih9LrPmmj/omx4u3yagqVoOqcqxvTSNdBlv3KFbfqJFNaRWD6YziZkFNXEjAvIbiZw0GvqCHbRDyvLHpBKfHwCugI/Kmn/EyjGFSlyZM5UItBdS2qrQdZn4OwXgs8CKtujooeYDkQ0l/Aqq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733317771; c=relaxed/simple;
	bh=jZ2RwKVdJ4bC0VnDsfi6p0bD09rvo3sIiignmZdu888=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=SfbLG5ymUn2QgjqMNj2y7UkUPmYRjA1OymEJsMXsXiTdoO231BupwcY6Wk9CMrviyE77/JhRfvHpTlTByGtRUCqeDD5H+0774r3fTNgThBPWPw3IONht5avdEQc8cuqaV+hSHSvj7y+PfoMqIelZeUMIOSI5b+ot0uISMrC/U40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29e579b9e9aso2476976fac.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 05:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733317769; x=1733922569;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmLSWkW1J5svlMSkXfkw9qHSWTTbScFtcsSqYhj9uUk=;
        b=aR2q9//5EXcIR2j++1wGTS1sDz1PnZQA5asCnJLY/Z21R54TVPkz93YhahlouD4upd
         bcbTnnnwMp3wALpazyf2zmx6rNnP2NoZGduETlaSthVKC+z/tDpJTuD0lRnN8p/6pLnx
         +2IvJtwasa00EkuwL0IH4/3YR3oSr7iF8fU9eqDJ0ZYYEZFHTXLKaDNoEUojyeTuOsV9
         YNebkuvKL7cwpGtSPTCLO5NVYuXoC6uOI8v2oAsdMzSOc28pfMl0TqbUVcMrSkTTBiL6
         YJY7Lhd2YQtOzi2mEUcFMMbsvLbYYAM5PmOZchPi9zjmyTo84hapQgRlmbdjYmnwH61s
         SqrQ==
X-Gm-Message-State: AOJu0YxUNbng+LWDYPMPDKHS3SN3xb8Bu+XSwvHZ8oa9WMd9PJhJ8GJP
	UhaEju4gYG90HEj5wzJDYnan8bbbiy7sdw4fNncHcA4bTtFoOc2vOB9FrC3u
X-Gm-Gg: ASbGncuGBp/Q2/o/1SJBrCmzoz0Kuc6dWUmryhKFaPKYf7UNPVWR6wOBYV2XfbJyIr9
	/JRjvJzyGcOc1RYeILSxm7BgGF55ISVH1nUq3R7O6zO4e94GlPnXZoSfgoD3u7vCtdPv7jBuqVl
	QUCb/RZ5CkGsQRq0qQMTSvKueyJz3JDAf+v8dPwVB0TipFjKAAburSfVxtUWNz0odk1HoIOb0Bn
	W+Z9eLoY9BhtQnwhSNufj5VOvMUZa9qripiGYggDR4vG2b+AbQCmqGto96CLh68vxWet9/lXA6C
	F3miA8sgrSjb
X-Google-Smtp-Source: AGHT+IEB0tDP9I+bobxW/u0M8aKr/Uf2MZmvaiuQoGiIuvqh+UqYTsFPXkd7RjGQe4YLVvhgm3iEmQ==
X-Received: by 2002:a05:6871:3a24:b0:29d:c832:8402 with SMTP id 586e51a60fabf-29e888da9c6mr7064823fac.41.1733317768743;
        Wed, 04 Dec 2024 05:09:28 -0800 (PST)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29e453645ebsm2784048fac.50.2024.12.04.05.09.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 05:09:28 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f1ecd0d9ecso3141328eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 05:09:28 -0800 (PST)
X-Received: by 2002:a05:6359:65c6:b0:1ca:a84e:ef7 with SMTP id
 e5c5f4694b2df-1caeaaa1005mr519169155d.10.1733317767987; Wed, 04 Dec 2024
 05:09:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
 <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
 <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com> <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
In-Reply-To: <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 14:09:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
Message-ID: <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 10:40=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>   - renesas-drivers-2024-11-19-v6.12 (TBD),
>   - renesas-drivers-2024-11-26-v6.12 (TBD).

This became renesas-drivers-2024-11-19-v6.12, followed by
renesas-drivers-2024-12-03-v6.13-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2024-12-17-v6.13-rc3,
  - renesas-drivers-2024-12-31-v6.13-rc5,
  - renesas-drivers-2025-01-14-v6.13-rc7,
  - renesas-drivers-2025-01-21-v6.13 (TBD),
  - renesas-drivers-2025-01-28-v6.13 (TBD).

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

