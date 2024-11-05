Return-Path: <linux-renesas-soc+bounces-10294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BB9BC99C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 10:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF731C2250E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 09:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA741D12E6;
	Tue,  5 Nov 2024 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXZ94Ahh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B21D0E3C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Nov 2024 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800300; cv=none; b=LPbrlSWdqbu4WdtXaC7iEXeEc7Ezj1XlumFUIpfsEcYXeALO7OzaCKy5/bliA3lQUd3Cr2/+Z6ipwewKye9KaR9szFI8WYscR9X87FQgsqge0dQdqF/h/glyoqY7IxeQ2YxqjdN7oaGTf0smbm9ppaEZStuQqsAaGSYigkHR5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800300; c=relaxed/simple;
	bh=VcfevScir1ded6+EyZ/KSn3zGVHyhYtpgAA7MtzAIy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUY16dn72cQEY55BMPxqUvdpxvt3Dh7bCHlMiUl7fZZTOAponOIgexX8skMgY+CNHJicF7Godgx98Rm9ed8mypznin6zroPnGGQ/xP9rP8bwcRLyKhGbHfKx9mwdAO8Jk5wXsl7BFaCnV5Ygop8Dn4TXAk2xXuATzXoZcQdwSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXZ94Ahh; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb58980711so48206161fa.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Nov 2024 01:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800296; x=1731405096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV1vO0gWyxANVgu/3dOUhT318ropJltP5B8W/VjUkQw=;
        b=QXZ94AhhTU0MlvfeWf2r6DReHet+ubdhiGGJMrge3zT+3eCV/mHdztNbwvTgIHJSgB
         cY3Bha0Uvj/hvYopvraQ/oZLknQmEtrxrBgFq6VH56KiCsyy7U7UnwFsoKq3Z4dPXNZS
         vEfDeh3KO4pTx5mK8bUZZGhqxzJNQGH5tZH2AfESb6s62V11+Sg9l/v9HFKGHdhbM4+o
         hroZeEFxUEXsEAdT6A1BBaeEN+ZONFpNgBOx1bZFgECeOhOwy8gZZazEVhBVwsjLg51V
         XUh7S9ubGeR7XaD5ZgX+SY2mzJvooHhDwq2IQvNhiMqNYxuOAhjT0StUyO/Iy4AxM72W
         T4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800296; x=1731405096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV1vO0gWyxANVgu/3dOUhT318ropJltP5B8W/VjUkQw=;
        b=NHlqwMX5fi+PvTKaCDBBt1d+VAtamC7+Cx670BKT1EkMGfjzxjSrx28aKarF/6zC5j
         szjfX2/GLWvL87rs1i2pVv9G66WbDW/PF908dU+RD6PLfuMr2guQOmhTqjsjwkyrdK4m
         iQEnYho/Atd968TFqmnJynkSff+4Td58S8eN6gw1WgLy4lKmKZDqNxjf4A9AptdwVi+W
         POXlAU36hovFSlb+ByS+ymtCMuJwcHFJ93tYTnlJ6ATw/a8My2yk/wrYkgVFWZlH+y4k
         On1gwPfxe386b7uYxknHJ75/dKaAAmFo5aXPKdVfofF/l9+doZzCSl6tvN8UKWtRjILE
         Ad2g==
X-Forwarded-Encrypted: i=1; AJvYcCWeQmiaV6FQhkhqpQPJmffscqN02DsGn7h0IXC0863CH6v8UjNzZ3QxY9Zj+fX89KWzXbxRvpGbmztsG8DecDceOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1EVbYiQ2bL3Ge9JeT0/Cp4NmJk0s3FZfoTed9BPFFnZCrpiK2
	IPtWhjJQ5aTKaK6mrhRI9EysTcA+MZBCSNJ/npeYNmmBXYjQ6kLTqOjNce+haYgSgnxtQ20SfYR
	/libpIIgi/V+yL0RupD/TQcVZQkZJ3j8ABMssmzhiV7mM5n1q
X-Google-Smtp-Source: AGHT+IGfvxVN6kMuLf61m637YEqs/KbHJqnF5qOgJvfMdJBouqUbqVFlMihUbq7dQPNYw3uNjsedGxnkWjbr0kkq2Cc=
X-Received: by 2002:a05:651c:1545:b0:2fb:4ddd:a8f0 with SMTP id
 38308e7fff4ca-2fcbdf728d4mr181151701fa.15.1730800296060; Tue, 05 Nov 2024
 01:51:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730726328.git.geert+renesas@glider.be>
In-Reply-To: <cover.1730726328.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2024 10:51:24 +0100
Message-ID: <CACRpkdYsWaX4nFC2uA+MsXa8vx1gbaTs7VYhs01qm0sMWbF2CQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.13 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 5dcde519a067ac5c85c273e550dde1873e2199=
bf:
>
>   pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC (2024-10-14 10=
:02:13 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.13-tag2
>
> for you to fetch changes up to f407af78c8d3b6035f81152b15ad67063f42514e:
>
>   pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell he=
lper (2024-10-25 10:43:18 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

