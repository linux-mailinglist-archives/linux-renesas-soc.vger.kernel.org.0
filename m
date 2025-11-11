Return-Path: <linux-renesas-soc+bounces-24458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF17C4CDA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 11:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 499DF34579F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389F132ABC2;
	Tue, 11 Nov 2025 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT8q/Fqb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A20320CD5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762855147; cv=none; b=WaGiord/oTbaL5V55goehAosZsDwcCxHWYbuGjLlm9Ej0vzm1ZS1rCyAEi6Avx+iG8StuYon0iX8DODeSpblOn21zPc911hGmneP4+GDW1xXzYMjmzD3pcKv+1otAauxYfYnJuo2C4HV1vZt1pp0+YY+sVLJRndlu0zx9cIk6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762855147; c=relaxed/simple;
	bh=lOCIaq5MYiqkjF7JN9o1JXdIKKWp75UQH8ZqzpRmiK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzgyhOpdTfwYroLNfxqjVsFb7GbXp0cL+zR6AnI5BjyxDE1fxExvxzs4B6KAxkTSw/xjiShyE86uOnmroIx9k5jdEas3D/PuCHMhcq5SrxTLLCHcrxaSq26uOYfHdqeC9NPJtCmUA7JSZgMzAn4Xwa4BMUjGJSPslWN/dvdGpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT8q/Fqb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1195982f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 01:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762855144; x=1763459944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjlk2cRXCuPrNRO+4Q+s712BaHBwWqkzdg7ZDqTvNUo=;
        b=WT8q/FqbP2eadLXthwJJn5z+xuQPjoCqwejuuerYPDyug3kui26cruq7aPMqlbm/aZ
         wWpRMsZyJ1d7WI3wRxoz8CAB0j4AcvxAz3+biCuNZ1mOIxt9XqCN3LJNRusMea8fNzTh
         EsSf4Np6r1KqobdEQzpob5ZV1rwqhGzLiJii21xrO0WeA4d1zOc/o1DxFGJDZY3grofU
         li8gqJlI9wX5MSRnXG2xAvL2xXaUUYbTlqj5+gFzPmz6M7G34BOgEP4VGylXtNMJ6E8n
         F3RU1rAInZp02DGnszTnCAFdjlEYGBpKHjTfzMXfEcOLdaCba/M7/GzWV8s6scKqhtzY
         qGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762855144; x=1763459944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjlk2cRXCuPrNRO+4Q+s712BaHBwWqkzdg7ZDqTvNUo=;
        b=oYiODmIaVWUgBkw148cMVxR8gzme0Gm7V1TTpb4M9GkeiL0xqL9n+tOupyb3qlmlGB
         bDJZHWY3ZpHKycJ82VpIW7l+mgPBgeR+06UNTf3kkU2HPiMzXe1s+uh8JANHB5P8036l
         j934nBnzkbFqZuaE1m+q9DnrO03M4l63KSEDr3ww6xlYlnjb7UydPm1jhJsWlfqaUUsc
         luO6E95fpOseor7ynUfGzDpjcNQK7Z1044LbYRd5R2CeW9mhd/PRLukymXl4NFQmxm+w
         iRwb2yjy+nd1je2/yYI5tk79SQ6lB7H+SL3C0NxcBA8J4d4YrwCumAzlv5aS8C3SbFQ+
         AEvA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0gHo4WLoQ3Thg3IHdT2XXrutsmrJx6muRNSAbQAgKZl8AZ4o3BA1JB3JuIRGJvyt2qLLYW283R5QHfPNx15q0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF5ejGVsr3LlgReT7IG8bM8LV+AmV/xaaG8jA9SIjfI9OwO2Zw
	gptUCn0JfrSNhYxpcheGbV1QJQnjxD9mecghWgdeqyBzj3OzmHTKmo0trtJ1Hugo1Ot1syF7ja2
	Z+06PnlCNnRZEN2MmCkdMEwx6HvpDUbg=
X-Gm-Gg: ASbGncu9PFNA3LqAP+HAzd2SMHgXKbdcliGfWKI5I/GtTDzW2Qjdti2JqWjeixfvxAC
	VL4Xv89yDdQ15srN1rZTr+ozu51de8mIcXjkx+rXzUtXj+Kx1mLdJNSBSWkmD+CRjcCTxi7H70I
	mJkA0uCtEFFtRzGQg0LiC0whDUyd/nSuAqizWDSY4WEJBuAu54FN3sUReI0ePL5ZxClS4jgLPdS
	L8wc37SRsh+FJoizmT+qZrwPAbhb+hDPBlpXPeZPAuam5TlvDa3iISj8KA033iuK5NN2Cig
X-Google-Smtp-Source: AGHT+IGjntCvClMuhLxz7Fya0295cjdJ1m9OqTMAuyWKHxrVWXNBcWKh6jbg+Z6+nNLdGhpeB15uRACtQ6ldFO7VOgM=
X-Received: by 2002:a05:6000:2a0b:b0:42b:3dbe:3a43 with SMTP id
 ffacd0b85a97d-42b3dbe3f2emr3582660f8f.50.1762855143534; Tue, 11 Nov 2025
 01:59:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <5be2d1a1-3eb5-44be-aa96-797be13ea7a2@microchip.com>
In-Reply-To: <5be2d1a1-3eb5-44be-aa96-797be13ea7a2@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Nov 2025 09:58:37 +0000
X-Gm-Features: AWmQ_blGjwEL6cAjvRlCMCOm_yxAQYhX3C4hQ33OpP5_-OFXdvaWUMEmwRVdWuA
Message-ID: <CA+V-a8uJ2Cg6tUWQ_tyApQL6s0F3A2VeJw8mBLiCfqXp5-gyMQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: phy: mscc: Add support for PHY LED control
To: Parthiban.Veerasooran@microchip.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	Horatiu.Vultur@microchip.com, geert+renesas@glider.be, 
	vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Parthiban,

Thank you for the review.

On Tue, Nov 11, 2025 at 9:54=E2=80=AFAM <Parthiban.Veerasooran@microchip.co=
m> wrote:
>
> On 11/11/25 2:40 pm, Prabhakar wrote:
> > +static int vsc85xx_led_combine_disable_set(struct phy_device *phydev,
> > +                                          u8 led_num, bool combine_dis=
able)
> > +{
> > +       u16 mask =3D LED_COMBINE_DIS_MASK(led_num);
> > +       u16 val =3D LED_COMBINE_DIS(led_num, combine_disable);
> Follow reverse xmas tree variable declaration style.
>
Sure, will do.

Cheers,
Prabhakar

