Return-Path: <linux-renesas-soc+bounces-5488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606C8CFD34
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 11:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5744280F77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 09:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173E913A41F;
	Mon, 27 May 2024 09:38:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AC13A407;
	Mon, 27 May 2024 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802739; cv=none; b=CBQXwRdI2GnXWR0ZhcEBsfs/w0R9Jvf+tg3pKMtHtA6s/iEmxIik6fuaKv9DwG3VXR37Fbvpmezxxt1G3tUo1KqvGaZGTZgJct9wKSxjfT1K3Y1Wglrwfx2y7i9owpHT6Xi2BOW5foEr6uhICp+DH9m6Wsx72wSj314wRwL4I5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802739; c=relaxed/simple;
	bh=AN//DizJVCyUg0QCrDZjkYZgMBSSJ7AIyufoQQ22Ie8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H89xGlix2HCdeO6Yh+2pMR6Q9LOGX6QZRlo4SVj+Xo3HaagSJnEAFltCz+NwiTAOyU5ZT7EnP8elBGD42aGdRuv11112C0aQytOpL5oJmyeXwW6YNnb0FtB6hoFPsqCMctV/hzmxh7NULaNusRHn+5athaYv5Fvt6uR9IFhqyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62a08099115so27771487b3.0;
        Mon, 27 May 2024 02:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802736; x=1717407536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwobYBfmNmsLhAXC5mjd8bY4+Dv8TEhrLLXdGOAc17Y=;
        b=BWljlhYJ+boFjImcljN0GKxUii+79pON+DY7ZyvrUaVm0jZ2z2K/zfYO+VqHhw0M0m
         dmlUYCEuSsNLagwA4/qQXIKc68BFl4wJlIiPW+A77uIyVX80GrPorKqIz/aYL1fwGf20
         n0RFoYR7D1M86Z9YEtgP6mQqUv98oErhWfPsRLW+wbriv18fRt/qgycZvfFsiXnQA9w9
         NEYvb/Nxn3f9oipu9O7JLCDvAibE9koL03Nm3RIBStZ5Qy5fNnoj17WeyO5VSkBPjhrV
         tEaIPqJFybJp2A63Bh+60PI1YXhC9fcbjW7AjQiMIzJctUoZuR3YmZ25jVrV8JrJXx60
         HGoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhs6VQDcVaMZ3G93sixRtfuwUp2PL0mpKDVkvQuPyScugEcUTLgeTu9ltXEWKQYBnGdOLp35tYOwIqqzEZ6UUAEHpR7HlEfxSuQB+9dQxZAg56dDjyk/UEPH3nWhZWa3Wuk8MLous/vQ==
X-Gm-Message-State: AOJu0Ywb94wqz/YdZZgMIRBl/pHRpRMfGcf3Ov+bUN9T9oPRlb4f4Wk0
	P/6YKfj3LCDmKkWnHEV1otK+s5A7XiaKJ6aazldATTE9pdInEf83ZS9wQMv9
X-Google-Smtp-Source: AGHT+IEf7RRCQEErGEEzkgBT4P0u9P5DV+7UgALY+UqnxoS9YNJ0BBwwP9HQsgrUwpkSevSB2SfOpg==
X-Received: by 2002:a81:c20c:0:b0:618:81f8:4a52 with SMTP id 00721157ae682-62a08d8acacmr78134477b3.19.1716802735683;
        Mon, 27 May 2024 02:38:55 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a43b5fasm15963647b3.70.2024.05.27.02.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:38:54 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df771b45e13so2844555276.2;
        Mon, 27 May 2024 02:38:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeJVASeKyPOzLsKZrDCRSv1CNvvw3RPnzY9RkHIls5QDbB2cISXd+ojQfzZ2tjNbcaaYnaLyR6BsnynTsxbm7GNI9GopwmwzDZtMX1S1N4uadBElcQk5sWhbnea7J+Ox5I5hAUe8NTGw==
X-Received: by 2002:a25:b2a2:0:b0:dcb:e82c:f7d with SMTP id
 3f1490d57ef6-df772256da5mr8432522276.41.1716802734191; Mon, 27 May 2024
 02:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523205041.7356-1-wsa+renesas@sang-engineering.com> <20240523205041.7356-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240523205041.7356-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 11:38:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+ypZ462P2TpU7LdsBDUaZ+eYcWT7f8M+yUONTdFe7-A@mail.gmail.com>
Message-ID: <CAMuHMdU+ypZ462P2TpU7LdsBDUaZ+eYcWT7f8M+yUONTdFe7-A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: s4sk: add aliases for I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 10:50=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> They are numbered like this in the schematics, so keep the names in
> Linux the same.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11, with s/busses/buses/.

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

