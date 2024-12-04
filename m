Return-Path: <linux-renesas-soc+bounces-10890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 612069E34E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 09:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27DE52813DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 08:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F11118DF6D;
	Wed,  4 Dec 2024 08:00:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11081FA4;
	Wed,  4 Dec 2024 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733299254; cv=none; b=A5zDulQaa9rE32hrU9vPd7RndCorR7dInE11+zHQ2IOpMIbFWLn/tN0Roc64JfoDe+bKT8IYVtqqD3V8cjqA5J3kUaHhY4I5BgKwgH44XM4xwrmGsVnyPu0OdaEkW01rmEWfB4kQ50QEeSU6mXDk5m4iBxws2iLbiWw8xcf5XuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733299254; c=relaxed/simple;
	bh=qX0JAZx3mOqjs38gq9rFR5GKcM/eDXXMNX8VRgGDQT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYG8nqGOGR3+8EKiJdthrMbaGBuzwaCB6esR4/I+gtG8wA7GH91EDH1f2EDThqV8o8pSi9Xrq+I2vqzNCw1TIUuH0y7sKjPn5JR8cdRt6pUkljVLT7cFKjoXMNj9u9y+44CYqkIxaltDmYDNRUOc/2HxvHQ4mQaWsVtbIIZ6/cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4af4da7d22fso2019506137.0;
        Wed, 04 Dec 2024 00:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733299250; x=1733904050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GONdbMSirRoIxoa5Koj9rUw2uC+DqLIh+b3SysJcOZo=;
        b=O9iwlmCzU/dxCI/tmH+GSNVOcdGI0v6jh2sOsZjgXU+LPwiZ4RAWmqmODX7pR0pX2w
         ilFCMrpqpnrP4res4ODMyX/YpO6zhiEYrycL7pNXmzZtsQm9+UioLWVDUQhRPeBSl8xa
         ro69gGhNc1eyM2Jie50pJykRQZviglZZCrAbY7bylOqSyOcN8zX46EXXfccU1w8ATO4f
         PbxESEHghs88AVNVxzxzXYBMgUw+dNMXhMHP6PLmA8CC5p/0Fvf2Vh8iqol9LfWwwQaO
         fUU6+8lKy0IXXDsAgESqz/B+IIXiKBga/4TrX3YAiYtav6Iom7QwiBbK7d3O1X11Xyp5
         orgg==
X-Forwarded-Encrypted: i=1; AJvYcCUqE8Pk9zJU9hsbYPil+BTtJujvILxSa/CFm5Ot1U/eWMpHTkTkbvIB44qwFxKEuSNLXNMYlMkIw9s3eLebawp6/L0=@vger.kernel.org, AJvYcCVXfkNR8eIqKIcMo7JTZu0BBOWAQlAG3M3s/c5fORXxOpmOm0SJUkt5R5otOcJMS31zwT8eExOYmakL@vger.kernel.org, AJvYcCW8ztWsPiJfVX3het/duL44zxgq6b35Lk56XTMi6FUPpNtS30dKc3zoGq7sSlhJNbcjK9mAqc8S5mKE69Be@vger.kernel.org, AJvYcCXU8mDm1V7P+Z/cjZsLVbCTAdsvdB2LDMvIeTOSVmHeKCFG95S6PWjZq1WqvEDNjZUkk21LcStPexFo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxcik7CDqgMT7z7frgRtDJdNqKdodfPRP7fDWOg7yAFkLKo0mz
	zKDdtod7NB5d3hnOzTdB41O6TQU6Kkx6yWwBi+WE09C/l7F8mvn56qjbsxBt
X-Gm-Gg: ASbGncvLSxPb4+zHIbL0iEbohf3sP9VkCaUkdfDoyyhbiQOLLgD+7FjLOI46AkrLy1W
	rDSCNnkPrmxhE3ZLx4CSDkF7FsD6tvpbmQyyM2eALrdBNIqr/+SOra2PcVF63Qxgq31TZfC0Tf9
	5Rx/g21DZwlTu8p1LNAzfIF8Y5rYje3c6hMxSYDOOdS8/ldvFL1RPChTJXaz+PQbrPsPD5GNGr2
	WLejEX5lKHNZjTGQa11+CEtGeIXGCoXAsCOBhK9dL4uxnCBYYxi1EbdSBTfdPNM1ys/OuUc3NiB
	svLcY7rBjDYZ
X-Google-Smtp-Source: AGHT+IEQYVxqngvc8AC/wSX2bHJFoU/I2ALJvF4bOv8wQshvnR8+yueiI6A/gDzEoNBA6cQaGf+khg==
X-Received: by 2002:a05:6102:3753:b0:4af:469b:d3ae with SMTP id ada2fe7eead31-4af9729081cmr7373184137.27.1733299250501;
        Wed, 04 Dec 2024 00:00:50 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afa51e97casm276276137.10.2024.12.04.00.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 00:00:47 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4af173cd0e5so2083932137.1;
        Wed, 04 Dec 2024 00:00:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9nL7mkPq3IYcpfbd+9phvhb11N15j17wcT/7N6H5gX9vs4ryqNxFalUeGYV1KwzQoZkP9vLP1SnZz@vger.kernel.org, AJvYcCWgXmogVtieeaO9G7Da0cU5JaX+uZDNEhEouqUcRMXDVzig6ne2M8hF3ruReAvUvXXIqnTcS7WEcibjkpnf@vger.kernel.org, AJvYcCXb6ZkaLDbgi/IfMF5kI6muEQoNp/dJI+aYjzznWo6MECtAElitmjIThDRJmXhA+y+1NnX2WV8ED2XiDrWLny0hBtU=@vger.kernel.org, AJvYcCXjiCbXQ4KPhZJDCRr+JOtcvaaW4rTtwxums2x9aNs1Nr0CFdFYRkRBEIyGCENxBT3sN9i9L0HsGn9e@vger.kernel.org
X-Received: by 2002:a05:6102:41a5:b0:4af:5eb5:8448 with SMTP id
 ada2fe7eead31-4af97162869mr6809478137.6.1733299246794; Wed, 04 Dec 2024
 00:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 09:00:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVatmOscaX9++y3L5SPhpPpbLw6fROqCw1Cc9iU=YJFpw@mail.gmail.com>
Message-ID: <CAMuHMdVatmOscaX9++y3L5SPhpPpbLw6fROqCw1Cc9iU=YJFpw@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Add DSI/DP support for Renesas r8a779h0 V4M and
 grey-hawk board
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Tue, Dec 3, 2024 at 9:02=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add everything needed to support the DSI output on Renesas r8a779h0
> (V4M) SoC, and the DP output (via sn65dsi86 DSI to DP bridge) on the
> Renesas grey-hawk board.
>
> Overall the DSI and the board design is almost identical to Renesas
> r8a779g0 and white-hawk board.

Thanks for your series!

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Woot, SoB tags for cover letters ;-)

Works fine up to 2560x1440 (I don't have a 4K display).

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

