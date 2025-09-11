Return-Path: <linux-renesas-soc+bounces-21780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2DB536E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C89AB1883496
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897D2322DAD;
	Thu, 11 Sep 2025 15:04:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135FD32A3C3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603081; cv=none; b=fasDK54im8ypD6fIsxNBTPZeSjQ99BQEhBxvDcBjslY3pWxElcJ8hSV65H6NeRTUWQ4UM66asv2O3ye8KyrKRqk6smfl73YXcpB53GieGj599ff1KJrxO9a6iAyX+OcbSxTyyROzjJm44vx/e0IfjXAZPYOp58KPAxBewsflcQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603081; c=relaxed/simple;
	bh=hDIjhZ6wAHYWNsMfgUFiT7VXXk4Wa0eoDOj1hGyg8P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAq4HFJMasE410aH4vzGy7FHIjZFjoxk99hAT2cG2qaTCV28HvMdoTBeA7HvO2cROnA5kKzMoo+MYVNzjVmy3vYbjuHnXZChne7ozox1hrc1zwmn+Tt+8hWICGDH9NZjPBGpvumg1dzq2TjDaSfPrXzX6G+1NW9ezTZeYdX4OSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931c71a1baso906392276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603079; x=1758207879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS0EL8aORZwbi8PmaP9iDcnqk5bgKxhbrNCQjz+ikhM=;
        b=DW06qiLaVhGSWBrAJdT86gHJarOJVVi9bO6SAzW1Ym9EPUgZJ9qFBopsYjE9mswIFd
         hZ3NmawGBGxXFQ/FSHBGxHgiOVLN2dBxmx6CihBelNvusVFsj5HtlJ1P9QsjHGzLwxO9
         EPMk+5nsrFezyYEP89vmmQ+rdQWqa0FM8cQ5ao/caq71GNBjKQ7+53DhoifJ1isUbZyZ
         SaAV+ocE9qiha3Hv89XB0Crq768ZePTazCO0TGSX9b8z+YoUwOOfMt6Cg0C5ePAOi//Q
         AkHQ7WpWvyg/gBHjketlnX2f1UFKgK5CGcmF9wTdHHNeBt0C1V0XWiKPf137FblDXDu7
         sVYg==
X-Forwarded-Encrypted: i=1; AJvYcCWNhWRn+RywZrfAnRJTovI30xbSez35iPTVeGa1iJHAO1gEyOLE/nN/C2fGDtmMXEXlyaKF69ly1aEq3pbZSFCYZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP2luKn+j1Z564NYXMlhvt4GVhpCg2PRh9E4Vf4LlZ2lLdU2YC
	FV0+u5K3Sdtws/xDs4tisHDSudM23+yKwhvqG5GzRmgWhkt6+m3lm4rr8RmqHUySdNA=
X-Gm-Gg: ASbGnctF2gvEY/6AgPM/ucEk73ZVCoyOEVSNNgOveRPwEpW27G6OGaJ6ccGDkTRv3c+
	KTfAnZRnFOYzKNKa7H0UJicXfGcrYagFNP0zpNrmdyWEuyQPKOxt/F1bZbqW7HSSBR1j4ctWOxo
	xGuxku1wtnc+th2EbyI0WTCVRifiiFCb275azFWfIKveieEiQ2Gb57OQk8nR0BHejewSAyOBe/l
	7Gd9fuczLB2z+0Gqfv1HN0hGyZunbI+kuUjtfY9ihwmuXgl1whEwtBNSCZJeGaOGmS2cOSwDXgG
	XkYt60/uCDdgVy+RiSsqDLkVLutcGdeV46FRJuJJa8iQ1/eJXXJKT5UsoegYtQYNrpm5heSDmxP
	j5iD8dJVrX4AjlVMxj8x0tuZ3mj3ZmPwni3aSFLg8JV6m65XKxtfnGgoJKbir
X-Google-Smtp-Source: AGHT+IErXpEj7YCy81GcuX5oHMlkTxZEKlrmNS9t8TlZ0+dPl/dcIsaSAEt5oe6oVSgvTCy7Egkbng==
X-Received: by 2002:a05:6902:400e:b0:e9d:6e8b:da82 with SMTP id 3f1490d57ef6-e9f67f9d18dmr12877478276.40.1757603078385;
        Thu, 11 Sep 2025 08:04:38 -0700 (PDT)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com. [74.125.224.49])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea3cefe160csm532434276.5.2025.09.11.08.04.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:04:36 -0700 (PDT)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-60f45afcc50so198499d50.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:04:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWJ8GxcjpYUTZ63xhlQD7tiiBzDjszX2AmwbA2VI2kW0RXb9R2VhpspvURyhVKI6fjc1Bq7ht7EZqT6wqU/l6mqg==@vger.kernel.org
X-Received: by 2002:a05:690e:1515:b0:625:27aa:61e8 with SMTP id
 956f58d0204a3-62527b9a69cmr1270304d50.1.1757603076433; Thu, 11 Sep 2025
 08:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se> <20250905084050.310651-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250905084050.310651-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:04:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUYFiHx2owbezcOLwUdYd5_7XZEYjF8-Khvc1WWavGQw@mail.gmail.com>
X-Gm-Features: AS18NWCW04nNVUUV0t60126nxRdvBxmyhce0KqBQMo7ha578-b8sIe7Ehrnf0RA
Message-ID: <CAMuHMdVUYFiHx2owbezcOLwUdYd5_7XZEYjF8-Khvc1WWavGQw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX462 on J1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Sept 2025 at 10:45, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add an overlay to connect an IMX462 camera sensor to the J1 connector.
> The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI40 Rx to be enabled to process images from the
> sensor.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

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

