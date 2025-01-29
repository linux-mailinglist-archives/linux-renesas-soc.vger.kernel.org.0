Return-Path: <linux-renesas-soc+bounces-12722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E09A2241C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 19:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79E9F1884E9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 18:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BED91E25E8;
	Wed, 29 Jan 2025 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBSx7v9m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C31E0E0D;
	Wed, 29 Jan 2025 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738176215; cv=none; b=ddxU0043nMkBMmh4mcxBp7kdeP1DPwa8UO7BKzN813khps3J+zkJjbHiGQlw0uNEFMTLjBcVSLGum+FJ3auBCIrxyUF6A1VuF8oZwDMvgaWFgdgGECZLx00yHK7Us8az7g83J+6jOiYOI5rOP961MHoBTD/3KtL8q11NuGPqIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738176215; c=relaxed/simple;
	bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UzeQFvqEeFKZf83tfVqqGrntm0mxrFX7hxixGg4+UQDNkNswtrzhLjfIFDbhrRfJobwX7qizxOlGEwy+PNt6vTdH9Ed3+qp7908FjquPJMHAXYD5DOnHuMJhVLQpB74Fvm9qdiiubaT4BpeplRGevebe/oACxvkcSF20AeGKjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBSx7v9m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso7701785e9.1;
        Wed, 29 Jan 2025 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738176212; x=1738781012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
        b=hBSx7v9mRy856HsDMXN9ZOFyljk8JXNwmIHeoa3286M9xjhJYyipr9BIiWmyAE4ZsO
         YLujrPnPBh6JEPDOND/gCQrkT1F37rB7iGxmFAEYaM9u3aNz9o7XgdjYLOvUz5jz2JDJ
         BrLHMiRGwiwcKSBTtIvzcpE/lguJmSiCc+EmMpGffg1mLFrJmYTsCF3JaYkEMCQ1uz+1
         IkW6c2yK0vzC2eQve48BamgVs8pV10tzsFk4TKSh/qAJqUDlU7qf920dHOFQpJg9RkyO
         Y52U+7IDU86huT3GYDv+Rk8p0LmbxH77Qncr657IEr2hs6jRHRh9UYPxh9dQWIyKTXbp
         so7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738176212; x=1738781012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
        b=L84q7rpprDciapmJhg/L0QormV3Uei9RwSQwCr8ctnDehb+VtyEyLTWzTIz7+t5iQi
         U4v4A+buOWci1IjzpuKdlJsHRiaku8XJttt5QphmXQ82mabWYQcMnOfLg+1hAFwqyzc6
         KKL9nZiqholKafu0Pbb2J2aoo+HPxnc4/f4rUApG74Zkl9RizPrJVbrf74LLmCk9cCvR
         Y8ieB0z89eMHQ/mJDaSwbjORsaAprkZ+wtC86zl3hgEpuKVQpSP2r5+/OuR3TrnCGkEe
         eJgVO461pR+BDf/IFqGaskqJm8fS12gU/ZqEq8wbV9niJEdDAAERkr2RS7YKIGXl8b8K
         bjkw==
X-Forwarded-Encrypted: i=1; AJvYcCVJSr0fKv2xETnfrkBdcKXxAjGM5l6skaNrwAN0ZoMYoZUVgLYBLbP1EZ9ioqZdiB4CNOyKYp0z9HbqxnM=@vger.kernel.org, AJvYcCVlyyy5eOTHAWNXKL3GH0C6awmVZ4JG44ohNbmOGwG0wR3h4ndDrXiNwGa5eZqv2n65hQ6DXSp9YrdSAiVKh8Wif4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0f+f2VBr4roSTWZZl2gdP8zWM9rutqZPFBCy1Q0FvPL9hpXCT
	SfWISmUneKXTSzawEYGcR1f9bgAPLFZCiInMtI3qxOyYa8gOn817
X-Gm-Gg: ASbGncuwdXDzN6gVyxodcraifT9I+cRRF0MD/dSCWEG5iWB7XlQ3Rd7sAFM4Xyska6K
	qRD50/H9qQXkHaOfHTtBq9TS8k8/OaYSPeMU1m1lxkdZmk8GlPo5AgcPid90exg/zl9ohNQzwsr
	HYtGEuho31PdFsepgVTvHeYFmZ6APzBkq4KXvN8aqymLrGgTijVheYmZ1zP8bYiHvB5ZzXfhq5/
	3BH/qi6o5fMEO39ErYThlhPbgZdrKrRJ1SZVMXZExxCf+DLZtugSJDbcLPn0ET0SVa9j50htquQ
	9HEWoYGp3pL/Geze2bt7B6Kb6LgHGY/rJzEReBjEtx6Wj6mEDbJDY5nPLgoH973vm+I=
X-Google-Smtp-Source: AGHT+IEPFrQXMJ4B9NwKJTHyw+XoKc8K85X25SwaFjwRXkdgX7SF83b7AlrXrbk9HgCflphZbgeZng==
X-Received: by 2002:a05:600c:3d8c:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-438e15db9f6mr3330685e9.5.1738176211643;
        Wed, 29 Jan 2025 10:43:31 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm32258705e9.34.2025.01.29.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:43:31 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
Subject:
 Re: [PATCH RFC 10/14] ahci: sunxi: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Date: Wed, 29 Jan 2025 19:43:29 +0100
Message-ID: <2765029.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
References:
 <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
 <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. januar 2025 ob 13:46:05 Srednjeevropski standardni =C4=
=8Das je Raphael Gallais-Pou napisal(a):
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>=20
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



