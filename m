Return-Path: <linux-renesas-soc+bounces-7562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0F93D643
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 17:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E55BB2236F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA8E17A580;
	Fri, 26 Jul 2024 15:39:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81BF225D9;
	Fri, 26 Jul 2024 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008378; cv=none; b=jT49bul5L1OTJG8pSuS4Wm+1b7KMKMX+SiFxGv5tcu/EXbQWxoxYAC8b0QcUkm/IQEdhyuOxveEWab7Ickjhd6rdR93jF5udgf7c+IH+zVTHpelK8wvwyISJnPXDFvNsPd3gfeD94sxOyLa8LuuJbhAQQwIiD+UzAazhTajMMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008378; c=relaxed/simple;
	bh=l6xaj9SSWGDgac/61fGC0+u7a2rM6/MOdfTjew4kTrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bln/0NxHdpjG56HigomF1stolKLL99We2vZ2PvKY8Jel3gOi4IdoPGyg+VNBdRjDMittbOPw/d4NSuu+/hdkWeKjRCsz6p3CrdUgVdlN+1SQK7Ua3Nv+apr0iItbRddjqGIDjd7nBLwd/bsE5RWPBsO0i4fG1ud5MNArZni8tyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e0b2d502c6eso1867196276.0;
        Fri, 26 Jul 2024 08:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008374; x=1722613174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIUzZYTVG5EcGsz2D8PrezjmVjdD58axd6gvQfxDp7Y=;
        b=nJ806MLYiKfOo+sIufTwdjzxqot7PqBqpjafFROD9561ezuSOL27EP7XeNuyQdE6IY
         k8pptwWcWbttFY/3KJtuY6t76/KZ4krPfW+9TrBKtwwwwuY5k5nVv5h2sd5+9mc2tDcr
         xDrMv9GdvUOkdoWz25767aFAX15ESFCgXz9HbR4vjTKDs2dOzJdjtzsr7yuYOvNylRzu
         BmJLAb6GmO6UG/424UpnO/hLdY2iQmDkvz8IDscdyrmbruI6E2zP8EJnTDea1xTIfXuy
         C+qnzgCauV4MLcTk/9ElHDdl36F0urXQ8I4G5+CJaqzgl9vhfW69kuipV80Pw7CYEX34
         cdGw==
X-Forwarded-Encrypted: i=1; AJvYcCWIkDlRdFPF+q/9GglcDWCIZGMSpaLsb0QtUO7DFCsy1JyifWmHWkvnVG8CbQwAEzhFgUCj1gZ2nZ/rhlayB4bvAW0rY9wsm6WAI4glGOPyAWk1GUb1+2bX+8jJsB1ozZvbzJKLnwS4Y27ZWKCyKQiNEGGI22yARJ5xhzNLYgRO79rZ/DDbPYys
X-Gm-Message-State: AOJu0Yzyfl/gmBzpEthEJdNAq1Ia5i7otti2eCw/Jaw2yVWk9e09drvu
	0OR0ERb287234B6AfF+p0b9w8xI/TAjP1hseLW5tDmgpwVhfTTNIpR8u1i93/ag=
X-Google-Smtp-Source: AGHT+IFvt2XrboZQMM7P/tmij/zhK8apVa10em7nZFQf3hZB7KcaDFTbMRKa5degC8kytWUUNGnV+w==
X-Received: by 2002:a05:6902:150b:b0:e06:405a:27e7 with SMTP id 3f1490d57ef6-e0b5449c2damr204956276.1.1722008373937;
        Fri, 26 Jul 2024 08:39:33 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b2960b4f6sm787477276.0.2024.07.26.08.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:39:33 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64b29539d86so21121327b3.2;
        Fri, 26 Jul 2024 08:39:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdDT6Va9cBMf0CQQx5StCBF0kHHrE9ml401uIsy6EAVSLvb49zmOsGl6qg3R73rFj26yrMa47Qln2UdL6UG92UGPkO0vQGZw8sm91tJV/A41rQ8C1TJe66xdS6q6A/Cc1dt756csxLscvkYt/62Lyt9aTThj4IXqFd7R7TmblJh56QjtBuouKC
X-Received: by 2002:a0d:f886:0:b0:652:d0a9:87de with SMTP id
 00721157ae682-67a09f4ca84mr1733827b3.35.1722008373286; Fri, 26 Jul 2024
 08:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com> <20240725100534.5374-4-oliver.rhodes.aj@renesas.com>
In-Reply-To: <20240725100534.5374-4-oliver.rhodes.aj@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:39:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_4JFyauEHxRYfshin6iWFAP1XY4e9fOzvpLHZNzgYww@mail.gmail.com>
Message-ID: <CAMuHMdW_4JFyauEHxRYfshin6iWFAP1XY4e9fOzvpLHZNzgYww@mail.gmail.com>
Subject: Re: [PATCH V2 3/6] dt-bindings: clock: renesas: Document RZ/G2M v3.0
 (r8a774a3) clock
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 12:06=E2=80=AFPM Oliver Rhodes
<oliver.rhodes.aj@renesas.com> wrote:
> Add binding documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) Clock
> Pulse Generator driver. The r8a774a3 cpg is similar to the r8a774a1 cpg
> however, it lacks some modules such as the FCPCI.
>
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v2->v2 resend:
> * Updated the patch description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

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

