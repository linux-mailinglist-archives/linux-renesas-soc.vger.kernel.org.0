Return-Path: <linux-renesas-soc+bounces-11169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 324149EB65C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7EC161399
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9B51BFE0D;
	Tue, 10 Dec 2024 16:27:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890C51BEF70;
	Tue, 10 Dec 2024 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733848041; cv=none; b=K199j7779efpVo7jRYlSk1PQMhAzPvSQ1wt1V4lCZ5AsJCAbyMqz7TNiuiHE6vEavOAUXiEsh18SR4ff3wZXXR1hp0YUE0z2rbkGLmx4J16R+CRxwb/C3wXp4HRCAY6hibSGC/rCpnYfc3Ma+ps+Z3xaH7VSitQerJo5PaYA+S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733848041; c=relaxed/simple;
	bh=eseIS8yIBUdZrF/1GLTJZ7wLS1Tjs3CB144jSce0lE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nE3mD/uWF49lREZ1of0z4mLXyEndGS+bVt7fOzVSK/attPKACIUTLkESFONSVTU9IsmmTat6M4p1UW6Hnf1WtJqa3plDojlI3Pm1RsZos3Bo1wXeS054PxaWjJBfYEwhQTpwMqoH7g429FOYCMCiqGuc8zfjzWFypsZZey1gM8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6d032bfa0so327020985a.1;
        Tue, 10 Dec 2024 08:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733848037; x=1734452837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4WuJQm0PMXOstokp2zkVSGJA7kGN0iowjzq4BYe14w=;
        b=eGLqqOi3O03YBiKKRg/S1XSY3qq0b3zyHEMoCcKb9QKZ+PkO/m/Wo0vSlQ222NMg5l
         eHHxCl+wcarWUoyHSOsi8/si7atPG9kqQvkc3XrtdR1oCmv7VxAYnOEfdYzjEbrlm2Rc
         Jnmh8i90wO5Pd38WVkm0jxPhVEe5Sa15RiJsreTQvwoa64Ns7boJy+REO58BWVFxO4Ow
         7JMY3Vr+q8kGWwJ6VAmH26JKCJ23QC16jO20jvk/ENCCgqYRcuK8FMqUXcm6QW2xNLbX
         dVs6SqWSsFcN/GltlMkNwMtbBmwk0lSVrlxrlIhnxyzrCSm+EDEKlMR43tIXdSb5t2B0
         xXbA==
X-Forwarded-Encrypted: i=1; AJvYcCUiXrTQhDFzH2jUclbR1W21rphhKfpXFm7tUlPjXd31DSgFqy/6w/Q6dxZj/WW9XDVqJ/TJWxyWHyh0@vger.kernel.org, AJvYcCW8N6AutrL/zmTSnu4FHHWj1GjD38KoHWACgtUB28LC7oEhr3/TBYboKzdBKhDl0WZD3K0Zm0FewO3aRqU9@vger.kernel.org, AJvYcCWsds0Vx3h9/8LEQJigUyraR5LRY0fLo6rgPDC2Cd8gMSMkTzKY5jVZW7aZbqwk7MdXIb9oPCsnbXj3@vger.kernel.org, AJvYcCXlrWTcscIUXJoNaCbW6WH19jL4FIdUhwmFNRinNGtejtCxVidkXjixbCqUg6AxVeOUN3CiOFAMVeGXxYv4+/V8K8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbeDK3MOPoG0hHbXbrtxLh7hzO3bL/qgxno0vNMQq/lyRryQ8H
	3NO9PNnXVodtYxwVwiDqNhdBl0NwWCvBz51o3F6XkiM0a/bNs5v6o/JUBO+e
X-Gm-Gg: ASbGnctZr4oIpnCLEcOxXpTuZr2uB/76ETcAUpLDskxF7iq9xkRTyti3ckH0bnfhxAe
	CX5FFHiBYmax1XgApG8OryTAjNV1OWi+9ohjCEamgNKNYMIeTSf6ys2Zab07BaFlH3sTVKOya18
	nxyJQA6m60R4VweiaT8uOOUxZRwy1xcpwwWCrsfXwAieZz3i/FZvKrA6kuhW9k6nNmtjZ2Nqmr1
	eclAq7FES3zp2zl27bcfKnWXRi8djcZn7IjTN7k3A+fuIurvIkNqOeW4ACOTvFDGTC5MgSjtIpr
	8gQM8AOrwAOwv3fS/42z
X-Google-Smtp-Source: AGHT+IFkMuCz4cV+pSJi74cVDsyr4TYgxGlOwyR6brUVIuUfA09oCNAsEKfK5f7Ervkvqk5DI/YZzA==
X-Received: by 2002:a05:620a:4399:b0:7b6:6e59:2864 with SMTP id af79cd13be357-7b6dce96562mr786138485a.43.1733848037133;
        Tue, 10 Dec 2024 08:27:17 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6c906ae7csm322707985a.115.2024.12.10.08.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 08:27:17 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4675fc06969so23893951cf.3;
        Tue, 10 Dec 2024 08:27:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIchwL19VKP3rYY+x87D4p2bPyZ9yNK9nYWTd7kbOXIwEyCcTjqxd/c6/h7C11Ed4/PBAKsOw6UoGS4lAG@vger.kernel.org, AJvYcCVoBxaca7PeTSq5/qYqIv/YzOeeoNZHmdMaKlN4VvN1w/4hNt6Dw1yx6IV2X67+wWLSILWfPAe03/cg@vger.kernel.org, AJvYcCWDWZehPcByyoBB0muZvNvpjEJDfEKvxqwBhdCkBJExwcOuYv3eHaiYqepOWc2M8gEMDkhu/y51bSE18cLpFAAJ0GU=@vger.kernel.org, AJvYcCXFSWlqGw00lsEOc7jc9tiLlNojuHTxLdtRjSEJ2HSQEM+AQUmQ5mNyCq6nStO1MsmBUNSz3RsvqH1E@vger.kernel.org
X-Received: by 2002:a05:620a:2711:b0:7b6:cae1:a3cc with SMTP id
 af79cd13be357-7b6dce18437mr893433085a.19.1733847583252; Tue, 10 Dec 2024
 08:19:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com> <20241206-rcar-gh-dsi-v3-9-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-9-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 17:19:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwrAJXg8AH_S_NDAzYuR4FiVLy+dcAfVeVh_J8Di_j9A@mail.gmail.com>
Message-ID: <CAMuHMdUwrAJXg8AH_S_NDAzYuR4FiVLy+dcAfVeVh_J8Di_j9A@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arm64: dts: renesas: r8a779h0: Add display support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Add the device nodes for supporting DU and DSI.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

