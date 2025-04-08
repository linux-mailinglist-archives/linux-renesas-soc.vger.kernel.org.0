Return-Path: <linux-renesas-soc+bounces-15538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD782A7F538
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 08:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9D318958B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 06:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE62125FA17;
	Tue,  8 Apr 2025 06:47:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E97925F977;
	Tue,  8 Apr 2025 06:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094851; cv=none; b=rimHnvkC+h08IZsEqZGAu1Mkj3wLaEubHkkXilWeFdtIxZhb0v70X5VCF17s+u3vZ1cLepaeUWO3AwgyWJiAM9A4qwmmsXmNlv4S/feqc0DwYtIUhEcSk9DZGbAbAabSTqy4XeDqkcN8ZzxBsvDr5t5VH1wowmzlyaf5fztmwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094851; c=relaxed/simple;
	bh=LznuiCLeAAsy2EUBD4afyfky4pN2mCFkC6xY5e4MGWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRT5HQ9ZI68gk0rz9mHXbTa9GhYzV8yQu6PPhGVkgI81qfo+WA5pMS5opJhhD46fHJIleFRfwbkDVKs34eZSu3CwIkbat4PmjSBw5oGfY1O21nfGaQaJLrybdG45JGVhee2RmihfY7BQ2QHrR5ibQYBWzKG37axgYvLwAVr6hBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5262475372eso2380362e0c.2;
        Mon, 07 Apr 2025 23:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094848; x=1744699648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4uljG8jAAAP6X23V4NvLorg/bt3Tc12iNiDu12FtbE=;
        b=ZBHW8WapWnUHvdJCWc8SEHxGPkR4RqnCdSG2OMVz0cHrder7onE6mmJRtmHzKVSnVg
         R0cufvXYEeyw3IQUuwd5iWoYMejtm0KqIJan3OW+Bn0dOxHfCALCaZFdVvAmhRXH/UPg
         e0jfepQRdVe7slhzNs86DA7uuvVQZrWPbzkHZQpYtwvAPFjJxY1Lmv6o8K43WHmrDpPm
         GmzM/z8OAYgy12feUROL0DS8vC7P4+QSjqLTrr9tlE357cqho1HfJIJfkm6yFB1GBDGe
         19ohAlnj4Dp1c4HQ8sRe7ZsdDX0/rUXjugA7bxcoaiEg3R9hdsdO2c/rIDEzf6CcccIn
         5EGg==
X-Forwarded-Encrypted: i=1; AJvYcCW6CQO5w1ZPL/AI6/bncTcgSMWFJ2eY6FGWX/OW5tkXTM4T//bliRLc4/wTmFAMF4oXyczZWJUq+s9+KagJ0VBk0lo=@vger.kernel.org, AJvYcCWMWhV1oBndL4TqFq7vzcZBEcXzvlaXHZbpDKVLXhK5wm7MD2WHOiFr3auc9H5Bvu0bX+P5RiK1/jT3@vger.kernel.org, AJvYcCX0g0mj8Zym1kj6YYIPbmRdzgwXupo+auISd9Xv0M5gF8Ba9kjsAtjiTqnNsXwRPIG1DLjYVFYcosOgyiyq@vger.kernel.org
X-Gm-Message-State: AOJu0YxKr/H66ynr6b/hN2A4DirrZYzkHHoB3Mg/mSWZshcQtORVW9Yv
	PjYKPhfY8peiinhclRPp2T2RsCn9a3gGufcYm6twWOcTnBF/pY1ln/b2oCuU
X-Gm-Gg: ASbGnctai2NLDhZkSrUyNH3NccL0slohPVSeGQvx/D/FF+UR0feYU6OLkNeuIq88KOf
	4sIiuH/MZDewGBPL6DGr6WCFIfX6f8TCD1e7cD8bKELAd7t90UKAezzeahiBwVv/MP1h2qnoXUs
	MwuDwmcYbcMGaMWGxpaJwctX4+XDQqvJqjpLGjk1x0oBCnm0p6DhEXTMB/bST9enQXs3lX/NJYh
	OccbQVzhp0Ifz++cXYgO3/vaKYvG3e/3i0+rpWeGrWehsU43K/NKePZoxP61xD/vftD67XTMymd
	hZBs/gRd9pVl3mxSB2HK+9zDYn0LLgbLtr6GJghjEUzSkEr8u4ZgjhR3dmVosdzSHObPtUpROMS
	pMXwq8ZDEvro=
X-Google-Smtp-Source: AGHT+IGZnXABKGCPsDI0wEWyKRE2EkTBBZm4WR83fDyPegfIt3xqH4fxqOus1+ZHxEXsMONYrLHm9Q==
X-Received: by 2002:a05:6102:534a:b0:4bb:d45c:7f4b with SMTP id ada2fe7eead31-4c8568f9c5bmr12623369137.11.1744094847698;
        Mon, 07 Apr 2025 23:47:27 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-873caa9a6d1sm206205241.26.2025.04.07.23.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 23:47:27 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5241abb9761so2268138e0c.1;
        Mon, 07 Apr 2025 23:47:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVs5bPlFTARlJsmf08JrUxILihWRzu+FjyCtxYx+BiEXG55BzhwolF8gMOa5j8AfWIykOnBP+hRxMDBmGjd@vger.kernel.org, AJvYcCWspqx6N1l2hd81jjgU5uU5vQezzQz44T7NbamjQDzJNwkNBhjYrrkFVLGSbrsusNqBa3pk/55C1tKC@vger.kernel.org, AJvYcCX2xMOGY8UeD/7MykRc9RF//b0KtBKYDfUAMJ95f4jddeaCIw8CV+Pbfr/BKEYmF4Ar90ibJk0fUDd33+39e67dwtk=@vger.kernel.org
X-Received: by 2002:a05:6102:15a5:b0:4c2:ffc8:93d9 with SMTP id
 ada2fe7eead31-4c8568c12bdmr11458882137.9.1744094847393; Mon, 07 Apr 2025
 23:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
 <D8IEWP78KVOE.1SD29H0S51FZM@bootlin.com> <Z_TA46i0KfFq89ch@shikoro>
In-Reply-To: <Z_TA46i0KfFq89ch@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 08:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLvqKP6QnLGuR3AT1SEJ_XO5F4119JCqgptv4RFWx8tA@mail.gmail.com>
X-Gm-Features: ATxdqUGsoQXbFsChzTbu6dT8PNNfqMxTuiDdt9ypFQBq3Z7H3KP4rtRuBQG_yHI
Message-ID: <CAMuHMdWLvqKP6QnLGuR3AT1SEJ_XO5F4119JCqgptv4RFWx8tA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board device-tree
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 8 Apr 2025 at 08:23, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I'll send a v4 soon.
>
> Please do with the minor review comments addressed. I have some patches
> depending on it. Which means that I am using this DTS regularly now and
> it works great.

v4 was posted on March 24th?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

