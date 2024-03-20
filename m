Return-Path: <linux-renesas-soc+bounces-3926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860A880CAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 09:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B815A1C208E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 08:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8364B2260A;
	Wed, 20 Mar 2024 08:03:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6511181
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710921796; cv=none; b=obfacCSGtj0GyXYjfHoZeNSCMDqI2t/ZF6PhfIFVzOOv35eRo4xacBoCXBM0xKbcYHdDYc2dUhdHSpcnrpErtsfZyOaEaus1d3t9QVtvoWVPyJldET+WZNZp9v88o1YilM1VjxanUNeNd8SeWvL3HMH3/4I5Utn4KZk29Sg+nI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710921796; c=relaxed/simple;
	bh=lXnfNmk6wLdyQb0lPKeKsENpOznmJcgX3B37TKiXXJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLAzqGPECLyGoLoeBdydZ0yQm0SCiV296I73LZYiaA6gRiHkQMo8aH9cqG2Be6544U/ZrNWNNab9k+ff0A4vBfGUN9B3VGj2V9cMmEW8czTHqCl+sk8rgYB76WZF6hnyv1lUHW8olIvv2fY5s2hUeAW7nSVcmC8xsnwozU3ZQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609eb3e5a56so69158037b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 01:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710921792; x=1711526592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCzxiR9mEUWpxSwg0HU4BOLCU+cUEL0wv7bOTW6pPQI=;
        b=jCP0/06EgRzN+2gI+0rbG7NXURTkHIrnhCDk23LfhlwhtX21WDi1b4QxcYphIIld1I
         63yYbluoOUelX37kL8Dpz6oT8S5oe6XoL1K/Kt+yX+Kez58kyO5KuAarn5ko9qpaRbJa
         anJ7YIxuqIZAS1lsOaiNlL3PJjYbAvH6vVkNjApQpka4tuQXNpmrp+rePMNHCw3NGpUm
         ZVW+pmb0RGsHq4BtHrdpQTMCRaUBqtws0AZ5X/ae1kqMGcDeisGAQvBuovH676/tOPZp
         wjmKnRIz+fWVW6I9U0Sq1ZTSdRpE6jQDwFB74PUB3+r03tWFu+ntCWSimPkBAIWp1vvp
         NV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU34XowoYwvjUZJR96m6bdG8uHCywYWsoTQ/Tb5gHpP/QMRdBI3vU37CCcrmuds8Wf6o3JjTWTZfpOqSINOKdTNMjq9sRDmydtOGuV+pg5CBvA=
X-Gm-Message-State: AOJu0Yz1HUEILVjlP1EGDZeM6WswVhpQ2ix54jpSpDFgv1zBthedtwMm
	gmhptV2VKVkt7u3mSIP2PuwqVIM5ps6d9hRkvYws9YxzUcSBHUBTbqGicezVQUY=
X-Google-Smtp-Source: AGHT+IHiBHokT8drjRmYGz3duhve4K13bDWxVOMfEBxo32GW7l/zNfkL2fQlqK/H66MegTyJJkuf3A==
X-Received: by 2002:a81:a1d7:0:b0:60a:353e:6b5e with SMTP id y206-20020a81a1d7000000b0060a353e6b5emr18040082ywg.1.1710921792412;
        Wed, 20 Mar 2024 01:03:12 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id z80-20020a0dd753000000b0060a048aac3fsm2717485ywd.96.2024.03.20.01.03.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 01:03:12 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so5834047276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 01:03:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmWjj3wPI0DRMzcGAr0QNlfTIHdiKhpf4fOUkEfa4nQso2yoqhfTRj5UiDH8chY49UlEnKjlcNVCVzxpjkhVscwho5MZjP3F863ULmmo3AzJk=
X-Received: by 2002:a5b:bc4:0:b0:dcb:fe58:a08b with SMTP id
 c4-20020a5b0bc4000000b00dcbfe58a08bmr14658390ybr.15.1710921791875; Wed, 20
 Mar 2024 01:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1710864964.git.geert+renesas@glider.be> <ZfqLY8Ej6kNnAMQA@ninjato>
In-Reply-To: <ZfqLY8Ej6kNnAMQA@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Mar 2024 09:03:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWeq6c8F=i7SgEt+HBBpknaEFTsrxM26OrDpjzOS_YTZw@mail.gmail.com>
Message-ID: <CAMuHMdWeq6c8F=i7SgEt+HBBpknaEFTsrxM26OrDpjzOS_YTZw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: renesas: Add more TMU support
To: Wolfram Sang <wsa@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Mar 20, 2024 at 8:08=E2=80=AFAM Wolfram Sang <wsa@kernel.org> wrote=
:
> > APE6 (APE6EVM), and on R-Car H2 (Lager) and M2-W (Koelsch), except for
> > TMU3 on M2-W, which consistently fails the CLOCK_REALTIME test (why?).
>
> Huh? It works on Lager and fails on Koelsch? Do you have a log file?

Of course it succeeded on the next try...

When it failed:

# Running Asynchronous Switching Tests...
TAP version 13
1..12
# Mon Mar 18 13:47:43 2024
[...]
# 1710766103:513532480
# 1710766103:513532480
# 1710766103:513532480
# --------------------
# 1710766103:513784560
# 1710766103:513784559
# --------------------
# 1710766103:513784559
# 1710766103:513784559
# 1710766103:513784559
[...]
# Delta: 1 ns
# Mon Mar 18 13:48:23 2024

not ok 1 CLOCK_REALTIE
# Planned tests !=3D run tests (12 !=3D 1)
# Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
TAP version 13
1..1
not ok 1 clocksource-switch
# Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

Perhaps a subtle driver issue, or an issue with the test?

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

