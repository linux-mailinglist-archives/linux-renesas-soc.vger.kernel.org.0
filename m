Return-Path: <linux-renesas-soc+bounces-22165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE4B91F74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 17:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA4FA427B35
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE94A2E7BDA;
	Mon, 22 Sep 2025 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vyhse1P0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADA22E7BA0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555234; cv=none; b=Rk9ZXkTG4g5wzVqHyEmaoODefE7z6MPGPISiqUPmwc3isuCovAVtc99Nlgbo7B5oV6wNM9dIRozorOUnQQc2OEB2KRLD8RB3FlsIHBV6CH2v8/1tJs6IKi3+0leJEf9NHrn1ve2B95Be7MHmvHzNwAsTBez9sqT4YNfUDQgfofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555234; c=relaxed/simple;
	bh=ojYCHT6pXa+exxltZgESY7Zvtrqth85NG5vUjQjg5a0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnGbCNks9weUFX4DofmQrwvXzHdscdxslkzPrSlFUfpe6Z/gyYu18vv03LYUcPC0tRlBxw2qiY0cRhe5zCsSNdmtpg13AgVW+nKdwB/MhaE13hglPdVcQZaG66lZ2jPqb8JZQhFJkCQjF4WLP36rgXe9x9xUqSQb8AeFxf87bGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vyhse1P0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57afc648b7dso2799726e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758555231; x=1759160031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojYCHT6pXa+exxltZgESY7Zvtrqth85NG5vUjQjg5a0=;
        b=Vyhse1P08xdAwVF7IUBO0VE3gPqvNZiaHJFiTnrslHL8S32Gsj7co/6LECCPjweuNX
         3iKWmCXFMXGmTJYsJcciVK01yJKMS1D+ZPTH/Rj6qsyKbGkckSFFJZfhezG4wtO5/Kvq
         /h0DlyMKdyY/3z70kAxMsAZUgqCyk3Xss7D0bRx4ipkHy72/5I3BOWItzv8VAlEZ5lq3
         /Mf0Xqqj0I6W4mhm2CXlZEXeaZqJj9bgvno7tYYK2tkuhuNdO4lNg+GsKe4DTFyxsybU
         dr+k20oK3Yza0CfhMhTtYd17ErVHFEE9SQjL3yV98V3O9UHS7RzdlcuQKQ7KZWsmDaFn
         7XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555231; x=1759160031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojYCHT6pXa+exxltZgESY7Zvtrqth85NG5vUjQjg5a0=;
        b=fR+9v1fCgXl2Vn0pIebbJ4Q6K/jYfLHc49m/VGznPdxNjuCGelVtwSEGcJO7iyzlhP
         l/84LyYykYZ1QaEm7UTPjgbNG2IDgniqg3EnQD0hJsSqeAVOnlGGbZP5O+0CV8Ga1/5Q
         U1+ggR1vKXAE44K5PcHgDG0KhX8mld/W/Bbo8b9YDTRlPrGasrBIspca6rf8sNKYzmuc
         qtNG43dzXVopUYtZubbgIIM+lwkKVy+aTDibIqWCdSx0XlOt6wtuN+K5nM3GJq98O5Rc
         5Drs/I/I2cDMrJWFZ5VoA5W3fVRp8Z+Q0QXuKbSEA8H7wNREBYnlCsSfMx7sm6eGqFyM
         p3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiVkY4jvZNIZ1b+L9q/Qjx+/ZPnjXIe7MFERkP0eO12VaqLs9RTNdRtAJ5IbrRHivOnsLz2+p2LoLz2AWgowKJzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0lzfOceP/RLr1mN2taMdSPkW/9iTunXVaV2NZqH+XxQfEGo9
	dCCAzFlKnOgABhVtZ56Oqmh813uBzg/+cLvaE+RaKofwleMg3i0n66GW+pICyQl4/kDW+9Myd25
	OqBhp2IiAU+fhA+uxmZcqO9rLt0/k8tmWoerfGXX/Wg==
X-Gm-Gg: ASbGncvr4+pH/iO3v4sjcHvzrf0aowL9S5lRZziOjPTd340CerVqO+m6S0grC1K6pFv
	u4RyTfB2eN7rPoTfHfFD0/C0so6v+S0/ASJN931wI/IqXXA3X+ZDg5kmDNB78X7wJ696okOSG7s
	3PsyF3Kqoi0tQJgwv1+FWm37zMZiQL27s0eHxggK4VYySij/CTdHukRuM7UydxjecxBnEHGXdRU
	vmGc//gMZxRtSV0Rd0cQrzTJ069XtJqQk4ZtQ==
X-Google-Smtp-Source: AGHT+IEaxzAg/HmbDrrm3iNmazyaqrQDYYZPj2rvNhR9IFx4P5LS5+Mzvc1t7Vk0Fk6HmKT8D4/HKt9kzkmiJNQ9aDI=
X-Received: by 2002:a05:651c:23c6:20b0:332:1de5:c513 with SMTP id
 38308e7fff4ca-36413f129c2mr36067881fa.4.1758555231093; Mon, 22 Sep 2025
 08:33:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:49 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:49 +0300
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922173145.4d4dbb2f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-6-herve.codina@bootlin.com> <CAMRc=Mf9OB03FXEpSXG8XeJhtd7MkwJTH=rY11SBb9SazCMqJw@mail.gmail.com>
 <20250922173145.4d4dbb2f@bootlin.com>
Date: Mon, 22 Sep 2025 18:33:49 +0300
X-Gm-Features: AS18NWAxwgYw0JIB0GARrV9RmnofX0awI5c9l6TU71Tk5COkBcCbFGmDIfXMzbU
Message-ID: <CAMRc=MeLDe+o6dWkFCv6zc7ubcXicWdw4FA_A2p519OC4SH2BA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Sep 2025 17:31:45 +0200, Herve Codina
<herve.codina@bootlin.com> said:
> Hi Bartosz,
>
> On Mon, 22 Sep 2025 16:22:14 +0200
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>> On Thu, Sep 18, 2025 at 12:40=E2=80=AFPM Herve Codina (Schneider Electri=
c)
>> <herve.codina@bootlin.com> wrote:
>> >
>> > Add GPIO controllers (Synosys DesignWare IPs) available in the
>> > r9a06g032 (RZ/N1D) SoC.
>> >
>> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin=
.com>
>> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> > ---
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I have just sent the v4 iteration.
>
> This patch has not been modified in v4.
>
> Can you add your 'Reviewed-by' in the v4 series?
>

Sure, done.

Bart

