Return-Path: <linux-renesas-soc+bounces-4675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8148A7EB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 10:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC891C21226
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 08:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677E812C462;
	Wed, 17 Apr 2024 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvnPxczV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C4B6D1CE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2024 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343934; cv=none; b=l7bdL9qEfOQ0+1wSKclyQkCoMPw4JPC/dsDPFrwJt4YM8u4sFMk0IA95h7I5TEy14sLHYz/kEB64tva+DqJMCkMKh4/JHysMbLwkOy/R7M4FHCFae+rg4lkS5bZf2/f+QOR9Bx1O8HwBnKWmucjpoHuEOQTSUm/JgeKHi6VYH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343934; c=relaxed/simple;
	bh=JMmXhv3YrwRo9CQJAJUZqT+fsVATl/0IC2nfdrMLgsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTTGMcs8fsRwPHzYiMzQfheWdg19Ryt5ECO149sycJLtdNHIc+6PoObwuZjxJH360s2b6lxG2Z0TJx0bG59OMmnyJdyitrcMgIHfPKWq6X+55v57mx00yUvlg3j0yWiuadWgURsDFWbQl3Ujbb8r+uK9i2QIHvknEWeYG8/CWJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lvnPxczV; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso5874752276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2024 01:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713343931; x=1713948731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRn14IhApnKNDMlAbxEyi7xMVt+mEK/2ttermI9zL3I=;
        b=lvnPxczVao+CzCTYv4I0R8SPvvG3tsbtgtgyimNSIaqXYRX8YFDmd+LWoqxvfZUQ9X
         ZtR6Ezeh01BBOiRZDgT2yldcgY+27WjxK/eTxj24shCi6Ok0D3Y5h8o6WjTtgjl9yurv
         DN4974LIVZ2JiIUdY+9/J78a+5kU4wIgzkC991JPwL2TQ52ZKIhDsn1ojyxfWQENySAK
         QWzgID3kZkk61FZTjkTlElS30XFhtW1vqO6RAtelBjpA9GNxkMh6L67uftbU+uQpbfnB
         X8lQURlusErPYJ+V3329VrrG5CXri7SBScYexVkMLTxhHfx7ZAnEAoj2kdpikjOUMLTv
         n3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713343931; x=1713948731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRn14IhApnKNDMlAbxEyi7xMVt+mEK/2ttermI9zL3I=;
        b=ZC8MH9EE5Pbae6r0TT4zzV4nRujknb1UaQm6a/qrCcPNgmY2ODt8udCxWX5l6pHT6g
         m/CgpF/BmISvGFWVwkdRfmP8D8SFdbq/YhiAzv6DKRWy7Z5BT7/yRrsRXMmJFodWwm8e
         X46nQuSJBVBY7hGOol5kXcFwauhGz6Sv9DyRded2hlPlBTYyB6c0j95Sg8gNLXUHMbia
         W6gRSOsznSFbwrga5uQgfMbVnH6IraVvoLGJckTmAhex0KqTObg/AhiVLdfIC5WesSpO
         fbMdU7sm6+4EoVimzpNzeUIgSUz6b5qekvo0EZ36gqeCam3tbSfaFvSFRHbeu7Nn1bFT
         7NGg==
X-Forwarded-Encrypted: i=1; AJvYcCXG8JNsEWTPpQXbWzGICn3xqLb/OpnQei0LJDqEEE54/ZWQThUEDeAz9A1RvQbrL8fKweUVK47WCid8LEtEDr48FfLgD28Lwu+hFvD8WS1WEHU=
X-Gm-Message-State: AOJu0YyoK4cu+JOnOQcy4stoAKIoBMPwTsQ64Owq2sOWQLMLLE5mxwvL
	+lrHMpDcA0EJxERUx8eHfHYIZrZTSbFMge/O28zSb1UuBBuh5maHL0M/PtPAmxX3Qj0JMxKEYtG
	tGu9xpxzaSE0B18X4+hoThYDcKNShGv36CFavgw==
X-Google-Smtp-Source: AGHT+IEf6aAIcdoxddXDkHr829IAaeT7lDLdT4mK4keoFmK4FS9SzSqnT6aIUN8X5nS5SIgO08v+auKBl9foxX/lHs0=
X-Received: by 2002:a5b:686:0:b0:dcd:1436:a4ce with SMTP id
 j6-20020a5b0686000000b00dcd1436a4cemr14063380ybq.23.1713343930717; Wed, 17
 Apr 2024 01:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1712915891.git.geert+renesas@glider.be>
In-Reply-To: <cover.1712915891.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:52:00 +0200
Message-ID: <CACRpkdZ8zgkiJCkGpaOqdB9Y27EaaoUm+GznmEEt+XWBbTO4hg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.9
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 12:48=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.9-tag1
>
> for you to fetch changes up to aa43c15a790cf083a6e6a7c531cffd27a5e1fd4f:
>
>   pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration=
 (2024-03-26 09:42:37 +0100)

Pulled into my fixes branch, thanks!

Yours,
Linus Walleij

