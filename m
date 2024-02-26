Return-Path: <linux-renesas-soc+bounces-3171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3D86749E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 13:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E16D1F29F7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 12:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C06604B5;
	Mon, 26 Feb 2024 12:20:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A7D604C4;
	Mon, 26 Feb 2024 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950018; cv=none; b=MkcPi00sKjGnTsGCYwWSkLB9ibDXLRSi1kLIKgOsXaUgVTaUdlcWS6xx5PqYSRW2pkO7ox14GHsB9eSVB34KeRYaU5maIsdZBROAghE/Hsgibq/t7KLmmOZM9EmZb3ZTYoA6dHsrhZ5bPKqR8fAu7a7exGz5ET+0sPzmpBTqKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950018; c=relaxed/simple;
	bh=kzsP9SMdQi9uXkmXE7VtoRsZjWjTd4h4Y2jjaWZrcbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAZuT6JRzE3EK6raLaN/7QWuxn/GlZisFD8SvTaXVnmQ8FNEHX0oTbeXw0Hs/FmklpxY2BOGnW6zT5sskdSR2y+VLLlXPeXX/5GyV6qJD2yr/ZdbJMkLLTF6piK5wpl75dFo7RUi7Fj9dw++rBC3TepJmOvlG2Qfd38/YwJx4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60908e5fb9eso5813357b3.2;
        Mon, 26 Feb 2024 04:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950014; x=1709554814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4J/cxB0tcjU1L2Z32zud+kvug5qqY91R00zM2x+EZo=;
        b=OlfFaegxpfes01GHkY6Ootx7MEsurII6X/G+1zxG6gcee5j/2s1WAJyM8EfpLuyjYz
         OLSPjf456Eigsv7YeGCXEMvSwZ/tvbe4/uxWlxRmP6P0xAg828jqgVL/+mg+j898a4io
         synUVDVQDgJylVr6C/AacPA2Bc5GpekwD+B8nuMqvWXfJ7oo/VPgs8D1hHwy6+xSN7VG
         xC3TFbDLqlvSdqqAejELa/tqXdFNgTe91nY6P057NGRxJnBQ6j6fAOGtPraetf37hMnF
         QJV7yLkh+ZsqqtC7zEilMiAY/8x2vIYcYoy2wNqAEbFxgjJexGZ9tRR1DW93s1hTDYl0
         JtFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3dXjlMUhAXzfrap6Z7S/QY1YXrLxiBvLM+1B52GwEQUQYyhBz2t4z1dk/auZeG4ndzw6wP+3bUtIsKfvIJrnWUuFVs8c3YTZKeacFZ7n3EGC2fBhdIFsI1/tfzM5+VmxLR9ET8O+QsBZUYaa+lm6CqMyMeMyBzZo1xzKsIvz1XWi0QFtN
X-Gm-Message-State: AOJu0YwOys2G2P3XFuEZvnRs7xwsfHfze0W8PHTgeoEjtqPxZ7w0pEui
	wvSfto9XoE/meIbWcT73Ow0iG9TzAjksAN7W/BfUJNsXaogrxvMgnr0u6oco3Wo=
X-Google-Smtp-Source: AGHT+IFpVAPgWrVr+QEyj+mdbbR6FavL5Lw2ic5j6M9S0vty0r59mWNrQaW69jrOeX3VhqoJT6oLMg==
X-Received: by 2002:a05:6902:4d0:b0:dc7:43b7:31ac with SMTP id v16-20020a05690204d000b00dc743b731acmr4276214ybs.14.1708950014108;
        Mon, 26 Feb 2024 04:20:14 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id b14-20020a5b0b4e000000b00dcda90f43d7sm858633ybr.59.2024.02.26.04.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:20:13 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so2994992276.3;
        Mon, 26 Feb 2024 04:20:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8ySn6g6UKIKRsL12yoznXQsoJsnJNRmIKNEjl79v44PT08uao72RJcWZWCyatgH84HlCOx4+DSOvPbW58i45AhXmDfYfhZRKujWOqgKBKVZUmEqJ7e/Pe3xsNT7J7VgkJTZQdUznOcjNNwrUqgm/9S3XG69LxYsid5a848bsU9ifUN01V
X-Received: by 2002:a25:918d:0:b0:dcc:7af5:97b4 with SMTP id
 w13-20020a25918d000000b00dcc7af597b4mr4109099ybl.12.1708950013074; Mon, 26
 Feb 2024 04:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223195526.1161232-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240223195526.1161232-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:20:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5VO-u5fmrRqRhUDZbODn-yzCZPh0bOqYiG-oZXYBDdw@mail.gmail.com>
Message-ID: <CAMuHMdW5VO-u5fmrRqRhUDZbODn-yzCZPh0bOqYiG-oZXYBDdw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Document default for delays
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 8:56=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The internal delay properties are not mandatory and should have a
> documented default value. The device only supports either no delay or a
> fixed delay and the device reset default is no delay, document the
> default as no delay.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

