Return-Path: <linux-renesas-soc+bounces-5492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A19468CFEFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA8191C214D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5961D155391;
	Mon, 27 May 2024 11:30:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217A4155348;
	Mon, 27 May 2024 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809436; cv=none; b=YtF1X5DLrt+XsB/qnGDAA1BOfhAjFi/Gwi3NK0Tfc8lIkOeKCnMHdCALu6gBa9KVeVX+3KU+YNtMk4OOkVtF75vo42keUp0lQ9jfyvvwoip1Ks2sINphQgbSRkbqKtguMvPo7suOaOHvJZj3YBkiYj12926v+B1Xq5bfRiouEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809436; c=relaxed/simple;
	bh=16iXFS88whnui9qMHOQgXVFdWQrnLZLjSObK8KQkcXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9g7Fqr3S6FqFZxJsSCMANWoEebwp9IQ4onLVoKYbQ0Mlv+j4x3XQGdPMZJ90Dhu5AWP9mzF+DuB1rqUe2iWT75oERy5vHJmXzpt6Cv2YvGnF0ZtZADU07EYt/MeSu2suRIrVQFT4gKyUzYYGwdbhGIAA9T3vOFc+bvIe7s0EhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-627ebbe7720so50502847b3.0;
        Mon, 27 May 2024 04:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716809432; x=1717414232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVfLVpCcCQoMqZrJ1THjjBW2mAx6rj6ZwJAwjlWTK7k=;
        b=Xq58FoB3y2osttfxuCrDDrVJqH7olmDxMZb5NEx5ysGkzgCLg3xZvWwBalDDJsOu+i
         JlsA3acCsJFGzW9rTDwcNiNw9vORVdIHCV31ebw93rIvv1rKnBRVtZsbMOQOSFMrq5d5
         2hP3pbR9EkXJn6Sm3cs3r4Sd1GgFUS7NNvrSP7JFWdxjugAaeNUa5zFBDQnCwy+Seu/P
         u5ffxblaORMgP1t/YyzX8mphjUm1mLSbLwGv26hn+w9D+h1O43ULveG0KbLwPdSC564u
         Zzt5eUEEvW/YlUyaRSkfXGRz251BvIX2bVyQMt6aVG4lJVL5k0b9KSdZveblmPcAsBjZ
         qFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9vDJdWEQuzq1zHM7y+85jjfpMjbn+lTSaN+rNoHoqk8qiZIF0lFbBgAF8wZFUgqFlOj4aJ9fp6l+PdIr8mReBiclelbiBPc0vaRSQFJa3lAkthFRt9+Hpex8GlOzSiapDZkZac7CQJBrgsCtH
X-Gm-Message-State: AOJu0YyB193rNqlOah3NWhqBuPO+O+kpxUkiRoP73MrmpQDL8yA0DsGd
	q2i7FaWzpQ6cNTg3vLf0uQ9PmgmEZ6ARFSX7wpedQcMQFjBtH9T1cWbjyl7m
X-Google-Smtp-Source: AGHT+IF3Jf2AT9xDhz7JyH4hrIGfFe/5naeeO9OeT3+xjbOqk/yboEH2jxj57QnOsjOlFm/zero4nw==
X-Received: by 2002:a81:4e52:0:b0:609:ff2d:1814 with SMTP id 00721157ae682-62a08ec3618mr84093967b3.37.1716809432304;
        Mon, 27 May 2024 04:30:32 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a56c171sm15879637b3.141.2024.05.27.04.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 04:30:32 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df771db8b24so3003016276.3;
        Mon, 27 May 2024 04:30:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkyFm1tbdiBgn8wk12r98JZmonsg3sm8cskbcjcXjYBvmdJH3QWtWGoTr3SwQL6b1HvaVafCyJRa5Sk0vyPscCCl4eon13P3a0dmrd+9Tm/YWTZUVq4bkw6kyJp14bHBBi+X9fuc6PQNLBe7aO
X-Received: by 2002:a25:d090:0:b0:df7:a75c:28e0 with SMTP id
 3f1490d57ef6-df7a75c2e99mr2723780276.36.1716809431757; Mon, 27 May 2024
 04:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240413141806.300989-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 13:30:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRiCkYZzy0NG+3o1px2CQdtrmpUDGdLL8XcFzV67oL0g@mail.gmail.com>
Message-ID: <CAMuHMdWRiCkYZzy0NG+3o1px2CQdtrmpUDGdLL8XcFzV67oL0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: renesas: white-hawk: Add AVB1 and AVB2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2024 at 4:19=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This small series describes the AVB1 and AVB2 found on White-Hawk.
>
> Patch 1/2 prepares the AVB base nodes for r8a779g0 to use a dedicated
> MDIO node and switches to use this for AVB0, which is the only node who
> currently describes a PHY. The driver and binding change needed to use a
> MDIO node are merged in net-next already.
>
> Patch 2/2 add the description for AVB1 and AVB2 found on the Ethernet
> sub-board.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11.

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

