Return-Path: <linux-renesas-soc+bounces-9291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7A98CD42
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 08:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18D5228602A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 06:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F265312DD90;
	Wed,  2 Oct 2024 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2KdJVxb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5750733EC;
	Wed,  2 Oct 2024 06:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727851341; cv=none; b=O8cqkDMwklMydvwz0tLyZXjRrRFY1qKP0nrs1gtPui10d+SNs86w5vngp3zBDgsl3ui/C/Wl3JWPKwc6xBhA0oTOw2oYdxRTAm9fOH8YBJamR32Dez9fo6K6lXdWP7kAiBpzdGhXGLb893sdUP37sMEZjYXciLuYowVyMvgkPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727851341; c=relaxed/simple;
	bh=MdWuSwkybXUYj063xEzsz/V8JSIpC4VUKS6xkG8i7Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8Olqf+v5o7EhJOmCfr1wQhEdOLUWzezaNreh+INN5gI2RE2sJF6OL9SkxXWpyKlt02lP4PF40iR6xcb37MIeUCCHPpPMq5YsFkWJ7ifJb4331lPMom1pqvopwQsd89EvlXYC6h6dtHbqxfPXTVeIZ9GDL1HY48MyqP9EiSOkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2KdJVxb; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so929280766b.3;
        Tue, 01 Oct 2024 23:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727851339; x=1728456139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdWuSwkybXUYj063xEzsz/V8JSIpC4VUKS6xkG8i7Ek=;
        b=O2KdJVxbsbYvrfUq9pzp2AmuV9xIJHplRWBP/qOCMecRC8OpOeaHbLV6PLLIPvEofD
         hjBKtJVogzMDeRYQf1hxVFSPXWCRbxkfogcMwHSpWPCfgEmwPTHIMcrDVAYRGMSymnVi
         FYMZoZ8BN3PgeVVAdF6eLenud1iACOoOz2wHMv/Ve5rOXbXyWjykCBNDPVp6gVZfWDdm
         ojIJU3YxosvZtYDmv09jUPYNhLn8LD2Went3VGr72Q96e9gE2LclUbGZZ200eZSQOo9g
         ea2SfwAtX6up6Rv2oyxN0kLR+IPUefNkYRZMNBnem6smMgP+vTchZYsATTBkfKUJhKV8
         mMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727851339; x=1728456139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdWuSwkybXUYj063xEzsz/V8JSIpC4VUKS6xkG8i7Ek=;
        b=GXfSO1QsBLnR9kGyZrRx52kvgU50/CdqG+jtke5SOqMK3TNVpJ1FLwaQoGczm6o9u/
         s5SRvxvEUXjQAjH1LOZNxpO0F5t3BrMYUeND9rBtcSMd/aTUj4wEcs32jo8CKXxThy3n
         NXppUS5RHsAA3b5msDlpXxKoaZgdU82MYga/VDnHPsa9JVB599R2pOtzbpv6I9BRFNuB
         4t0fnE7/l8Czgl/OrLBPQysJWVKY85MDK2UrvQAvCZYZ3aITKvo6j9eC3a/Bf2c6Vh4A
         SD4eoy8PskJcqe6WdGBhxL2GP9j1XivDkByVLkE94NsTQtLafwtYbyqJ9X0yWAJIlGM/
         0g4A==
X-Forwarded-Encrypted: i=1; AJvYcCU123Z7ei1Gkr8Fa7t7BLMPJ5A9XARgLRtRTZ7wRWAg3ddStj2574K+PnApXA5X0z/xxqSmnohWC3H6@vger.kernel.org, AJvYcCUE8of2zfhK7V8hq9pponsnv84GQqvsvuJRoYmVNfWYOb/UIpMpPD7WgWrafC7clHtB5vXSUUAdNqxNfg3S@vger.kernel.org, AJvYcCUOC8Nw/mg2IZGqrxrVUR/7uvqlj2QlShCYtMVpJTSrLPJ6KCvCbqOq//UBOIj2x0skigDdft/K70dUgBo=@vger.kernel.org, AJvYcCWq0ciaq4zpb/HAxLCkhhPUWdCQqSAAA+x8wvA3+3+HwIoBjdhRUrR0ANBAuTYtaYMfMeQ8CX+5+O+N@vger.kernel.org, AJvYcCX0d/q6BCpJB/Uo+566peewZYkwsJhVgjLUKRhe0v8/NNvc0R6bFEr0txeUY2Xdk672wf0F95KIWRSDFZW32hqDPes=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHfGzxoSli5KE1uaSN4IQt1SHbGPATTrjSGTzRYVnL9OYQev5i
	GPrd7ySAAJ4iuckUcdHSEy3mjO67ZNvhYZx5eHwBiKtH/auAUY6om8DO3toVeggw1lNIPC1FSEo
	4yWhGm/GuppTi/oEhprJxDUGU1tU=
X-Google-Smtp-Source: AGHT+IHo5N+PmxexOIAZW9wy2hU9cuTy5rl7qjrkN/SU1uBB8FGlt4ZcL2RSEzaIwqP4nFhi4TRSgJ7Nzvn0kPnXYJQ=
X-Received: by 2002:a17:907:6e90:b0:a7a:aa35:408c with SMTP id
 a640c23a62f3a-a98f82008d3mr181880466b.8.1727851338455; Tue, 01 Oct 2024
 23:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com> <e2sceba6setxuvm5ztygqo5eoihjbts7gl4pfewjunepfhllhq@oblkbeb4wfym>
In-Reply-To: <e2sceba6setxuvm5ztygqo5eoihjbts7gl4pfewjunepfhllhq@oblkbeb4wfym>
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Date: Wed, 2 Oct 2024 14:42:08 +0800
Message-ID: <CAL5-g4VE9kzXewhqOFetuyjZdh-OnaisyProEujuW9dbVCWTmA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] hwmon: (isl28022) new driver for ISL28022 power monitor
To: Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: patrick@stwcx.xyz, Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert, Krzysztof,

Thanks for your feedback. I will fix them.


Best regards,
Yikai

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:35=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Wed, Sep 25, 2024 at 11:11:26AM +0800, Yikai Tsai wrote:
> > Driver for Renesas ISL28022 power monitor chip.
> > Found e.g. on Ubiquiti Edgerouter ER-6P
> >
> > v7: review comments and code refactoring
>
> What exactly happened? That's too vague.
>
> Best regards,
> Krzysztof
>

