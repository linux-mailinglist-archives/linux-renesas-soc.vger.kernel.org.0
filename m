Return-Path: <linux-renesas-soc+bounces-9891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609289A4333
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 18:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D75F9B22A59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 16:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21C420262C;
	Fri, 18 Oct 2024 16:06:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E1202640;
	Fri, 18 Oct 2024 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267569; cv=none; b=smdPg3cUR6xHJJdu6yRW0c3QFMU0p6kdn5teJ93oc80JHSsYeBX610/g1ZqST7dbH2X/LVZ1blBQqZ4CkZAqK7vCvQEPNo8Dktd81yLaAg8FY2DFIKx3dxLEcBr4jVLRoKZH7hm+f5Sqsx0i2Qo0f8KSIjzOPXoovRTx7iFHHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267569; c=relaxed/simple;
	bh=77kt/9AU1XQ43TjwFtNw9fpgJrebjcu25+nLpEMYUPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOr6mniUf7DiFCwCFXNjBSQDCF7t/o+LHlBxLP+laJw++39zTwod2IKKIj0FWV6M+3nK2DHt0XzSL8mjURHVhzQGvGdfXJGdjsy/+eKwBLUmzeSKFqGjwAV/b1UVGwQ+WGBvwKeur+fqho8t9al23Ki/mO8/aLm2P5Os9VRmmNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e390d9ad1dso24219267b3.3;
        Fri, 18 Oct 2024 09:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267566; x=1729872366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS2zcJjmH/OYE5G4adj1rUyL7Ifvoy7udN6X13AHaEU=;
        b=pCvhsjOxp7GnZwhw0G3HKvFczU/V68sC74FgVfX6f7huPkI+cS5wCwsZLlpPRR8hKX
         iLBjVSw+Ov6+UZ8XcP2EnjENM2RsDaGvENy8X1Ya6N7DQOr7uq0PBB7fY8qspH+pNcpf
         hRB6Tc15yNDYO6U9Q5vzfFK2Cwu5fySThxpEPqr70Z2wsfytp6CdgKEfNjOnVbomBlTk
         oZ8ejeXaF66XQCVMzGFGe9M6RezNZC/irQCbHVo+C2klzSxL576hJjSXMnt83C9R9xHP
         wIn7fG4q+4EONygBybJxZc/pemXS8nXvZb0h1VYQongAZb5vIl2GuEszRz69G3g7RfWI
         J2iA==
X-Forwarded-Encrypted: i=1; AJvYcCXxxyBPaDmAf3/iEH6pmVyyXcZcDPkYpHLk6SWRI1mv8hRbFBhQSaKFrAmT0cQhW8j+fs+dEKV+4SJNWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPgQIW60oq6pO37wNZG5N9MwAdh+EsYnXJJyQa0nC4J/A+88U
	NTMkxCEZgEQEN+UUrdXof29JZyiUJNEANH6Eimo1e/Fg7zoMGsoRoaX3c1dB
X-Google-Smtp-Source: AGHT+IHGaKFQLEttXlGpH6gjfKKzRe749AB7aRr+N7qgrqB1WtVyORRdg9RUFVMrZhGworjpl0VwAg==
X-Received: by 2002:a05:690c:4d4a:b0:6dd:d5b7:f35d with SMTP id 00721157ae682-6e5bfc16b86mr35528667b3.30.1729267564264;
        Fri, 18 Oct 2024 09:06:04 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c024c36dsm3508037b3.113.2024.10.18.09.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 09:06:04 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5cec98cceso5199667b3.2;
        Fri, 18 Oct 2024 09:06:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoNNecjHsoBSEVhydhUZgBz5TlAsUACrbm2h+RRu8JUAt0lLOilDBXPBl7QahQmHnr3V8mFRzKGqoXUw==@vger.kernel.org
X-Received: by 2002:a05:690c:ecd:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6e5bf72c0eemr33701737b3.3.1729267563876; Fri, 18 Oct 2024
 09:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729240989.git.geert+renesas@glider.be>
In-Reply-To: <cover.1729240989.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Oct 2024 18:05:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNcC-qRw5AHNR9F_uJrDBt=rVhg3X_KHDvgxwyxMGCdA@mail.gmail.com>
Message-ID: <CAMuHMdVNcC-qRw5AHNR9F_uJrDBt=rVhg3X_KHDvgxwyxMGCdA@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 11:32=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>       - fbtest test002 crashes with SEGV in 2560x1440.

This is a bug in fbtest: 32-bit arithmetic no longer flies for drawing
ellipses on very large displays...

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

