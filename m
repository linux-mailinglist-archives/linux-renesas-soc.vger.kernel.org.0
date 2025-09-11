Return-Path: <linux-renesas-soc+bounces-21781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0CBB536EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 359A11622D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A173B327A36;
	Thu, 11 Sep 2025 15:05:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB3B3112D8;
	Thu, 11 Sep 2025 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603119; cv=none; b=ghbEvcPODHCPwJWOgS7wtRXuUMg+Lqp5aTXeWAuiWuQwh2OlsXznV2ivTHvRKXas/vuGVMk9PFB8WjNA1u6yZHcUbm0EQ/nAHF8ogzyzrw/wzE6xyz/wKW5naqqqNLxk6G2NTJvenV427A3Xb9XI+mEzrXNlzecx7hTEY+8J8nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603119; c=relaxed/simple;
	bh=KRY2FXreUBqtRhbOZ7otiCoe732nLJvk9bnCJZazRVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sg5Ip4dQBd1JEU5Jc+9rOHPyHxqjkgKbuuOo+FsnUF1UIHnq1ykfazMSFFkiOzB6aoH3J2Bo4ER6xWxbthAT2v0fURC6Rox+IVJOWUI87CRwRtn3o0jG9VO7RmbNmmD5HINGr62bVGXNLv7enA+eErkdFZ7iAyolktlOK3QsNZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-72267c05050so7152927b3.3;
        Thu, 11 Sep 2025 08:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603115; x=1758207915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaaIltXRJkN9MT3ArkM4E5oYZVvz3Y8pYWZcT0NrNFI=;
        b=lsQXx+AAFpA4wCHFyXYeVeSpWn0HXs+kFERSDIdGx677f+ORfTqVNaVCZ+xypR29YS
         C+QryBHvz3ubOItajB+XWDM5dkW/yL+5lYRF9uEkni+V0oE2Imyg+/KqnT1t+Z4pmle4
         I8kjZfoU2yAEIkOMufykxaBgvAmUHy6iy21pBezJU2gM9zNmUZMnnv/4hd265ccYh7ch
         kyhK+1VtDMQN9EdtfKmsGy9z7WRjid8Xlw8ZBBYxWZXNVBjp0Wci7/1ncoma58VGXRnp
         Blqo1zgxIQi4SspOB2Le/TEDfuGjELASE0zaAGUG/+S4/w9ptXhC2XFWI6N45yJGX8qV
         Ukyg==
X-Forwarded-Encrypted: i=1; AJvYcCUpFgBOla/0AaGzr511U1XzCdRbXB0Xy+RQ/Bt1eVdkUldPcBtyMfAtiXhusNLehKakPNpdQAIGIj16Py7q87EzSsA=@vger.kernel.org, AJvYcCXraXkdAUiuuuUuKCIn/zDTqp0Foz2WDa48WoXuLgF74HaUVX7M9O5JCO8AAEL9cvoG/iUOZPyarYEI@vger.kernel.org
X-Gm-Message-State: AOJu0YwGAbWcRO5u7KP6jGie73+K6sZBqvQprxmeLRL6wxs/PoOTZ+nC
	AsCkCwV0EbE+KPLd6hEb61fdv5w64WqMdFvN0BrJWUBiIg0q+/nPq04TUg164gcD
X-Gm-Gg: ASbGncsWJ8QKf3VyacGiPEg7lhyJ+Sen72psF4bGabuSzQVCnR9nbfT420LPE2yFt16
	DPPEzHfUOdRe9QHex2j+lNqkvsXxIR8oLi91nAhWR19cifFMQA/q0l47TU5L+Bl3rf4esKM86AK
	c27R5LKITshkxst7DrAJ/p9+8fLUcEMKlYij4N7Kfj6Zyt+VcGcS7pvJZlZ9UNnSvzAuq+kYkQd
	DbLXhNxuIi9q58jV+h7XvRSbMURDcu9sQGDVzrd30gZELaESpMNGEh7tKewhP+CbwTkXbCIHrWx
	WkP3Jtiukl8BUQzhD6JIwBlkIvYyWQ3Dre/Ie+2VoGsr5zCHYiIy3IUzbDVRrPb3mO+ZEPHYwyV
	lV4IsjRQUc+Zw6E/JpJziklTH9MbDJNWkNuDbskROVYJWCqvy61PRSjUS6RA7Nn+q
X-Google-Smtp-Source: AGHT+IG/9djbvdZovWHdNEqXP5FX5nc2kpOR5cArBrcUAUVjHMXvHZ1IVSlo1sZ4CA7L40zbPQPdcw==
X-Received: by 2002:a05:690c:3609:b0:721:6b2e:a08e with SMTP id 00721157ae682-727f4d614e4mr148978907b3.34.1757603114647;
        Thu, 11 Sep 2025 08:05:14 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f769302acsm4053057b3.29.2025.09.11.08.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:05:14 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e94d678e116so852522276.2;
        Thu, 11 Sep 2025 08:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuCjCFANYkzdjfVEYh/bXa942Fl0eRhnolqqJQFahg0FsrtpzlSyL9hKyGYKQVdoadms8CwYeQ6tZ/@vger.kernel.org, AJvYcCVYbKzg9RnVtcM4Ebw9a9tJ3f1IG77OHQevv+WcpiaGQtqD3QGUOEsgdd7LqXRjRj3ICFOtPRcu8dO+cY/I9iOfRW4=@vger.kernel.org
X-Received: by 2002:a05:6902:2004:b0:e97:a30:99f2 with SMTP id
 3f1490d57ef6-e9f677a2599mr16435493276.30.1757603113356; Thu, 11 Sep 2025
 08:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se> <20250905084050.310651-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250905084050.310651-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:05:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGq28ckKnFpoxRdoGhY=Lr2PYxFT9Rz-4wRYdc0KeGoA@mail.gmail.com>
X-Gm-Features: AS18NWD-ws9A7GUZQDNSJNGFupkCVY15toHjBurWFud7AiSvgbGshpeDxs2Fck4
Message-ID: <CAMuHMdXGq28ckKnFpoxRdoGhY=Lr2PYxFT9Rz-4wRYdc0KeGoA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX462 on J2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Sept 2025 at 10:45, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add an overlay to connect an IMX462 camera sensor to the J2 connector.
> The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI41 Rx to be enabled to process images from the
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

