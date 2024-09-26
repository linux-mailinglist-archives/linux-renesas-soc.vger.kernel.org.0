Return-Path: <linux-renesas-soc+bounces-9085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A798738B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 14:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3860D1F23C49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD2217966F;
	Thu, 26 Sep 2024 12:26:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D39474;
	Thu, 26 Sep 2024 12:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353604; cv=none; b=BUSafw473Bxqzs1UxNUgqSpbN95vQsbdRmtfNKjXSV5ZCC5eTkUl4+DWzMpEs9WWv0ovrEWS9tklQZ0j9ZKt/0mI/ykGdQ8VCLhTjoL58BWyXmfX398VabPKAmu98YK0/7j5kZ0ux785TnemDdo539dRDdVP2OO0bKm8jafCEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353604; c=relaxed/simple;
	bh=AugrEthB1voeV7UgbBZwbCGTjvcN/RJH0wEzmIrhIFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yn3eDn9CTWgueOVvIcq1kOP2XpIbpYNTFYjRAC59Wm5nH6D63rKtHMa+1HDX1pZKCIq/kiM2ueukjBIx9SWHEfVAuBFUG5avNo4QP0sInc/GqSAxwJRRCuoOev4QNDUzC0uuM/E3O5ILYmmOwoFZcGlWMUtSS0NjxYucPZ6WSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e22cb0b19aso8467987b3.1;
        Thu, 26 Sep 2024 05:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353601; x=1727958401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Njezuo4sCN5H6SrIqRc4Ap0PNfGHk9FILaQnuB9plKM=;
        b=W78lgFW8GsXSwNCluGdruvh3osmZ4IHcghns3hjXOL5Gql/zBg33atbmLnMgUC5w+U
         XdoAQd10iY2f/M2Iv+Q3b7Nfandgc33fHyLGAHsgc7bduVkZzm7x5z3yLRHFr/C9KDZn
         0GEaBsPtaJu7dRcf6Hfa0aA9bZ9SDCC2s4vpnKqBc9X49M9ApFEYe4QEViW5xg7/K9vD
         uEeiAnJ8wj+iFXuzm47TTr1kkNITqd0aTQSrzNOMm6OV3K4TlAqCv6ROAEYuPlj0dV4X
         td8ozu6bhxwbcb1pLtGB9nZ1tV3m2LH7K/1GZqdh+hiHU+/+cyw2n+gj3E0eJ8QWOzRV
         cbDw==
X-Forwarded-Encrypted: i=1; AJvYcCUqT2yp4Q6jlPLQqJH4NXkpan7hm5LCaHNqBgI1AM1UnzCNZRbrP6B+0lK5sFzk+CyeYfjn1elERIVd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SP5/ITwe1TZwUfjxzJTonqAhJc35HWFyLyk8WW4cKP4IYniw
	g4/y4TAqqWqswQgPizLIq90QVtDJfwW4oiGvVpZxG2kv6uJpbG+qg0JR0S0W
X-Google-Smtp-Source: AGHT+IExGFn2TeY154AnZjej0Vi17pOXAMFLtnmnrPbn17qSVCqOXdpyWiKL7uVLp+zZgtLs7+e8hw==
X-Received: by 2002:a05:690c:61c1:b0:6dd:d06a:b840 with SMTP id 00721157ae682-6e21d9e3f2dmr50793897b3.39.1727353601234;
        Thu, 26 Sep 2024 05:26:41 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e23ecc1284sm645787b3.51.2024.09.26.05.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:26:40 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6dbc75acbfaso8812487b3.3;
        Thu, 26 Sep 2024 05:26:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmLOfO0btRcwYd6dDsj/OAN3vuJqDA7dGsf2oH9PPOdXALdREEFXkxfsE2Mizw0+n9k1agZVplJIlC@vger.kernel.org
X-Received: by 2002:a05:690c:82:b0:6c7:a120:e10f with SMTP id
 00721157ae682-6e21d9bb5b3mr62435097b3.29.1727353599769; Thu, 26 Sep 2024
 05:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com> <20240921114813.4124-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240921114813.4124-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 14:26:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpW8+REtap4dwKyqEjwbUC=h=+JiidhzidBGJJYpTLuA@mail.gmail.com>
Message-ID: <CAMuHMdUpW8+REtap4dwKyqEjwbUC=h=+JiidhzidBGJJYpTLuA@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: renesas: genmai: sort pinctrl entries
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sat, Sep 21, 2024 at 1:48=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To make future additions easier.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

If you don't mind, I will fold this into the previous patch, and move
the /memory node while applying.

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

