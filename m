Return-Path: <linux-renesas-soc+bounces-12886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38FA2A301
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52CDD3A8821
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A2F225406;
	Thu,  6 Feb 2025 08:13:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3CD1F1537;
	Thu,  6 Feb 2025 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829579; cv=none; b=CNTOTNohG97t7VJRm3KU9AvPMKi1Kx3Xv7Stzd5zgH9HQ6gAS+i+iLW/9BQeTcBARA9P2hCZBhC4MwR9/GupDDezpXCLK0TLKFhcL6iJ/T3OQa2v+wNDW43CuHIZLjZ/li7IUwFqRIiQ6lzNxtNvVBro7xQy+FgrdS6lg86f5rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829579; c=relaxed/simple;
	bh=CfaWTqkkpTQ7CFwyARlwr2glNQs639xywaItIEyqTqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1W750sKzUgSaDSLZwZJugLFkeywboflCB26JhsY6oXKgVGhJUeUWsY3uanrwmH92sdgsrzDg/jPF0/4HISiggfksyZQQJ5wIc+o0O+XZ2yavwOiEfLfmnTawryy+3xTH/FhQ/Wo444SyEgi4/B19ox/MLxbA0o+9yhNenVDRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4ba79f6c678so65717137.3;
        Thu, 06 Feb 2025 00:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738829576; x=1739434376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVguAjuj0/bFUrD7Z4228jPVJ56A54T3xXdiHnOCCUY=;
        b=AsIWSz9Kh7OKpeOkJioUAnYVtjqZJG6M33hC8jgbRLE4ILTxjewgeTyYY2J0ojtVRY
         NOiiBdgDNNEGwcnzRnMoSZvEvqFVfx4j/GPnLk1t2GVCXOC/PBIK4LTJc6sYFQ7Ub/+O
         fv7AvdAUxY2t43yZezp1MzG6/FA4RLJPFj90cxUElzJqG8zNyYQkn0hVLoOss/RtMQJi
         9jD0JNvu3S19T8ivHKcZAoCOthBIk6WH7svpx6bdVW7SpzGuAR9DME9hCGzM0zuxFfG3
         YyoobUrRAfUCBTXHiR2TErCEfGMgATmijp80qcyT2MMljFShNud8cDfUfDXJ1O4PNdTF
         TEuw==
X-Forwarded-Encrypted: i=1; AJvYcCVfuCsF7V1ghY2HuuikuhtNxs0IZqiEEoEhigk18PneHTXvUZPzM5c5MGQmb+uqxG5hYjAm4hJ+Uvu6@vger.kernel.org, AJvYcCXFZvM9cVKuMaTCWoDvQKw1u/5qQQdmaTbNE2SMpomPeTKUr57Ul5BGLvbPUI0TUoi+RoCV8m9wfrwoYW02TJZTTvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz82HqYVdSbNKZkWw/R2FGbFwZwPWtGJhqTNs7dApx0cEzE2AYO
	0jvhwSZK5T69cvJk4VCdg19AIMK+k/Unxn7HZmkl5XOzNMXOGqy924MhBtF5
X-Gm-Gg: ASbGncsrVMc5vpTRcBwiTgzcCUq3CqClBIwumFrMOgdxrtUAVuOeG7uQp5tqvhnXW4B
	c4pau0P2GbezJqP9j2FlI4FEkRXeJbRjtuKCOn2OFpoNjEg/GWEs6fGjHn+2vWxYy+bNDRFmF9J
	Ia/TlKxLo1rhqfZyaYQM3fhdoz7X8BOi52af6wNNT0zdFJQ7S/cE3vS8J4Vii56sx2i0WazPbXD
	FgfGIbtgSJen7HhniTQJ+TtZ0XTevMyuotgq8eE07+6qcTwCH/af5sQUTQHD3fzsOiut/DVMMqi
	ruGR27757s33c3NY8e1aQGiy52PIHG5tx2okmFEIkwqXhSjW6IF1bg==
X-Google-Smtp-Source: AGHT+IEn1uF2e3a5QnkheErjhaIXgN68UhINMyA4xNf2rTXHkPXs7h6hBIZ4L3YCZrsLb+7F4PFZhg==
X-Received: by 2002:a05:6102:3f55:b0:4b6:d108:cac1 with SMTP id ada2fe7eead31-4ba478aaf3fmr4018614137.9.1738829575782;
        Thu, 06 Feb 2025 00:12:55 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d8c6asm116141241.21.2025.02.06.00.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 00:12:55 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4ba79f6c678so65712137.3;
        Thu, 06 Feb 2025 00:12:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQ6xuLDc4G8mUDm7khrKH5w/P80DvyAEsCo8pq0xgE3H5lAcEnzZU5owLJjiZThasP35D/o+GrzlDh@vger.kernel.org, AJvYcCXdtgxU9YLhiFogYKA00mdAWIQu955A6ShpqAltskzZrhIxUge/UO3qgBFUfctKvk0vsXJ3vzRA1oADpIYLxnf1I2o=@vger.kernel.org
X-Received: by 2002:a05:6102:dc6:b0:4b6:d773:afc0 with SMTP id
 ada2fe7eead31-4ba47913e74mr3621832137.13.1738829575352; Thu, 06 Feb 2025
 00:12:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205103311.668768-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250205103311.668768-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 09:12:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVd9vwGRrb9tOdyOtewTdbttF3tcRyzrRAURd1ws3tZNw@mail.gmail.com>
X-Gm-Features: AWEUYZk89fwMqSSG0q_RM-YmwfDYNfgv0K3B5cSP2kjk6T1LZ7207gpD37VRFHg
Message-ID: <CAMuHMdVd9vwGRrb9tOdyOtewTdbttF3tcRyzrRAURd1ws3tZNw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-csi-dsi: Use names for
 CSI-2 data line orders
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Feb 2025 at 11:33, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The defines names for the line-orders are now available in
> video-interfaces.h, switch to them instead of using their numerical
> values.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

