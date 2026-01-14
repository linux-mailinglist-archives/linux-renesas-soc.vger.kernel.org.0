Return-Path: <linux-renesas-soc+bounces-26744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CBFD1FA41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B02A300CAC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564121EF09B;
	Wed, 14 Jan 2026 15:12:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B5D3168F2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403558; cv=none; b=P1pESM12NPj3D0Mlt2CdqgDlYzOk37VigxsrJJZ4GW+3Q8/nFWKEBWFXO372Bojs3424gOXgY8yMOogAgLEq7TBCzf/vLMM4O1TGTikTyWNjYLVJwXItzdenewxlTMpL7thLu5dcG6OY4Ja9Fw2HIU9JBLor0Mq5PRAUL7Tv5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403558; c=relaxed/simple;
	bh=rTRyXahERnqy/2b+PnsI4jr170HiD4jbIMfzSBqGSyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3UJ6vd0o5OkpIUkWfkvLZyKOICZd5WLK9MxK+WQoO0vZ9pIV9riKX661Nq5ssqi2LHvmTYer0Fewajb2866qwACNfkBA1Qk4pGh275fXXQRi6z0iW07Gp5Kc5BxxougwYjAhE5UgTkrIyDmeNbqFYiOO4Kmm9QNc7Xbj6IXnrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93f5905e60eso5504638241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403556; x=1769008356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTf4Ia98cnNEFdpDb8exU9CBi6eG0s42SPNHJEcig2U=;
        b=DA2FkYxYRu7oTMaz+p4kXSrYuG+eYRqelf6R0TIjoBbwAGQjNtPtHNBG8QiGnIPlwL
         RQ7iirD+JO8MSTa374+Vnr/zBCHtTOXMHS4QaE18tCSGS+GtoT/PY7Tkz12p4Qb5y+D4
         nDiRQV4cWglUK6UyZ048/5yEdYa5cv2NwVuCD4iyyxWJusoROjfFrp27XKzONPlXlMHr
         ymS8JsZc+vPlE1UYFOXKQOtX2c4nUxmojHkyu4yDzcswWeIrGVG6jGb+4SNmsfU4i314
         jizCnoTxW3ej8uwaHt7931H9kBjuQSY22E2eWVFE6bAQYNXGw8GgmK6lue4hmljtv9L0
         5xGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWawXEk5s+4y9KORYu9amk2ijeymEkUICzoRESWqNEWuAFiPw9E2HMo20sGFVXsUpi/L+ApCs0uWJpC2Y+NA00Z2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtF2dp6qiOZUZ+OPAvjSjp3FqvNrx52fBjuM7JDShW8eKBdwDm
	SLSUCcX1WAZxL0FXjj+TwKKlt0F8k4tQ+aD+1ERFt4IaeQvpzV5gPWb5O2/LWWlW
X-Gm-Gg: AY/fxX4jp7ECAUEkY2WearX5PEP9tZE9NgzOrVQNI/fmMpGtgNkru9LEvGiySkTvFtk
	fiJCL8mhX77jA4yD+/qq+yuz1vJZJ66Re5KIFu/KpbcVOJO6zkuQ0HNpFwDa78ziuKh9hBXrjGU
	r1tcQlST8I/TFnRdayFbNGm4YI0HKyp4wAkRv3deUYlDJBngNjYPiOVY7mYpYAes8Kek7tecdQU
	MfQjO+yzK6QuaJDqwCSTzcsTLb8OJEZGmu2KtF8WRPykFaeElVaf3zw+vDNGQNSdzEUenMPkrGV
	C27G4cZIC2NALQP1F+OjvWinX6N/DdU/75GIdM0KF/LTpcKirUKwh6ZmZJm8SVl9gmHld8f2t1X
	nZcMXvTmuzItSBZfKi5P1BPay1ur/GPstattxXbTP/ZERWfr3jtcK/rG/We8Of4rYDE6eRN1M+I
	ZFUgTs5rgXWws+P35eREiFD0N91NNJnbrRH98eGJtR/ZTkOqUl
X-Received: by 2002:a05:6102:162a:b0:529:fc9e:84ae with SMTP id ada2fe7eead31-5f17f58c030mr1197863137.24.1768403556193;
        Wed, 14 Jan 2026 07:12:36 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947bc43f085sm1181235241.5.2026.01.14.07.12.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:12:36 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ec96028b32so5440515137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCIzZRizMLhAmOUIycdtDTF9hFlMwsTsqW0rD3CiLWsSyUWZv7uWLIJ+6IuoaT1/xY3CwhV6YHIpV3nl7NfLPAGQ==@vger.kernel.org
X-Received: by 2002:a05:6102:644d:b0:5db:ca9e:b57c with SMTP id
 ada2fe7eead31-5f17f58e48cmr1339389137.27.1768403555913; Wed, 14 Jan 2026
 07:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <b77b95de299de70ca78f62274d2bfbbff8bfa0ac.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <b77b95de299de70ca78f62274d2bfbbff8bfa0ac.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:12:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwvY61-cei8_6Z_TCs7EKmY0Wj_pV0Gymq8k4KxYSeAQ@mail.gmail.com>
X-Gm-Features: AZwV_QgBsmdOL1CsIZxC91XqWUZahJaPBp6OhsrHXMfNCw9hk5svX0lNu6KcuTU
Message-ID: <CAMuHMdWwvY61-cei8_6Z_TCs7EKmY0Wj_pV0Gymq8k4KxYSeAQ@mail.gmail.com>
Subject: Re: [PATCH 17/22] arm64: dts: renesas: r9a09g047: Add fcpvd0 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add fcpvd0 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

