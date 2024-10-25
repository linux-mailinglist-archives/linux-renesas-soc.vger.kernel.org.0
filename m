Return-Path: <linux-renesas-soc+bounces-10147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A819B05BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 16:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15005284DFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 14:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFB520102B;
	Fri, 25 Oct 2024 14:25:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9CE1FB8B5;
	Fri, 25 Oct 2024 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866345; cv=none; b=OE1HTN+29a4ZZtDHi3C7E/XSFteLGIaLt6cgl5VzxRTiX/wvSiuTxUI6S9DpKbuvstvXPCizTezSWUBVVAOcylgfAegRHMyEcxXAHStV+Lf0CMduXbR8UVEeuue4vmefjSlvnpJ9hGKzuwlJ/28xzFAawlnj/IqeLhuyN2YkGTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866345; c=relaxed/simple;
	bh=7txhSpB1+LMaw3Qah4BUAhFDpA1PiJakkH7Bn+HLxyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0P8lXi5N2TeXxYip9aA97Qi2hV2kVyni2Faga2RvZ4rA9pEK7jCxEjZ9QjO5t23Ql3RlS2Uzag53L6zZRaeXuynE+k2nszUDxvzec9avsRh14V9TNT1gQCxIVVs26VzLQlp6VRXPs1MGY5VzE5iS/O6ucFkAz1k9VnVvUUX2F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so2397887276.0;
        Fri, 25 Oct 2024 07:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866342; x=1730471142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4rAyIN9uUnDFzo3sF3mCIr3j07Xy0cr6D3dVjJ9Z0M=;
        b=sCL1py+1JVDqYwodrjUPKKahF22VoS9zr9g+DmbsyXjGXsnl6cTEwl1QvACx+c8Brl
         Rj3wKG0qSgDcfm8+cHU6+dGDlELdkSul738lCgHy/Xh+p5NQmhMeDmTWOcHkUqQXj1cu
         B35Mq5XGdaOe0z+YONth38hAosuVA8xmUll1fUvmW/mCeHNo3whRqWZfGCS3uuSqSuLB
         leZWntU7Wp3CqiDhjjRl7Jcq6TNADhKMpoacJI2xcmKCVPJzQUwWwjKNvxFSW80xBcv8
         scaJQZbqF8W+ITFGjDiitnJP4MMLjDLr5T9+mCYCw7xfZo9p8PL6XYGl7jy/UIXgCKX1
         BA0A==
X-Forwarded-Encrypted: i=1; AJvYcCWGTJtAzbxhaEUnHi50TsXfPDl0OAvQnZNrhzEQXBQ/HTEF7D1E0P4wH9ohQX1bBIcvYb4NoHWAnY92@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0P6Eez/VZRqXywCcYqcBCVrAGYE6u5/Pe2qJBqb53EhmiYq0H
	mruf56A/2k/Kv/NLNZ5d1lmKKFAGNFV+0dk6YjBpoam4WLaa5IhPmXw/Hn11
X-Google-Smtp-Source: AGHT+IESizBengtlogWDi0v0B4KW5iSeaecMk7nDWcEyBY4F5M3RjDZtFpeceUNZeUjPE8ORWLwjZg==
X-Received: by 2002:a05:6902:18c4:b0:e29:110e:6262 with SMTP id 3f1490d57ef6-e2e3a6c6266mr9965425276.36.1729866341745;
        Fri, 25 Oct 2024 07:25:41 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3079d5264dsm271281276.6.2024.10.25.07.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:25:41 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e8063533b5so22088307b3.1;
        Fri, 25 Oct 2024 07:25:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsu6ziZz9RMY2G+w7s8sipE+6UW7chCqLZREGKnlLWlKOlvzPD3U9U6Qg8UhMjcEuY42GlbYkh62tB@vger.kernel.org
X-Received: by 2002:a05:690c:39b:b0:615:1a0:78ea with SMTP id
 00721157ae682-6e7f0f4ed38mr105771937b3.34.1729866341395; Fri, 25 Oct 2024
 07:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015224801.2535-4-wsa+renesas@sang-engineering.com> <20241015224801.2535-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241015224801.2535-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2024 16:25:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdAoRbexEWsYH_Ax5AC0vnwL5hs8m+KJ9t50p3byhbgA@mail.gmail.com>
Message-ID: <CAMuHMdVdAoRbexEWsYH_Ax5AC0vnwL5hs8m+KJ9t50p3byhbgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r7s72100: add DMAC node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 12:48=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

