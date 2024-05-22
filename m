Return-Path: <linux-renesas-soc+bounces-5432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDBA8CBDCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 11:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18600280E28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 09:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A144F80628;
	Wed, 22 May 2024 09:25:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73C52F7A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369936; cv=none; b=PnEtgVLT9oFqVz/cXQImghG68FnTIbDx0lElRYSuS8jxVKq/27GY+mU31O2D8mCqxA0VNmqUzvAV24DEC9O5/ygGFNBuOY6yAPP44aS/VyKgDFNhU86v7dRUSDt+s2jfaa10ibv8euaNwap42lOYj2Z+SY+hpLHnU0KuL7xZt04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369936; c=relaxed/simple;
	bh=K8gxxpoKv1csQ1t+icIsci/MfXiQ8kU74Q5PMSAdDFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYi6Uz9mb7l4dYTeGnW2aWEQLvYPl5HZwqLBla5zhu6yoDqH+bTfWckq/rZbZEgAC4OY94uFVniwUHCBPtEnKoUrkW/Vidy3E8nlq9+Nsd9JAT/ZyYKL0yYuOqsGdkTp4ROGJf1A0X6MfFkDg2tHkXGGrE2ZDYQA4prw5PJGk1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61be674f5d1so44602487b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 02:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716369934; x=1716974734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCSlCqHhyTTtSzT5rwbjiUkBE6IWx4vlFQA2dvj4dD8=;
        b=wcQVfUiCeORkg7UZ3IR1otz2CmMPAu6kGxYVY0iC147CkeDifijQ7Z6ey0gZD+Shqd
         YmDQRLms038LiXKaETmNGQxVgUClGiNe4bz0oLuEnY2+Alv+lpwIPpdY4jC6c0SKAUqu
         um68MdLdShTgDPrah3Crrq6SMbp7Na+VuZvPpeaqqj0fCetrUCu5pZX5DV1+totp2UW3
         g6nSxYZrWuycE/zLWWgEeJ35Wh+t18eOeJfZP++X9iiwVlMJeNQToZDGAmdzVOMbBTKP
         xE5tXlTr4KWyCgqS+O1/C0gJXHUKP9qIMBueAe2s1QdrOwCskxmZH5bEkqYWxwGHxne/
         EtfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPX1YOS//fn1J9jf7TkIv0ZAUy7IX9LM1j/t4bKXb30dX4TAOE2TUaWFYpa9we4+teiv6Ta5RNNClOvvC3V1v8PKfcjvGvoZt/ZciI0MPLIHM=
X-Gm-Message-State: AOJu0Yy+nkW0P8KeZUI+O4qX2f82aLm33LHX6/XGs9HRHZO3z8s2M1jp
	wuglqxup1iZn6u/2q9RaBZJHzEPhCfzShi8Xdzf10w2RVTRDCi78eiapwEw5
X-Google-Smtp-Source: AGHT+IGtdbXLHwW1gmHZvmjuaU8L779J35R4II1X8JM6+ZERUwxqMJaLWG+stS0uPCuubAm+xqHQ+Q==
X-Received: by 2002:a05:690c:338f:b0:61b:849d:39d0 with SMTP id 00721157ae682-627e4691ff9mr24900347b3.16.1716369933875;
        Wed, 22 May 2024 02:25:33 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e27344bsm57365707b3.73.2024.05.22.02.25.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:25:33 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df4e5b89e49so309820276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 02:25:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDOP79fdIWQeGtxQ9yUy31erjW1n1Ja0co4S/i6f1sNvrqBla1QFW/jzaXlcAeC7BEYl2LGdiIQYJ/vCjGRbA7kXu00mOZc0KnTyOxFLAIcJY=
X-Received: by 2002:a5b:d4d:0:b0:deb:4164:1441 with SMTP id
 3f1490d57ef6-df4e0e365e3mr2200958276.41.1716369933273; Wed, 22 May 2024
 02:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com> <20240520075931.126476-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240520075931.126476-3-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 11:25:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmMP7XOn-wq-qzcwRNc-6ZmkPnYdzOrm6xiywCk5YkXg@mail.gmail.com>
Message-ID: <CAMuHMdVmMP7XOn-wq-qzcwRNc-6ZmkPnYdzOrm6xiywCk5YkXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: white-hawk-cpu-common: Enable
 PCIe Host ch0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 9:59=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable PCIe Host controller channel 0 on R-Car V4H White Hawk boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v1 is still valid.

As this has a hard dependency on the driver changes, it must be
postponed until the driver changes have landed upstream.

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

