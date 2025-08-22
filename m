Return-Path: <linux-renesas-soc+bounces-20889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A27B310E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 09:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4649607EC4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 07:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979C12EA49B;
	Fri, 22 Aug 2025 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwdqNJ34"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E397B2E426A;
	Fri, 22 Aug 2025 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849403; cv=none; b=lPohTNYYVBFWt9CgDTLgWHnawI0Quq+GfI86ZC/K80q32HorVaUKjQWno/4GHtyUEB7NiTB3W9TTBOtnQlRO9p4GOnxxFp0hNpOp2SAVof8YiqxMItXpzeHrvpMjSfr7Dxr0z9WPjmM4NNrwBpCbN0eNUz3OexdiJOHgq7EzHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849403; c=relaxed/simple;
	bh=+8YEKnLVuyvtxkfcLTrUSFG0QkZ0geiO1dNTd2rccjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6sWyLRcznq+mw7bhW6Rm4MAGez0JXzTr0pLQCMi+gpAhb00YC4Is9Dg4ZvzN//Hu/b0xKeI1ycGMgbdenhA49HcpMspitUtO+NeVt51bi5pRFAbmE91rlqLNnC5d5ovwcZK94yqDH3IAGi+xO6goR2KxPHSpz184cveVfNMIcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwdqNJ34; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso36029f8f.2;
        Fri, 22 Aug 2025 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755849400; x=1756454200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8YEKnLVuyvtxkfcLTrUSFG0QkZ0geiO1dNTd2rccjA=;
        b=kwdqNJ34mEf9GGAXYOGot6MmIqu5VFXeQsGuHEzh8v8YsfIqLjM5ddMsGkG9PFSyRG
         uanwyA3TfW4kmbNVkdVtNkH9T87JooML+cih75Y/6D5ekDBREQW8frXe/gbg9S/GvR6X
         GaPUv1Et5ecInxz6GlXYrg8FKOAfAUqj3kEUXuq3JOfuYQoozFwPfh7x5zuk3YOq7My1
         ajUnYC3Lt9FeYTYo5SBQHhKkDJ3k+UyddtlHIbR3c/NUtQCxqpGqZtcpUCnUUcHxlaUQ
         6nv3k5M62Xu3GqtiSVZepjMT3EOMZOVpMhXt23Ih8sdmjLOFgGBKxcj+j7jN81a2voU+
         mwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755849400; x=1756454200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8YEKnLVuyvtxkfcLTrUSFG0QkZ0geiO1dNTd2rccjA=;
        b=vRx2xxHIMC8tUwn/7DIeKTUBYNjn1jTctHI5fmmEvbe/ImEgZA6Erkcrg1ZsEoxjWX
         9ziyekydQ4iBjHuYlRFuULMCxEO9qQA0k8jdaAj5mX43xQi4i7toNFstUjg1dYt5mjC6
         u819d8y0A0yISQTEkxiuI1mrcKk2D8vusReLxuhlFWCzdlKhTDUdhuzEUgfQpKP5wves
         oEUowbGabWNaeI8XvN9tsbzCp04BU6Eq+4uh0FLwy0uzVxeKPJOiuI/YYGM9I9ChMIVr
         0m3bB8b6+5P5i8QcpUz/xN024poz5OzsgGfWB7xQWXsGz/sKXYfT8azPi/1A3+ymHBTZ
         JVkw==
X-Forwarded-Encrypted: i=1; AJvYcCUQFEa5MTWgHosbeCtyPzt+7kpVBe/mor5/thI8bCPdENJfryXPuLzhXJKq2YbLKTE7RqMCzRo9@vger.kernel.org, AJvYcCVB592120gykka1gaXIKDHtRF3YmYMpTa700KawlchmpdRj1nIg8tvsvmtCVLmAKGfZ+dbxitgBqnYt44xm0bqe2Xg=@vger.kernel.org, AJvYcCVleh68yqTw4U16cVvLZZ8oIiDDM9CAkP+hMrDSaaj7H6nT3XG2jD54jwxUG4YKZFmAeuoU++r0YB51+FE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBRTbJRp1kLPo0FapHo3hr8m/CJtv/2oPzcNBbTfdqEtncmAK
	/o0K3Y//eeVnq7ornjPoLNpmqe1Xx+GyKDbVa1aOxCpou96/kO3JHGm4afE/M4Cy4+ZEjcvUHRg
	WNSFkz5JlpxWWS8Idyr1DH9Jc/l/jllqaHQ==
X-Gm-Gg: ASbGncvY+uNbj8z9PcSaRfLP7NLUP7BIYFW9tLPTCQzSFm9V87wi6SLfwhpUzX/RUVL
	84IBgCtF0410wovRPrNQ5fKqNhCDJ3cSF5g767K02wKVKI2V45EL8oCNp2wRYKT9pI4FNfJMrhw
	eFnYy5oZ4qH87IwKE4hK/b8LfgQVPZqV85/Do/8PllsG54ZTfOglM1KuPxyrbmz54R3zfwJxTca
	3p6lwAceyi3kAWEQyuXlKzSdM6MqOTiyWGy4F4GljDR5VOEIhg=
X-Google-Smtp-Source: AGHT+IEbGJuoHW7rCE7BkdbrLyJipuMVrh6Jk6nTxf/tgVBOhU7H8W6ozm8JeoEilSb0jWk+f2ImBB5jR9AWhmpaZC8=
X-Received: by 2002:a05:6000:2089:b0:3b7:9bd2:7ad6 with SMTP id
 ffacd0b85a97d-3c5dc541d53mr1282606f8f.38.1755849400046; Fri, 22 Aug 2025
 00:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250821172215.7fb18f5f@kernel.org>
In-Reply-To: <20250821172215.7fb18f5f@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 22 Aug 2025 08:56:14 +0100
X-Gm-Features: Ac12FXyIp6zmYDgrODfWhERFNleExp79aX5ExE7TYTzEMpyW-neIbQZy7Z5W5JA
Message-ID: <CA+V-a8uqOw=Xr+OqyHxEy2MV8p6QDRYG53GWjya+2mRQM0A28Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL register offset
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Fri, Aug 22, 2025 at 1:22=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 20 Aug 2025 18:09:13 +0100 Prabhakar wrote:
> > Subject: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL regis=
ter offset
>
> Hi Prabhakar!
>
> AFAIU we're waiting for Wolfram to test (hopefully early) next week.
> Could you repost in the meantime with [PATCH net v3] as the subject
> prefix? If it's a fix it's not -next material.
>
Sure, I will do that.

Cheers,
Prabhakar

