Return-Path: <linux-renesas-soc+bounces-22440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D14BA908D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B3803A5847
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 11:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F653002B4;
	Mon, 29 Sep 2025 11:35:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF680604
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 11:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145708; cv=none; b=kvXT3HPtTq6fyOhR6nYeYuFrfnx7irEohz3CCPpk3h4QeE8eJkUDtUQu1CxAN4VeGVzm8cQKvi173iu4rerggYs/IqYbaV1Wy7VDH68yvRAn5+/cwk7ejGFBd3JSwqvK9d7V2bfNMSIKoJwV8Vf3wcNmKvUuvUjgb2i8oc1NSnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145708; c=relaxed/simple;
	bh=ch7c0GMzEBmON//ATPEGlDV9ckg4jFVTkG+ER5Pa/oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8p2zOPwXYGWoH4dNhGaa5Hl4orRgRRhlWZXu122nZ2ChifK6k+C0a4BNDEiGcDuSVl1guGmchteD3L/vR/sVf05OYXTHrCHjnROIJneATPUxhA5u+OdVtCzcgCURJssDqhesE+v9om1XBOiFcmWc0jAVjBMaZfBME2hgGs5hZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-905b08b09f5so1181360241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145705; x=1759750505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zscJNsz9LWE1JCbi4f4RqWFcZGer3C+FRtSw/qqEOSE=;
        b=Z2F0ThWEP0JPQXI/WuaYQPEFXnszDm+AK0JALVFL+6YiATQR3nK0Db0PDiRtJRvzJa
         pFWyQ1avFrfBrHR6LgBxM9VYOrK7+iKQyByd6YP5n5oGiA7R3A+selzLhiddwyUi+Bym
         C8MHxwnPNLAQA6ZNKbTXwhjiwMp0j0Nz2NnrT65FwISjssPh3YvqBUvUnR41I4zOIoT9
         us97DNAmRCB2tHrc9HqeD256LBIho/5xnjRak24xGABa+cH2qc7aFeCt34yUuaXwdklQ
         Uyeyuulp+KatyqfWqHM1ROTEgMlwJtZiJDrnjQLmz/T90D+hMITttTceFmD1AeaE0LAo
         +cew==
X-Forwarded-Encrypted: i=1; AJvYcCVAeVk388ClktmcC2Y2K6JrvNlY6IWmZ4HMeNso8gOO+lLkgS+g/MwQQ86kQ4OQ9MdoyYlKWwMRL5QR8Pgk1GGOFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqC8KDeNCO+f3srsUS7ff/pOak4nRTFCJ01UKcwncqvr04E7Xu
	YQ39C4XMPZU27GdwyvasJZVZwgo7twGxdMqqm2B43ZyndbYF0jxoddEbuDsD1Bgl
X-Gm-Gg: ASbGncuH0xBcUVQYdhQ7JjD7rqW5JrOwC5UI/XwOm1LYhljBaoisz03wISjoToZZpSF
	g3MJz7NXi3UPH88h6aJi73DPw96xryjTWHRC3Vldx9z10i75AbCMyD8P9yV7jInYIyWrTZHH2+y
	eh5CQtziBHS8We4PCs9u0dc9WH3uyeKqIfRAFTr5tmHolU4SM0TA3vzTwfEsUXmL6bGpkz8NI1Y
	T1IenaUYPtf40h/vdPbBPcqapd29eroq07WWwsT4U1ytuSqb1B9meT42Smyi9Mjds4UpOwbOdIh
	KPOProtVFjhjUkhzm2bAmM0iQr7QarQoBbtrHABW4c4sYcYpI6xp/zFBV6FjMgSxGk3EraniKS5
	gBpUbL2pxNMy63wrkbgs3Ttp7uRAA7YkWFaofgKbxTprmaP1+iRUwN3zLhTLWxIkjMX1Iuic=
X-Google-Smtp-Source: AGHT+IFqs5366bgJyo9ACi7OXeoFNtpY/csZglBWzEAyCJ02JrSsJLo2HzcYMTE1ZO19seHikGDVUw==
X-Received: by 2002:a05:6102:e0b:b0:58c:aceb:1e3a with SMTP id ada2fe7eead31-5acc6709419mr6480223137.11.1759145705127;
        Mon, 29 Sep 2025 04:35:05 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae302ee7f1sm3315718137.2.2025.09.29.04.35.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:35:04 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-580a1f1f187so1862095137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:35:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSRS27+FoHTjWi7QWjINUvS6eY1NLUhOFm0Y9YmbNcTcttqqTmBSxKotbpBx0R5pISXs92yXRQZTZQrhqZniVI8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:292c:b0:5a1:ea0:f56d with SMTP id
 ada2fe7eead31-5acd0efb09dmr5673188137.32.1759145704110; Mon, 29 Sep 2025
 04:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
 <20250917170202.197929-4-john.madieu.xa@bp.renesas.com> <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
In-Reply-To: <CAMuHMdUw+cVtMkfnWjuO6BUNPRd=gZHhiD=KqPxugrJVLOe+Wg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:34:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVazggwwtD2pvtzwTwX5XWf=UWsuezTU4vJnU5gtT09yQ@mail.gmail.com>
X-Gm-Features: AS18NWCxvZMcs4IKeRIKmjN1qwZhpwGWh6ZDTAZia6k6h8LSwaxFUr6lA65qWRI
Message-ID: <CAMuHMdVazggwwtD2pvtzwTwX5XWf=UWsuezTU4vJnU5gtT09yQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	lukasz.luba@arm.com, magnus.damm@gmail.com, mturquette@baylibre.com, 
	robh@kernel.org, rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	p.zabel@pengutronix.de, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 16:07, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 17 Sept 2025 at 19:03, John Madieu
> <john.madieu.xa@bp.renesas.com> wrote:
> > Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

