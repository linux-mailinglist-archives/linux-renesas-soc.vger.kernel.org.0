Return-Path: <linux-renesas-soc+bounces-826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9BA8084FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 10:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA17283C1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 09:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D742735287;
	Thu,  7 Dec 2023 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muUcdWEd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89598193
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Dec 2023 01:54:48 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d3d5b10197so4485277b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Dec 2023 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701942887; x=1702547687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE7xYQUlzv02mponHAUbU9YxaUMHPxUWeHaAlOpaiO0=;
        b=muUcdWEdZBQSHf5DcrG9edy4cYcAeoXc6q+aqt85J0QKd7YubFEQBeH8NDEuJ+o9cM
         PmyB58KDxa3L5atwABY4KZFsSTC8g6xrh/+jkqIpEmfhyjZKdxQS3md8TiQLi7CoI+mo
         LcLTepAFJP1Al5ljPBF0gmPGOzM2IVv2v0SdOTXzTrpl0t5IEXsIJXiGQw1WNTrdiW0+
         W9OgiHfj6yvO5v+80eAX7RqMGSbP8//Ku+aPiP2N1nr7Cp/IQufFnydKOy0+4BZLY40r
         iQDrXVSOeIIgUewAoMzhbQmA48Dpzs+HbYUAxK5Sy9CTrLSFszKyd0C9Uq1kfXNbLo4m
         e3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942887; x=1702547687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE7xYQUlzv02mponHAUbU9YxaUMHPxUWeHaAlOpaiO0=;
        b=hSlIo+Dv8eevLo8s3FO/Jw985Oj0Ky5KjmMU0xp61ghNZVYa1IvCtoKD1bPR56yM2B
         IWm9up/rGa76q8BdAEPbZWaM576Ve7/cejyHlT1YKFqnBSrhhEQUj1w9yheh5tL/EfVx
         6t+42KOg53yNJ5yLc47Kq0E/d2xdpPIEbhco/JYwSmGTTf0mRBbC0LyFHP+5SdSv+arx
         yixsWRvTVlUX1+KYiQ+juNTX2cqUaA9dUTbLxkizyKp1S8WuM2A2Pruuc4zqIlCtyXyX
         nBHkkaizGVS57Mc2kc/Let2lmi/7v2/O3p/LYxTuwUVU8zp7WAuIdtVMft0i5LXCGlNW
         q+Pg==
X-Gm-Message-State: AOJu0Yy2HsT7hImWWRc2BG7Oej8mH30T4GsqCxTnhrgyEq1YTmjPkUf9
	pJOQFpBLFFK9ur0BbNHjJfeLRnhwhli4X64vnP8KNg==
X-Google-Smtp-Source: AGHT+IEOjV+e4fO7tLGjEoQWjOkdeRdGdcIMPsTYSMvX6xAX0W3EEwj2XzT9z0JeD0O7EwAjfnACJWMxZ/0hDFeMo1s=
X-Received: by 2002:a81:4515:0:b0:5d4:3596:5ace with SMTP id
 s21-20020a814515000000b005d435965acemr2061763ywa.12.1701942887739; Thu, 07
 Dec 2023 01:54:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:54:58 +0100
Message-ID: <CACRpkdYVTgNCdDE6qK8wnbPAL2=S6RyDQYwPUVdtfQSSTratnQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] pinctrl: Use struct pingroup and PINCTRL_PINGROUP()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 5:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is an excerpt from v4 of the "pinctrl: Convert struct group_desc
> to use struct pingroup" [1]. The series has been compiled with GCC 8
> for ARM64 besides x86_64 GCC 13 and LLVM 16.
>
> Changelog to the mother series [1]:
> - added a new patch against Renesas code, so no warnings will be seen

Patches applied!

Yours,
Linus Walleij

