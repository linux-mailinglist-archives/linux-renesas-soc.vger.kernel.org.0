Return-Path: <linux-renesas-soc+bounces-11450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D46599F4681
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26EBC188C6DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C3B1DDC3C;
	Tue, 17 Dec 2024 08:50:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0515624D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425459; cv=none; b=qjpYUGNOfIijegCyiQb67eTc+PgFlL3d+WC5uyv6st7l4CkQWWfOkpQBaFBHn0X3Rvb34VttbH08NFgRgNVNu3dpAisXCUFlqWCi70KW8EHQ1yrNEZ1A8xP6jSp5lyzAZ8X0rjexB6hnUnsyyytiyd9okWElW2L/FhZRwepPcHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425459; c=relaxed/simple;
	bh=XjHy1OWwR0puRiDYQI0K4gsvQi6icPed3Z0lvihOAC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hONK0JZWM9qBL5m2Vpv0Z5mSoiUQcEz58ONGcLUIDowlxnBAkiS6TQBBGeaKTrchg8TDb+MQB5N6rn4l0bY1btNk2bLc3XSQLDJu9V9n6hk5d4scWtw0bZfs/BbhyKaqOX/B6P+t7lObRK+ZOtjg90AMf/P+rsMIgSAcX7wBn9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso2508631241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425456; x=1735030256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh2fxd5VMJ+LXR+XijQ7x4pS87qHyA4MI2jX3s4g4EI=;
        b=jy3xRS+o6tPtE4DhV2UTiSsm2fV6wVPlvomuqcGtEM9X29oa9/LcdzMAyRXvng4XFV
         qi8Fp47c+8OrXABuADMR/uz7YdpnlfFeqrUEyfw647U0mgVdQnRLmIsiLnIyzr1avTdd
         gwtGv3SwGwSq5xwok1LISF9L75qsiUjUachz/KYrdWozuWuBjePTkd8YSprDov/tIict
         JwDjJ0c/p41W1E77Q7aJXIFDUEBr9ZyQ9nqXRKlRt0GY9h97f2RhUNNrwMzc1y5r+dO5
         CWcsBhGSVXHRAHMFql0CkTG7HuS+c8JDQC/2fCKt3v1wiSJaFiJUBNI2mkroX4C4599S
         QdSA==
X-Forwarded-Encrypted: i=1; AJvYcCVjFD+zWSa85y5LbKWUfIEotjwSKK5lg54fU9F7z45zMPd0OF26t5OWir5uxcswbCTrMpk55nyuSYsnN/nKK2q48A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Hf/sQSZFTiuUJ6eYXm/TpUq6E+uCCf9Cr4xuHXhEtyLiiFHP
	a19Uk3aqb2fs0IMiQ+WTAONeFx84xwE0cdj8Iu9SBMMHFTDNGRrVlabvtF8K
X-Gm-Gg: ASbGnctWY2n2duWpSwYrndTcblYNSxTUEQxJ4YLW6/lx5hcGMUvycGm5eU5Cns0iIqf
	W7IUtm8ttTpvkutgMHPrTGPqXhsywpLR4O1CU+9osWvhSiM578twMHnQFv/H6Atl0HTx6o+MEDy
	ItB5nPdfv1EAUaYTDUPshBN2KD5MKnmMJeqAM5HU5B9dVjnGGpgwbV41hol7cFUXPk+zL3sCXSH
	Whosko6aN1T392aRkOl3KgVZMSCUuB8DXtNhR8epIiTdxat2HMRrmGMs2UXgag7yx9/wuuJf+T6
	vOSRi9lWZyIcSt2Dyl4=
X-Google-Smtp-Source: AGHT+IFDlaFXtxYwzaOC8nZFOCFjMISJ5+QkzhNFp4G2GeC9BLzwkk4p9IMxMHe8NnFFxAcfQ9Ktdg==
X-Received: by 2002:a05:6102:f88:b0:4b2:48b2:db9f with SMTP id ada2fe7eead31-4b25dce81ffmr15507288137.13.1734425455950;
        Tue, 17 Dec 2024 00:50:55 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab6d6e01sm1165144241.23.2024.12.17.00.50.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 00:50:55 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so2223502241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:50:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVn1NwgPPI0NopaEeMyqd8y1zw7vwfQWpfN/8DUdwOwD8GP7L0gKnrElEn88ycgbOJhXBAwd08oxJVfHOSn7RoVbA==@vger.kernel.org
X-Received: by 2002:a05:6102:4b:b0:4b2:7534:f26e with SMTP id
 ada2fe7eead31-4b27534f57dmr7583309137.16.1734425455618; Tue, 17 Dec 2024
 00:50:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216115327.138833-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216115327.138833-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 09:50:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1SeEJVyNXFf3UFpZ9mh97ON5PvoX44hEyD5=0uyFhHA@mail.gmail.com>
Message-ID: <CAMuHMdU1SeEJVyNXFf3UFpZ9mh97ON5PvoX44hEyD5=0uyFhHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: renesas_defconfig: Enable RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 12:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Enable support for the RZ/G3E (R9A09G047) SoC in the renesas_defconfig fo=
r
> Renesas ARM64 systems.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to my topic/renesas-defconfig branch.

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

