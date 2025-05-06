Return-Path: <linux-renesas-soc+bounces-16711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11830AAC231
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 13:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 329691C234B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 11:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF75B27935A;
	Tue,  6 May 2025 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUDJ5Ia6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D2A2798E1;
	Tue,  6 May 2025 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529975; cv=none; b=rZ0rOFXDJAPck9Mj0dRP2S9L6lhwiyf8gobhSPRg3GHkkhpEazVMFtiJESP81Cljp5nvoUC4crLrf8Zb3ICZwWnPn5eP5Se7lWc4WrMBx9XrvaklC0pDrgT6VIp9NCUPk5IOyQ+rNYQ5hmYpF8nUuG7rO4Qr2UM9p3pXVacwGZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529975; c=relaxed/simple;
	bh=O2rqsS+7CIPhwzmnA7i4FOO8hEThqmeuLPa/ESAe03U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRyToNrpQ3lyPCTybnqmYWXqe08T+bCUkE4TTPQqin4tMEIDyiTkR/JqDgDg5rGwZ1+4orSAWZtTCd+ops88ynzYV+e8M9ZBZEp3ygGyiIsWNsHLr+dbsiUuLvkPtPjxB50MKsM7DcQjG7Nfn7DiGYOdjSdhsoQawQ33/+lJ7qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUDJ5Ia6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso36753835e9.2;
        Tue, 06 May 2025 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746529972; x=1747134772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2rqsS+7CIPhwzmnA7i4FOO8hEThqmeuLPa/ESAe03U=;
        b=dUDJ5Ia6juYazFBBmP6+GmFsSJTV42UzH10YwQswFry3wVPRbWI3bjaJTWh9y6/WE8
         5nb7yMOyzNiTSQKwVVGz3WUksr3knvnPczQorsaS6wxZObVCkUhwBoIkETNG/XYi78eE
         YZ2OnmwRFYq2ml8ozwleOVHXB7X1qh2irvTIsZhg8tYJcQYQW8pkICwu9GE/ps90CPi7
         SzDPLROmvfeo8JjmKjlZ0wCqSUYdHvsUTGH0oHVwGGsOY9vXqOOIWTnhPQuhuCdiqQlc
         UCSCjGMWZ0LholZ1kn/ZoxpjOZRBWRmsjGY53gTG9ATkgUbBbv1sXw+QMcVibOjJvfDS
         cvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746529972; x=1747134772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2rqsS+7CIPhwzmnA7i4FOO8hEThqmeuLPa/ESAe03U=;
        b=OdHIdKPE1qZk7N/TTi/qqPlrMRSsjKTICqIYEyn14SMX+l+fVi+CMS5V9cPYhNTx9w
         fIROm+KbgeyXLH30VHt2b8rNbHyhvCIKFHZZ6EuRAmdxdpnLCwil1GQqkfr2oxvk3Q1+
         n7KfqmF7+Kmpi5tc8X57XMWLIVjdUQm6+tUbk9llxmXwaBEL9pOrU9RpThglEKTl8fJD
         rZ6X1bDfRkUbvZC8gMj2LtuFIEh/h8gt4wYG3HSPCI93IXprYeETVVXNxabqpMMYXayG
         Li8L4SLk5cPNP6GG4xhtYtDc3awcS4y+3gndkk3j0tsptpGJMuxgpjz2SkSWy/o7yTVE
         7y1g==
X-Forwarded-Encrypted: i=1; AJvYcCVyx1TJAmDbLMKmfh5CATZyiRkstQUvZm8+H587CZGpQDOuEIUGAEcza2hLLMdSA/0Azo92phApYg0PsbI=@vger.kernel.org, AJvYcCXTHb3N+deCHuULavwaTGpyH2p5nYyx1z33ctFhfdIJROshw2ctgQqECmdD7TVfif3Xugg7nG+wVaCUXVgkCrnKZ0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhsd20frh5vFeDIHZJsynp0TpJr/7D/LNl1Is8EJSY881G/y3O
	9DsERI2WCM1chJ0F7HRJPBD7ofNoBqcY4hiAB4vik2HaqxsvGdnSZ70p6eTAieQOY0jCGmgUyfU
	hsoc0ADpeN68ykE2pScUC5tuIcaw=
X-Gm-Gg: ASbGncsUzKh2ccyW8KEOj+wy0y9/HY/HYoQaCO6aFq+jyh3mRZZMX4O23Cvi6QIdcCr
	S6+i0S52Ko2rAyNb0jlGVmKLTpKGUzgAlUm/zatFvDPBr9LqR2OPMTDB+PUWLRH+VT65Zdgc56b
	DbbXX/UMgCwg6QT9w4JuspqTQpA1oWdyLbOg==
X-Google-Smtp-Source: AGHT+IEl8WOsOctZB6vC/J5QfmXY3sgD9nIFkIDBu4WcUX+Px3DXCBoXBfXgsmay8+RXay1gXsI3eMHzNv+p6FEZHbU=
X-Received: by 2002:a05:600c:37ce:b0:43c:f4b3:b094 with SMTP id
 5b1f17b1804b1-441bbea0e40mr140979485e9.6.1746529971892; Tue, 06 May 2025
 04:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
In-Reply-To: <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 May 2025 12:12:26 +0100
X-Gm-Features: ATxdqUEJZorzolIgvsTdLshEsTPYYiqnZz4o7Z9Dl-6jDsMyiFJ-9tbycLt3cAM
Message-ID: <CA+V-a8s_98eGfBe353Tp6TxZMtkc8JyP2KtxW55c_uN9ZB=NxQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, May 6, 2025 at 11:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/05/2025 12:47, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) =
to
> > ensure the Ethernet driver is available early in the boot process. This
> > is necessary for platforms mounting the root filesystem via NFS, as the
> > driver must be available before the root filesystem is accessed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Same comments as for previous patches like this (even the same?): you
> are supposed to use initramfs for your arm74 boards. Even armv7 boards
> use initramfs, so network driver does not have to be built in.
>
> For example all of our setups use it thus we do not have to populate all
> other vendors with our own drivers.
>
> Sorry, but I am strongly against such change. Kernel is already way too
> big and with KASAN it does not fit to boot partitions in some of the
> devices (and I cannot change the boot partition size, at least not
> without big effort).
>
Thanks for the feedback. I understand your concerns, and I agree with
your comments regarding the use of initramfs and the impact on kernel
size. I'll drop this change and avoid adding the driver as built-in.

Cheers,
Prabhakar

