Return-Path: <linux-renesas-soc+bounces-9422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2E990461
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0ED1C221D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2B115990C;
	Fri,  4 Oct 2024 13:31:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB241D6DB0;
	Fri,  4 Oct 2024 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048693; cv=none; b=PjEVteaQIkGxWpnkemOqujV5oyWiu/YGqPrvIIcwXjHtnumhSkeTJP1xBGsRQL8W9aLgrwNDXL5yM0yXLg7AGWIoY4CTS6GjHGoNk4Mq8naKQVwvIh3KKZJ2/Nt8N2imkT9TaJwARFlGcvM6iJ6kWJDOjVk7ZpE6FDs4kGS/D44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048693; c=relaxed/simple;
	bh=2OJyiDmNlRVFG26bBHpo10tdRFF5IPcLBzcDUu9V82I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r88AgI9/P4ezjN1+S+NIDRGElM41ptfdaTDftK3IMGhr4WoIPnJN/6HtexWbOkYRryqrirktZ1Q35vdXHE9utvTDirUnZDa0CG7zcUjIgCDKwQ9++Dzo2gIm83vPdg65n5DlPbmKJ6ACtMot8J0RuC8fwpIm0EaFPgkvzAQgJtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso25339261fa.1;
        Fri, 04 Oct 2024 06:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048688; x=1728653488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrhXoruajpLQH5FMrAmNbm14aglZlPNufZtjYcZ1vKA=;
        b=rIXj0+jhiKWRy0VCJZgMGlJwjHgNcS9SNxLPe7hjrE6gNg/aHKKM72d3m8ynsW/N+w
         a9M59dwQkeLZj5L+tDSjDgCUDHy87BNrQVe9Lu156Vtq4Oddvc693+Z9o1GIkSCWs/b8
         FlG94Zy2s58QOxX5FERrOar428WE0Am6MYTtfFwlJW9xvR9x1dsSPF4lD8Hp0wCd89Zo
         57yjTTE8J2FTpCoqQzQnFIGdYOUnPXVFbSY2HAARsxhyfXV5St3xfRL8o+mBPlkzCgM/
         ORJ9TAPvRLIw6/OUZelzxAoiMI6kCbWz8GUq55wCZQHImsS1aSVbOD4aRxfZppn6Y5IF
         Q7sw==
X-Forwarded-Encrypted: i=1; AJvYcCWS2XWt13ugFsq6uFpKkCpv+tIrN71sLRb8xClTLcNjK5REcGV38vCtX/TThKYfyCoOVt1clh4XQPUL@vger.kernel.org
X-Gm-Message-State: AOJu0YxuFrWZ3HsyG10eO6VFSjIHycekoORgbgyk24vo1OSTOPiIDK3S
	OFxLzBMbj+jMZGJziPWwJF82FOvgxlSTxFKYTyr9pzh4hPs+efAYpB/NyVHXLFA=
X-Google-Smtp-Source: AGHT+IFuJYZu5RozVMMAqKYlKDryhhX8bXzKFqKVeP39dH5eFRisigpAVo79AnJtDu1/ntg4mMqDaw==
X-Received: by 2002:a05:6512:3b8e:b0:539:8bde:eb90 with SMTP id 2adb3069b0e04-539ab88afa8mr1864807e87.32.1728048687391;
        Fri, 04 Oct 2024 06:31:27 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a8297591sm423481e87.153.2024.10.04.06.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:31:27 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso25338481fa.1;
        Fri, 04 Oct 2024 06:31:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmEMqTDriKaGmOXuy9snoVw24ByJxlqtITpUCyPibgmiiS2+yavco+WLtsm8C0ybEasT0JumLMX4wp@vger.kernel.org
X-Received: by 2002:a05:6512:308f:b0:539:986e:cd68 with SMTP id
 2adb3069b0e04-539ab9ec4eemr1617156e87.60.1728048686517; Fri, 04 Oct 2024
 06:31:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926102005.15475-5-wsa+renesas@sang-engineering.com> <20240926102005.15475-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926102005.15475-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:31:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf=7GA=4MTvtuGyn_hsV0+nVesapQphoVL6WtmXA_fcg@mail.gmail.com>
Message-ID: <CAMuHMdVf=7GA=4MTvtuGyn_hsV0+nVesapQphoVL6WtmXA_fcg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: renesas: r7s72100: 'bus-width' is a board property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:20=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Do not set 'bus-width' in the SoC-include DTSI. It must be set in the
> board DTS file. No regressions because MMCIF was not enabled yet for
> this SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

