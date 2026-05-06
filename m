Return-Path: <linux-renesas-soc+bounces-32119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAIEBvUy+2nfXgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:24:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F34DA271
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 341DD3034A8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 12:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F2C44A72C;
	Wed,  6 May 2026 12:19:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C24418DC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069983; cv=none; b=Dw1f2pkvsQNPuG8wEIT1d9dycUdZt1fIJrWEGdA5FDL20+3ox5kRmr6STpqaMZ0g7r+rQIku434UaeXiVvw1wyr+LSBdPW4eYMZew+7cWg+IN28TAh0HayvF8wU4KX4QSK/wCcx6zzEDx9/oZr6MkEdI9WM0w3Y45XVYoljJ/AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069983; c=relaxed/simple;
	bh=OGgIA55BZAFXmu80rcWgjfY/+756SJIACznmErfcp5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GP4O5kfmWms41tsViQh1RG3lk+GvlWSYG3/1AVOI87JNtOT6r/WjkF/1cqfP2rvDSQmneTQLNXljO91lc6qDIkXHkwnSKCbqUHkj13Rrcf1Cua+GO8N1wlE8w4nHQhFl3mUhWJ33Z2jO0utinBMtihQg4FQimHlUoldGDnrWu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5673804da95so2191056e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 05:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069981; x=1778674781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWnsycWbumXvHAbUFrY0DhwMzBvdavZ86zhUbzNKa2s=;
        b=D4csO9UdqhGokbk5F8B52w3/Wpj6YZQzTdER5qtwu3pXOYA0WQDHenJ7JKOQJ2flyk
         JWE8z/GEZ6AJaLbUAbq9zhJjwji4IPBCMv5M4K2zhcFkbRJr2iFyXGzb7sPFq4anKIRg
         JpHyg77pDDgCHN8CDCnYxboYFh695EjShkc//6ZlIweMFFuXTigYIOEMzYBSqOaGX1iL
         6LRQXOzpNLSAjeoHnIBhIhUsNWbgHi/5LUXyDgPq2Fh8htbBmClpIl/vJNsmkn7AapiM
         hMEGnzWNlZ8DUhY7Fl2Ix8fQomWMLQ6sMD/7NVmxOLBw2P1Jt3q5WAvNzmByW+Onn8RK
         sYdw==
X-Forwarded-Encrypted: i=1; AFNElJ8ULWHYEfC3gjSo6ZfvYs8GKe2MJtmuoBYBC34iDRN4ZsKy6pZ7xzYfsoWK+Y0Jec4wcX85JRW5gFx4mrebcqD/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQPfVOWOkgB6y+f1ghaJT8N9XU3DPGbs+AxQBIZWTUg78Xq7a
	zVPx4r6yi8B53K9Qlj+62BnZqtR/wHOXaXyoLxmpdfxLemrBQlQr94kVlI2aoTxXOOk=
X-Gm-Gg: AeBDiet4qPAxuQsS7DcMseOI1X6Lab9S80j3tl16L6eU4HgJmjAG5UxqSQiCCegzaMd
	e+sfQd28f93XAfzI/EY6jql3PYcQZ5puZ1/GOYfmK5xnWW1PQca113p3anS7IF+rfj6blc2Y3YV
	BDjaIHwD3mBN6lCi99MAT7M9lA0ELQrqUKHwVp3xwCF3gj33qqHcYtBfiJUEI32s22tLB43xUfj
	BNO6pVY+gJGfhVuuNiJZX3v26d9RSIAeD+DoS9AoU8dSBF2RUuruayOkpjMzjHrRl4EfmaOc4N3
	6LNHvSI52rUC6BlzEoELIsooPZghdFLUiX0ln4FSMYf9uNFQ76RJ5gatpX+NwPvkxUexe2V6Qov
	7vVVth4zD/ZgpY4ctAstVh5wIIXPioNocY0nQJQNIJ/cDq0o5vKOOMUklwnvEWleLv3Z8fFLXDX
	b4437h57cdxCatLhBSt8tjqFyrFiyZmrtFOYCr5tTLLoFXD7kJygsctCvp5+PNdZ8cpmOn2S8=
X-Received: by 2002:a05:6122:1b8f:b0:56f:6d11:b962 with SMTP id 71dfb90a1353d-575593b49e7mr1375233e0c.2.1778069981445;
        Wed, 06 May 2026 05:19:41 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0902d6dsm8591756241.6.2026.05.06.05.19.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:19:40 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95d0476492eso1074352241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 05:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/f+egkVH7YKXS/K6JJS1qjklgeueetCci02w2xP4eyF1JZHsu7pEE2oDcNFw8Omi5wEcZhkjdUmn5JZPX0NUN2Qw==@vger.kernel.org
X-Received: by 2002:a67:e102:0:b0:630:2428:7abd with SMTP id
 ada2fe7eead31-630f90815d4mr936479137.11.1778069980279; Wed, 06 May 2026
 05:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 14:19:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
X-Gm-Features: AVHnY4IG9JEePlz9NMSwqaWGbq3mPYkZd51IDr_wNWH5wl5ZacHtWP2K2qU7iv4
Message-ID: <CAMuHMdUGo0G1ZjuXa=PA_2fa8JpU+z6gbp-Dh4FWPK69V4SvJQ@mail.gmail.com>
Subject: Re: [v8 00/14] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 643F34DA271
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32119-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,ragnatech.se:email]

Hi Niklas,

On Mon, 4 May 2026 at 03:08, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This series adds support for two different devices that together enable
> ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
> is for Dreamchip RPPX1 ISP, this device purely deals with image
> processing algorithms, statistics and image conversion; but have no DMA
> engines. The second driver is for the R-Car ISP CORE, this device
> deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
> interface for the ISP.

Thanks for your series!

> This series depends on the ISP extensible statistics definitions
> out-of-tree patches.

So that is:
  1. "[PATCH v1 00/11] media: Add iMX95 neoisp driver"
     https://lore.kernel.org/20260413160331.2611829-1-antoine.bouyer@nxp.co=
m/
     for v4l2_isp_block_header,
  2. Jacopo's reply https://lore.kernel.org/aeHd0G_JDaROMWDd@zed/
     for v4l2_isp_buffer_size.

However, that still leaves me with undefined struct v4l2_isp_block_type_inf=
o,
and lore couldn't help in locating the patch series that adds it :-(

Where can I find it? Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

