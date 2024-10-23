Return-Path: <linux-renesas-soc+bounces-9981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CAD9AC06E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 09:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64FB11F219D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 07:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10844154BFF;
	Wed, 23 Oct 2024 07:37:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA8148FE8;
	Wed, 23 Oct 2024 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669074; cv=none; b=Hoe+dXEI8gUofhF8tfAcowUMFu0AuOq80pGLGn5u28TNeoZp9LUYPIeZL5GyuiAMz7h7GFd4SkfzvFI8DGOFCLc4cIZqd635ugcHW7+x0DnJp2I15VTnUrqZm72FRK0U2WIQLhGw/LXxripDT8WudLDikeK16SZRmGTu1C8alK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669074; c=relaxed/simple;
	bh=u4JQxfYcMPlyi9HiIa3KMAM+bjUiWnR3jyZP8srqLxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfcjQGzOC6g6Ob+G65ME3l83rS8QhpbMW5uyCfae1hGHXBuO+cc2NsEpvTckae5lMKEkNPQUxNwadDQzMFuEjTEHHq/OQlKiJ2S4v/mi6rTrtYeQedLnRSI9woBK26RI/4prr6PCOj4KF9gSeePEX0gZ5bvqBsd9DBcpjkNrMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2e2ef2e906so1683695276.2;
        Wed, 23 Oct 2024 00:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729669070; x=1730273870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+PBluiKGEgvXQd9D1fqi0rYQCLfJ4nFtSe+3v7U03Y=;
        b=LWZAC2dXjJ1+z1NbYWuAI1wNJq/mpIhRRb4PQXyDxFnfo18kdW7MaKVZpV22nIGZZm
         p8I2nYO+mkuWrT+1vvfKBJznPogchUvLEeGQdYKw9rvHg5+8sxFr1RcbkRUm9u56lzM3
         qKhSF0O2tmfRasChFQOid6zGq15B/RcPqFXS906MGL10x4O/E/vk555FRKhylWG5X9mV
         6wFxDLmgD4cfJ5/52bkXqHWkekKO2JjcRnbjiQfDPfvG3G0YNiClmUTHU0HKvVqpQbCu
         7cp8IZLBDczjPElraHTEvEzBTFhQX+eg5B3K09YIcSk3SQV6DT0/7ufkImWdUtQsCyw/
         7s4g==
X-Forwarded-Encrypted: i=1; AJvYcCVYfi+0BtqrPD5y+gW+JR3fcs5/QR3yfTEAHIRacBghECZnV7LWRn6WRh5NQkhh90uQPjFWSbGNWJuM@vger.kernel.org, AJvYcCViDz5fmBRVvisfHF12QYN5sfgyG4tTD8SYy8fNNJNKQC1knrr/cSGsDl/0YvJtwMH7LiSux3MmvOz9SJkhlisBjOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxywrPY8pRInjnII2SGiBbj+KXOsVmbtfQMKyKF/WXD/W3DD9iu
	dnh2CK667/VI4HxFM6J4AzhwjZqnNERrvrS3dGidKHiiOwqd0lRuRnFwaXrm
X-Google-Smtp-Source: AGHT+IHiraaOPruBNcw44nml4IoVob167/38R+huc9G6Ri6iVbNFTEzWn6fwl+OKwW1rEFsHp0ngew==
X-Received: by 2002:a05:6902:228b:b0:e29:1fa4:9aa4 with SMTP id 3f1490d57ef6-e2e3a650fefmr1524218276.34.1729669070092;
        Wed, 23 Oct 2024 00:37:50 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdcaebbb9sm1445640276.47.2024.10.23.00.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 00:37:49 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e35fb3792eso65044807b3.3;
        Wed, 23 Oct 2024 00:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnEHmnadKp5leavcLJzekmPz0IrG+lrHgRqIUUl94+2ZxuUZtyPkfnrzg4j2M9KCIhC2lOWn9U+A9n@vger.kernel.org, AJvYcCX29tEUTV9H0QnDRSVOFUsoPGJDorRybU5NWPga7/eAU3IKk3gA70+WkjiZIY4VUz0m2d5uPPQl2vyB2HcRDzqzZT0=@vger.kernel.org
X-Received: by 2002:a05:690c:318a:b0:6e3:d8ca:f00 with SMTP id
 00721157ae682-6e7f100471amr14088917b3.44.1729669069333; Wed, 23 Oct 2024
 00:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com> <ZxinNLKFW6Ijuyc7@shikoro>
In-Reply-To: <ZxinNLKFW6Ijuyc7@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 09:37:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5VDiM+9SerRm8sBxYFw=NPBAqTmcJ5i-R=Y1zS+ai0A@mail.gmail.com>
Message-ID: <CAMuHMdW5VDiM+9SerRm8sBxYFw=NPBAqTmcJ5i-R=Y1zS+ai0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: falcon: Wire-up Ethernet
 breakout board
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Oct 23, 2024 at 9:35=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Are non-v100 variants widespread?
>
> I'd say nothing related to the Falcon could be called "widespread"...

I agree (but I didn't want to be the one to spell it out ;-)

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

